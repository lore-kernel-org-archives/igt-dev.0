Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB10CC27C78
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 16:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F3C10E105;
	Tue, 11 Jun 2024 16:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EvPCs37J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA27810E105
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718124004; x=1749660004;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/PTDfqIHloVvZJhWyUHc68y3t+N5/Wxxefb/QYk9sGs=;
 b=EvPCs37JvCXleYuzEPUShb1+wOp/v4I1VwsmQQKd+f8ajH8M/tw8sxvE
 7MA9oQHAo70DbZkyeqMXy71j0JMS+hov0cnKlnslorq6nFargfDvTjZ5M
 gds+11h9WwmsgUkulbTv6GZo6SAFgxrkaR1OURllHJA0EIalou4tVoLzM
 Zj4zgcfT7C+EVtYLjdhkwx88g9+hfz0XLFYERu9k8TtVX+tNnaxJCP+Tu
 28aa6B4bCOc3MArDGEmegTK70NF7Ye4SWCfwSwgd4VeRSG1zcxsOQ/Q1R
 Ju1cQh4b9wqZZS7Ox8KQRlugXej7rSR9WzneMGjaecYBotUNNuZ3/1XMO g==;
X-CSE-ConnectionGUID: 8E94piouSnKZ0CriI1Ijzw==
X-CSE-MsgGUID: 6ncMBKZtT22vM6sSMPTl1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="25522858"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="25522858"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:40:01 -0700
X-CSE-ConnectionGUID: q78ckjLBRsCJW2YOsTjIpA==
X-CSE-MsgGUID: HlFyqspAQMCxLKeqqf2ERA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39584806"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 09:40:00 -0700
Date: Tue, 11 Jun 2024 18:39:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Rob Clark <robdclark@chromium.org>,
 Helen Koike <helen.koike@collabora.com>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH i-g-t 2/3] tests/msm: Move MSM tests to new dir
Message-ID: <20240611163957.ljb3sslsarpbuuz3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Rob Clark <robdclark@chromium.org>,
 Helen Koike <helen.koike@collabora.com>,
 Emma Anholt <emma@anholt.net>
References: <20240610080150.3610871-1-bhanuprakash.modem@intel.com>
 <20240610080150.3610871-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610080150.3610871-3-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-06-10 at 13:31:48 +0530, Bhanuprakash Modem wrote:
> Move all MSM specific tests (tests/msm_*) to new dir
> (tests/msm/msm_*).
> 

Added msm devs to Cc:

Cc: Rob Clark <robdclark@chromium.org>
Cc: Helen Koike <helen.koike@collabora.com>
Cc: Emma Anholt <emma@anholt.net>

> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  meson.build           |  8 ++++++++
>  tests/meson.build     | 19 ++-----------------
>  tests/msm/meson.build | 16 ++++++++++++++++
>  3 files changed, 26 insertions(+), 17 deletions(-)
>  create mode 100644 tests/msm/meson.build
> 
> diff --git a/meson.build b/meson.build
> index 701a5cc35..6ae3c2684 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -276,6 +276,7 @@ includedir = get_option('includedir')
>  libdir = get_option('libdir')
>  libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
>  amdgpudir = join_paths(libexecdir, 'amdgpu')
> +msmdir = join_paths(libexecdir, 'msm')
>  panfrostdir = join_paths(libexecdir, 'panfrost')
>  v3ddir = join_paths(libexecdir, 'v3d')
>  vc4dir = join_paths(libexecdir, 'vc4')
> @@ -316,6 +317,12 @@ if get_option('use_rpath')
>  	endforeach
>  	amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, libdir)
>  
> +	msm_rpathdir = '$ORIGIN'
> +	foreach p : msmdir.split('/')
> +		msm_rpathdir = join_paths(msm_rpathdir, '..')
> +	endforeach
> +	msm_rpathdir = join_paths(msm_rpathdir, libdir)
> +
>  	panfrost_rpathdir = '$ORIGIN'
>  	foreach p : panfrostdir.split('/')
>  		panfrost_rpathdir = join_paths(panfrost_rpathdir, '..')
> @@ -343,6 +350,7 @@ else
>  	bindir_rpathdir = ''
>  	libexecdir_rpathdir = ''
>  	amdgpudir_rpathdir = ''
> +	msm_rpathdir = ''
>  	panfrost_rpathdir = ''
>  	v3d_rpathdir = ''
>  	vc4_rpathdir = ''
> diff --git a/tests/meson.build b/tests/meson.build
> index 16896de99..122fbd07c 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -314,14 +314,6 @@ intel_xe_progs = [
>  	'xe_sysfs_scheduler',
>  ]
>  
> -msm_progs = [
> -	'msm_mapping',
> -	'msm_recovery',
> -	'msm_shrink',
> -	'msm_submit',
> -	'msm_submitoverhead',
> -]
> -
>  chamelium_progs = [
>  	'kms_chamelium_audio',
>  	'kms_chamelium_color',
> @@ -424,15 +416,6 @@ foreach prog : intel_progs
>  	endif
>  endforeach
>  
> -foreach prog : msm_progs
> -	test_executables += executable(prog, join_paths('msm', prog + '.c'),
> -				       dependencies : test_deps,
> -				       install_dir : libexecdir,
> -				       install_rpath : libexecdir_rpathdir,
> -				       install : true)
> -	test_list += prog
> -endforeach
> -
>  if chamelium.found()
>  	foreach prog : chamelium_progs
>  		testexe = executable(prog,
> @@ -457,6 +440,8 @@ endif
>  
>  subdir('amdgpu')
>  
> +subdir('msm')
> +
>  subdir('panfrost')
>  
>  subdir('v3d')
> diff --git a/tests/msm/meson.build b/tests/msm/meson.build
> new file mode 100644
> index 000000000..74169b5b2
> --- /dev/null
> +++ b/tests/msm/meson.build
> @@ -0,0 +1,16 @@
> +msm_progs = [
> +	'msm_mapping',
> +	'msm_recovery',
> +	'msm_shrink',
> +	'msm_submit',
> +	'msm_submitoverhead',
> +]
> +
> +foreach prog : msm_progs
> +	test_executables += executable(prog, prog + '.c',
> +				       dependencies : test_deps,
> +				       install_dir : msmdir,
> +				       install_rpath : msm_rpathdir,
> +				       install : true)
> +	test_list += join_paths('msm', prog)
> +endforeach
> -- 
> 2.43.2
> 
