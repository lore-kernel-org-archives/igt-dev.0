Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0546E49F
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jun 2021 15:51:48 +0000 (UTC)
Date: Mon, 28 Jun 2021 11:51:42 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210628155142.3cbidunxv3umpzwt@outlook.office365.com>
References: <20210624173525.1526215-1-markyacoub@chromium.org>
Content-Disposition: inline
In-Reply-To: <20210624173525.1526215-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v5] tests/kms_vblank: Turn on hardware before
 testing invalid vblank.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, petri.latvala@intel.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 06/24, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> Before any hardware is on, the vblank is off and its ref counter is in
> an initialized state as each driver handles toggling it differently.
> Ioctl DRM_IOCTL_WAIT_VBLANK could return 0 such as on i915, or an invalid
> integer that doesn't mean much, such as on Zork running Kernel 5.4 due
> to the kernel workaround that increments the vblank ref count to prevent
> a get from enabling the interrupt.
> 
> [How]
> For invalid_subtest(), active the CRTCs to turn the hardware on so
> DRM_IOCTL_WAIT_VBLANK returns something meaningful.
> 
> Changes since v4:
> Use igt_get_single_output_for_pipe to get igt_output_t.
> 
> Changes since v3:
> Turn on only 1 output instead of all.
> 
> Changes since v2:
> 1. Updated Signed-off-by.
> 
> Changes since v1:
> 1. Update Commit message
> 2. Rename variable p to pipe_number
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_vblank.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 93b01eba..b709ef69 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -475,8 +475,12 @@ static void invalid_subtest(data_t *data, int fd)
>  {
>  	union drm_wait_vblank vbl;
>  	unsigned long valid_flags;
> +	igt_display_t* display = &data->display;
> +	enum pipe pipe = 0;
> +	igt_output_t* output = igt_get_single_output_for_pipe(display, pipe);
>  
> -	igt_display_require_output_on_pipe(&data->display, 0);
> +	igt_display_require_output_on_pipe(display, pipe);
> +	prepare_crtc(data, fd, output);
>  
>  	/* First check all is well with a simple query */
>  	memset(&vbl, 0, sizeof(vbl));
> @@ -511,6 +515,8 @@ static void invalid_subtest(data_t *data, int fd)
>  	vbl.request.type |= _DRM_VBLANK_SECONDARY;
>  	vbl.request.type |= _DRM_VBLANK_FLAGS_MASK;
>  	igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
> +
> +	cleanup_crtc(data, fd, output);
>  }
>  
>  igt_main
> -- 
> 2.32.0.93.g670b81a890-goog
> 

lgtm,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

-- 
Rodrigo Siqueira
https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
