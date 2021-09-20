Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEAD66E40F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 07:45:45 +0000 (UTC)
References: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
 <20210909153047.16729-4-ville.syrjala@linux.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <fa609b28-8dee-8ca5-136f-d30fe2cff979@intel.com>
Date: Mon, 20 Sep 2021 13:15:29 +0530
In-Reply-To: <20210909153047.16729-4-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 03/11] tests/kms_plane_scaling: Use
 igt_plane_has_rotation()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 9/9/2021 9:00 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Replace the hand rolled gen check with igt_plane_has_rotation().
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Looks good to me.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/kms_plane_scaling.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 809463a71583..4c517a4326d7 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -165,10 +165,6 @@ static bool can_rotate(data_t *d, unsigned format, uint64_t tiling,
>   	if (!is_i915_device(d->drm_fd))
>   		return true;
>   
> -	if (intel_display_ver(d->devid) >= 13 &&
> -		igt_rotation_90_or_270(rot))
> -		return false;
> -
>   	switch (format) {
>   	case DRM_FORMAT_RGB565:
>   		if (intel_display_ver(d->devid) >= 11)
> @@ -272,6 +268,7 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
>   
>   				if (test_format(d, &tested_formats, format) &&
>   				    igt_plane_has_format_mod(plane, format, tiling) &&
> +				    igt_plane_has_rotation(plane, rot) &&
>   				    can_rotate(d, format, tiling, rot) &&
>   				    can_scale(d, format))
>   					check_scaling_pipe_plane_rot(d, plane, format,

