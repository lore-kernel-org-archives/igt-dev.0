Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3A9D32D79
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 09:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341CA10E31F;
	Tue, 12 Nov 2024 09:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qxvxD8C0";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C07C10E31F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 09:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731404065;
 bh=Py25BIz/BIs5+SijkTrZ/inNjONEizN6UygMR9aHoug=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qxvxD8C0IzkXu/2RoV/zR+zsxrrhfbADLI2TKmtqggD/Sw50uR2nXEyLYtrC7v5Kx
 Jf0Q105YKK4Cm0Crfv7tTNZszyGdqIw5kkTVdFf/Fw/hU3qXHhcoDRnsoGYh0U5+Cc
 blrqqhySOJzVw7aAUqjuIxuHdL4JN/KnMcN0MqjJmCNm5k4vG0GlfjfFGmNh0riidq
 8GC5Ea19Ni6lTZdLvDRcKB3ouHKc6VtsXS6dz6ynerGLvdmRI3s5HZj3f+pXAQvg83
 ajEfX0VumEhcjI+P+h2uW88SsN1L9pkEnIN6y6g9nbRicRNzV/Zv2f/wKNJ8AI6yeb
 LOuz5Q7bMujGA==
Received: from [192.168.50.250] (unknown [171.76.85.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6833E17E1524;
 Tue, 12 Nov 2024 10:34:22 +0100 (CET)
Message-ID: <efda127a-5e5e-452e-bd55-6fece10cb0cf@collabora.com>
Date: Tue, 12 Nov 2024 15:04:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] lib/chamelium/v2: Rename chamelium to
 chamelium_v2
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com,
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com,
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com,
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com
References: <20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com>
 <20241022-b4-cv3-03-cv2-split-v1-3-9f7cc8591ff9@bootlin.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20241022-b4-cv3-03-cv2-split-v1-3-9f7cc8591ff9@bootlin.com>
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

On 22/10/24 20:19, Louis Chauvet wrote:
> To avoid confusion in meson build file, rename the variable chamlium to
> chamlium_v2.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   .gitlab-ci.yml            |  2 +-
>   docs/testplan/meson.build |  4 ++--
>   lib/meson.build           |  4 ++--
>   lib/tests/meson.build     |  4 ++--
>   meson.build               | 16 ++++++++--------
>   meson_options.txt         |  4 ++--
>   tests/meson.build         |  8 ++++----
>   7 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index a6c076dba487..ff4f4f94b691 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>     MESON_OPTIONS: >
>       -Dlibdrm_drivers=intel,nouveau,amdgpu
>       -Doverlay=enabled
> -    -Dchamelium=enabled
> +    -Dchamelium_v2=enabled
>       -Dvalgrind=enabled
>       -Dman=enabled
>       -Dtests=enabled
> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
> index 5560347f1337..f60c82ad139c 100644
> --- a/docs/testplan/meson.build
> +++ b/docs/testplan/meson.build
> @@ -21,8 +21,8 @@ if build_tests
>   		build_info += 'Will Check if documentation is in sync with testlist'
>   		check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
>   
> -		if not chamelium.found()
> -			warning('WARNING: Will not check if documentation is in sync for KMS as chamelium is disabled')
> +		if not chamelium_v2.found()
> +			warning('WARNING: Will not check if documentation is in sync for KMS as chamelium v2 is disabled')
>   		else
>   			kms_check_testlist = check_testlist
>   		endif
> diff --git a/lib/meson.build b/lib/meson.build
> index dc70704bd919..5769f96fbdc1 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -189,8 +189,8 @@ if alsa.found()
>   	lib_sources += 'igt_alsa.c'
>   endif
>   
> -if chamelium.found()
> -	lib_deps += chamelium
> +if chamelium_v2.found()
> +	lib_deps += chamelium_v2
>   	lib_sources += [
>   		'chamelium/v2/igt_chamelium.c',
>   		'chamelium/v2/igt_chamelium_stream.c'
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index df8092638eca..fa7741b7be61 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -36,8 +36,8 @@ lib_fail_tests = [
>   
>   lib_tests_deps = igt_deps
>   
> -if chamelium.found()
> -	lib_deps += chamelium
> +if chamelium_v2.found()
> +	lib_deps += chamelium_v2
>   	lib_tests += 'igt_audio'
>   endif
>   
> diff --git a/meson.build b/meson.build
> index 64f57f232ad8..df0f7b718986 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -86,7 +86,7 @@ foreach cc_arg : cc_args
>     endif
>   endforeach
>   
> -build_chamelium = get_option('chamelium')
> +build_chamelium_v2 = get_option('chamelium_v2')
>   build_docs = get_option('docs')
>   build_tests = not get_option('tests').disabled()
>   build_xe = not get_option('xe_driver').disabled()
> @@ -174,17 +174,17 @@ if not xmlrpc.found() and xmlrpc_cmd.found()
>   	endif
>   endif
>   
> -if build_chamelium.enabled() and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
> +if build_chamelium_v2.enabled() and not (xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found())
>   	error('Chamelium build forced and required dependency xmlrpc not found')
>   endif
>   
> -gsl = dependency('gsl', required : build_chamelium)
> -alsa = dependency('alsa', required : build_chamelium)
> -libcurl = dependency('libcurl', required : build_chamelium)
> +gsl = dependency('gsl', required : build_chamelium_v2)
> +alsa = dependency('alsa', required : build_chamelium_v2)
> +libcurl = dependency('libcurl', required : build_chamelium_v2)

libcurl is required for chamelium v3 also. We can remove 
build_chamelium_v2 in this case.

>   
>   if xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found() and gsl.found() and alsa.found() and libcurl.found()
>   	config.set('HAVE_CHAMELIUM', 1)
> -	chamelium = declare_dependency(dependencies : [
> +	chamelium_v2 = declare_dependency(dependencies : [
>   		xmlrpc,
>   		xmlrpc_util,
>   		xmlrpc_client,
> @@ -192,10 +192,10 @@ if xmlrpc.found() and xmlrpc_util.found() and xmlrpc_client.found() and gsl.foun
>   		alsa,
>   	])
>   else
> -	chamelium = disabler()
> +	chamelium_v2 = disabler()
>   endif
>   
> -build_info += 'Build Chamelium test: @0@'.format(chamelium.found())
> +build_info += 'Build Chamelium v2 test: @0@'.format(chamelium_v2.found())

This should be added inside the if condition?

>   
>   pthreads = dependency('threads')
>   math = cc.find_library('m')
> diff --git a/meson_options.txt b/meson_options.txt
> index c410f9b777ad..3a6edefba349 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -8,9 +8,9 @@ option('overlay_backends',
>          choices : [ 'auto', 'x', 'xv' ],
>          description : 'Overlay backends to enable')
>   
> -option('chamelium',
> +option('chamelium_v2',
>          type : 'feature',
> -       description : 'Build Chamelium test')
> +       description : 'Build Chamelium v2 test')
>   
>   option('valgrind',
>          type : 'feature',
> diff --git a/tests/meson.build b/tests/meson.build
> index 4cb199d34527..4eebe1838979 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -332,7 +332,7 @@ if build_xe_eudebug
>   	intel_xe_progs += intel_xe_eudebug_progs
>   endif
>   
> -chamelium_progs = [
> +chamelium_v2_progs = [
>   	'kms_chamelium_audio',
>   	'kms_chamelium_color',
>   	'kms_chamelium_edid',
> @@ -435,8 +435,8 @@ foreach prog : intel_progs
>   	endif
>   endforeach
>   
> -if chamelium.found()
> -	foreach prog : chamelium_progs
> +if chamelium_v2.found()
> +	foreach prog : chamelium_v2_progs
>   		testexe = executable(prog,
>   				 [join_paths('chamelium', 'v2', prog + '.c')] + extra_sources.get(prog, []),
>   				 dependencies : test_deps + extra_dependencies.get(prog, []),
> @@ -454,7 +454,7 @@ if chamelium.found()
>   				    output : name + '.testlist')
>   		endif
>   	endforeach
> -	test_deps += chamelium
> +	test_deps += chamelium_v2
>   endif
>   
>   subdir('amdgpu')
> 

Regards,
Vignesh
