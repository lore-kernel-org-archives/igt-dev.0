Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FB210FED5
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jun 2022 13:21:32 +0000 (UTC)
Message-ID: <7833fd84-5bcf-3f75-959c-791dd3c3492a@intel.com>
Date: Wed, 8 Jun 2022 18:51:24 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
 <20220517120245.3521494-2-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220517120245.3521494-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 01/11] tests/kms_pipe_crc_basic: Convert tests to
 dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 17-May-22 5:32 PM, Bhanuprakash Modem wrote:
> Convert the existing subtests to dynamic subtests at pipe level.
> 
> V2:
> * Fix typos: s/hand/hang/, s/TEST_NONE/TEST_BASIC, etc..
> V3:
> * Add output->name to the dynamic subtest
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_pipe_crc_basic.c | 140 +++++++++++++++++++++----------------
>   1 file changed, 78 insertions(+), 62 deletions(-)
> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 0861c46d..a9fbfc32 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -59,22 +59,23 @@ static void test_bad_source(data_t *data)
>   
>   #define N_CRCS	3
>   
> -#define TEST_SEQUENCE (1<<0)
> -#define TEST_NONBLOCK (1<<1)
> +enum {
> +	TEST_BASIC = 0,
> +	TEST_SEQUENCE = 1 << 0,
> +	TEST_NONBLOCK = 1 << 1,
> +	TEST_SUSPEND = 1 << 2,
> +	TEST_HANG = 1 << 3,
> +};
>   
> -static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
> +static void test_read_crc(data_t *data, enum pipe pipe,
> +			  igt_output_t *output, unsigned flags)
>   {
>   	igt_display_t *display = &data->display;
> -	igt_output_t *output;
>   	igt_plane_t *primary;
>   	drmModeModeInfo *mode;
>   	igt_crc_t *crcs = NULL;
>   	int c, j;
>   
> -	igt_require_pipe(display, pipe);
> -	igt_display_require_output_on_pipe(display, pipe);
> -	output = igt_get_single_output_for_pipe(display, pipe);
> -
>   	igt_display_reset(display);
>   	igt_output_set_pipe(output, pipe);
>   
> @@ -164,7 +165,7 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
>    *
>    *   No CRC mismatch should happen
>    */
> -static void test_compare_crc(data_t *data, enum pipe pipe)
> +static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_plane_t *primary;
> @@ -172,11 +173,6 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
>   	igt_crc_t ref_crc, crc;
>   	igt_pipe_crc_t *pipe_crc = NULL;
>   	struct igt_fb fb0, fb1;
> -	igt_output_t *output;
> -
> -	igt_require_pipe(display, pipe);
> -	igt_display_require_output_on_pipe(display, pipe);
> -	output = igt_get_single_output_for_pipe(display, pipe);
>   
>   	igt_display_reset(display);
>   	igt_output_set_pipe(output, pipe);
> @@ -223,18 +219,14 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
>   	igt_remove_fb(data->drm_fd, &fb1);
>   }
>   
> -static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe)
> +static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
> +					igt_output_t *output)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_pipe_crc_t *pipe_crc;
>   	drmModeModeInfo *mode;
> -	igt_output_t *output;
>   	igt_crc_t crc[2];
>   
> -	igt_require_pipe(display, pipe);
> -	igt_display_require_output_on_pipe(display, pipe);
> -	output = igt_get_single_output_for_pipe(display, pipe);
> -
>   	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, "auto");
>   
>   	igt_display_reset(display);
> @@ -270,6 +262,25 @@ data_t data = {0, };
>   igt_main
>   {
>   	enum pipe pipe;
> +	struct {
> +		const char *name;
> +		unsigned flags;
> +		const char *desc;
> +	} tests[] = {
> +		{ "read-crc", TEST_BASIC,
> +			"Test for pipe CRC reads." },
> +		{ "read-crc-frame-sequence", TEST_SEQUENCE,
> +			"Tests the pipe CRC read and ensure frame sequence." },
> +		{ "nonblocking-crc", TEST_NONBLOCK,
> +			"Test for O_NONBLOCK CRC reads." },
> +		{ "nonblocking-crc-frame-sequence", TEST_SEQUENCE | TEST_NONBLOCK,
> +			"Test for O_NONBLOCK CRC reads and ensure frame sequence." },
> +		{ "suspend-read-crc", TEST_SUSPEND,
> +			"Suspend test for pipe CRC reads." },
> +		{ "hang-read-crc", TEST_HANG,
> +			"Hang test for pipe CRC read." },
> +	};
> +	int i;
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -279,6 +290,7 @@ igt_main
>   		igt_require_pipe_crc(data.drm_fd);
>   
>   		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
>   		data.debugfs = igt_debugfs_dir(data.drm_fd);
>   	}
>   
> @@ -286,54 +298,58 @@ igt_main
>   	igt_subtest("bad-source")
>   		test_bad_source(&data);
>   
> -	for_each_pipe_static(pipe) {
> -		igt_describe("Test for pipe CRC reads.");
> -		igt_subtest_f("read-crc-pipe-%s", kmstest_pipe_name(pipe))
> -			test_read_crc(&data, pipe, 0);
> -
> -		igt_describe("Tests the pipe CRC read and ensure frame sequence.");
> -		igt_subtest_f("read-crc-pipe-%s-frame-sequence", kmstest_pipe_name(pipe))
> -			test_read_crc(&data, pipe, TEST_SEQUENCE);
> -
> -		igt_describe("Test for O_NONBLOCK CRC reads.");
> -		igt_subtest_f("nonblocking-crc-pipe-%s", kmstest_pipe_name(pipe))
> -			test_read_crc(&data, pipe, TEST_NONBLOCK);
> -
> -		igt_describe("Test for O_NONBLOCK CRC reads and ensure frame sequence.");
> -		igt_subtest_f("nonblocking-crc-pipe-%s-frame-sequence", kmstest_pipe_name(pipe))
> -			test_read_crc(&data, pipe, TEST_SEQUENCE | TEST_NONBLOCK);
> -
> -		igt_describe("Suspend test for pipe CRC reads");
> -		igt_subtest_f("suspend-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
> -			test_read_crc(&data, pipe, 0);
> -
> -			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> -						      SUSPEND_TEST_NONE);
> -
> -			test_read_crc(&data, pipe, 0);
> +	for (i = 0; i < ARRAY_SIZE(tests); i++) {
> +		igt_describe(tests[i].desc);
> +		igt_subtest_with_dynamic(tests[i].name) {
> +			for_each_pipe(&data.display, pipe) {
> +				igt_output_t *output = igt_get_single_output_for_pipe(&data.display, pipe);
> +
> +				igt_require(output);
> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> +					if (tests[i].flags & TEST_SUSPEND) {
> +						test_read_crc(&data, pipe, output, 0);
> +
> +						igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +									      SUSPEND_TEST_NONE);
> +
> +						test_read_crc(&data, pipe, output, 0);
> +					} else if (tests[i].flags & TEST_SUSPEND) {

Do you mean TEST_HANG here?

> +						igt_hang_t hang = igt_allow_hang(data.drm_fd, 0, 0);
> +
> +						test_read_crc(&data, pipe, output, 0);
> +						igt_force_gpu_reset(data.drm_fd);
> +						test_read_crc(&data, pipe, output, 0);
> +
> +						igt_disallow_hang(data.drm_fd, hang);
> +					} else {
> +						test_read_crc(&data, pipe, output, tests[i].flags);
> +					}
> +				}
> +			}
>   		}
> +	}
>   
> -		igt_describe("Check that disabling CRCs on a CRTC after having disabled the CRTC "
> -			     "does not cause issues.");
> -		igt_subtest_f("disable-crc-after-crtc-pipe-%s", kmstest_pipe_name(pipe))
> -			test_disable_crc_after_crtc(&data, pipe);
> -
> -		igt_describe("Hang test for pipe CRC read");
> -		igt_subtest_f("hang-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
> -			igt_hang_t hang = igt_allow_hang(data.drm_fd, 0, 0);
> -
> -			test_read_crc(&data, pipe, 0);
> +	igt_describe("Check that disabling CRCs on a CRTC after having disabled the CRTC "
> +		     "does not cause issues.");
> +	igt_subtest_with_dynamic("disable-crc-after-crtc") {
> +		for_each_pipe(&data.display, pipe) {
> +			igt_output_t *output = igt_get_single_output_for_pipe(&data.display, pipe);
>   
> -			igt_force_gpu_reset(data.drm_fd);
> +			igt_require(output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +				test_disable_crc_after_crtc(&data, pipe, output);
> +		}
> +	}
>   
> -			test_read_crc(&data, pipe, 0);
> +	igt_describe("Basic sanity check for CRC mismatches");
> +	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
> +		for_each_pipe(&data.display, pipe) {
> +			igt_output_t *output = igt_get_single_output_for_pipe(&data.display, pipe);
>   
> -			igt_disallow_hang(data.drm_fd, hang);
> +			igt_require(output);
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +				test_compare_crc(&data, pipe, output);
>   		}
> -
> -		igt_describe("Basic sanity check for CRC mismatches");
> -		igt_subtest_f("compare-crc-sanitycheck-pipe-%s", kmstest_pipe_name(pipe))
> -			test_compare_crc(&data, pipe);
>   	}
>   
>   	igt_fixture {

-- 
~Swati Sharma
