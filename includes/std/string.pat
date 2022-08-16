#pragma once

#include <std/io.pat>

namespace std::string {

	fn length(str string) {
		return builtin::std::string::length(string);
	};

	fn at(str string, u32 index) {
		return builtin::std::string::at(string, index);
	};

	fn substr(str string, u32 pos, u32 count) {
		return builtin::std::string::substr(string, pos, count);
	};


	fn parse_int(str string, u8 base) {
		return builtin::std::string::parse_int(string, base);
	};

	fn parse_float(str string) {
		return builtin::std::string::parse_float(string);
	};


    fn to_string(auto x) {
        return std::format("{}", x);
    };

    fn starts_with(str string, str part) {
        return std::string::substr(string, 0, std::string::length(part)) == part;
    };

    fn ends_with(str string, str part) {
        return std::string::substr(string, std::string::length(string) - std::string::length(part), std::string::length(part)) == part;
    };

    fn contains(str a, str b) {
        s32 a_len = std::string::length(a);
        s32 b_len = std::string::length(b);

        for (s32 i = 0, i <= (a_len - b_len), i += 1) {
            if (std::string::substr(a, i, b_len) == b)
                return true;
        }

        return false;
    };

    fn reverse(str string) {	
        str result;
        
        s32 i;
        i = std::string::length(string);
        while (i > 0) {
            i = i - 1;
            result = result + std::string::at(string, i);
        }
            
        return result;
    };

    fn to_upper(str string) {
		str result;
		
		u32 i;
		char c;
		while (i < std::string::length(string)) {
			c = std::string::at(string, i);
			
			if (c >= 'a' && c <= 'z')
				result = result + char(c - 0x20);
			else
				result = result + c;
			
			i = i + 1;
		}
		
		return result;
	};
	
	fn to_lower(str string) {
		str result;
		
		u32 i;
		char c;
		while (i < std::string::length(string)) {
			c = std::string::at(string, i);
			
			if (c >= 'A' && c <= 'Z')
				result = result + char(c + 0x20);
			else
				result = result + c;
			
			i = i + 1;
		}
		
		return result;
	};

    fn replace(str string, str pattern, str replace) {
    	u32 string_len, pattern_len, replace_len;
		string_len  = std::string::length(string);
		pattern_len = std::string::length(pattern);
		replace_len = std::string::length(replace);
		
		if (pattern_len > string_len)
			return string;
			
		str result;
		u32 i;
		while (i <= (string_len - pattern_len)) {
			
			if (std::string::substr(string, i, pattern_len) == pattern) {
				result = result + replace;
				i = i + pattern_len;
			} else {
				result = result + std::string::at(string, i);
				i = i + 1;
			}
		}
		
		return result;
	};


}
