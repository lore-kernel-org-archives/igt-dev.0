Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE2CC636E5
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 17:26:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED43E10E15A;
	Wed, 28 Aug 2024 17:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="APa7g9r9";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8D610E15A
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 17:26:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 938D820008;
 Wed, 28 Aug 2024 17:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724865971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jCe0WK+zMIY9H3gKQd0Ny/dTrIsUxpHv20AXrHm22fs=;
 b=APa7g9r9Z7UKJcge79CSjdIeJy5QyoUvEA9NWBeccGjawey3s9XpcmESsFaL+F1cz24bDV
 gOcDubWQYJYZEgxpF8+CR4dEQsN+GtiuMEMtxCmkLTQC0sb+1DW7koUEyvY4kkUPPsYxzO
 yY+48BUNEBVR+RuTDS321UyKIV1fVCW3BS6f/HOs97GT+TleLS0FdeHN2AZAtS1gMzFJlK
 +ZvJWJPxWhbl2t+wtIzBQGCLNYusJbKnU4dAN+VZOXoCcDOlFY63aexyl4V7m/SBIsCvCo
 wzhybZAlsYD6uNX9iwwI9y1ypc7JJr3CCSAfoiFkX/nBibPC9OEfprazgL1TKQ==
Date: Wed, 28 Aug 2024 19:26:09 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com,
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
 daniels <daniels@collabora.com>
Subject: Re: [PATCH i-g-t v2 14/39] lib/chamelium/v3: Introduce the
 foundation for the Chamelium v3 wrapper
Message-ID: <Zs9dsZ1TL3BjudOa@louis-chauvet-laptop>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
 <20240709-dev-remove-static-ports-v2-14-5adfc6985778@bootlin.com>
 <b84917de-4a48-4363-9060-243fa5e61c45@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b84917de-4a48-4363-9060-243fa5e61c45@collabora.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 26/08/24 - 14:52, Vignesh Raman a écrit :
> Hi Louis,
> 
> On 09/07/24 21:04, Louis Chauvet wrote:
> > Adds a build option to enable building the Chamelium v3 wrapper.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   lib/chamelium/v3/igt_chamelium.c |  9 +++++++++
> >   lib/chamelium/v3/igt_chamelium.h |  8 ++++++++
> >   lib/igt_kms.c                    |  8 ++++++++
> >   lib/meson.build                  |  7 +++++++
> >   lib/tests/meson.build            |  4 ++++
> >   meson.build                      | 17 ++++++++++++++++-
> >   meson_options.txt                |  4 ++++
> >   tests/meson.build                | 25 +++++++++++++++++++++++++
> >   8 files changed, 81 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
> > new file mode 100644
> > index 000000000000..9579bd2cd9f8
> > --- /dev/null
> > +++ b/lib/chamelium/v3/igt_chamelium.c
> > @@ -0,0 +1,9 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <igt_core.h>
> > +#include "igt_chamelium.h"
> > +
> > +void chamelium_v3_init(void)
> > +{
> > +	igt_info("Using chamelium v3\n");
> > +}
> > diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
> > new file mode 100644
> > index 000000000000..1848f66b574f
> > --- /dev/null
> > +++ b/lib/chamelium/v3/igt_chamelium.h
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef V3_IGT_CHAMELIUM_H
> > +#define V3_IGT_CHAMELIUM_H
> > +
> > +void chamelium_v3_init(void);
> > +
> > +#endif //V3_IGT_CHAMELIUM_H
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index 059c61bf222a..6c2b7cc4f5bd 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -2883,7 +2883,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
> >   	if (!resources)
> >   		goto out;
> >   
> > +/*
> > + * FIXME: Dirty hack to avoid those lines when chamelium v3 is used
> > + *
> > + * Must be replaced with a configuration file information, so the end user can choose if the
> > + * chamelium must be connected or not.
> > + */
> >   #ifdef HAVE_CHAMELIUM_V2
> > +#ifndef HAVE_CHAMELIUM_V3
> >   	{
> >   		struct chamelium *chamelium;
> >   
> > @@ -2898,6 +2905,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
> >   			chamelium_deinit_rpc_only(chamelium);
> >   		}
> >   	}
> > +#endif
> >   #endif
> >   
> >   	igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,
> > diff --git a/lib/meson.build b/lib/meson.build
> > index 714990e96485..968f1164bf61 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -197,6 +197,13 @@ if chamelium_v2.found()
> >   	lib_sources += 'monitor_edids/monitor_edids_helper.c'
> >   endif
> >   
> > +if chamelium_v3.found()
> > +	lib_deps += chamelium_v3
> > +	lib_sources += [
> > +		'chamelium/v3/igt_chamelium.c',
> > +	]
> 
> We need to add "lib_sources += 'monitor_edids/monitor_edids_helper.c'" 
> to fix undefined reference to error.

