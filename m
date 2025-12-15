Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED958D41D74
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 10:41:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9408010E3EC;
	Mon, 15 Dec 2025 10:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBDtR/sY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB7A10E3EC
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 10:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765795304; x=1797331304;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=97Ktk6DFxjBmZZlNSo3HukTizfe72QB6X7ZliFtOBhI=;
 b=CBDtR/sYeKgryuaCVzbCjV2LLOhKd4c+tQMVrFNqxxY7WkOjPE07OB+l
 H/buZ9sx6rsQM8lM4W38UkejqYVnhl/Ncu9XH+vpdYFVmjEMwgHDxsy7Y
 vL2Dc1qcgWY9gJaLj83w8ayrUp1NFEGNINVl92mC1rwn42aUo6eiHNY21
 jPgIyYcQjrtG3Yh4SaJE6dTJ9zwGIerc982L6AtT0v2y4AflgMh+O+ZjM
 an/0NTPMk+cjqsnlG/6mHXd2dOsx1+JgSMkVU4OIFUKv95T4v9mvLpM26
 zaJGyw2KzBv3aesJJ1AOXNEVSFvTOHwwfw0trCgIxHgRnCemIszRWUJ5F w==;
X-CSE-ConnectionGUID: G0zFuUIjSkKOv5czXrYj8A==
X-CSE-MsgGUID: ZelOHqv3SZeg6Lb8j+6u4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78331740"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="78331740"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:41:43 -0800
X-CSE-ConnectionGUID: Nip2hfTjToSNNmLE24YlTw==
X-CSE-MsgGUID: yxHL3I2rSIqPzYt6MhX0/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="197450437"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 02:41:42 -0800
Date: Mon, 15 Dec 2025 11:41:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
Subject: Re: [PATCH i-g-t v1 2/2] tools/gputop/gputop: Enable support for
 multiple GPUs and instances
Message-ID: <20251215104139.mhizvqw6wmw34fb7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Purkait, Soham" <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com
References: <20251209173513.4020947-1-soham.purkait@intel.com>
 <20251209173513.4020947-3-soham.purkait@intel.com>
 <20251212214122.uzu2gcvuj23ejfyz@kamilkon-DESK.igk.intel.com>
 <4c9f5521-013d-49ae-a021-f742b404f386@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c9f5521-013d-49ae-a021-f742b404f386@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Purkait,,
