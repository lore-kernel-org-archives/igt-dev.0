Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E64C27C65
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 16:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495B910E13F;
	Tue, 11 Jun 2024 16:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHYgI7hb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D769110E1BB
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 16:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718124309; x=1749660309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YkH/tirtBSDrXJifhC8PJAbCqBDU4OpY0JADKGK4O5U=;
 b=mHYgI7hbzHI28pvxzgzeBp0cpAD51xAp3Cp4zzgcI3c9kdcH9nG6WAav
 OcFqdyx+I4cISjrxMH1gRcTtn/vIL/bFGf/16xgx1CHpz0y6PdzWuABy0
 AmUxzNIMSxYZIkInbS6DUFMpfyKB0Q3nxEbEB+HP50udd7mlyc1hgc2cf
 4D0ApSnx9PIjckJIsgAfMNnCc/dHzLRdWPbqXa5D1kc1yDJPnFSokGo9N
 MwiDHEnBRWVGLfFhywjTOfx3nZURQTq1va93p7zLXvF3/eHwaZQIJVjxz
 DUF+POiuGCuSL7NSUIzwfl/syO/HNj7mnkntsRqmheJT7IQp/0KZ5PQnt A==;
X-CSE-ConnectionGUID: H0fB5s75QmW02pgeYMnFQw==
X-CSE-MsgGUID: VBFrqkUmQwG9uxe5rg7Veg==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15007454"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="15007454"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:45:08 -0700
X-CSE-ConnectionGUID: XIwUMJUUSDOMYjYyeMOFyw==
X-CSE-MsgGUID: mkn9qE19SA6neAZQR4DbVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44441187"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 09:45:07 -0700
Date: Tue, 11 Jun 2024 18:45:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, ihf@google.com,
 markyacoub@google.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH i-g-t RFC 04/13] lib/chamelium: Introduce the foundation
 for the chamelium v3 library
Message-ID: <20240611164503.xr43vsxmn55biknt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>, ihf@google.com,
 markyacoub@google.com, thomas.petazzoni@bootlin.com
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
 <20240605-dev-remove-static-ports-v1-4-665f25b7a4db@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240605-dev-remove-static-ports-v1-4-665f25b7a4db@bootlin.com>
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

Hi Louis,
On 2024-06-05 at 16:30:16 +0200, Louis Chauvet wrote:
> Adds a build option to enable building the chamelium v3 wrapper.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/chamelium/v3/igt_chamelium.c |  9 +++++++++
>  lib/chamelium/v3/igt_chamelium.h |  8 ++++++++
>  lib/igt_kms.c                    |  9 ++++++++-
>  lib/meson.build                  |  7 +++++++
>  lib/tests/meson.build            |  4 ++++
>  meson.build                      | 17 +++++++++++++++-
>  meson_options.txt                |  4 ++++
>  tests/meson.build                | 43 +++++++++++++++++++++++++++++++---------
>  8 files changed, 90 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
> new file mode 100644
> index 000000000000..9579bd2cd9f8
> --- /dev/null
> +++ b/lib/chamelium/v3/igt_chamelium.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
------------------------------ ^^^^^^^
Please use MIT here.

> +
> +#include <igt_core.h>
imho here:
#include "igt_core.h"

and this should be after igt_chamelium.h (alphabetical order).

> +#include "igt_chamelium.h"
> +

Describe each new lib function here.

Regards,
Kamil

