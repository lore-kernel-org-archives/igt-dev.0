Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A99410E034
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 20:10:37 +0000 (UTC)
Date: Fri, 13 Oct 2023 16:10:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <ZSmkNuZVDU/Gj9Ns@intel.com>
References: <20231012061444.78748-1-swati2.sharma@intel.com>
 <20231012061444.78748-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231012061444.78748-2-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/intel/kms_pm_rpm: use linear
 modifier
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 11:44:43AM +0530, Swati Sharma wrote:
> To setup primary plane, use DRM_FORMAT_MOD_LINEAR instead of
> I915_FORMAT_MOD_X_TILED.

I don't believe we had any strong reason for the X_tile, so:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> index 2882e265f..a46735875 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -1305,13 +1305,13 @@ static void test_one_plane(bool dpms, uint32_t plane_id,
>  		plane_format = DRM_FORMAT_XRGB8888;
>  		plane_w = 64;
>  		plane_h = 64;
> -		modifier = I915_FORMAT_MOD_X_TILED;
> +		modifier = DRM_FORMAT_MOD_LINEAR;
>  		break;
>  	case PLANE_PRIMARY:
>  		plane_format = DRM_FORMAT_XRGB8888;
>  		plane_w = default_mode_params->mode->hdisplay;
>  		plane_h = default_mode_params->mode->vdisplay;
> -		modifier = I915_FORMAT_MOD_X_TILED;
> +		modifier = DRM_FORMAT_MOD_LINEAR;
>  		break;
>  	case PLANE_CURSOR:
>  		plane_format = DRM_FORMAT_ARGB8888;
> -- 
> 2.25.1
> 
