Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2163410E360
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 04:52:45 +0000 (UTC)
Message-ID: <4dec50df-8e99-a983-bbc3-fc043ad26b3a@intel.com>
Date: Tue, 15 Nov 2022 10:22:26 +0530
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20221102110428.4049549-1-bhanuprakash.modem@intel.com>
 <20221104020005.4098049-1-bhanuprakash.modem@intel.com>
 <878rkdpadj.wl-ashutosh.dixit@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <878rkdpadj.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V2 i-g-t] tests/kms_cursor_crc: Fix SIGABRT in
 dynamic subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ashutosh,

On Tue-15-11-2022 01:38 am, Dixit, Ashutosh wrote:
> On Thu, 03 Nov 2022 19:00:05 -0700, Bhanuprakash Modem wrote:
>>
> 
> Hi Bhanu, could you please fix the compile warnings below. Thanks.
> 
> 
>> @@ -700,65 +700,78 @@ static void test_rapid_movement(data_t *data)
>> 	igt_assert_lt(usec, 0.9 * 400 * 1000000 / data->refresh);
>>   }
>>
>> -static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
>> -			   int w, int h)
>> +static void run_size_tests(data_t *data, int w, int h)
>>   {
>> 	enum pipe pipe;
>> +	struct {
>> +		const char *name;
>> +		void (*testfunc)(data_t *);
>> +		const char *desc;
>> +	} size_tests[] = {
>> +		{ "cursor-onscreen", test_crc_onscreen,
>> +			"Check if a given-size cursor is well-positioned inside the screen." },
>> +		{ "cursor-offscreen", test_crc_offscreen,
>> +			"Check if a given-size cursor is well-positioned outside the screen." },
>> +		{ "cursor-sliding", test_crc_sliding,
>> +			"Check the smooth and pixel-by-pixel given-size cursor movements on horizontal, vertical and diagonal." },
>> +		{ "cursor-random", test_crc_random,
>> +			"Check random placement of a cursor with given size." },
>> +		{ "cursor-rapid-movement", test_rapid_movement,
>> +			"Check the rapid update of given-size cursor movements." },
>> +	};
>> +	int i;
>> +	char name[16];
>>
>> 	if (w == 0 && h == 0) {
>> 		w = data->cursor_max_w;
>> 		h = data->cursor_max_h;
>>
>> -		/*
>> -		 * No point in doing the "max-size" test if
>> -		 * it was already covered by the other tests.
>> -		 */
>> -		if ((w == h) && (w <= 512) && (h <= 512) &&
>> -		    is_power_of_two(w) && is_power_of_two(h)) {
>> -			igt_info("Cursor max size %dx%d already covered by other tests\n", w, h);
>> -			return;
>> -		}
>> +		strcpy(name, "max-size");
>> +	} else {
>> +		snprintf(name, sizeof(name), "%dx%d", w, h);
> 
> [305/1132] Compiling C object tests/kms_cursor_crc.p/kms_cursor_crc.c.o
> ../tests/kms_cursor_crc.c: In function ‘run_size_tests.constprop’:
> ../tests/kms_cursor_crc.c:731:50: warning: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size between 4 and 14 [-Wformat-truncation=]
>    731 |                 snprintf(name, sizeof(name), "%dx%d", w, h);
>        |                                                  ^~
> ../tests/kms_cursor_crc.c:731:46: note: directive argument in the range [-2147483648, 1024]
>    731 |                 snprintf(name, sizeof(name), "%dx%d", w, h);
>        |                                              ^~~~~~~

Somehow this warning is not coming in local workspace, also not caught 
in CI.
It seems, -Wformat-truncation flag is missing.

$ meson -Drunner=enabled build && ninja -C build && ninja -C build test

truncated...

Compiler for C supports arguments -Wbad-function-cast: YES
Compiler for C supports arguments -Wdeclaration-after-statement: YES
Compiler for C supports arguments -Wformat=2: YES
Compiler for C supports arguments -Wimplicit-fallthrough=0: YES
Compiler for C supports arguments -Wlogical-op: YES
Compiler for C supports arguments -Wmissing-declarations: YES
Compiler for C supports arguments -Wmissing-format-attribute: YES
Compiler for C supports arguments -Wmissing-noreturn: YES
Compiler for C supports arguments -Wmissing-prototypes: YES
Compiler for C supports arguments -Wnested-externs: YES
Compiler for C supports arguments -Wold-style-definition: YES
Compiler for C supports arguments -Wpointer-arith: YES
Compiler for C supports arguments -Wredundant-decls: YES
Compiler for C supports arguments -Wshadow: YES
Compiler for C supports arguments -Wstrict-prototypes: YES
Compiler for C supports arguments -Wuninitialized: YES
Compiler for C supports arguments -Wunused: YES
Compiler for C supports arguments -Wno-clobbered: YES
Compiler for C supports arguments -Wno-maybe-uninitialized: YES
Compiler for C supports arguments -Wno-missing-field-initializers: YES
Compiler for C supports arguments -Wno-pointer-arith: YES
Compiler for C supports arguments -Wno-address-of-packed-member: YES
Compiler for C supports arguments -Wno-sign-compare: YES
Compiler for C supports arguments -Wno-type-limits: YES
Compiler for C supports arguments -Wno-unused-parameter: YES
Compiler for C supports arguments -Wno-unused-result: YES
Compiler for C supports arguments -Werror=address: YES
Compiler for C supports arguments -Werror=array-bounds: YES
Compiler for C supports arguments -Werror=implicit: YES
Compiler for C supports arguments -Werror=init-self: YES
Compiler for C supports arguments -Werror=int-to-pointer-cast: YES
Compiler for C supports arguments -Werror=main: YES
Compiler for C supports arguments -Werror=missing-braces: YES
Compiler for C supports arguments -Werror=nonnull: YES
Compiler for C supports arguments -Werror=pointer-to-int-cast: YES
Compiler for C supports arguments -Werror=return-type: YES
Compiler for C supports arguments -Werror=sequence-point: YES
Compiler for C supports arguments -Werror=trigraphs: YES
Compiler for C supports arguments -Werror=write-strings: YES
Compiler for C supports arguments -fno-builtin-malloc: YES
Compiler for C supports arguments -fno-builtin-calloc: YES
Compiler for C supports arguments -fcommon: YES

truncated...

Compiler for C supports arguments -Wno-declaration-after-statement: YES
Compiler for C supports arguments -Wno-discarded-qualifiers: YES
Compiler for C supports arguments -Wno-missing-format-attribute: YES
Compiler for C supports arguments -Wno-old-style-definition: YES
Compiler for C supports arguments -Wno-redundant-decls: YES
Compiler for C supports arguments -Wno-shadow: YES
Compiler for C supports arguments 
-Wno-incompatible-pointer-types-discards-qualifiers: NO

truncated...

Found ninja-1.10.0 at /usr/bin/ninja
ninja: Entering directory `build'
[1234/1234] Linking target tests/core_hotunplug
ninja: Entering directory `build'

truncated...

Ok:                 332
Expected Fail:      4
Fail:               0
Unexpected Pass:    0
Skipped:            0
Timeout:            0

- Bhanu

> In file included from /usr/include/stdio.h:894,
> 		 from ../lib/igt_core.h:41,
> 		 from ../lib/drmtest.h:39,
> 		 from ../lib/igt.h:27,
> 		 from ../tests/kms_cursor_crc.c:25:
> In function ‘snprintf’,
>      inlined from ‘run_size_tests.constprop’ at ../tests/kms_cursor_crc.c:731:3:
> /usr/include/bits/stdio2.h:71:10: note: ‘__builtin___snprintf_chk’ output between 4 and 24 bytes into a destination of size 16
>     71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
>        |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     72 |                                    __glibc_objsize (__s), __fmt,
>        |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     73 |                                    __va_arg_pack ());
>        |                                    ~~~~~~~~~~~~~~~~~
