Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76251C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 19:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1579010E31C;
	Thu, 16 May 2024 19:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XNyeeU/n";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA3610E31C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715888960;
 bh=drKqIKYWCMIIjh2c5e/4THap58W5m2+AXehOIPHLgvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XNyeeU/ne8u0wOMzUtonzogpOPQgmrOUQ8KGyNJM1/3Kh8UT1DJbQvKqX8KLtnEuX
 Mvv98TTPZ9Wo1gyHWxycEfM7oHLslVHztn5fbnhdYd2vhZlUz/gN7EBT+45x7TS+kS
 1zNXxgZ/QYorW/K2nRHj9qctOAkvxIT7vi26LSFz0zkNDaXT58uSOiy6FhrWVeDb17
 lIjQQcR6JHCRsO2Xa8ODK3OidwdLB8YgWzs70QirU/mOduo6HSyAY9d8L/QEkdYpzY
 4Crxk1TBNnoUyfXEeYs2Qdeqb5/Ds7G31VIBTJju5cvdNvhX+lHrKFTJILOjmgAtj5
 adpvhaC//oSgw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 668CD37821B2;
 Thu, 16 May 2024 19:49:20 +0000 (UTC)
Date: Thu, 16 May 2024 20:49:19 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: tursulin@ursulin.net, robdclark@chromium.org, 
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com,
 igt-dev@lists.freedesktop.org, 
 healych@amazon.com, kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 2/2] tools/gputop: toggle sysfs profiling knob if
 available for device
Message-ID: <oqksa2irp7uqcrv3rjdxbvadmaj27qyomge3tgyqvika2wq5qr@tmkdpeevrwhf>
References: <20240510192243.285457-1-adrian.larumbe@collabora.com>
 <20240510192243.285457-3-adrian.larumbe@collabora.com>
 <20240513071724.6p7fim6wk7jkcyvn@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240513071724.6p7fim6wk7jkcyvn@zkempczy-mobl2>
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

On 13.05.2024 09:17, Zbigniew Kempczyński wrote:
> On Fri, May 10, 2024 at 08:22:38PM +0100, Adrián Larumbe wrote:
> > For every DRM device that enables its job accounting HW from user space,
> > toggle it right before obtaining per-client fdinfo numbers.
> > 
> > Make sure profiling status is returned to its original state before
> > exiting, by handling the SIGINT signal just like in intel_gpu_top.
> > 
> > Also add the static IGT profiling library to gputop's list of build
> > dependencies.
> > 
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  tools/gputop.c    | 33 ++++++++++++++++++++++++++++++++-
> >  tools/meson.build |  2 +-
> >  2 files changed, 33 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/gputop.c b/tools/gputop.c
> > index 5634fa58a0c7..7ae3d6411cf1 100644
> > --- a/tools/gputop.c
> > +++ b/tools/gputop.c
> > @@ -29,6 +29,7 @@
> >  #include "igt_core.h"
> >  #include "igt_drm_clients.h"
> >  #include "igt_drm_fdinfo.h"
> > +#include "igt_profiling.h"
> >  #include "drmtest.h"
> >  
> >  static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> > @@ -358,10 +359,19 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
> >  	return 1;
> >  }
> >  
> > +static volatile bool stop_top;
> > +
> > +static void sigint_handler(int sig)
> > +{
> > +	(void) sig;
> > +	stop_top = true;
> > +}
> > +
> >  int main(int argc, char **argv)
> >  {
> >  	struct gputop_args args;
> >  	unsigned int period_us;
> > +	struct igt_profiled_device *profiled_devices = NULL;
> >  	struct igt_drm_clients *clients = NULL;
> >  	int con_w = -1, con_h = -1;
> >  	int ret;
> > @@ -380,9 +390,22 @@ int main(int argc, char **argv)
> >  	if (!clients)
> >  		exit(1);
> >  
> > +
> > +	profiled_devices = igt_devices_profiled();
> > +	if (profiled_devices != NULL) {
> > +		igt_devices_toggle_profiling(profiled_devices, true);
> > +
> > +		if (signal(SIGINT, sigint_handler) == SIG_ERR) {
> > +			fprintf(stderr, "Failed to install signal handler!\n");
> > +			igt_devices_toggle_profiling(profiled_devices, false);
> > +			igt_devices_free_profiling(profiled_devices);
> > +			profiled_devices = NULL;
> > +		}
> > +	}
> > +
> >  	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> >  
> > -	while (n != 0) {
> > +	while ((n != 0) && !stop_top) {
> >  		struct igt_drm_client *c, *prevc = NULL;
> >  		int i, engine_w = 0, lines = 0;
> >  
> > @@ -410,9 +433,17 @@ int main(int argc, char **argv)
> >  		usleep(period_us);
> >  		if (n > 0)
> >  			n--;
> > +
> > +		if (profiled_devices != NULL)
> > +			igt_devices_update_original_profiling_state(profiled_devices);
> 
> Only reason in which calling this function here makes sense to me is
> when external program which profiles some devices exits and switches
> from 1 -> 0. Is sth I don't see here?

Yep, maybe another profiler that is checking the sysfs knob status, but could also
be a second gputop instance runnig at the same time.

> --
> Zbigniew
> 
> >  	}
> >  
> >  	igt_drm_clients_free(clients);
> >  
> > +	if (profiled_devices != NULL) {
> > +		igt_devices_toggle_profiling(profiled_devices, false);
> > +		igt_devices_free_profiling(profiled_devices);
> > +	}
> > +
> >  	return 0;
> >  }
> > diff --git a/tools/meson.build b/tools/meson.build
> > index ac79d8b5840c..05138ee679cd 100644
> > --- a/tools/meson.build
> > +++ b/tools/meson.build
> > @@ -68,7 +68,7 @@ endif
> >  executable('gputop', 'gputop.c',
> >             install : true,
> >             install_rpath : bindir_rpathdir,
> > -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
> > +           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
> >  
> >  intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
> >  executable('intel_l3_parity', sources : intel_l3_parity_src,
> > -- 
> > 2.44.0
> > 
