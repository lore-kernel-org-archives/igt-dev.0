Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B5889C03
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jan 2021 18:21:48 +0000 (UTC)
Date: Tue, 26 Jan 2021 20:21:40 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20210126182140.GA1768967@ideak-desk.fi.intel.com>
References: <20210118153252.14062-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210118153252.14062-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_setmode: Handle conflicting
 encoders
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 09:02:52PM +0530, Bhanuprakash Modem wrote:
> When conflicting encoders are found, driver will disable other
> connectors, instead of failing with -EINVAL. So we endup with
> test failures.
> 
> This patch will update the logic to expect the failure for the
> combinations where all connectors are on the same crtc only.
> 
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_setmode.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 878e149a9..16648087d 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -255,7 +255,8 @@ static void get_crtc_config_str(struct crtc_config *crtc, char *buf,
>  	}
>  }
>  
> -static void setup_crtcs(drmModeRes *resources, struct connector_config *cconf,
> +static void setup_crtcs(const struct test_config *tconf,
> +			struct connector_config *cconf,
>  			int connector_count, struct crtc_config *crtcs,
>  			int *crtc_count_ret, bool *config_valid_ret)
>  {
> @@ -263,6 +264,7 @@ static void setup_crtcs(drmModeRes *resources, struct connector_config *cconf,
>  	int crtc_count;
>  	bool config_valid;
>  	int i;
> +	drmModeRes *resources = tconf->resources;
>  	int encoder_usage_count[resources->count_encoders];
>  
>  	kmstest_unset_all_crtcs(drm_fd, resources);
> @@ -351,7 +353,8 @@ static void setup_crtcs(drmModeRes *resources, struct connector_config *cconf,
>  		drmModeFreeEncoder(encoder);
>  	}
>  	for (i = 0; i < resources->count_encoders; i++)
> -		if (encoder_usage_count[i] > 1)
> +		if (encoder_usage_count[i] > 1 &&
> +				!!(tconf->flags & TEST_SINGLE_CRTC_CLONE))

Yes, since CRTCs in this test will be modesetted one-by-one we won't get
a failure even if two connectors share an encoder (DDI) if each connector
has its own CRTC:

Reviewed-by: Imre Deak <imre.deak@intel.com>

>  			config_valid = false;
>  
>  	*crtc_count_ret = crtc_count;
> @@ -604,7 +607,7 @@ static void test_one_combination(const struct test_config *tconf,
>  	int crtc_count;
>  	bool config_valid;
>  
> -	setup_crtcs(tconf->resources, cconfs, connector_count, crtcs,
> +	setup_crtcs(tconf, cconfs, connector_count, crtcs,
>  		    &crtc_count, &config_valid);
>  
>  	if (config_valid == !(tconf->flags & TEST_INVALID))
> -- 
> 2.20.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
