Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF326E0EE
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jun 2021 11:10:05 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so4139335wms.1
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jun 2021 04:10:05 -0700 (PDT)
References: <20210630094304.1230608-1-mika.kahola@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <bf7acdfd-b7dd-f259-421b-66dffdca43e8@gmail.com>
Date: Wed, 30 Jun 2021 14:09:57 +0300
MIME-Version: 1.0
In-Reply-To: <20210630094304.1230608-1-mika.kahola@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Skip 90/270
 rotation for ADL-P
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 30.6.2021 12.43, Mika Kahola wrote:
> ADL-P platform doesn't support 90/270 rotation. Let's skip to test
> with these rotations.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>   tests/kms_plane_scaling.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 2aa46ac8..1dad2e60 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -165,6 +165,10 @@ static bool can_rotate(data_t *d, unsigned format, uint64_t tiling,
>   	if (!is_i915_device(d->drm_fd))
>   		return true;
>   
> +	if (intel_display_ver(d->devid) >= 13 &&
> +		(rot == IGT_ROTATION_90 || rot == IGT_ROTATION_270))
> +		return false;
> +
>   	switch (format) {
>   	case DRM_FORMAT_RGB565:
>   		if (intel_display_ver(d->devid) >= 11)
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
