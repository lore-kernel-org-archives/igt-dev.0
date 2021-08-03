Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B7B6E203
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Aug 2021 14:24:12 +0000 (UTC)
Date: Tue, 3 Aug 2021 10:24:06 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210803142406.jtmtjczid6rnegj4@outlook.office365.com>
References: <20210712163116.384942-1-markyacoub@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712163116.384942-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_concurrent: Replace fb modifier to
 DRM_FORMAT_MOD_LINEAR
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, petri.latvala@intel.com, arek@hiler.eu, anson.jacob@amd.com, abhinavk@codeaurora.org, robdclark@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 07/12, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> LOCAL_I915_FORMAT_MOD_X_TILED is unique to intel SoCs and is not
> supported on any other device.
> 
> [How]
> Replace LOCAL_I915_FORMAT_MOD_X_TILED by DRM_FORMAT_MOD_LINEAR which is
> supported on all other devices.
> 
> Tested on ChromeOS Trogdor[msm]
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_concurrent.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index c3f29ec7..abe2ab75 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -187,8 +187,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
>  	/* primary plane */
>  	data->plane[primary->index] = primary;
>  	create_fb_for_mode_position(data, mode, x, y, size, size,
> -				    LOCAL_I915_FORMAT_MOD_X_TILED,
> -				    max_planes, output);
> +		DRM_FORMAT_MOD_LINEAR, max_planes, output);
>  
>  	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
  
> -- 
> 2.32.0.93.g670b81a890-goog
> 

-- 
Rodrigo Siqueira
https://siqueira.tech
