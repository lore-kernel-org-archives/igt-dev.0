Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07BA6EB04
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Jun 2021 12:23:48 +0000 (UTC)
Date: Thu, 24 Jun 2021 15:25:48 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YNR5zK8uETCRu4qZ@platvala-desk.ger.corp.intel.com>
References: <20210621183257.1030915-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621183257.1030915-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH v4] tests/kms_vblank: Turn on hardware before
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
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 06:32:57PM +0000, Mark Yacoub wrote:
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
> Change-Id: Id70072ea797a74d3e9563ef8feb5901daa6b511a
> ---
>  tests/kms_vblank.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 93b01eba..19284257 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -475,8 +475,13 @@ static void invalid_subtest(data_t *data, int fd)
>  {
>  	union drm_wait_vblank vbl;
>  	unsigned long valid_flags;
> +	igt_display_t* display = &data->display;
> +	igt_output_t* output;
>  
> -	igt_display_require_output_on_pipe(&data->display, 0);
> +	igt_display_require_output_on_pipe(display, 0);
> +	igt_require(display->n_outputs);
> +	output = &display->outputs[0];
> +	prepare_crtc(data, fd, output);

prepare_crtc uses the pipe in data->pipe which is still left
uninitialized at this point.

And you can't be sure that the first output is valid for that
pipe. igt_get_single_output_for_pipe() can get you that.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
