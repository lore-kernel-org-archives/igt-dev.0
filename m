Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE65910E67A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 09:57:43 +0000 (UTC)
Date: Thu, 1 Sep 2022 12:56:49 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <YxCB4ZKZu06s2Y2e@platvala-desk.ger.corp.intel.com>
References: <20220901092748.224317-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901092748.224317-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t] lib/igt_kms: Choose default mode based on
 --environment flag from igt_runner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 02:57:48PM +0530, Bhanuprakash Modem wrote:
> igt_runner provides --environment flag KEY=VALUE pair as the environment
> variable to execute test processes. Upon user request igt_runner will set
> an environment variable to choose default DRM display mode for subtests
> instead of taking the preferred mode.
> 
> Example:
> Eventhough we have an 8K panel, Kernel may expose 4K or lesser mode
> as a preferred mode. So all subtests will take this mode as a default
> may cause losing the coverage.
> 
> This patch will parse the environment variable exposed by igt_runner
> and take the decision to choose the mode from the available list.
> 
> Possible options are:
>   0: Choose the mode with lowest possible resolution.
>   1: Choose the mode with highest possible resolution.
> 
> By default (without this flag) fallback to take the preferred mode exposed
> by the Kernel.
> 
> Usage:
> ./igt_runner --environment "IGT_KMS_RESOLUTION=1" ...
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 1ba3bd2a..be0d76bb 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1586,7 +1586,8 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>  bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
>  					drmModeModeInfo *mode)
>  {
> -	int i;
> +	char *env;
> +	int i, res;
>  
>  	if (!connector->count_modes) {
>  		igt_warn("no modes for connector %d\n",
> @@ -1594,6 +1595,26 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
>  		return false;
>  	}
>  
> +	env = getenv("IGT_KMS_RESOLUTION");
> +	if (env) {
> +		res = atoi(env);
> +
> +		/*
> +		 * Only 0 and 1 are allowed.
> +		 * 0: Choose connector mode with lowest possible resolution.
> +		 * 1: Choose connector mode with highest possible resolution.
> +		 */

I would prefer these to be more restrictive. Maybe in addition to the
ints even. That is, allow values "highest" and "lowest" here.


-- 
Petri Latvala



> +		if (res != 0 && res != 1)
> +			goto default_mode;
> +
> +		igt_sort_connector_modes(connector, res ?
> +						     sort_drm_modes_by_res_dsc :
> +						     sort_drm_modes_by_res_asc);
> +		*mode = connector->modes[0];
> +		return true;
> +	}
> +
> +default_mode:
>  	for (i = 0; i < connector->count_modes; i++) {
>  		if (i == 0 ||
>  		    connector->modes[i].type & DRM_MODE_TYPE_PREFERRED) {
> -- 
> 2.35.1
> 
