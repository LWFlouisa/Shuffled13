module Shuffled13
  class SolveReciprocal
    # Creates a new shuffled key unique to each player.
    def self.create_keys
        # alphabet = [
        #             "A", "B", "C", "D", "E",
        #             "F", "G", "H", "J", "K",
        #             "L", "M", "N",
        # 
        #             "O", "P", "Q", "R", "S",
        #             "T", "U", "V", "W", "X",
        #             "Y", "Z", ".",
        # ].to_s

        word_list = File.readlines("_data/words/word_options.txt")

                 #                                          1    1    1    1    1
                 #  1    2    3    4    5    6    7    8    9    0    1    2    3 
         keys1 = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',

                 #  1    1    1    1    1    1    2    2    2    2    2    2    2
                 #  4    5    6    7    8    9    0    1    2    3    4    5    6
                   'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ].shuffle

         alph_1 = keys1[0]  +  keys1[1] +  keys1[2] +  keys1[3] +  keys1[4] +  keys1[5] +  keys1[6] +  keys1[7] +  keys1[8] +
                  keys1[9]  + keys1[10] + keys1[11] + keys1[13] + keys1[13] + keys1[14] + keys1[15] + keys1[16] + keys1[17] +
                  keys1[18] + keys1[19] + keys1[20] + keys1[21] + keys1[22] + keys1[23] + keys1[24] + keys1[25]

         alph_2 = keys1[13] + keys1[14] + keys1[15] + keys1[16] + keys1[17] + keys1[18] + keys1[19] + keys1[20] +
                  keys1[21] + keys1[22] + keys1[23] + keys1[24] + keys1[25] +  keys1[0] +  keys1[1] +  keys1[2] +
                  keys1[3] +  keys1[4] +  keys1[5] +  keys1[6] +  keys1[7] +  keys1[8] +  keys1[9] + keys1[10] +
                  keys1[11] + keys1[13]

         # puts alph1
         # puts alph2

         ## Save a copy of the keys for later decryption
         File.open("_data/audit/keys1.txt", "w") { |f|
           f.puts alph_1
         }
         File.open("_data/audit/keys2.txt", "w") { |f|
           f.puts alph_2
         }
      end
    end

    ## This encryption key is also its own decryption key similar to rot13.
    def self.encrypt_and_decrypt
      key1       = File.read("_data/audit/keys1.txt")
      key2       = File.read("_data/audit/keys2.txt")
      ciphertext = File.read("_ciphertext/message.txt")

      puts ciphertext.tr key1, key2
    end

    ## Purge the keys when no longer needed, such as needed to create a new set of keys for a different player.
    def self.purge_keys
      system("rm _data/audit/keys1.txt; rm _data/audit/keys2.txt; touch _data/audit/cat.txt")
    end
  
  end
end
