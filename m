Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D996E486
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2020 12:03:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u18so4131374wmc.3
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Sep 2020 05:03:06 -0700 (PDT)
References: <20200901153302.26667-1-srinivasx.k@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <a3e2c650-9fdf-eafa-706d-1612ccfc9e84@gmail.com>
Date: Wed, 2 Sep 2020 15:02:58 +0300
MIME-Version: 1.0
In-Reply-To: <20200901153302.26667-1-srinivasx.k@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] Stripping rendercopy implementation to
 use Cairo for restoring test image
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
To: Kamati Srinivas <srinivasx.k@intel.com>, igt-dev@lists.freedesktop.org
Cc: tejaskumarx.surendrakumar.upadhyay@intel.com, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi Srinivas,

I noticed your patch got stuck in CI with false positive failures, I 
forwarded the issue to Lakshminarayana Vudum. Once Lakshmi see my mail 
he'll mark those failures not to be about your patch and your patch will 
go on to shards testing.

About the patch otherwise, on subject line you should have note you're 
changing content in tests and which test. On this case subject would 
begin with 'tests/kms_cursor_crc: ...'

On 1.9.2020 18.33, Kamati Srinivas wrote:
> Cc: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
> Cc: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
> Cc: Tejask Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Cc: K Srinivas <srinivasx.k@intel.com>
> Signed-off-by: Kamati Srinivas <srinivasx.k@intel.com>
> ---
>   tests/kms_cursor_crc.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index e9491847..079abe88 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -831,15 +831,7 @@ igt_main
>   
>   		igt_display_require(&data.display, data.drm_fd);
>   
> -		if (is_i915_device(data.drm_fd)) {
> -			data.bufmgr = drm_intel_bufmgr_gem_init(data.drm_fd, 4096);
> -			igt_assert(data.bufmgr);
> -			drm_intel_bufmgr_gem_enable_reuse(data.bufmgr);
> -
> -			data.devid = intel_get_drm_devid(data.drm_fd);
> -			data.rendercopy = igt_get_render_copyfunc(data.devid);
> -		}
> -		igt_debug("Using %s for restoring test image\n", (data.rendercopy == NULL)?"Cairo":"rendercopy");
> +		igt_debug("Using Cairo for restoring test image\n");

You'll need to remove all related dead code. I'd suggest you'll take out 
from data_t structure all variables which are for rendercopy and you'll 
see where compilation fail and from this you'll know where you need to 
go fix. Quickly looking at least those data.rendercopy, data.bufmgr 
which are mentioned in above code.

>   	}
>   
>   	data.cursor_max_w = cursor_width;
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