> +void chamelium_v3_init(void)
> +{
> +	igt_info("Using chamelium v3\n");
> +}
> diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
> new file mode 100644
> index 000000000000..1848f66b574f
> --- /dev/null
> +++ b/lib/chamelium/v3/igt_chamelium.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef V3_IGT_CHAMELIUM_H
> +#define V3_IGT_CHAMELIUM_H
> +
> +void chamelium_v3_init(void);
> +
> +#endif //V3_IGT_CHAMELIUM_H
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index fbb9c545e1b4..56038b82b8a0 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2882,8 +2882,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	if (!resources)
>  		goto out;
>  
> -#ifdef HAVE_CHAMELIUM
> +/*
> + * FIXME: Dirty hack to avoid those lines when chamelium v3 is used
> + *
> + * Must be replaced with a configuration file information, so the end user can choose if the
> + * chamelium must be connected or not.
> + */
>  #ifdef HAVE_CHAMELIUM_V2
> +#ifndef HAVE_CHAMELIUM_V3
>  	{
>  		struct chamelium *chamelium;
>  
> @@ -2898,6 +2904,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  			chamelium_deinit_rpc_only(chamelium);
>  		}
>  	}
> +#endif
>  #endif
>  
>  	igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,
> diff --git a/lib/meson.build b/lib/meson.build
> index accf9ff41222..126bd07c1d66 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -196,6 +196,13 @@ if chamelium_v2.found()
>  	lib_sources += 'monitor_edids/monitor_edids_helper.c'
>  endif
>  
> +if chamelium_v3.found()
> +	lib_deps += chamelium_v3
> +	lib_sources += [
> +		'chamelium/v3/igt_chamelium.c',
> +	]
> +endif
> +
>  if libprocps.found()
>  	lib_deps += libprocps
>  else
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index f98c948bc827..15f484ba0d54 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -39,6 +39,10 @@ if chamelium_v2.found()
>  	lib_tests += 'igt_audio'
>  endif
>  
> +if chamelium_v3.found()
> +	lib_deps += chamelium_v3
> +endif
> +
>  foreach lib_test : lib_tests
>  	exec = executable(lib_test, lib_test + '.c', install : false,
>  			dependencies : igt_deps)
> diff --git a/meson.build b/meson.build
> index a6c8ddf6a128..47a509db734b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -87,6 +87,7 @@ foreach cc_arg : cc_args
>  endforeach
>  
>  build_chamelium_v2 = get_option('chamelium_v2')
> +build_chamelium_v3 = get_option('chamelium_v3')
>  build_docs = get_option('docs')
>  build_tests = not get_option('tests').disabled()
>  build_xe = not get_option('xe_driver').disabled()
> @@ -172,7 +173,7 @@ if not xmlrpc.found() and xmlrpc_cmd.found()
>  	endif
>  endif
>  
> -if build_chamelium_v2.enabled() and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
> +if (build_chamelium_v2.enabled() or build_chamelium_v3.enabled()) and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
>  	error('Chamelium build forced and required dependency xmlrpc not found')
>  endif
>  
> @@ -195,6 +196,20 @@ endif
>  
>  build_info += 'Build Chamelium v2 test: @0@'.format(chamelium_v2.found())
>  
> +
> +if xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found() and libcurl.found()
> +	config.set('HAVE_CHAMELIUM_V3', 1)
> +	chamelium_v3 = declare_dependency(dependencies : [
> +										  xmlrpc,
> +										  xmlrpc_util,
> +										  xmlrpc_client,
> +										  gsl,
> +										  alsa,
> +									  ])
> +else
> +	chamelium_v3 = disabler()
> +endif
> +
>  pthreads = dependency('threads')
>  math = cc.find_library('m')
>  realtime = cc.find_library('rt')
> diff --git a/meson_options.txt b/meson_options.txt
> index fea91fb129aa..4d4047407854 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -12,6 +12,10 @@ option('chamelium_v2',
>         type : 'feature',
>         description : 'Build Chamelium v2 test')
>  
> +option('chamelium_v3',
> +       type : 'feature',
> +       description : 'Build Chamelium v3 tests')
> +
>  option('valgrind',
>         type : 'feature',
>         description : 'Build with support for valgrind annotations')
> diff --git a/tests/meson.build b/tests/meson.build
> index 0b0a913bd878..d7c20e235325 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -334,6 +334,9 @@ chamelium_v2_progs = [
>  	'kms_chamelium_hpd',
>  ]
>  
> +chamelium_v3_progs = [
> +]
> +
>  test_deps = [ igt_deps ]
>  
>  if libdrm_nouveau.found()
> @@ -440,25 +443,47 @@ endforeach
>  if chamelium_v2.found()
>  	foreach prog : chamelium_v2_progs
>  		testexe = executable(prog,
> -				 [join_paths('chamelium', 'v2', prog + '.c')] + extra_sources.get(prog, []),
> -				 dependencies : test_deps + extra_dependencies.get(prog, []),
> -				 install_dir : libexecdir,
> -				 install_rpath : libexecdir_rpathdir,
> -				 install : true)
> +							 [join_paths('chamelium', 'v2', prog + '.c')] + extra_sources.get(prog, []),
> +							 dependencies : test_deps + extra_dependencies.get(prog, []),
> +							 install_dir : libexecdir,
> +							 install_rpath : libexecdir_rpathdir,
> +							 install : true)
>  		test_list += prog
>  		test_executables += testexe
>  		name = prog.split('/').get(-1)
>  		if not meson.is_cross_build()
>  			testlist_files += custom_target(name + '.testlist',
> -				    build_by_default : true,
> -				    command : [testexe, '--show-testlist'],
> -				    capture : true,
> -				    output : name + '.testlist')
> +											build_by_default : true,
> +											command : [testexe, '--show-testlist'],
> +											capture : true,
> +											output : name + '.testlist')
>  		endif
>  	endforeach
>  	test_deps += chamelium_v2
>  endif
>  
> +if chamelium_v3.found()
> +	foreach prog : chamelium_v3_progs
> +		testexe = executable(prog,
> +							 [join_paths('chamelium', 'v3', prog + '.c')],
> +							 dependencies : test_deps,
> +							 install_dir : libexecdir,
> +							 install_rpath : libexecdir_rpathdir,
> +							 install : true)
> +		test_list += prog
> +		test_executables += testexe
> +		name = prog.split('/').get(-1)
> +		if not meson.is_cross_build()
> +			testlist_files += custom_target(name + '.testlist',
> +											build_by_default : true,
> +											command : [testexe, '--show-testlist'],
> +											capture : true,
> +											output : name + '.testlist')
> +		endif
> +	endforeach
> +	test_deps += chamelium_v3
> +endif
> +
>  subdir('amdgpu')
>  
>  subdir('v3d')
> 
> -- 
> 2.43.2
> 
