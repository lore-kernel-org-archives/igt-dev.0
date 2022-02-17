Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F6610EED3
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 09:48:37 +0000 (UTC)
Message-ID: <71a56c8e-7ffc-f164-4b86-491d92b70d32@intel.com>
Date: Thu, 17 Feb 2022 15:18:25 +0530
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220216191814.10314-1-ville.syrjala@linux.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220216191814.10314-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_async_flips: Fix the crc test
 vblank request
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

On 2/17/2022 12:48 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The test fails to populate the horrible vblank ioctl
> flags correctly unless it happens to be running on the
> first crtc. Use the helper we have to cook up the
> necessary magic flags.
>
> Should make the test work on some CHV machines that have
> to use pipe C due to their restricted pipe->port routing
> capabilities.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 0c3821339680..5e11cd43610f 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -396,9 +396,10 @@ static void test_init(data_t *data)
>   
>   static void queue_vblank(data_t *data)
>   {
> +	int pipe = kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
>   	drmVBlank wait_vbl = {
>   		.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT |
> -			kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id),
> +			kmstest_get_vbl_flag(pipe),
>   		.request.sequence = 1,
>   		.request.signal = (long)data,
>   	};

