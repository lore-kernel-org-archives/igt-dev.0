Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1F8C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 07:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A58210E02E;
	Mon, 20 May 2024 07:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXBI4Ztc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9788010E02E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716189853; x=1747725853;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BG03N/4IC7JvgLo2Ifmb1buLREP9zqaD1OmSIBrk1t0=;
 b=IXBI4ZtcWGqgsyJMslPMZQofpFyFaOH2gQSxcECZg0WywPqL5KiScwu6
 y9ssLMSKyIjIoLoqQptJu2S6tF3atDg7Jf1OMj3bteYRfdzFJgCUr1qkN
 ULOOISPdLxK90PPqbXFpA9kcGVAyMpKZswcytiRCAk4CaQ62UTzBA23qT
 vl0OhCY7Q7728WOsUk0ZltL4KOjy692aLcAqEmow4a4v5qeZbAsqXnKi+
 bBAH0qBTZCTAodgt8ONTbM0mg6gt315yDAwtxnj3uOrtFG5GH0mTRMfR/
 suHiVjPjCHwntvxOAtfjk1H77BS849Z7OSejE4mUlQnILUjoLnbRETMCQ g==;
X-CSE-ConnectionGUID: a1aWg0I3RBOw/iqrnlzZXQ==
X-CSE-MsgGUID: xxMNBOp4Rqm+JOeSe+lVTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="23443466"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="23443466"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 00:24:12 -0700
X-CSE-ConnectionGUID: IPcZ2DbdR+S2DgO28vaibw==
X-CSE-MsgGUID: 9AqBocE6QYuufMxhoWMqKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="69877241"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 00:24:08 -0700
Date: Mon, 20 May 2024 09:24:04 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: tursulin@ursulin.net, robdclark@chromium.org,
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com,
 igt-dev@lists.freedesktop.org, healych@amazon.com,
 kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 2/2] tools/gputop: toggle sysfs profiling knob if
 available for device
Message-ID: <20240520072404.zayq7bdb5y7nkjcp@zkempczy-mobl2>
References: <20240510192243.285457-1-adrian.larumbe@collabora.com>
 <20240510192243.285457-3-adrian.larumbe@collabora.com>
 <20240513071724.6p7fim6wk7jkcyvn@zkempczy-mobl2>
 <oqksa2irp7uqcrv3rjdxbvadmaj27qyomge3tgyqvika2wq5qr@tmkdpeevrwhf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <oqksa2irp7uqcrv3rjdxbvadmaj27qyomge3tgyqvika2wq5qr@tmkdpeevrwhf>
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

On Thu, May 16, 2024 at 08:49:19PM +0100, Adrián Larumbe wrote:
> On 13.05.2024 09:17, Zbigniew Kempczyński wrote:
> > On Fri, May 10, 2024 at 08:22:38PM +0100, Adrián Larumbe wrote:
> > > For every DRM device that enables its job accounting HW from user space,
> > > toggle it right before obtaining per-client fdinfo numbers.
> > > 
> > > Make sure profiling status is returned to its original state before
> > > exiting, by handling the SIGINT signal just like in intel_gpu_top.
> > > 
> > > Also add the static IGT profiling library to gputop's list of build
> > > dependencies.
> > > 
> > > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >  tools/gputop.c    | 33 ++++++++++++++++++++++++++++++++-
> > >  tools/meson.build |  2 +-
> > >  2 files changed, 33 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/tools/gputop.c b/tools/gputop.c
> > > index 5634fa58a0c7..7ae3d6411cf1 100644
> > > --- a/tools/gputop.c
> > > +++ b/tools/gputop.c
> > > @@ -29,6 +29,7 @@
> > >  #include "igt_core.h"
> > >  #include "igt_drm_clients.h"
> > >  #include "igt_drm_fdinfo.h"
> > > +#include "igt_profiling.h"
> > >  #include "drmtest.h"
> > >  
> > >  static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> > > @@ -358,10 +359,19 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
> > >  	return 1;
> > >  }
> > >  
> > > +static volatile bool stop_top;
> > > +
> > > +static void sigint_handler(int sig)
> > > +{
> > > +	(void) sig;
> > > +	stop_top = true;
> > > +}
> > > +
> > >  int main(int argc, char **argv)
> > >  {
> > >  	struct gputop_args args;
> > >  	unsigned int period_us;
> > > +	struct igt_profiled_device *profiled_devices = NULL;
> > >  	struct igt_drm_clients *clients = NULL;
> > >  	int con_w = -1, con_h = -1;
> > >  	int ret;
> > > @@ -380,9 +390,22 @@ int main(int argc, char **argv)
> > >  	if (!clients)
> > >  		exit(1);
> > >  
> > > +
> > > +	profiled_devices = igt_devices_profiled();
> > > +	if (profiled_devices != NULL) {
> > > +		igt_devices_toggle_profiling(profiled_devices, true);
> > > +
> > > +		if (signal(SIGINT, sigint_handler) == SIG_ERR) {
> > > +			fprintf(stderr, "Failed to install signal handler!\n");
> > > +			igt_devices_toggle_profiling(profiled_devices, false);
> > > +			igt_devices_free_profiling(profiled_devices);
> > > +			profiled_devices = NULL;
> > > +		}
> > > +	}
> > > +
> > >  	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> > >  
> > > -	while (n != 0) {
> > > +	while ((n != 0) && !stop_top) {
> > >  		struct igt_drm_client *c, *prevc = NULL;
> > >  		int i, engine_w = 0, lines = 0;
> > >  
> > > @@ -410,9 +433,17 @@ int main(int argc, char **argv)
> > >  		usleep(period_us);
> > >  		if (n > 0)
> > >  			n--;
> > > +
> > > +		if (profiled_devices != NULL)
> > > +			igt_devices_update_original_profiling_state(profiled_devices);
> > 
> > Only reason in which calling this function here makes sense to me is
> > when external program which profiles some devices exits and switches
> > from 1 -> 0. Is sth I don't see here?
> 
> Yep, maybe another profiler that is checking the sysfs knob status, but could also
> be a second gputop instance runnig at the same time.

Now it makes sense, a-b from me.

--
Zbigniew

> 
> > --
> > Zbigniew
> > 
> > >  	}
> > >  
> > >  	igt_drm_clients_free(clients);
> > >  
> > > +	if (profiled_devices != NULL) {
> > > +		igt_devices_toggle_profiling(profiled_devices, false);
> > > +		igt_devices_free_profiling(profiled_devices);
> > > +	}
> > > +
> > >  	return 0;
> > >  }
> > > diff --git a/tools/meson.build b/tools/meson.build
> > > index ac79d8b5840c..05138ee679cd 100644
> > > --- a/tools/meson.build
> > > +++ b/tools/meson.build
> > > @@ -68,7 +68,7 @@ endif
> > >  executable('gputop', 'gputop.c',
> > >             install : true,
> > >             install_rpath : bindir_rpathdir,
> > > -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
> > > +           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
> > >  
> > >  intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
> > >  executable('intel_l3_parity', sources : intel_l3_parity_src,
> > > -- 
> > > 2.44.0
> > > 
