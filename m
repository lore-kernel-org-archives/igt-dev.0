Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CA56E51B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jul 2021 08:00:58 +0000 (UTC)
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Thu, 29 Jul 2021 08:00:55 +0000
Message-ID: <SN6PR11MB342156BFBBA95520F805D4A3DFEB9@SN6PR11MB3421.namprd11.prod.outlook.com>
References: <20210722150700.18435-1-vidya.srinivas@intel.com>
 <20210722150700.18435-2-vidya.srinivas@intel.com>
In-Reply-To: <20210722150700.18435-2-vidya.srinivas@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] Revert
 "tests/kms_plane_alpha_blend: Fix a check in is_6bpc function"
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
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vidya
> Srinivas
> Sent: 22 July 2021 20:37
> To: igt-dev@lists.freedesktop.org
> Cc: Latvala, Petri <petri.latvala@intel.com>
> Subject: [igt-dev] [PATCH i-g-t 1/2] Revert "tests/kms_plane_alpha_blend: Fix
> a check in is_6bpc function"
> 
> This reverts commit 7b4fdeca7cc4bc5786d9ee06be71779b28f29b59.
> 
> Subtest coverage-premultiplied-constant was failing due to buffer alignment
> issue. It was not due to 6bpc. Hence this patch needs to be reverted.
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>

Reviewed-by : Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>

> ---
>  tests/kms_plane_alpha_blend.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index d649a09f52b4..57bbda5d975a 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -454,7 +454,7 @@ static bool is_6bpc(igt_display_t *display, enum pipe
> pipe) {
>  		return false;
> 
>  	c = output->config.connector;
> -	if (c->connector_type != DRM_MODE_CONNECTOR_eDP &&
> +	if (c->connector_type != DRM_MODE_CONNECTOR_eDP ||
>  		c->connector_type != DRM_MODE_CONNECTOR_DSI)
>  		return false;
> 
> --
> 2.32.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
