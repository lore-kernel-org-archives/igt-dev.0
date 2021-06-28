Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0716E461
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jun 2021 13:46:49 +0000 (UTC)
References: <20210628132104.1071786-1-Anson.Jacob@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <d0caf390-4ba9-b951-9678-06e9e0dd0d9a@amd.com>
Date: Mon, 28 Jun 2021 09:46:43 -0400
In-Reply-To: <20210628132104.1071786-1-Anson.Jacob@amd.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t V2] tests/kms_content_protection: Enable
 Primary plane for CRTC.
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
To: Anson Jacob <Anson.Jacob@amd.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Bindu Ramamurthy <bindu.r@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 2021-06-28 9:21 a.m., Anson Jacob wrote:
> From: Bindu Ramamurthy <bindu.r@amd.com>
> 
> [Why]
> Atomic driver check fails for crtc, when there is no primary plane.
> 
> [How]
> Enable primary plane before committing the streams.
> 
> Signed-off-by: Bindu Ramamurthy <bindu.r@amd.com>
> Acked-by: Anson Jacob <Anson.Jacob@amd.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Mark Yacoub <markyacoub@chromium.org>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  tests/kms_content_protection.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index bab61817bcc1..04b9ab30334a 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -180,10 +180,13 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
>  	igt_output_set_pipe(output, pipe);
>  
>  	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_display_commit2(display, s);
>  	igt_plane_set_fb(primary, &data.red);
>  	igt_fb_set_size(&data.red, primary, mode.hdisplay, mode.vdisplay);
>  
> +	igt_display_commit2(display, s);
> +
> +	igt_plane_set_fb(primary, &data.green);
> +
>  	/* Wait for Flip completion before starting the HDCP authentication */
>  	commit_display_and_wait_for_flip(s);
>  }
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
