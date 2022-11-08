Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5539C10E4BA
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 16:18:24 +0000 (UTC)
Message-ID: <2cd40a09-62a5-7eb6-5288-52645cfe72e4@igalia.com>
Date: Tue, 8 Nov 2022 15:18:13 -0100
MIME-Version: 1.0
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20221102110428.4049549-1-bhanuprakash.modem@intel.com>
 <20221104020005.4098049-1-bhanuprakash.modem@intel.com>
 <20221107224749.ldeba3ztjdvff7iw@mail.igalia.com>
In-Reply-To: <20221107224749.ldeba3ztjdvff7iw@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 11/7/22 21:48, Melissa Wen wrote:
> On 11/04, Bhanuprakash Modem wrote:
>> All subtests must report success/fail instead of crashing out.
>>
>> V2:
>> - Fix the coverage of max-size tests
>>
>> Fixes: 9494d53d ("tests/kms_cursor_crc: Convert tests to dynamic")
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Signed-off-by: Alaa Emad <aemad@igalia.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/kms_cursor_crc.c | 128 ++++++++++++++++++++++-------------------
>>   1 file changed, 68 insertions(+), 60 deletions(-)
>>
>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
>> index d51c1f90..68bed666 100644
>> --- a/tests/kms_cursor_crc.c
>> +++ b/tests/kms_cursor_crc.c
>> @@ -700,65 +700,78 @@ static void test_rapid_movement(data_t *data)
>>   	igt_assert_lt(usec, 0.9 * 400 * 1000000 / data->refresh);
>>   }
>>   
>> -static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
>> -			   int w, int h)
>> +static void run_size_tests(data_t *data, int w, int h)
>>   {
>>   	enum pipe pipe;
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
>>   	if (w == 0 && h == 0) {
>>   		w = data->cursor_max_w;
>>   		h = data->cursor_max_h;
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
>>   	}
>>   
>> -	create_cursor_fb(data, w, h);
>> -	if (require_cursor_size(data, w, h)) {
>> -		igt_info("Cursor size %dx%d not supported by driver\n", w, h);
>> +	igt_fixture
>> +		create_cursor_fb(data, w, h);
>>   
>> -		igt_remove_fb(data->drm_fd, &data->fb);
>> -		return;
>> -	}
>> +	for (i = 0; i < ARRAY_SIZE(size_tests); i++) {
>> +		igt_describe(size_tests[i].desc);
>> +		igt_subtest_with_dynamic_f("%s-%s", size_tests[i].name, name) {
>> +			if (!strcmp(name, "max-size")) {
>> +				/*
>> +				 * No point in doing the "max-size" test if
>> +				 * it was already covered by the other tests.
>> +				 */
>> +				if ((w == h) && (w <= 512) && (h <= 512) &&
>> +				    is_power_of_two(w) && is_power_of_two(h)) {
>> +					igt_info("Cursor max size %dx%d already covered by other tests\n", w, h);
>> +					continue;
>> +				}
>> +			}
>> +
>> +			for_each_pipe(&data->display, pipe) {
>> +				data->pipe = pipe;
>>   
>> -	for_each_pipe(&data->display, pipe) {
>> -		data->pipe = pipe;
>> -		igt_dynamic_f("pipe-%s-%s",
>> -			      kmstest_pipe_name(pipe), igt_output_name(data->output))
>> -			run_test(data, testfunc, w, h);
>> +				if (require_cursor_size(data, w, h)) {
> I think here we want `!require_cursor_size()` (not require_cursor_size),
> since zero means success for drmModeAtomicCommit(), that is used to
> check if the cursor size is accepted or not.

Never mind, I mixed up the meaning.

Alaa, as you are reviewing this work, can you add your 
Reviewed-by/Tested-by tag?

Anyway, I see much of this work was done by Alaa, therefore, it would be 
good to add a Co-developed-by tag to her too.

You can also add:

Reviewed-by: Melissa Wen <mwen@igalia.com>

>> +					igt_info("Cursor size %dx%d not supported by driver\n", w, h);
>> +					continue;
>> +				}
>> +
>> +				igt_dynamic_f("pipe-%s-%s",
>> +					      kmstest_pipe_name(pipe), igt_output_name(data->output))
>> +					run_test(data, size_tests[i].testfunc, w, h);
>> +			}
>> +		}
>>   	}
>>   
>> -	igt_remove_fb(data->drm_fd, &data->fb);
>> +	igt_fixture
>> +		igt_remove_fb(data->drm_fd, &data->fb);
>>   }
>>   
>>   static void run_tests_on_pipe(data_t *data)
>>   {
>>   	enum pipe pipe;
>>   	int cursor_size;
>> -	int i;
>> -	struct {
>> -		const char *name;
>> -		void (*testfunc)(data_t *);
>> -		const char *desc;
>> -	} size_tests[] = {
>> -		{ "cursor-onscreen", test_crc_onscreen,
>> -			"Check if a given-size cursor is well-positioned inside the screen." },
>> -		{ "cursor-offscreen", test_crc_offscreen,
>> -			"Check if a given-size cursor is well-positioned outside the screen." },
>> -		{ "cursor-sliding", test_crc_sliding,
>> -			"Check the smooth and pixel-by-pixel given-size cursor movements on horizontal, vertical and diagonal." },
>> -		{ "cursor-random", test_crc_random,
>> -			"Check random placement of a cursor with given size." },
>> -		{ "cursor-rapid-movement", test_rapid_movement,
>> -			"Check the rapid update of given-size cursor movements." },
>> -	};
>>   
>>   	igt_fixture {
>>   		data->output = igt_get_single_output_for_pipe(&data->display, pipe);
>> @@ -859,30 +872,25 @@ static void run_tests_on_pipe(data_t *data)
>>   	igt_fixture
>>   		igt_remove_fb(data->drm_fd, &data->fb);
>>   
>> -	for (i = 0; i < ARRAY_SIZE(size_tests); i++) {
>> -		igt_describe(size_tests[i].desc);
>> -		igt_subtest_group {
>> -			for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
>> -				int w = cursor_size;
>> -				int h = cursor_size;
>> +	for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
>> +		int w = cursor_size;
>> +		int h = cursor_size;
>>   
>> -				igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
>> -					run_size_tests(data, size_tests[i].testfunc, w, h);
>> +		igt_subtest_group
>> +			run_size_tests(data, w, h);
>>   
>> -				/*
>> -				 * Test non-square cursors a bit on the platforms
>> -				 * that support such things. And make it a bit more
>> -				 * interesting by using a non-pot height.
>> -				 */
>> -				h /= 3;
>> -				igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
>> -					run_size_tests(data, size_tests[i].testfunc, w, h);
>> -			}
>> +		/*
>> +		 * Test non-square cursors a bit on the platforms
>> +		 * that support such things. And make it a bit more
>> +		 * interesting by using a non-pot height.
>> +		 */
>> +		h /= 3;
>>   
>> -			igt_subtest_with_dynamic_f("%s-max-size", size_tests[i].name)
>> -				run_size_tests(data, size_tests[i].testfunc, 0, 0);
>> -		}
>> +		igt_subtest_group
>> +			run_size_tests(data, w, h);
>>   	}
>> +
>> +	run_size_tests(data, 0, 0);
>>   }
>>   
>>   static data_t data;
>> -- 
>> 2.38.0
>>
