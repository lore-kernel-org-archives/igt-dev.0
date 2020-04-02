Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00ECE6EAB0
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2020 14:53:59 +0000 (UTC)
Date: Thu, 2 Apr 2020 17:53:52 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200402145352.GC32162@ideak-desk.fi.intel.com>
References: <20200331123857.1212432-1-arkadiusz.hiler@intel.com>
 <20200331123857.1212432-3-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331123857.1212432-3-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] lib/kms: Reprobe connector state
 after disabling modest
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 03:38:55PM +0300, Arkadiusz Hiler wrote:
> With TypeC we don't always get hotplug events for a connector until the
> mode is disabled.
> 
> Cc: Imre Deak <imre.deak@intel.com>
> Issue: https://gitlab.freedesktop.org/drm/intel/issues/323
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Looks ok, on patches 1 and 2:
Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  lib/igt_kms.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 796da1fb..b461818a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2040,7 +2040,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  
>  	for (i = 0; i < display->n_outputs; i++) {
>  		igt_output_t *output = &display->outputs[i];
> -		drmModeConnector *connector;
>  
>  		/*
>  		 * We don't assign each output a pipe unless
> @@ -2051,13 +2050,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  		output->display = display;
>  
>  		igt_output_refresh(output);
> -
> -		connector = output->config.connector;
> -		if (connector && (!connector->count_modes ||
> -		    connector->connection == DRM_MODE_UNKNOWNCONNECTION)) {
> -			output->force_reprobe = true;
> -			igt_output_refresh(output);
> -		}
>  	}
>  
>  	drmModeFreePlaneResources(plane_resources);
> @@ -2070,6 +2062,25 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	igt_display_commit2(display,
>  			    display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>  
> +	/*
> +	 * Let's reprobe all connectors to make sure we have up to date stete.
> +	 * Some connectors may require disabling modeset to be detected
> +	 * correctly.
> +	 */
> +	for (i = 0; i < display->n_outputs; i++) {
> +		igt_output_t *output = &display->outputs[i];
> +		drmModeConnector *connector;
> +
> +		igt_output_refresh(output);
> +
> +		connector = output->config.connector;
> +		if (connector && (!connector->count_modes ||
> +		    connector->connection == DRM_MODE_UNKNOWNCONNECTION)) {
> +			output->force_reprobe = true;
> +			igt_output_refresh(output);
> +		}
> +	}
> +
>  out:
>  	LOG_UNINDENT(display);
>  
> -- 
> 2.24.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
