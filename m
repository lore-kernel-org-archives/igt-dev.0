Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA14689BAE
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 10:53:37 +0000 (UTC)
Date: Mon, 21 Jun 2021 13:55:35 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YNBwJ6potaWQYa/V@platvala-desk.ger.corp.intel.com>
References: <20210617152032.431594-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617152032.431594-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH v3] tests/kms_vblank: Turn on hardware before
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

On Thu, Jun 17, 2021 at 03:20:32PM +0000, Mark Yacoub wrote:
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
> Changes since v2:
> 1. Updated Signed-off-by.
> 
> Changes since v1:
> 1. Update Commit message
> 2. Rename variable p to pipe_number
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_vblank.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 93b01eba..988794c0 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -475,8 +475,14 @@ static void invalid_subtest(data_t *data, int fd)
>  {
>  	union drm_wait_vblank vbl;
>  	unsigned long valid_flags;
> +	igt_display_t* display = &data->display;
> +	enum pipe pipe_number = 0;
> +	igt_output_t* output;
>  
> -	igt_display_require_output_on_pipe(&data->display, 0);
> +	igt_display_require_output_on_pipe(display, pipe_number);
> +	data->pipe = pipe_number;
> +	for_each_valid_output_on_pipe(display, pipe_number, output)
> +		prepare_crtc(data, fd, output);

Do you really need to fire up and reset all the outputs that pipe can
drive? As opposed to just one.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
