Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6549CC5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 09:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9272C10E174;
	Mon, 26 Aug 2024 09:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="EPy0AQtH";
	dkim-atps=neutral
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D4A10E174
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 09:22:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1724664167; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BwgZlbhf4zNFkD5Mt8OS18bQqWnvnQ+xc4cnYAvDMgVP5JLOMIezSxXQkPjxE6zRUg2o9tNX/ys8Nzt7NTvl53OvD61PTWKTGNwVV6BA3g2yMp+pZTBD0sgcqT/UWFZyn2lffCA6IQCmQoG2zVn4+g2I86qk+eyRufnig7Pkd5Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724664167;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=hAzH2PZRSGMONkHoNcQpYkA7AAiOkmWnNHe5Ktt0qdI=; 
 b=Dpz0zYX6EhsqCZtjmYmE78UVAPDAdpHYsWHCR5bnLTo8hiXHgot9vxg7RrIVBSq+q7XiriTj1BYN6CERb12frX5g4K5zPQ9kq0migtJ+5/zYK2p/kPrfZdvRbmpFxQ8YLCyhEIMrnFXFF8kr+a8GpOfAhKRS4wFqkvcdAHDwtL0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
 dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724664167; 
 s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=hAzH2PZRSGMONkHoNcQpYkA7AAiOkmWnNHe5Ktt0qdI=;
 b=EPy0AQtH832qqkn1iSZmKWAwgXErwFbqQkgdDMIDFhbFmJ1hnakfb1CpEGDEGAbp
 9ak9vYRcnMWmO03RdP3Ffrcbtb2XgmHO6giw0tIy+VV2KzMLBCWVGNf7tvpivHoe52Y
 Kzu/21bbijbHxRtlmehhDt4THOFBVQ0CEODXZtiI=
Received: by mx.zohomail.com with SMTPS id 1724664165791715.6247527488458;
 Mon, 26 Aug 2024 02:22:45 -0700 (PDT)
Message-ID: <b84917de-4a48-4363-9060-243fa5e61c45@collabora.com>
Date: Mon, 26 Aug 2024 14:52:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 14/39] lib/chamelium/v3: Introduce the foundation
 for the Chamelium v3 wrapper
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org, 
 ihf@google.com, markyacoub@google.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, daniels <daniels@collabora.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
 <20240709-dev-remove-static-ports-v2-14-5adfc6985778@bootlin.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-14-5adfc6985778@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 09/07/24 21:04, Louis Chauvet wrote:
> Adds a build option to enable building the Chamelium v3 wrapper.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   lib/chamelium/v3/igt_chamelium.c |  9 +++++++++
>   lib/chamelium/v3/igt_chamelium.h |  8 ++++++++
>   lib/igt_kms.c                    |  8 ++++++++
>   lib/meson.build                  |  7 +++++++
>   lib/tests/meson.build            |  4 ++++
>   meson.build                      | 17 ++++++++++++++++-
>   meson_options.txt                |  4 ++++
>   tests/meson.build                | 25 +++++++++++++++++++++++++
>   8 files changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
> new file mode 100644
> index 000000000000..9579bd2cd9f8
> --- /dev/null
> +++ b/lib/chamelium/v3/igt_chamelium.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <igt_core.h>
> +#include "igt_chamelium.h"
> +
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
> index 059c61bf222a..6c2b7cc4f5bd 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2883,7 +2883,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>   	if (!resources)
>   		goto out;
>   
> +/*
> + * FIXME: Dirty hack to avoid those lines when chamelium v3 is used
> + *
> + * Must be replaced with a configuration file information, so the end user can choose if the
> + * chamelium must be connected or not.
> + */
>   #ifdef HAVE_CHAMELIUM_V2
> +#ifndef HAVE_CHAMELIUM_V3
>   	{
>   		struct chamelium *chamelium;
>   
> @@ -2898,6 +2905,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>   			chamelium_deinit_rpc_only(chamelium);
>   		}
>   	}
> +#endif
>   #endif
>   
>   	igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,
> diff --git a/lib/meson.build b/lib/meson.build
> index 714990e96485..968f1164bf61 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -197,6 +197,13 @@ if chamelium_v2.found()
>   	lib_sources += 'monitor_edids/monitor_edids_helper.c'
>   endif
>   
> +if chamelium_v3.found()
> +	lib_deps += chamelium_v3
> +	lib_sources += [
> +		'chamelium/v3/igt_chamelium.c',
> +	]