Will be fixed for v2.

> > +endif
> > +
> >   if libprocps.found()
> >   	lib_deps += libprocps
> >   else
> > diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> > index f98c948bc827..15f484ba0d54 100644
> > --- a/lib/tests/meson.build
> > +++ b/lib/tests/meson.build
> > @@ -39,6 +39,10 @@ if chamelium_v2.found()
> >   	lib_tests += 'igt_audio'
> >   endif
> >   
> > +if chamelium_v3.found()
> > +	lib_deps += chamelium_v3
> > +endif
> > +
> >   foreach lib_test : lib_tests
> >   	exec = executable(lib_test, lib_test + '.c', install : false,
> >   			dependencies : igt_deps)
> > diff --git a/meson.build b/meson.build
> > index 1fbbe4802ad3..0bb4853535cf 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -87,6 +87,7 @@ foreach cc_arg : cc_args
> >   endforeach
> >   
> >   build_chamelium_v2 = get_option('chamelium_v2')
> > +build_chamelium_v3 = get_option('chamelium_v3')
> >   build_docs = get_option('docs')
> >   build_tests = not get_option('tests').disabled()
> >   build_xe = not get_option('xe_driver').disabled()
> > @@ -172,7 +173,7 @@ if not xmlrpc.found() and xmlrpc_cmd.found()
> >   	endif
> >   endif
> >   
> > -if build_chamelium_v2.enabled() and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
> > +if (build_chamelium_v2.enabled() or build_chamelium_v3.enabled()) and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
> >   	error('Chamelium build forced and required dependency xmlrpc not found')
> >   endif
> >   
> > @@ -195,6 +196,20 @@ endif
> >   
> >   build_info += 'Build Chamelium v2 test: @0@'.format(chamelium_v2.found())
> >   
> > +
> > +if xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found() and libcurl.found()
> > +	config.set('HAVE_CHAMELIUM_V3', 1)
> > +	chamelium_v3 = declare_dependency(dependencies : [
> > +										  xmlrpc,
> > +										  xmlrpc_util,
> > +										  xmlrpc_client,
> > +										  gsl,
> > +										  alsa,
> 
> gsl and alsa can be removed for v3?

Yes, I missed it, thanks!
 
> > +									  ])
> > +else
> > +	chamelium_v3 = disabler()
> > +endif
> > +
> >   pthreads = dependency('threads')
> >   math = cc.find_library('m')
> >   realtime = cc.find_library('rt')
> > diff --git a/meson_options.txt b/meson_options.txt
> > index fea91fb129aa..4d4047407854 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -12,6 +12,10 @@ option('chamelium_v2',
> >          type : 'feature',
> >          description : 'Build Chamelium v2 test')
> >   
> > +option('chamelium_v3',
> > +       type : 'feature',
> > +       description : 'Build Chamelium v3 tests')
> > +
> >   option('valgrind',
> >          type : 'feature',
> >          description : 'Build with support for valgrind annotations')
> > diff --git a/tests/meson.build b/tests/meson.build
> > index e7c8416dabcf..6a736d1defd1 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -324,6 +324,9 @@ chamelium_v2_progs = [
> >   	'kms_chamelium_hpd',
> >   ]
> >   
> > +chamelium_v3_progs = [
> > +]
> > +
> >   test_deps = [ igt_deps ]
> >   
> >   if libdrm_nouveau.found()
> > @@ -441,6 +444,28 @@ if chamelium_v2.found()
> >   	test_deps += chamelium_v2
> >   endif
> >   
> > +if chamelium_v3.found()
> > +	foreach prog : chamelium_v3_progs
> > +		testexe = executable(prog,
> > +				 [join_paths('chamelium', 'v3', prog + '.c')],
> > +				 dependencies : test_deps,
> > +				 install_dir : libexecdir,
> > +				 install_rpath : libexecdir_rpathdir,
> > +				 install : true)
> > +		test_list += prog
> > +		test_executables += testexe
> > +		name = prog.split('/').get(-1)
> > +		if not meson.is_cross_build()
> > +			testlist_files += custom_target(name + '.testlist',
> > +				    build_by_default : true,
> > +				    command : [testexe, '--show-testlist'],
> > +				    capture : true,
> > +				    output : name + '.testlist')
> > +		endif
> > +	endforeach
> > +	test_deps += chamelium_v3
> > +endif
> > +
> >   subdir('amdgpu')
> >   
> >   subdir('msm')
> > 
> 
> Regards,
> Vignesh

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
