Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD3010E949
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 13:57:41 +0000 (UTC)
Message-ID: <abed96fd-2352-352c-09fc-d1056287d3fc@intel.com>
Date: Tue, 27 Sep 2022 19:27:36 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
 <20220926185321.2897136-4-kunal1.joshi@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20220926185321.2897136-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v1 3/5] tests/i915/kms_pwrite_crc.c:
 cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kunal,

Few comments below:
-Drop .c from subj.
-Remove comments those are unnecessary.
-Improve your commit message.

On 27-Sep-22 12:23 AM, Kunal Joshi wrote:
> -> Sanitize the state before starting the subtest
> -> Kept all the test requirements in igt_fixture
> -> clean state with igt_display_fini before exit
> -> close drm_fd
> 
> Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/i915/kms_pwrite_crc.c | 28 ++++++++++++++++++----------
>   1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
> index 584e6a19..b116bd62 100644
> --- a/tests/i915/kms_pwrite_crc.c
> +++ b/tests/i915/kms_pwrite_crc.c
> @@ -160,6 +160,13 @@ static void run_test(data_t *data)
>   	enum pipe pipe;
>   
>   	for_each_pipe_with_valid_output(display, pipe, output) {
> +
> +		/*
> +		 * Reset basic pipes, connectors and planes on
> +		 * @display back to default values.
> +		 */
> +		igt_display_reset(&data->display);
> +
>   		data->output = output;
>   		data->pipe = pipe;
>   
> @@ -178,17 +185,18 @@ static data_t data;
>   
>   igt_simple_main
>   {
> -	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> -
> -	data.devid = intel_get_drm_devid(data.drm_fd);
> -
> -	kmstest_set_vt_graphics_mode();
> -
> -	igt_require_pipe_crc(data.drm_fd);
> -
> -	igt_display_require(&data.display, data.drm_fd);
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		data.devid = intel_get_drm_devid(data.drm_fd);
> +		kmstest_set_vt_graphics_mode();
> +		igt_require_pipe_crc(data.drm_fd);
> +		igt_display_require(&data.display, data.drm_fd);
> +	}
>   
>   	run_test(&data);
>   
> -	igt_display_fini(&data.display);
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		close(data.drm_fd);
> +	}
>   }

-- 
~Swati Sharma
