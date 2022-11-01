Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA5F10E37B
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Nov 2022 11:25:52 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 01 Nov 2022 12:25:46 +0100
From: aemad <aemad@igalia.com>
To: juhapekka.heikkila@gmail.com
In-Reply-To: <aa261d04-81b3-48ac-603b-c75fcb3c8909@gmail.com>
References: <20221009151844.3456-1-aemad@igalia.com>
 <aa261d04-81b3-48ac-603b-c75fcb3c8909@gmail.com>
Message-ID: <31ec4c5751bfda7c1f174b9e0c898280@igalia.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: prevent the
 entire test from being aborted when a subtest fails
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-10-10 13:16, Juha-Pekka Heikkila wrote:
> Hi Alaa,
> 
> what's that invalid argument you're getting on addfb? I never tried
> this with vkms, normally just on i915. With i915 I cannot reproduce
> that abort you're seeing. Other kms tests run on your setup?
> 

Hi Juha-Pekka,

> Anyway, that revert you're suggesting would remove support for msm
> driver on this test. Let's first summon those who made these changes
> to comment. (cc'ing Modem and Swati)

Could you please explain why this patch will remove MSM driver support?


BR,
Alaa


> 
> /Juha-Pekka
> 
> On 9.10.2022 18.18, Alaa Emad wrote:
>> Any test failure prevents the other tests to be run, aborting the entire test loop. This behavior was introduced by commit
>> 9494d53d ("tests/kms_cursor_crc: Convert tests to dynamic").
>> For instance, when running the cursor-offscreen-32x10 subtest using VKMS,
>> the execution is aborted instead of SKIP/FAIL, as in the following output:
>>
>> $ ./tests/kms_cursor_crc --run-subtest cursor-offscreen-32x10
>> (kms_cursor_crc:7447) igt_fb-CRITICAL: Test assertion failure function igt_create_fb_with_bo_size, file ../lib/igt_fb.c:2078:
>> (kms_cursor_crc:7447) igt_fb-CRITICAL: Failed assertion: (__kms_addfb(fb->fd, fb->gem_handle, fb->width, fb->height, fb->drm_format, fb->modifier, fb->strides, fb->offsets, fb->num_planes, flags, &fb->fb_id)) == 0
>> (kms_cursor_crc:7447) igt_fb-CRITICAL: Last errno: 22, Invalid argument
>> Stack trace:
>> kms_cursor_crc: ../lib/igt_core.c:1667: igt_fail: Assertion `_igt_dynamic_tests_executed < 0 || dynamic_failed_one' failed.
>> Received signal SIGABRT.
>>
>> The test was aborted after convertig tests to dynamic with cursor size 32*10 that because of the assertion in the `igt_create_fb_with_bo_size` when creating cursor in `create_cursor_fb`.
>>
>> This happened because Within a igt_subtest_with_dynamic block, explicit failure (e.g. igt_assert) is not allowed,
>> only dynamic subsubtests themselves will produce test results.
>>
>> The previous approach was running each test for all cursor sizes then move to the next test  so fix this issue
>> by running all tests for one cursor size one by one, and check if cursor size is
>> supported or not before running the test.
>>
>> Fixes: 9494d53d ("tests/kms_cursor_crc: Convert tests to dynamic")
>>
>> Signed-off-by: Alaa Emad <aemad@igalia.com>
>> ---
>>   tests/kms_cursor_crc.c | 136 +++++++++++++++++++++--------------------
>>   1 file changed, 69 insertions(+), 67 deletions(-)
>>
>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
>> index 8d3426dd..9b620389 100644
>> --- a/tests/kms_cursor_crc.c
>> +++ b/tests/kms_cursor_crc.c
>> @@ -72,7 +72,6 @@ typedef struct {
>>   	cairo_surface_t *surface;
>>   	uint32_t devid;
>>   	double alpha;
>> -	int vblank_wait_count; /* because of msm */
>>   } data_t;
>>     #define TEST_DPMS (1<<0)
>> @@ -125,12 +124,6 @@ static void cursor_disable(data_t *data)
>>   {
>>   	igt_plane_set_fb(data->cursor, NULL);
>>   	igt_plane_set_position(data->cursor, 0, 0);
>> -	igt_display_commit(&data->display);
>> -
>> -	/* do this wait here so it will not need to be added everywhere */
>> -	igt_wait_for_vblank_count(data->drm_fd,
>> -				  data->display.pipes[data->pipe].crtc_offset,
>> -				  data->vblank_wait_count);
>>   }
>>     static bool chv_cursor_broken(data_t *data, int x)
>> @@ -209,9 +202,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>>   		igt_display_commit(display);
>>     		/* Extra vblank wait is because nonblocking cursor ioctl */
>> -		igt_wait_for_vblank_count(data->drm_fd,
>> -					  display->pipes[data->pipe].crtc_offset,
>> -					  data->vblank_wait_count);
>> +		igt_wait_for_vblank(data->drm_fd,
>> +				display->pipes[data->pipe].crtc_offset);
>>     		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
>>   @@ -249,7 +241,11 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>>     		restore_image(data, swbufidx, &((cursorarea){x, y, data->curw, data->curh}));
>>   		igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
>> +
>>   		igt_display_commit(display);
>> +		igt_wait_for_vblank(data->drm_fd,
>> +				display->pipes[data->pipe].crtc_offset);
>> +
>>   		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
>>   		igt_assert_crc_equal(&crc, hwcrc);
>>   	}
>> @@ -267,7 +263,9 @@ static void do_fail_test(data_t *data, int x, int y, int expect)
>>   	igt_plane_set_position(data->cursor, x, y);
>>   	ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>>   +	igt_plane_set_position(data->cursor, 0, 0);
>>   	cursor_disable(data);
>> +	igt_display_commit(display);
>>     	igt_assert_eq(ret, expect);
>>   }
>> @@ -689,10 +687,28 @@ static void test_rapid_movement(data_t *data)
>>   	igt_assert_lt(usec, 0.9 * 400 * 1000000 / data->refresh);
>>   }
>>   -static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
>> -			   int w, int h)
>> +static void run_size_tests(data_t *data, int w, int h)
>>   {
>>   	enum pipe pipe;
>> +	int i;
>> +
>> +	struct
>> +	{
>> +		const char *name;
>> +		void (*testfunc)(data_t *);
>> +		const char *desc;
>> +	} size_tests[] = {
>> +		{"cursor-onscreen", test_crc_onscreen,
>> +		 "Check if a given-size cursor is well-positioned inside the screen."},
>> +		{"cursor-offscreen", test_crc_offscreen,
>> +		 "Check if a given-size cursor is well-positioned outside the screen."},
>> +		{"cursor-sliding", test_crc_sliding,
>> +		 "Check the smooth and pixel-by-pixel given-size cursor movements on horizontal, vertical and diagonal."},
>> +		{"cursor-random", test_crc_random,
>> +		 "Check random placement of a cursor with given size."},
>> +		{"cursor-rapid-movement", test_rapid_movement,
>> +		 "Check the rapid update of given-size cursor movements."},
>> +	};
>>     	if (w == 0 && h == 0) {
>>   		w = data->cursor_max_w;
>> @@ -709,45 +725,38 @@ static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
>>   		}
>>   	}
>>   -	create_cursor_fb(data, w, h);
>> -	if (require_cursor_size(data, w, h)) {
>> -		igt_info("Cursor size %dx%d not supported by driver\n", w, h);
>> -
>> -		igt_remove_fb(data->drm_fd, &data->fb);
>> -		return;
>> -	}
>> +	igt_fixture
>> +		create_cursor_fb(data, w, h);
>>   -	for_each_pipe(&data->display, pipe) {
>> -		data->pipe = pipe;
>> -		igt_dynamic_f("pipe-%s-%s",
>> -			      kmstest_pipe_name(pipe), igt_output_name(data->output))
>> -			run_test(data, testfunc, w, h);
>> +	for (i = 0; i < ARRAY_SIZE(size_tests); i++)
>> +	{
>> +		igt_describe(size_tests[i].desc);
>> +		igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
>> +		{
>> +			for_each_pipe(&data->display, pipe)
>> +			{
>> +				data->pipe = pipe;
>> +				if (require_cursor_size(data, w, h))
>> +				{
>> +					igt_info("Cursor size %dx%d not supported by driver\n", w, h);
>> +					continue;
>> +				}
>> +
>> +				igt_dynamic_f("pipe-%s-%s",
>> +							  kmstest_pipe_name(pipe), igt_output_name(data->output))
>> +					run_test(data, size_tests[i].testfunc, w, h);
>> +			}
>> +		}
>>   	}
>>   -	igt_remove_fb(data->drm_fd, &data->fb);
>> +	igt_fixture
>> +		igt_remove_fb(data->drm_fd, &data->fb);
>>   }
>>     static void run_tests_on_pipe(data_t *data)
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
>>     	igt_fixture {
>>   		data->output = igt_get_single_output_for_pipe(&data->display, pipe);
>> @@ -848,30 +857,26 @@ static void run_tests_on_pipe(data_t *data)
>>   	igt_fixture
>>   		igt_remove_fb(data->drm_fd, &data->fb);
>>   -	for (i = 0; i < ARRAY_SIZE(size_tests); i++) {
>> -		igt_describe(size_tests[i].desc);
>> -		igt_subtest_group {
>> -			for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
>> -				int w = cursor_size;
>> -				int h = cursor_size;
>> -
>> -				igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
>> -					run_size_tests(data, size_tests[i].testfunc, w, h);
>> -
>> -				/*
>> -				 * Test non-square cursors a bit on the platforms
>> -				 * that support such things. And make it a bit more
>> -				 * interesting by using a non-pot height.
>> -				 */
>> -				h /= 3;
>> -				igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
>> -					run_size_tests(data, size_tests[i].testfunc, w, h);
>> -			}
>> +	for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2)
>> +	{
>> +		int w = cursor_size;
>> +		int h = cursor_size;
>>   -			igt_subtest_with_dynamic_f("%s-max-size", size_tests[i].name)
>> -				run_size_tests(data, size_tests[i].testfunc, 0, 0);
>> -		}
>> +		igt_subtest_group
>> +			run_size_tests(data, w, h);
>> +
>> +		/*
>> +		 * Test non-square cursors a bit on the platforms
>> +		 * that support such things. And make it a bit more
>> +		 * interesting by using a non-pot height.
>> +		 */
>> +		h /= 3;
>> +
>> +		igt_subtest_group
>> +			run_size_tests(data, w, h);
>>   	}
>> +
>> +	run_size_tests(data, 0, 0);
>>   }
>>     static data_t data;
>> @@ -896,8 +901,6 @@ igt_main
>>   		kmstest_set_vt_graphics_mode();
>>     		igt_require_pipe_crc(data.drm_fd);
>> -
>> -		data.vblank_wait_count = is_msm_device(data.drm_fd) ? 2 : 1;
>>   	}
>>     	data.cursor_max_w = cursor_width;
>> @@ -913,6 +916,5 @@ igt_main
>>   		}
>>     		igt_display_fini(&data.display);
>> -		close(data.drm_fd);
>>   	}
>>   }
