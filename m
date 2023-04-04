Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D2810E6D1
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 14:51:28 +0000 (UTC)
Date: Tue, 4 Apr 2023 16:51:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230404145124.jixgwtgpvysrz7e2@kamilkon-desk1>
References: <20230331134556.4077113-1-bhanuprakash.modem@intel.com>
 <20230331134556.4077113-5-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230331134556.4077113-5-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V2 4/5] tests/kms_force_connector_basic: Set
 the param only if driver supports
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

On 2023-03-31 at 19:15:55 +0530, Bhanuprakash Modem wrote:
> Set/Clear the param "load_detect_test" only if driver supports.
> 
> V2: - Set the param if driver supports
>     - Fix the commit message
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_force_connector_basic.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
> index 4ff1efe3b..35e8153c8 100644
> --- a/tests/kms_force_connector_basic.c
> +++ b/tests/kms_force_connector_basic.c
> @@ -36,6 +36,7 @@ static void reset_connectors(void)
>  	drmModeRes *res;
>  	drmModeConnector *connector = NULL;
>  	int drm_fd;
> +	char *param;
>  
>  	drm_fd = drm_open_driver_master(DRIVER_ANY);
>  	res = drmModeGetResources(drm_fd);
> @@ -53,7 +54,11 @@ static void reset_connectors(void)
>  		drmModeFreeConnector(connector);
>  	}
>  
> -	igt_set_module_param_int(drm_fd, "load_detect_test", 0);
> +	param = __igt_params_get(drm_fd, "load_detect_test");
> +	if (param) {
> +		igt_set_module_param_int(drm_fd, "load_detect_test", 0);
> +		free(param);
> +	}
>  
>  	close(drm_fd);
>  }
> -- 
> 2.40.0
> 