On 2025-12-15 at 09:38:12 +0530, Purkait, Soham wrote:
> Hi Kamil,
> 
> On 13-12-2025 03:11, Kamil Konieczny wrote:
> > Hi Soham,
> > On 2025-12-09 at 23:05:13 +0530, Soham Purkait wrote:
> > > Introduce vendor-agnostic support for handling multiple GPUs and instances
> > > in gputop. Improve the tool's adaptability to various GPU configurations.
> > > 
> > > v1:
> > >   - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
> > > v2:
> > >   - Add device filter to populate the array of cards for
> > >     all supported drivers. (Zbigniew)
> > > v3:
> > >   - Cosmetic changes. (Riana)
> > >   - Avoid three level indentation. (Riana)
> > > v4:
> > >   - Add user message for running without root privileges. (Kamil)
> > > v5:
> > >   - Add support for GPU client-only busyness on unsupported
> > >     drivers as a fallback mechanism. (Kamil)
> > > 
> > > Signed-off-by: Soham Purkait<soham.purkait@intel.com>
> > > ---
> > >   tools/{ => gputop}/gputop.c | 283 +++++++++++++++++++++++++++++++-----
> > >   tools/gputop/meson.build    |   6 +
> > >   tools/meson.build           |   6 +-
> > >   3 files changed, 250 insertions(+), 45 deletions(-)
> > >   rename tools/{ => gputop}/gputop.c (59%)
> > >   create mode 100644 tools/gputop/meson.build
> > > 
[cut]
> > > @@ -417,9 +506,12 @@ int main(int argc, char **argv)
> > >   	struct igt_profiled_device *profiled_devices = NULL;
> > >   	struct igt_drm_clients *clients = NULL;
> > >   	int con_w = -1, con_h = -1;
> > > +	bool is_root;
> > >   	int ret;
> > >   	long n;
> > > +	is_root = (geteuid() == 0);
> > Note that this is not required when a user is in a group.
> > Better way is to just try to open a file and only when it fails
> > act accordingly.
> This is just a boolean variable which stores if it is running as root or non
> root. Rest it does the same way as you mentioned, when it fails.
> > 
> > > +
> > >   	ret = parse_args(argc, argv, &args);
> > >   	if (ret < 0)
> > >   		return EXIT_FAILURE;
> > > @@ -429,6 +521,92 @@ int main(int argc, char **argv)
> > >   	n = args.n_iter;
> > >   	period_us = args.delay_usec;
> > > +	if (!populate_device_instances(args.device ? args.device
> > > +				       : "device:subsystem=pci,card=all") &&
> > > +				       geteuid()) {
> > > +		printf("\n" ANSI_HEADER "Run with root "
> > > +		       "privileges for GPU client "
> > > +		       "busyness.\n" ANSI_RESET "\n");
> > So you still need a root, as I said it is a regression.
> 
> Could you please clarify with which functionality or tool  this is compared
> to as a regression?

I took machine with i915 driver loaded and run gputop,
and it runs perfectly fine, shows workload.

Now I run with your changes and got:

$ build/tools/gputop/gputop

Run with root privileges for GPU client busyness.
$

So it is definitly a regression.

> By the way, PMU is not accessible without root or setting the capability.
> 
> > Imho looks like you want to create a new tool ngputop.
> 
> Why not GPUTOP ?

Please look again for my comment with pseudocode, it seems you
want root access and when it is not there you bail out, so it
is a regression.

As I said, you can have new requirements in a new tool, not in
old one.

Regards,
Kamil

> 
> Thanks,
> Soham.
> 
> > You could create it in tools/ngputop.src/ <- most source files here
> > and link into executable tools/ngputop
> > 
> > In a new tool you could require to have a root or group or caps.
> > 
> > Regards,
> > Kamil
> > 
> > > +		gputop_clean_up();
> > > +		exit(1);
> > > +	}
> > > +
> > > +	for (int i = 0; drivers[i]; i++) {
> > > +		if (!per_driver_contexts[i].device_present)
> > > +			continue;
> > > +
> > > +		for (int j = 0; j < per_driver_contexts[i].len; j++) {
> > > +			if (!ops[i].init_engines(per_driver_contexts[i].instances, j)) {
> > > +				fprintf(stderr,
> > > +					"Failed to initialize engines! (%s)\n",
> > > +					strerror(errno));
> > > +					gputop_clean_up();
> > > +				return EXIT_FAILURE;
> > > +			}
> > > +			ret = ops[i].pmu_init(per_driver_contexts[i].instances, j);
> > > +
> > > +			if (ret) {
> > > +				if (errno == EACCES && !is_root) {
> > > +					fprintf(stderr,
> > > +						"\n"
> > > +						"When running as a normal user, "
> > > +						"CAP_PERFMON or perf_event_paranoid\n"
> > > +						"is required to access performance "
> > > +						"monitoring.\n"
> > > +						"\n"
> > > +						ANSI_HEADER "Through CAP_PERFMON "
> > > +						"capability"
> > > +						ANSI_RESET "\n"
> > > +						"cd /path/to/igt-gpu-tools/\n"
> > > +						"sudo setcap cap_perfmon=+ep $(pwd)/"
> > > +						"build/tools/gputop/gputop\n"
> > > +						"sudo sh -c \"echo $(pwd)/build/lib >"
> > > +						" /etc/ld.so.conf.d/lib-igt.conf\"\n"
> > > +						"sudo ldconfig\n"
> > > +						ANSI_HEADER "Revert:" ANSI_RESET "\n"
> > > +						"sudo setcap cap_perfmon=-ep $(pwd)/"
> > > +						"build/tools/gputop/gputop\n"
> > > +						"sudo rm /etc/ld.so.conf.d/lib-igt.conf\n"
> > > +						"sudo ldconfig\n"
> > > +						"\n"
> > > +						ANSI_HEADER "Through perf_event_paranoid"
> > > +						" (system-wide policy)"
> > > +						ANSI_RESET "\n"
> > > +						"# Save current value\n"
> > > +						"orig_val=$(sysctl -n "
> > > +						"kernel.perf_event_paranoid)\n"
> > > +						"# Allow non-root perf usage\n"
> > > +						"sudo sysctl -w kernel.perf_event_paranoid=-1\n"
> > > +						ANSI_HEADER "Revert:" ANSI_RESET "\n"
> > > +						"sudo sysctl -w kernel."
> > > +						"perf_event_paranoid=$orig_val\n"
> > > +						"\n"
> > > +						"For details, see 'Perf events and "
> > > +						"tool security':\n"
> > > +						"https://www.kernel.org/doc/html/"
> > > +						"latest/admin-guide/perf-security.html\n");
> > > +					igt_devices_free();
> > > +					gputop_clean_up();
> > > +					return EXIT_SUCCESS;
> > > +				} else {
> > > +					fprintf(stderr,
> > > +						"Failed to initialize PMU! (%s)\n",
> > > +						strerror(errno));
> > > +					igt_devices_free();
> > > +					gputop_clean_up();
> > > +					return EXIT_FAILURE;
> > > +				}
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	for (int i = 0; drivers[i]; i++) {
> > > +		for (int j = 0;
> > > +		     per_driver_contexts[i].device_present && j < per_driver_contexts[i].len;
> > > +		     j++)
> > > +			ops[i].pmu_sample(per_driver_contexts[i].instances, j);
> > > +	}
> > > +
> > >   	clients = igt_drm_clients_init(NULL);
> > >   	if (!clients)
> > >   		exit(1);
> > > @@ -449,22 +627,47 @@ int main(int argc, char **argv)
> > >   	while ((n != 0) && !stop_top) {
> > >   		struct igt_drm_client *c, *prevc = NULL;
> > > -		int i, engine_w = 0, lines = 0;
> > > +		int k, engine_w = 0, lines = 0;
> > >   		igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> > > +
> > > +		for (int i = 0; drivers[i]; i++) {
> > > +			for (int j = 0;
> > > +			     per_driver_contexts[i].device_present &&
> > > +			     j < per_driver_contexts[i].len;
> > > +			     j++)
> > > +				ops[i].pmu_sample(per_driver_contexts[i].instances, j);
> > > +		}
> > > +
> > >   		igt_drm_clients_sort(clients, client_cmp);
> > >   		update_console_size(&con_w, &con_h);
> > >   		clrscr();
> > > +		for (int i = 0; drivers[i]; i++) {
> > > +			for (int j = 0;
> > > +			     per_driver_contexts[i].device_present &&
> > > +			     j < per_driver_contexts[i].len;
> > > +			     j++) {
> > > +				lines = ops[i].print_engines(per_driver_contexts[i].instances, j,
> > > +							 lines, con_w, con_h);
> > > +			}
> > > +		}
> > > +
> > >   		if (!clients->num_clients) {
> > > -			const char *msg = " (No GPU clients yet. Start workload to see stats)";
> > > +			const char *msg;
> > > +
> > > +			if (is_root)
> > > +				msg = " (No GPU clients yet. Start workload to see stats)";
> > > +			else
> > > +				msg = " (GPU client busyness is only available with root"
> > > +				" privileges)";
> > >   			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
> > >   			       (int)(con_w - strlen(msg) - 1), msg);
> > >   		}
> > > -		igt_for_each_drm_client(clients, c, i) {
> > > +		igt_for_each_drm_client(clients, c, k) {
> > >   			assert(c->status != IGT_DRM_CLIENT_PROBE);
> > >   			if (c->status != IGT_DRM_CLIENT_ALIVE)
> > >   				break; /* Active clients are first in the array. */
> > > @@ -488,11 +691,11 @@ int main(int argc, char **argv)
> > >   	}
> > >   	igt_drm_clients_free(clients);
> > > +	gputop_clean_up();
> > >   	if (profiled_devices != NULL) {
> > >   		igt_devices_configure_profiling(profiled_devices, false);
> > >   		igt_devices_free_profiling(profiled_devices);
> > >   	}
> > > -
> > >   	return 0;
> > >   }
> > > diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
> > > new file mode 100644
> > > index 000000000..4766d8496
> > > --- /dev/null
> > > +++ b/tools/gputop/meson.build
> > > @@ -0,0 +1,6 @@
> > > +gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
> > > +executable('gputop', sources : gputop_src,
> > > +           install : true,
> > > +           install_rpath : bindir_rpathdir,
> > > +           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
> > > +	   install: true)
> > > diff --git a/tools/meson.build b/tools/meson.build
> > > index 8185ba160..99a732942 100644
> > > --- a/tools/meson.build
> > > +++ b/tools/meson.build
> > > @@ -70,11 +70,6 @@ if libudev.found()
> > >   		   install : true)
> > >   endif
> > > -executable('gputop', 'gputop.c',
> > > -           install : true,
> > > -           install_rpath : bindir_rpathdir,
> > > -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
> > > -
> > >   intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
> > >   executable('intel_l3_parity', sources : intel_l3_parity_src,
> > >   	   dependencies : tool_deps,
> > > @@ -123,3 +118,4 @@ endif
> > >   subdir('i915-perf')
> > >   subdir('xe-perf')
> > >   subdir('null_state_gen')
> > > +subdir('gputop')
> > > -- 
> > > 2.34.1
> > > 
