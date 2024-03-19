Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49DFC54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 14:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB2810E3CD;
	Tue, 19 Mar 2024 14:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HRBlpEOk";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E010E10E3CD
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710857280;
 bh=wgFcXRLcAAGlIw3pbjJFUZsBrVTxgJBRWCxe9eLBov0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=HRBlpEOkFjdGQ4zPCzpVBn9up0X0bDu+3FF6BSGNLgZtarnxND9hkORzFdCOTpWxx
 ykkkJWp9M7yG3TsreRzfbOjsz9NFLJFr8iIzJCjDxJrKuukPzmqr3o0tkdg/gtmZwZ
 SBZZr/YsgdJvlgOlY/9YpofKBTTV8X2vBs/0sR1oFHo0mjr0j9TKSU1IotjdgNal3V
 WXmWUzgjhkdo8dZ8OGt1J0TtuAUiDzCVg8SUHsz7nq/m5zxL0e4hCUvm3fePY2vrW4
 GLdZAhd1vHJ7DYMSh0BY97CbBcC2vYLb+YlYm2CwYSHur06UFWWNG/ODoa3c/Ridga
 SH2wkcGS6EOug==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3230A3780626;
 Tue, 19 Mar 2024 14:08:00 +0000 (UTC)
Date: Tue, 19 Mar 2024 14:07:59 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org, daniel@ffwll.ch, boris.brezillon@collabora.com
Subject: Re: [PATCH 2/2] tools/gputop: toggle sysfs profiling knob if
 available for device
Message-ID: <se3sah6btzu6qdqq2kclgeytgwvppioqz2yoqvay2plgy3etaq@vcqmkd4peacb>
References: <20240316220229.249119-1-adrian.larumbe@collabora.com>
 <20240316220229.249119-2-adrian.larumbe@collabora.com>
 <20240318124039.btbkh5ann72ez5nk@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240318124039.btbkh5ann72ez5nk@kamilkon-desk.igk.intel.com>
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

On 18.03.2024 13:40, Kamil Konieczny wrote:
> Hi Adrián,
> On 2024-03-16 at 22:00:38 +0000, Adrián Larumbe wrote:
> > For every DRM device that enables its job accounting HW from user space,
> > toggle it right before obtaining per-client fdinfo numbers.
> > 
> > Make sure profiling status is returned to its original state before
> > exiting, by handling the SIGINT signal just like in intel_gpu_top.
> > 
> > Also dynamically link gputop against igt lib instead of separate per-file
> > static libraries to avoid dependence cascade because of using igt_sysfs
> > functions.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  tools/gputop.c    | 30 +++++++++++++++++++++++++++++-
> >  tools/meson.build |  2 +-
> >  2 files changed, 30 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/gputop.c b/tools/gputop.c
> > index 71e28f43ee4c..d6885be6aa16 100644
> > --- a/tools/gputop.c
> > +++ b/tools/gputop.c
> > @@ -27,7 +27,9 @@
> >  #include <stdbool.h>
> >  
> >  #include "igt_drm_clients.h"
> > +#include "igt_device_scan.h"
> >  #include "igt_drm_fdinfo.h"
> > +#include "igt_profiling.h"
> >  #include "drmtest.h"
> >  
> >  static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> > @@ -243,9 +245,17 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
> >  
> >  }
> >  
> > +static bool stop_top;
> --------- ^^^^^^
> Add 'volatile' here as compiler could optimise your loop into
> while(true).
> 
> > +
> > +static void sigint_handler(int  sig)
> > +{
> > +	stop_top = true;
> > +}
> > +
> >  int main(int argc, char **argv)
> >  {
> >  	unsigned int period_us = 2e6;
> > +	struct igt_profiled_device *profiled_devices = NULL;
> >  	struct igt_drm_clients *clients = NULL;
> >  	int con_w = -1, con_h = -1;
> >  
> > @@ -253,9 +263,22 @@ int main(int argc, char **argv)
> >  	if (!clients)
> >  		exit(1);
> >  
> > +	igt_devices_scan(false);
> > +
> > +	profiled_devices = igt_devices_profiled();
> > +	if (profiled_devices != NULL)
> > +		igt_devices_toggle_profiling(profiled_devices, true);
> > +
> > +	if (signal(SIGINT, sigint_handler) == SIG_ERR) {
> > +		fprintf(stderr, "Failed to install signal handler!\n");
> > +		igt_devices_toggle_profiling(profiled_devices, false);
> > +		free(profiled_devices);
> > +		profiled_devices = NULL;
> > +	}
> > +
> >  	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
> >  
> > -	for (;;) {
> > +	while (!stop_top) {
> >  		struct igt_drm_client *c, *prevc = NULL;
> >  		int i, engine_w = 0, lines = 0;
> >  		struct winsize ws;
> > @@ -293,5 +316,10 @@ int main(int argc, char **argv)
> >  		usleep(period_us);
> >  	}
> >  
> > +	if (profiled_devices != NULL) {
> > +		igt_devices_toggle_profiling(profiled_devices, false);
> > +		free(profiled_devices);
> > +	}
> > +
> >  	return 0;
> >  }
> > diff --git a/tools/meson.build b/tools/meson.build
> > index ac79d8b5840c..a126d6cad7ba 100644
> > --- a/tools/meson.build
> > +++ b/tools/meson.build
> > @@ -68,7 +68,7 @@ endif
> >  executable('gputop', 'gputop.c',
> >             install : true,
> >             install_rpath : bindir_rpathdir,
> > -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
> ------------------------------------------------- ^^^^^^^^^^^^^^^^^^
> > +           dependencies : [lib_igt, lib_igt_drm_clients, math])
> ----------------------------- ^^^^^^^
> This will blow-up size of tool, also why did you removed
> lib_igt_drm_fdinfo?

I removed it because igt_drm_fdinfo.c is part of lib_sources, and since I decided to link gputop
dynamically against libigt, it didn't make any sense to have the same symbols provided by both
a static archive and a dynamic library (although I guess the linker will pick them up from whatever
shows up first in the command line).

As to the new tool size, I think it'd be smaller than before, because it's dynamically linked.
Although if this is unacceptable I could traverse the whole tree of dependencies and create a new
archive dependency for gputop that includes both igt_profiling.c, igt_sysfs.c and everything
they depend on.

> Regards,
> Kamil
> 
> >  
> >  intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
> >  executable('intel_l3_parity', sources : intel_l3_parity_src,
> > -- 
> > 2.43.0
> > 
