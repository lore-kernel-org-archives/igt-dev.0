Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0935410E0A8
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Mar 2023 12:45:47 +0000 (UTC)
Date: Tue, 21 Mar 2023 14:45:43 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jasber Chen <yipeng.chen@amd.com>
Message-ID: <ZBmm90YOzarKx7tO@intel.com>
References: <20230321024826.1722421-1-yipeng.chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321024826.1722421-1-yipeng.chen@amd.com>
Subject: Re: [igt-dev] [PATCH] correct validating config on enconder mask.
 Then mode setting can be run through with multiple displays.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Jasber Chen <yipeng.chen@amd.corp-partner.google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 10:48:26AM +0800, Jasber Chen wrote:
> From: Jasber Chen <yipeng.chen@amd.corp-partner.google.com>
> 
> Signed-off-by: yipeng.chen@amd.com
> ---
>  tests/kms_setmode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index bfa10891..4e59f2aa 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -331,7 +331,7 @@ static void setup_crtcs(const struct test_config *tconf,
>  
>  			encoder_mask |= 1 << get_encoder_idx(resources,
>  							     encoder);
> -			config_valid &= !(encoder_mask &
> +			config_valid &= !!(encoder_mask &
>  					  ~encoder->possible_clones);

The code looks correct the way it is.

>  
>  			drmModeFreeEncoder(encoder);
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
