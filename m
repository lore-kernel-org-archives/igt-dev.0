Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEE710EC96
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 13:03:37 +0000 (UTC)
Message-ID: <6822ba63-0701-51f6-3176-82ada44ce2c1@intel.com>
Date: Fri, 17 Jun 2022 18:33:30 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220616060437.4174069-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220616060437.4174069-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] tests/kms: Fix kms tests to use lib helpers
 to sort connector modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>

On 16-Jun-22 11:34 AM, Bhanuprakash Modem wrote:
> Instead of writing our own wrappers for each subtest to sort connector
> modes, just use the helpers from IGT library.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_dsc.c | 12 +-----------
>   tests/kms_flip.c     | 16 +++-------------
>   tests/kms_setmode.c  | 13 ++-----------
>   3 files changed, 6 insertions(+), 35 deletions(-)
> 
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index c94c64c4..76ca15eb 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -123,22 +123,12 @@ static void kms_dsc_exit_handler(int sig)
>   	restore_force_dsc_en();
>   }
>   
> -static int sort_drm_modes(const void *a, const void *b)
> -{
> -	const drmModeModeInfo *mode1 = a, *mode2 = b;
> -
> -	return (mode1->clock < mode2->clock) - (mode2->clock < mode1->clock);
> -}
> -
>   static drmModeModeInfo *get_highres_mode(igt_output_t *output)
>   {
>   	drmModeConnector *connector = output->config.connector;
>   	drmModeModeInfo *highest_mode = NULL;
>   
> -	qsort(connector->modes,
> -	      connector->count_modes,
> -	      sizeof(drmModeModeInfo),
> -	      sort_drm_modes);
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
>   
>   	highest_mode = &connector->modes[0];
>   
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index c5b5741a..2a57da02 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1311,24 +1311,14 @@ static void discard_any_stale_events(void) {
>   	}
>   }
>   
> -static int sort_drm_modes(const void *a, const void *b)
> -{
> -	const drmModeModeInfo *mode1 = a, *mode2 = b;
> -
> -	return (mode2->clock < mode1->clock) - (mode1->clock < mode2->clock);
> -}
> -
>   static void get_suitable_modes(struct test_output *o)
>   {
>   	drmModeModeInfo mode[2];
>   	int i;
>   
> -	for (i = 0; i < RUN_PAIR; i++) {
> -		qsort(o->kconnector[i]->modes,
> -		      o->kconnector[i]->count_modes,
> -		      sizeof(drmModeModeInfo),
> -		      sort_drm_modes);
> -	}
> +	for (i = 0; i < RUN_PAIR; i++)
> +		igt_sort_connector_modes(o->kconnector[i],
> +					 sort_drm_modes_by_clk_asc);
>   
>   	get_compatible_modes(&mode[0], &mode[1],
>   			     o->kconnector[0], o->kconnector[1]);
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 8c755091..bfa10891 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -535,13 +535,6 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>   		     fabs(mean - expected) / line_time(kmode));
>   }
>   
> -static int sort_drm_modes(const void *a, const void *b)
> -{
> -	const drmModeModeInfo *mode1 = a, *mode2 = b;
> -
> -	return (mode2->clock < mode1->clock) - (mode1->clock < mode2->clock);
> -}
> -
>   static void test_crtc_config(const struct test_config *tconf,
>   			     struct crtc_config *crtcs, int crtc_count)
>   {
> @@ -567,10 +560,8 @@ retry:
>   
>   		for (i = 0; i < crtc_count; i++) {
>   			/* Sort the modes in asending order by clock freq. */
> -			qsort(crtcs[i].cconfs->connector->modes,
> -			      crtcs[i].cconfs->connector->count_modes,
> -			      sizeof(drmModeModeInfo),
> -			      sort_drm_modes);
> +			igt_sort_connector_modes(crtcs[i].cconfs->connector,
> +						 sort_drm_modes_by_clk_asc);
>   
>   			crtcs[i].mode = crtcs[i].cconfs->connector->modes[0];
>   		}

-- 
~Swati Sharma
