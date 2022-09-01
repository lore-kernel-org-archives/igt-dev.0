Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66DA10E653
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 08:13:28 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k9so21294858wri.0
 for <igt-dev@lists.freedesktop.org>; Thu, 01 Sep 2022 01:13:28 -0700 (PDT)
Message-ID: <44cd0c35-ede2-3a14-02ce-7e33c73816ec@gmail.com>
Date: Thu, 1 Sep 2022 11:13:21 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Arun R Murthy <arun.r.murthy@intel.com>, igt-dev@lists.freedesktop.org
References: <20220829093147.3836523-1-arun.r.murthy@intel.com>
 <20220901022038.3920384-1-arun.r.murthy@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220901022038.3920384-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCHv2 i-g-t] tests/kms_async_flips: Enable async
 flip on linear buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Arun,

On 1.9.2022 5.20, Arun R Murthy wrote:
> On Intel Gen platforms >= GEN12, Async on linear buffer is supported,
> hence enabling test for the same.
> 
> v2: Added new line character for igt_skip_on_f (Petri)
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>   tests/kms_async_flips.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 695aea74..214f2195 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -61,6 +61,7 @@ typedef struct {
>   	bool extended;
>   	enum pipe pipe;
>   	bool alternate_sync_async;
> +	bool is_linear_buffer;
>   } data_t;
>   
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -125,6 +126,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
>   
>   	if (is_i915_device(data->drm_fd)) {
>   		igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> +			      data->is_linear_buffer ? DRM_FORMAT_MOD_LINEAR :
>   			      I915_FORMAT_MOD_X_TILED, fb);

I think instead of putting this is_linear_buffer flag into data 
structure you could just put used modifier into data structure.

/Juha-Pekka

>   		igt_draw_fill_fb(data->drm_fd, fb, 0x88);
>   	} else {
> @@ -594,14 +596,28 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
>   		igt_fixture
>   			require_monotonic_timestamp(data.drm_fd);
>   
> -		igt_describe("Wait for page flip events in between successive asynchronous flips");
> +		igt_describe("Wait for page flip events in between successive asynchronous flips on X Tiled buffer");
>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>   			data.alternate_sync_async = false;
> +			data.is_linear_buffer = false;
>   			run_test(&data, test_async_flip);
>   		}
>   
> +		igt_describe("Wait for page flip events in between successive asynchronous flips on Linear buffer");
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear") {
> +			data.alternate_sync_async = false;
> +			data.is_linear_buffer = true;
> +			if(is_i915_device(data.drm_fd)) {
> +				uint32_t devid = intel_get_drm_devid(data.drm_fd);
> +				igt_skip_on_f(!AT_LEAST_GEN(devid, 12),
> +						"Async on Linear buffer not supported\n");
> +				run_test(&data, test_async_flip);
> +			}
> +		}
> +
>   		igt_describe("Alternate between sync and async flips");
>   		igt_subtest_with_dynamic("alternate-sync-async-flip") {
> +			data.is_linear_buffer = false;
>   			data.alternate_sync_async = true;
>   			run_test(&data, test_async_flip);
>   		}
