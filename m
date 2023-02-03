Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D160D10E1F6
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 09:19:52 +0000 (UTC)
Date: Fri, 3 Feb 2023 10:19:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230203091925.wz5yotewdeofsto2@kamilkon-desk1>
References: <20230202180139.3528829-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230202180139.3528829-1-markyacoub@google.com>
Subject: Re: [igt-dev] [PATCH v3] Chamelium: Get Chamelium Logs on RPC
 failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: amstan@chromium.org, ihf@google.com, seanpaul@chromium.org,
 markyacoub@google.com, khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-02-02 at 13:01:39 -0500, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@chromium.org>
> 
> [Why]
> Currently, Chamelium acts like a black box, we can't tell what
> is going on there when a failure occur. Seeing its logs will
> allow us to debug better.
> 
> [How]
> On chamelium_rpc failure, print out the logs in debug so it
> wouldn't clutter good tests.
> 
> v2:
> - Added missing #includes
> v3:
> - C-style comments (Kamil Konieczny)
> - Cut commit messages to 65 char tops (Kamil Konieczny)
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_chamelium.c                    | 50 ++++++++++++++++++++++++--
>  lib/igt_chamelium.h                    |  1 +
>  tests/chamelium/kms_chamelium_helper.c | 18 ++++++++++
>  3 files changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index a235f3c8..bac6fb76 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -658,6 +658,8 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
>  	xmlrpc_value *res;
>  	va_list va_args;
>  	int fsm_trials_left = 5;
> +	bool did_fault_occur = false;
> +	char fault_string[1024];
>  
>  	if (strcmp(method_name, "CaptureVideo") == 0
>  	    || strcmp(method_name, "StartCapturingVideo") == 0) {
> @@ -680,9 +682,28 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
>  					 format_str, va_args);
>  		va_end(va_args);
>  	}
> -	igt_assert_f(!chamelium->env.fault_occurred,
> -		     "Chamelium RPC call[%s] failed: %s\n", method_name,
> -		     chamelium->env.fault_string);
> +
> +	did_fault_occur = chamelium->env.fault_occurred;
> +	if (did_fault_occur) {
> +		/*
> +		 * Save the fault string before getting the logs which will
> +		 * clear the string if it is works.
> +		 */
> +		strncpy(fault_string, chamelium->env.fault_string, 1024);
> +		/*
> +		 * We call GetChameleondLogs on an xmlrpc failure. Let's not
> +		 * call it when the xmlrpc failure is for GetChameleondLogs
> +		 * itself as this can cause a recursive behavior.
> +		 */
> +		if (strcmp(method_name, "GetChameleondLogs") != 0) {
> +			char *logs = chamelium_get_logs(chamelium);
> +			igt_debug("CHAMELIUM LOGS:\n%s\n", logs);
> +			free(logs);
> +		}
> +	}
> +
> +	igt_assert_f(!did_fault_occur, "Chamelium RPC call [%s] failed: %s\n",
> +		     method_name, fault_string);
>  
>  	return res;
>  }
> @@ -737,6 +758,29 @@ void chamelium_assert_reachable(struct chamelium *chamelium, int timeout)
>  		     "Couldn't connect to Chamelium for %ds", timeout);
>  }
>  
> +/**
> + * chamelium_get_logs - Get the logs from the chamelium daemon
> + * @chamelium: The Chamelium instance to use
> + *
> + * Returns: The logs from the last time this was called.
> + */
> +
> +char *chamelium_get_logs(struct chamelium *chamelium)
> +{
> +	xmlrpc_value *res;
> +	const char *logs = NULL;
> +
> +	igt_debug(
> +		"Calling GetChameleondLogs - Logs returned are from the last time "
> +		"this was called.\n");
> +
> +	res = chamelium_rpc(chamelium, NULL, "GetChameleondLogs", "(s)", "IGT");
> +	xmlrpc_read_string(&chamelium->env, res, &logs);
> +	xmlrpc_DECREF(res);
> +
> +	return logs;
> +}
> +
>  /**
>   * chamelium_plug:
>   * @chamelium: The Chamelium instance to use
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index d979de4a..e9096519 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -159,6 +159,7 @@ chamelium_reset_state(igt_display_t *display,
>  
>  bool chamelium_wait_reachable(struct chamelium *chamelium, int timeout);
>  void chamelium_assert_reachable(struct chamelium *chamelium, int timeout);
> +char *chamelium_get_logs(struct chamelium *chamelium);
>  void chamelium_plug(struct chamelium *chamelium, struct chamelium_port *port);
>  void chamelium_unplug(struct chamelium *chamelium, struct chamelium_port *port);
>  bool chamelium_is_plugged(struct chamelium *chamelium,
> diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/kms_chamelium_helper.c
> index 197d29be..54f8ebfc 100644
> --- a/tests/chamelium/kms_chamelium_helper.c
> +++ b/tests/chamelium/kms_chamelium_helper.c
> @@ -24,7 +24,19 @@
>   *    Lyude Paul <lyude@redhat.com>
>   */
>  
> +#include <fcntl.h>
> +#include <stdint.h>
> +#include <string.h>
> +#include <stdatomic.h>
> +#include <xf86drmMode.h>
> +
> +#include "config.h"
> +#include "igt.h"
> +#include "igt_chamelium.h"
>  #include "igt_edid.h"
> +#include "igt_eld.h"
> +#include "igt_vc4.h"
> +#include "igt_infoframe.h"
>  #include "kms_chamelium_helper.h"
>  
>  void chamelium_init_test(chamelium_data_t *data)
> @@ -47,6 +59,12 @@ void chamelium_init_test(chamelium_data_t *data)
>  	/* we need to initalize chamelium after igt_display_require */
>  	data->chamelium = chamelium_init(data->drm_fd, &data->display);
>  	igt_require(data->chamelium);
> +	/*
> +	 * Get the logs so we can reset the chamelium logs at this cursor.
> +	 * The logs are then retrieved when any call fails so we can debug
> +	 * chamelium if needed.
> +	 */
> +	free(chamelium_get_logs(data->chamelium));
>  
>  	data->ports = chamelium_get_ports(data->chamelium, &data->port_count);
>  
> -- 
> 2.39.1.519.gcb327c4b5f-goog
> 