We need to add "lib_sources += 'monitor_edids/monitor_edids_helper.c'" 
to fix undefined reference to error.

> +endif
> +
>   if libprocps.found()
>   	lib_deps += libprocps
>   else
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index f98c948bc827..15f484ba0d54 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -39,6 +39,10 @@ if chamelium_v2.found()
>   	lib_tests += 'igt_audio'
>   endif
>   
> +if chamelium_v3.found()
> +	lib_deps += chamelium_v3
> +endif
> +
>   foreach lib_test : lib_tests
>   	exec = executable(lib_test, lib_test + '.c', install : false,
>   			dependencies : igt_deps)
> diff --git a/meson.build b/meson.build
> index 1fbbe4802ad3..0bb4853535cf 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -87,6 +87,7 @@ foreach cc_arg : cc_args
>   endforeach
>   
>   build_chamelium_v2 = get_option('chamelium_v2')
> +build_chamelium_v3 = get_option('chamelium_v3')
>   build_docs = get_option('docs')
>   build_tests = not get_option('tests').disabled()
>   build_xe = not get_option('xe_driver').disabled()
> @@ -172,7 +173,7 @@ if not xmlrpc.found() and xmlrpc_cmd.found()
>   	endif
>   endif
>   
> -if build_chamelium_v2.enabled() and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
> +if (build_chamelium_v2.enabled() or build_chamelium_v3.enabled()) and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
>   	error('Chamelium build forced and required dependency xmlrpc not found')
>   endif
>   
> @@ -195,6 +196,20 @@ endif
>   
>   build_info += 'Build Chamelium v2 test: @0@'.format(chamelium_v2.found())
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

gsl and alsa can be removed for v3?

> +									  ])
> +else
> +	chamelium_v3 = disabler()
> +endif
> +
>   pthreads = dependency('threads')
>   math = cc.find_library('m')
>   realtime = cc.find_library('rt')
> diff --git a/meson_options.txt b/meson_options.txt
> index fea91fb129aa..4d4047407854 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -12,6 +12,10 @@ option('chamelium_v2',
>          type : 'feature',
>          description : 'Build Chamelium v2 test')
>   
> +option('chamelium_v3',
> +       type : 'feature',
> +       description : 'Build Chamelium v3 tests')
> +
>   option('valgrind',
>          type : 'feature',
>          description : 'Build with support for valgrind annotations')
> diff --git a/tests/meson.build b/tests/meson.build
> index e7c8416dabcf..6a736d1defd1 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -324,6 +324,9 @@ chamelium_v2_progs = [
>   	'kms_chamelium_hpd',
>   ]
>   
> +chamelium_v3_progs = [
> +]
> +
>   test_deps = [ igt_deps ]
>   
>   if libdrm_nouveau.found()
> @@ -441,6 +444,28 @@ if chamelium_v2.found()
>   	test_deps += chamelium_v2
>   endif
>   
> +if chamelium_v3.found()
> +	foreach prog : chamelium_v3_progs
> +		testexe = executable(prog,
> +				 [join_paths('chamelium', 'v3', prog + '.c')],
> +				 dependencies : test_deps,
> +				 install_dir : libexecdir,
> +				 install_rpath : libexecdir_rpathdir,
> +				 install : true)
> +		test_list += prog
> +		test_executables += testexe
> +		name = prog.split('/').get(-1)
> +		if not meson.is_cross_build()
> +			testlist_files += custom_target(name + '.testlist',
> +				    build_by_default : true,
> +				    command : [testexe, '--show-testlist'],
> +				    capture : true,
> +				    output : name + '.testlist')
> +		endif
> +	endforeach
> +	test_deps += chamelium_v3
> +endif
> +
>   subdir('amdgpu')
>   
>   subdir('msm')
> 

Regards,
Vignesh
