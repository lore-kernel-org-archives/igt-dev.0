Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDD610F616
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 07:56:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c21so4713808wrb.1
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 00:56:27 -0700 (PDT)
Message-ID: <dfef7194-fe91-35af-0eb2-324de8e83cb6@gmail.com>
Date: Fri, 17 Jun 2022 10:56:19 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, igt-dev@lists.freedesktop.org
References: <20220616225510.3305267-1-robdclark@gmail.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220616225510.3305267-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH igt] tests/kms_getfb: Fix on non-i915 devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 17.6.2022 1.55, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> intel_get_drm_devid() will assert that it is i915.. so we need to
> require that first in order for getfb-reject-ccs to skip instead of
> crash.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   tests/kms_getfb.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
> index b3a8d265..2e4552a0 100644
> --- a/tests/kms_getfb.c
> +++ b/tests/kms_getfb.c
> @@ -265,6 +265,7 @@ static void test_duplicate_handles(int fd)
>   		struct drm_mode_fb_cmd2 add_ccs = { };
>   		struct drm_mode_fb_cmd get = { };
>   
> +		igt_require(is_i915_device(fd));
>   		igt_require_f(!HAS_FLATCCS(intel_get_drm_devid(fd)),
>   			      "skip because flat ccs has only one buffer.\n");
>   
