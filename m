Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C2010F10E
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 08:08:44 +0000 (UTC)
Date: Tue, 31 May 2022 10:08:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YpXM8uS68JAfDGJn@kamilkon-desk1>
References: <20220531053648.19856-1-karthik.b.s@intel.com>
 <20220531053648.19856-2-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220531053648.19856-2-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/2] tests/kms_async_flips: Convert
 tests to dynamic
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

Hi Karthik,

On 2022-05-31 at 11:06:47 +0530, Karthik B S wrote:

Put commit description here.

> v2: -Get the mode after igt_display_reset() (Bhanu)
> 
> v3: -Move patch to start of series to avoid code duplication (Bhanu)
>     -Use for_each_pipe() instead of for_each_pipe_static() (Bhanu)
> 
> v4: -Add helper to avoid code duplication (Andre)

Looks like you do a little more than just converting tests to
dynamic, can you describe that in commit message or maybe split
this patch into converting and adding new option and extending
tests ?

--
Kamil

> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_async_flips.c | 80 +++++++++++++++++++++++++++++++----------
>  1 file changed, 62 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 1701883b..8b545b77 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -51,6 +51,7 @@ typedef struct {
>  	struct igt_fb bufs[4];
>  	igt_display_t display;
>  	drmModeConnectorPtr connector;
> +	igt_output_t *output;
>  	unsigned long flip_timestamp_us;
>  	double flip_interval;
>  	igt_pipe_crc_t *pipe_crc;
> @@ -58,6 +59,9 @@ typedef struct {
>  	int flip_count;
>  	int frame_count;
>  	bool flip_pending;
> +	bool extended;
> +	enum pipe pipe;
> +	bool alternate_sync_async;
>  } data_t;
>  
>  static drmModeConnectorPtr find_connector_for_modeset(data_t *data)
> @@ -159,7 +163,7 @@ static void require_monotonic_timestamp(int fd)
>  		      "Monotonic timestamps not supported\n");
>  }
>  
> -static void test_async_flip(data_t *data, bool alternate_sync_async)
> +static void test_async_flip(data_t *data)
>  {
>  	int ret, frame;
>  	long long int fps;
> @@ -172,7 +176,7 @@ static void test_async_flip(data_t *data, bool alternate_sync_async)
>  	do {
>  		int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
>  
> -		if (alternate_sync_async) {
> +		if (data->alternate_sync_async) {
>  			flags &= ~DRM_MODE_PAGE_FLIP_ASYNC;
>  
>  			ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> @@ -216,7 +220,7 @@ static void test_async_flip(data_t *data, bool alternate_sync_async)
>  		gettimeofday(&end, NULL);
>  		timersub(&end, &start, &diff);
>  
> -		if (alternate_sync_async) {
> +		if (data->alternate_sync_async) {
>  			igt_assert_f(data->flip_interval < 1000.0 / (data->refresh_rate * MIN_FLIPS_PER_FRAME),
>  				     "Flip interval not significantly smaller than vblank interval\n"
>  				     "Flip interval: %lfms, Refresh Rate = %dHz, Threshold = %d\n",
> @@ -226,7 +230,7 @@ static void test_async_flip(data_t *data, bool alternate_sync_async)
>  		frame++;
>  	} while (diff.tv_sec < RUN_TIME);
>  
> -	if (!alternate_sync_async) {
> +	if (!data->alternate_sync_async) {
>  		fps = frame * 1000 / RUN_TIME;
>  		igt_assert_f((fps / 1000) > (data->refresh_rate * MIN_FLIPS_PER_FRAME),
>  			     "FPS should be significantly higher than the refresh rate\n");
> @@ -540,9 +544,45 @@ static void test_crc(data_t *data)
>  	igt_assert_lt(data->frame_count * 2, data->flip_count);
>  }
>  
> -igt_main
> +static void run_test(data_t *data, void (*test)(data_t *))
> +{
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
> +	for_each_pipe(&data->display, pipe) {
> +		for_each_valid_output_on_pipe(&data->display, pipe, output) {
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> +				data->output = output;
> +				data->pipe = pipe;
> +				test(data);
> +			}
> +
> +			if (!data->extended)
> +				break;
> +		}
> +	}
> +}
> +
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	data_t *data = _data;
> +
> +	switch (opt) {
> +	case 'e':
> +		data->extended = true;
> +		break;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const char help_str[] =
> +"  --e \t\tRun the extended tests\n";
> +
> +static data_t data;
> +
> +igt_main_args("e", NULL, help_str, opt_handler, &data)
>  {
> -	static data_t data;
>  	int i;
>  
>  	igt_fixture {
> @@ -561,28 +601,32 @@ igt_main
>  			test_init(&data);
>  
>  		igt_describe("Wait for page flip events in between successive asynchronous flips");
> -		igt_subtest("async-flip-with-page-flip-events")
> -			test_async_flip(&data, false);
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
> +			data.alternate_sync_async = false;
> +			run_test(&data, test_async_flip);
> +		}
>  
>  		igt_describe("Alternate between sync and async flips");
> -		igt_subtest("alternate-sync-async-flip")
> -			test_async_flip(&data, true);
> +		igt_subtest_with_dynamic("alternate-sync-async-flip") {
> +			data.alternate_sync_async = true;
> +			run_test(&data, test_async_flip);
> +		}
>  
>  		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
> -		igt_subtest("test-time-stamp")
> -			test_timestamp(&data);
> +		igt_subtest_with_dynamic("test-time-stamp")
> +			run_test(&data, test_timestamp);
>  
>  		igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
> -		igt_subtest("test-cursor")
> -			test_cursor(&data);
> +		igt_subtest_with_dynamic("test-cursor")
> +			run_test(&data, test_cursor);
>  
>  		igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
> -		igt_subtest("invalid-async-flip")
> -			test_invalid(&data);
> +		igt_subtest_with_dynamic("invalid-async-flip")
> +			run_test(&data, test_invalid);
>  
>  		igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
> -		igt_subtest("crc")
> -			test_crc(&data);
> +		igt_subtest_with_dynamic("crc")
> +			run_test(&data, test_crc);
>  
>  		igt_fixture {
>  			for (i = 0; i < ARRAY_SIZE(data.bufs); i++)
> -- 
> 2.22.0
> 
