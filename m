Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5B06E7F5
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Sep 2021 19:42:39 +0000 (UTC)
References: <20210818222419.210879-1-jose.souza@intel.com>
 <20210818222419.210879-3-jose.souza@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Message-ID: <f2c6f78f-d20f-c33b-6bad-76f75002bd45@intel.com>
Date: Thu, 2 Sep 2021 22:42:25 +0300
In-Reply-To: <20210818222419.210879-3-jose.souza@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] test/kms_frontbuffer_tracking:
 Fix multidraw test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?UTF-8?Q?Jos=c3=a9_Roberto_de_Souza?= <jose.souza@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Looks good to me.
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

On 8/19/21 1:24 AM, José Roberto de Souza wrote:
> Multidraw tests was not notifying driver about the area it uses
> blitter to pain the primary background color between drawing methods.
> Without this notification driver will not update pipe and the CRC will
> not update causing the tests fail due a CRC mismatch.
> 
> All the other callers of fill_fb_region() are safe, doing a page flip
> or a atomic commit afterwards.
> 
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   tests/kms_frontbuffer_tracking.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
> index 496718e2a..574048537 100644
> --- a/tests/kms_frontbuffer_tracking.c
> +++ b/tests/kms_frontbuffer_tracking.c
> @@ -1123,6 +1123,17 @@ static void fill_fb_region(struct fb_region *region, enum color ecolor)
>   			 color);
>   }
>   
> +static void _fb_dirty_ioctl(struct fb_region *region)
> +{
> +	struct rect rect;
> +
> +	rect.x = region->x;
> +	rect.y = region->y;
> +	rect.w = region->w;
> +	rect.h = region->h;
> +	fb_dirty_ioctl(region, &rect);
> +}
> +
>   static void unset_all_crtcs(void)
>   {
>   	igt_display_reset(&drm.display);
> @@ -2122,6 +2133,7 @@ static void multidraw_subtest(const struct test_mode *t)
>   			}
>   
>   			fill_fb_region(target, COLOR_PRIM_BG);
> +			_fb_dirty_ioctl(target);
>   
>   			update_wanted_crc(t, &blue_crcs[t->format].crc);
>   			do_assertions(ASSERT_NO_ACTION_CHANGE);
> 
