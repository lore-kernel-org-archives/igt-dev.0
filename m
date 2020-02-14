Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665296F903
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2020 12:27:24 +0000 (UTC)
Date: Fri, 14 Feb 2020 14:27:21 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200214122721.GE25209@platvala-desk.ger.corp.intel.com>
References: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
 <20200212132349.109042-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212132349.109042-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 9/9] lib/kms: Try to plug all Chamelium
 ports, abort if it fails
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 03:23:49PM +0200, Arkadiusz Hiler wrote:
> Using chamelium as a display for non-chamelium-aware test is
> challenging. The board can be left in multiple different states after
> kms_chamelium tests even though we have atexit() handlers and other
> measures which try to assure that all ports are plugged in. Sadly this
> is not 100% reliable. We also had a few boards hard hanging (happens
> very seldom) and requiring manual intervention.
> 
> This leads to changes in the testing configuration - we may end up with
> any number of connectors plugged in which makes a lot of kms_ tests to
> flip between skip and pass depending on a run.
> 
> In an attempt to make connectors state less random this patch makes
> igt_display_require() chamelium-aware. If chamelium is configured for
> given machine we try to reach it and make sure everything is plugged in.
> If we fail to do so we abort the execution because the testing
> configuration is an unknown.
> 
> For machines without a configured chamelium this boils down to a nop.
> 
> I have run a bunch of tests and measured how much time we spend in the
> Chamelium section of igt_display_require() (n = 1000) with chamelium
> configured:
> 
>     Min: 0.0030s     Max:    0.0113s
>     Avg: 0.0089s     Median: 0.0089s
> 
> With ~1000 of KMS subtests in a run it's only a mere 9s.
> 
> Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/20
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  lib/igt_chamelium.c         | 55 +++++++++++++++++++++++++++++++++++--
>  lib/igt_chamelium.h         |  1 +
>  lib/igt_kms.c               | 18 ++++++++++++
>  tests/kms_chamelium.c       |  7 +++--
>  tests/kms_color_chamelium.c |  7 +++--
>  5 files changed, 80 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index d5d8dc60..cdf0e3ad 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -1978,7 +1978,13 @@ static size_t chamelium_get_video_ports(struct chamelium *chamelium,
>  	int res_len, i, port_id;
>  	size_t port_ids_len = 0;
>  
> -	res = chamelium_rpc(chamelium, NULL, "GetSupportedInputs", "()");
> +	res = __chamelium_rpc(chamelium, NULL, "GetSupportedInputs", "()");
> +	if (chamelium->env.fault_occurred) {
> +		igt_debug("Chamelium RPC call failed: %s\n",
> +		     chamelium->env.fault_string);
> +
> +		return -1;
> +	}
>  	res_len = xmlrpc_array_size(&chamelium->env, res);
>  	for (i = 0; i < res_len; i++) {
>  		xmlrpc_array_read_item(&chamelium->env, res, i, &res_port);
> @@ -2181,6 +2187,8 @@ static bool chamelium_autodiscover(struct chamelium *chamelium, int drm_fd)
>  	candidate_ports_len = chamelium_get_video_ports(chamelium,
>  							candidate_ports);
>  
> +	igt_assert(candidate_ports_len > 0);
> +
>  	igt_debug("Starting Chamelium port auto-discovery on %zu ports\n",
>  		  candidate_ports_len);
>  	igt_gettime(&start);
> @@ -2299,14 +2307,14 @@ static bool chamelium_read_config(struct chamelium *chamelium)
>  	GError *error = NULL;
>  
>  	if (!igt_key_file) {
> -		igt_warn("No configuration file available for chamelium\n");
> +		igt_debug("No configuration file available for chamelium\n");
>  		return false;
>  	}
>  
>  	chamelium->url = g_key_file_get_string(igt_key_file, "Chamelium", "URL",
>  					       &error);
>  	if (!chamelium->url) {
> -		igt_warn("Couldn't read chamelium URL from config file: %s\n",
> +		igt_debug("Couldn't read chamelium URL from config file: %s\n",
>  			 error->message);
>  		return false;
>  	}
> @@ -2402,6 +2410,9 @@ error:
>   * Chamelium configuration. This must be called first before trying to use the
>   * chamelium.
>   *
> + * Needs to happen *after* igt_display_require() as otherwise the board will
> + * get reset.
> + *
>   * If we fail to establish a connection with the chamelium, fail to find a
>   * configured connector, etc. we fail the current test.
>   *
> @@ -2482,6 +2493,44 @@ void chamelium_deinit(struct chamelium *chamelium)
>  	free(chamelium);
>  }
>  
> +bool chamelium_plug_all(struct chamelium *chamelium)
> +{
> +	size_t port_count;
> +	int port_ids[CHAMELIUM_MAX_PORTS];
> +	xmlrpc_value *v;
> +	v = __chamelium_rpc(chamelium, NULL, "Reset", "()");
> +
> +	if (v != NULL)
> +		xmlrpc_DECREF(v);
> +
> +	if (chamelium->env.fault_occurred) {
> +		igt_debug("Chamelium RPC call failed: %s\n",
> +		     chamelium->env.fault_string);
> +
> +		return false;
> +	}
> +
> +	port_count = chamelium_get_video_ports(chamelium, port_ids);
> +	if (port_count <= 0)
> +		return false;
> +
> +	for (int i = 0; i < port_count; ++i) {
> +		v = __chamelium_rpc(chamelium, NULL, "Plug", "(i)", port_ids[i]);
> +
> +		if (v != NULL)
> +			xmlrpc_DECREF(v);
> +
> +		if (chamelium->env.fault_occurred) {
> +			igt_debug("Chamelium RPC call failed: %s\n",
> +			     chamelium->env.fault_string);
> +
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>  igt_constructor {
>  	/* Frame dumps can be large, so we need to be able to handle very large
>  	 * responses
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index 3b9a1242..fb273b1a 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -217,5 +217,6 @@ void chamelium_crop_analog_frame(struct chamelium_frame_dump *dump, int width,
>  void chamelium_destroy_frame_dump(struct chamelium_frame_dump *dump);
>  void chamelium_destroy_audio_file(struct chamelium_audio_file *audio_file);
>  void chamelium_infoframe_destroy(struct chamelium_infoframe *infoframe);
> +bool chamelium_plug_all(struct chamelium *chamelium);
>  
>  #endif /* IGT_CHAMELIUM_H */
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 54de45e5..7f9fafb3 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -58,6 +58,9 @@
>  #include "igt_device.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
> +#ifdef HAVE_CHAMELIUM
> +#include "igt_chamelium.h"
> +#endif
>  
>  /**
>   * SECTION:igt_kms
> @@ -1886,6 +1889,21 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	if (!resources)
>  		goto out;
>  
> +#ifdef HAVE_CHAMELIUM
> +	{
> +		struct chamelium *chamelium;
> +
> +		chamelium = chamelium_init_rpc_only();
> +		if (chamelium) {
> +			igt_abort_on_f(!chamelium_wait_reachable(chamelium, 20),
> +				       "cannot reach the configured chamelium!\n");
> +			igt_abort_on_f(!chamelium_plug_all(chamelium),
> +				       "failed to plug all the chamelium ports!\n");
> +			chamelium_deinit_rpc_only(chamelium);
> +		}
> +	}
> +#endif
> +
>  	/*
>  	 * We cache the number of pipes, that number is a physical limit of the
>  	 * hardware and cannot change of time (for now, at least).
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index 8243d2ef..34e6dda9 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -2623,6 +2623,10 @@ igt_main
>  
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +
> +		/* we need to initalize chamelium after igt_display_require */
>  		data.chamelium = chamelium_init(data.drm_fd);
>  		igt_require(data.chamelium);
>  
> @@ -2636,9 +2640,6 @@ igt_main
>  
>  		/* So fbcon doesn't try to reprobe things itself */
>  		kmstest_set_vt_graphics_mode();
> -
> -		igt_display_require(&data.display, data.drm_fd);
> -		igt_require(data.display.is_atomic);
>  	}

For this and kms_color_chamelium: Does it matter that
kmstest_set_vt_graphics_mode() is now after igt_display_require?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
