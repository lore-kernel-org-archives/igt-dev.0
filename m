Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0703A10E1C6
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 13:03:41 +0000 (UTC)
Message-ID: <019a4c4c-c2a1-ecdd-7a53-968de33920a6@intel.com>
Date: Fri, 22 Apr 2022 18:33:30 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220422104547.15940-1-nidhi1.gupta@intel.com>
 <20220422104547.15940-3-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220422104547.15940-3-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms : Added dynamic test cases
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

On Fri-22-04-2022 04:15 pm, Nidhi Gupta wrote:
> Modified kms_sequence and kms_concurrent to include
> dynamic test cases.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_concurrent.c |  6 ++-
>   tests/kms_sequence.c   | 87 +++++++++++++++++++++---------------------
>   2 files changed, 48 insertions(+), 45 deletions(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 622d3335..82b2021e 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -328,9 +328,11 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>   
>   	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
>   		     "resolution.");
> -	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe))
> +	igt_subtest_with_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
>   		for_each_valid_output_on_pipe(&data->display, pipe, output)
> -			run_test(data, pipe, output);
> +			igt_dynamic_f("%s", igt_output_name(output))
> +				run_test(data, pipe, output);
> +	}
>   }
>   
>   static int opt_handler(int option, int option_index, void *input)
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index ca25e041..5ec3e925 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -140,54 +140,46 @@ static void run_test(data_t *data, int fd, void (*testfunc)(data_t *, int, int))
>   {
>   	int nchildren =
>   		data->flags & FORKED ? sysconf(_SC_NPROCESSORS_ONLN) : 1;
> -	igt_display_t *display = &data->display;
>   	igt_output_t *output;
> -	enum pipe p;
> -	unsigned int valid_tests = 0;
> -
> -	for_each_pipe_with_valid_output(display, p, output) {
> -		data->pipe = p;
> -		prepare_crtc(data, fd, output);
> -
> -		igt_info("Beginning %s on pipe %s, connector %s (%d threads)\n",
> -			 igt_subtest_name(),
> -			 kmstest_pipe_name(data->pipe),
> -			 igt_output_name(output),
> -			 nchildren);
> -
> -		if (data->flags & BUSY) {
> -			struct drm_crtc_queue_sequence cqs;
> -
> -			memset(&cqs, 0, sizeof(cqs));
> -			cqs.crtc_id = data->crtc_id;
> -			cqs.flags = DRM_CRTC_SEQUENCE_RELATIVE;
> -			cqs.sequence = 120 + 12;
> -			igt_assert_eq(crtc_queue_sequence(fd, &cqs), 0);
> -		}
> +	output = data->output;

Assignment can be done in definition directly.
igt_output_t *output = data->output;

With above change, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

>   
> -		igt_fork(child, nchildren)
> -			testfunc(data, fd, nchildren);
> -		igt_waitchildren();
> +	prepare_crtc(data, fd, output);
>   
> -		if (data->flags & BUSY) {
> -			struct drm_event_vblank buf;
> -			igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
> -		}
> +	igt_info("Beginning %s on pipe %s, connector %s (%d threads)\n",
> +		 igt_subtest_name(),
> +		 kmstest_pipe_name(data->pipe),
> +		 igt_output_name(output),
> +		 nchildren);
> +
> +	if (data->flags & BUSY) {
> +		struct drm_crtc_queue_sequence cqs;
> +
> +		memset(&cqs, 0, sizeof(cqs));
> +		cqs.crtc_id = data->crtc_id;
> +		cqs.flags = DRM_CRTC_SEQUENCE_RELATIVE;
> +		cqs.sequence = 120 + 12;
> +		igt_assert_eq(crtc_queue_sequence(fd, &cqs), 0);
> +	}
>   
> -		igt_assert(poll(&(struct pollfd){fd, POLLIN}, 1, 0) == 0);
> +	igt_fork(child, nchildren)
> +	testfunc(data, fd, nchildren);
> +	igt_waitchildren();
>   
> -		igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
> -			 igt_subtest_name(),
> -			 kmstest_pipe_name(data->pipe),
> -			 igt_output_name(output));
> +	if (data->flags & BUSY) {
> +		struct drm_event_vblank buf;
>   
> -		/* cleanup what prepare_crtc() has done */
> -		cleanup_crtc(data, fd, output);
> -		valid_tests++;
> +		igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
>   	}
>   
> -	igt_require_f(valid_tests,
> -		      "no valid crtc/connector combinations found\n");
> +	igt_assert(poll(&(struct pollfd){fd, POLLIN}, 1, 0) == 0);
> +
> +	igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
> +		 igt_subtest_name(),
> +		 kmstest_pipe_name(data->pipe),
> +		 igt_output_name(output));
> +
> +	/* cleanup what prepare_crtc() has done */
> +	cleanup_crtc(data, fd, output);
>   }
>   
>   static void sequence_get(data_t *data, int fd, int nchildren)
> @@ -255,6 +247,8 @@ static void sequence_queue(data_t *data, int fd, int nchildren)
>   igt_main
>   {
>   	int fd;
> +	igt_output_t *output;
> +	enum pipe p;
>   	data_t data;
>   	const struct {
>   		const char *name;
> @@ -280,6 +274,7 @@ igt_main
>   		fd = drm_open_driver_master(DRIVER_ANY);
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&data.display, fd);
> +		igt_display_require_output(&data.display);
>   	}
>   
>   	for (f = funcs; f->name; f++) {
> @@ -289,9 +284,15 @@ igt_main
>   
>   			igt_describe("This is a test of drmCrtcGetSequence and "
>   				     "drmCrtcQueueSequence");
> -			igt_subtest_f("%s-%s", f->name, m->name) {
> -				data.flags = m->flags;
> -				run_test(&data, fd, f->func);
> +			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
> +				for_each_pipe_with_valid_output(&data.display, p, output) {
> +					igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(p)) {
> +						data.pipe = p;
> +						data.output = output;
> +						data.flags = m->flags;
> +						run_test(&data, fd, f->func);
> +					}
> +				}
>   			}
>   		}
>   	}
