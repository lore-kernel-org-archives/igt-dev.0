Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38715D32D7D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 09:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDB510E31F;
	Tue, 12 Nov 2024 09:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XVzw2+J9";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81A010E31F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 09:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731404273;
 bh=GDH6tiHsk85PEkB/bp/p/9hYNHCtky9sTgwSV5dW4EY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=XVzw2+J9t0cyLOhyFCwrGzV97ysKbbPr58v3/5DctpT1aAbo2l44K3w49wRwkpkQX
 FX9nPct/aYmJkTEaaeF/2ULdQ5k/di26GNaUcRQxZEtysllTVRSC9B6QFBt/Kal8Ik
 RXpQygEqEh0SNjmxe4pe1CchgJQz4OyX0m6RuOoVupOPlxn8pOB5MYpaysPOgtCem6
 Um99KBklYIUeJn9Fcjh5S2odhGZ5AtKc0BTtVzbIGjTKG9uE5jKuZNFNMZ6a4IcHr/
 4xbeBRiSmAfsq+wfRybj/d39Hz+LIIqu8fTl4wTwqLVMaK2fNig9K90mduVv/xsivP
 0DNsE/eiN10mg==
Received: from [192.168.50.250] (unknown [171.76.85.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 76D4317E1524;
 Tue, 12 Nov 2024 10:37:51 +0100 (CET)
Message-ID: <ae418a89-5d58-4841-aec0-acca586af192@collabora.com>
Date: Tue, 12 Nov 2024 15:07:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/5] lib/chamelium/v3: Introduce the foundation
 for the Chamelium v3 wrapper
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org, 
 ihf@google.com, markyacoub@google.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com,
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com,
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com,
 20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com
References: <20241022-dev-remove-static-ports-v3-0-bfbc7b2a83b9@bootlin.com>
 <20241022-dev-remove-static-ports-v3-1-bfbc7b2a83b9@bootlin.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20241022-dev-remove-static-ports-v3-1-bfbc7b2a83b9@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 22/10/24 22:01, Louis Chauvet wrote:
> Adds a build option to enable building the Chamelium v3 wrapper.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   lib/chamelium/v3/igt_chamelium.c |  9 +++++++++
>   lib/chamelium/v3/igt_chamelium.h |  8 ++++++++
>   lib/igt_kms.c                    |  8 ++++++++
>   lib/meson.build                  | 12 +++++++++++-
>   lib/tests/meson.build            |  4 ++++
>   meson.build                      | 15 ++++++++++++++-
>   meson_options.txt                |  4 ++++
>   tests/meson.build                | 25 +++++++++++++++++++++++++
>   8 files changed, 83 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
> new file mode 100644
> index 000000000000..152242998013
> --- /dev/null
> +++ b/lib/chamelium/v3/igt_chamelium.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: MIT
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
> index 000000000000..3195be2bc384
> --- /dev/null
> +++ b/lib/chamelium/v3/igt_chamelium.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef V3_IGT_CHAMELIUM_H
> +#define V3_IGT_CHAMELIUM_H
> +
> +void chamelium_v3_init(void);
> +
> +#endif //V3_IGT_CHAMELIUM_H
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 56003ceaf9dc..4d9df90e771f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2908,7 +2908,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
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
> @@ -2923,6 +2930,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>   			chamelium_deinit_rpc_only(chamelium);
>   		}
>   	}
> +#endif
>   #endif
>   
>   	igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,
> diff --git a/lib/meson.build b/lib/meson.build
> index 5769f96fbdc1..8bcbd58bc0e6 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -195,7 +195,6 @@ if chamelium_v2.found()
>   		'chamelium/v2/igt_chamelium.c',
>   		'chamelium/v2/igt_chamelium_stream.c'
>   	]
> -	lib_sources += 'monitor_edids/monitor_edids_helper.c'
>   endif
>   
>   if build_xe_eudebug
> @@ -203,6 +202,17 @@ if build_xe_eudebug
>   	lib_sources += 'xe/xe_eudebug.c'
>   endif
>   
> +if chamelium_v3.found()
> +	lib_deps += chamelium_v3
> +	lib_sources += [
> +		'chamelium/v3/igt_chamelium.c',
> +	]
> +endif
> +
> +if chamelium_v2.found() or chamelium_v3.found()
> +	lib_sources += 'monitor_edids/monitor_edids_helper.c'
> +endif
> +
>   if libprocps.found()
>   	lib_deps += libprocps
>   else
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index fa7741b7be61..8a96cd73ee42 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -41,6 +41,10 @@ if chamelium_v2.found()
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
> index b4b1026acb4c..d5d7b325eacd 100644
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
> @@ -174,7 +175,7 @@ if not xmlrpc.found() and xmlrpc_cmd.found()
>   	endif
>   endif
>   
> -if build_chamelium_v2.enabled() and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
> +if (build_chamelium_v2.enabled() or build_chamelium_v3.enabled()) and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
>   	error('Chamelium build forced and required dependency xmlrpc not found')
>   endif
>   
> @@ -197,6 +198,18 @@ endif
>   
>   build_info += 'Build Chamelium v2 test: @0@'.format(chamelium_v2.found())

We need to add this for Chamelium v3 test also?

>   
> +
> +if xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found() and libcurl.found()
> +	config.set('HAVE_CHAMELIUM_V3', 1)
> +	chamelium_v3 = declare_dependency(dependencies : [
> +										  xmlrpc,
> +										  xmlrpc_util,
> +										  xmlrpc_client,
> +									  ])
> +else
> +	chamelium_v3 = disabler()
> +endif
> +
>   pthreads = dependency('threads')
>   math = cc.find_library('m')
>   realtime = cc.find_library('rt')
> diff --git a/meson_options.txt b/meson_options.txt
> index 3a6edefba349..ebdb9976da1a 100644
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
> index 4eebe1838979..861101c2534e 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -340,6 +340,9 @@ chamelium_v2_progs = [
>   	'kms_chamelium_hpd',
>   ]
>   
> +chamelium_v3_progs = [
> +]
> +
>   test_deps = [ igt_deps ]
>   
>   if libdrm_nouveau.found()
> @@ -457,6 +460,28 @@ if chamelium_v2.found()
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
