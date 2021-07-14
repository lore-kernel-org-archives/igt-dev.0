Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775506E220
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 11:23:10 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Wed, 14 Jul 2021 11:22:53 +0000
Message-ID: <BY5PR11MB4372BFEABDF46860B15FD47389139@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <20210714080002.26107-1-vidya.srinivas@intel.com>
 <20210714100404.GB27868@intel.com>
In-Reply-To: <20210714100404.GB27868@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Fix a
 check in is_6bpc function
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
To: "C, Ramalingam" <ramalingam.c@intel.com>, "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thank you so much Ram. Kunal, kindly help merge this. Sorry for the trouble.

Regards
Vidya

-----Original Message-----
From: C, Ramalingam <ramalingam.c@intel.com> 
Sent: Wednesday, July 14, 2021 3:34 PM
To: Srinivas, Vidya <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Fix a check in is_6bpc function

On 2021-07-14 at 13:30:02 +0530, Vidya Srinivas wrote:
> Fixes commit 3bf28f9dffd41b85c262d4e6664ffbdf5b7d9a93.
> 
> is_6bpc is supposed to return false if connector is not eDP or DSI.
> The right check will be DRM_MODE_CONNECTOR_eDP && 
> DRM_MODE_CONNECTOR_DSI By mistake DRM_MODE_CONNECTOR_eDP || 
> DRM_MODE_CONNECTOR_DSI was being used.
> 
> Credits-to: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
LGTM.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  tests/kms_plane_alpha_blend.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_alpha_blend.c 
> b/tests/kms_plane_alpha_blend.c index a3529dc2190f..8020216c1594 
> 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -454,7 +454,7 @@ static bool is_6bpc(igt_display_t *display, enum pipe pipe) {
>  		return false;
>  
>  	c = output->config.connector;
> -	if (c->connector_type != DRM_MODE_CONNECTOR_eDP ||
> +	if (c->connector_type != DRM_MODE_CONNECTOR_eDP &&
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
