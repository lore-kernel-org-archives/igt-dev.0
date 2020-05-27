Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FE089B05
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2020 22:35:01 +0000 (UTC)
Date: Wed, 27 May 2020 15:35:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20200527223500.GD2603999@mdroper-desk1.amr.corp.intel.com>
References: <20200519094803.8687-1-mika.kahola@intel.com>
 <20200519094803.8687-2-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519094803.8687-2-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_ccs: Add debug
 information on format modifier
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 19, 2020 at 12:48:02PM +0300, Mika Kahola wrote:
> We could benefit on information on what format modifier is in use
> when running the test. This in mind, let's add informative string along
> with the list of ccs modifiers.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  tests/kms_ccs.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> index bc34aec5..c23b4e44 100644
> --- a/tests/kms_ccs.c
> +++ b/tests/kms_ccs.c
> @@ -81,12 +81,15 @@ static const uint32_t formats[] = {
>  	DRM_FORMAT_P016,
>  };
>  
> -static const uint64_t ccs_modifiers[] = {
> -	LOCAL_I915_FORMAT_MOD_Y_TILED_CCS,
> -	LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS,
> -	LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> -	LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC,
> -	LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS,
> +static const struct {
> +	uint64_t modifier;
> +	const char *str;
> +} ccs_modifiers[5] = {
> +	{LOCAL_I915_FORMAT_MOD_Y_TILED_CCS, "LOCAL_I915_FORMAT_MOD_Y_TILED_CCS"},
> +	{LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS, "LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS"},
> +	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS"},
> +	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, "LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC"},
> +	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, "LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS"},
>  };

To help guard against typos or copy/paste errors, you might want to use
a macro like:

        #define CCSMOD(x)  { x, #x }
        static const struct {
                uint64_t modifier;
                const char *str;
        } ccs_modifiers[5] = {
                CCSMOD(LOCAL_I915_FORMAT_MOD_Y_TILED_CCS),
                CCSMOD(LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS),
                ...
        }
        #undef CCSMOD

But either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


>  
>  static bool check_ccs_planes;
> @@ -422,7 +425,8 @@ static int __test_output(data_t *data)
>  	for (i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
>  		int j;
>  
> -		data->ccs_modifier = ccs_modifiers[i];
> +		data->ccs_modifier = ccs_modifiers[i].modifier;
> +		igt_debug("Modifier in use: %s\n", ccs_modifiers[i].str);
>  		for (j = 0; j < ARRAY_SIZE(formats); j++) {
>  			data->format = formats[j];
>  			valid_tests += test_ccs(data);
> -- 
> 2.20.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
