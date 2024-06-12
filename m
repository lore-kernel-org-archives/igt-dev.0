Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D702CC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 08:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF6710E7D8;
	Wed, 12 Jun 2024 08:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HF/IUvID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8670910E7D8
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 08:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718182778; x=1749718778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SmAOoBnTGVu737+EDLPd2y8EblElutxYhUDK2w9stp8=;
 b=HF/IUvIDyLNyYjA6wa65PI1UuUSxgEBT5JBsinxkKwhpW8UZ7Tvw868B
 1hFX8vAs+URWZPckQ4eXvS9dIPrre0KWRDQYP19d9CQ/UYlL+olEiAEFV
 JZbKmuUjjvwX2uUXxjKXbjUBh5OruKO6jzONqLDDBduDsTtkYuM5bgJaK
 kHeTUt9lUKW5A7Xfon9UqbK1RuJ3gk+yXi0XEfiBuHxX03lXNXD229Mz5
 rUnbfYyZYxjN0lossREttagKLZtnF3xKaXkZZHIMftzcFXlUfXJVVsWws
 tB9B8KScm7wfUc76kJr7KACcLF5itCmPUyP539DXSV/M4vjYNEeXxmSZG g==;
X-CSE-ConnectionGUID: 3Pagn/+nR0O0y/4Fd09w1w==
X-CSE-MsgGUID: /zAuCFGOTU+lfQhutP2DQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15088469"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="15088469"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 01:59:37 -0700
X-CSE-ConnectionGUID: fw5nASOsQle4FTsVAYH07Q==
X-CSE-MsgGUID: c65eSOQXQme6rPjiFa+GiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="44113194"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 01:59:35 -0700
Date: Wed, 12 Jun 2024 10:59:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Rob Clark <robdclark@chromium.org>,
 Helen Koike <helen.koike@collabora.com>, Emma Anholt <emma@anholt.net>
Subject: Re: [i-g-t V2 2/3] tests/msm: Move MSM tests to new dir
Message-ID: <20240612085917.fuedflaohprijgr2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Rob Clark <robdclark@chromium.org>,
 Helen Koike <helen.koike@collabora.com>,
 Emma Anholt <emma@anholt.net>
References: <20240612070335.3758500-1-bhanuprakash.modem@intel.com>
 <20240612070335.3758500-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240612070335.3758500-3-bhanuprakash.modem@intel.com>
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
On 2024-06-12 at 12:33:34 +0530, Bhanuprakash Modem wrote:
> Move all MSM specific tests (tests/msm_*) to new dir
> (tests/msm/msm_*).
> 
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Helen Koike <helen.koike@collabora.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Acked-by:  Rob Clark <robdclark@chromium.org>
> ---
>  meson.build           |  8 ++++++++
>  tests/meson.build     | 19 ++-----------------
>  tests/msm/meson.build | 16 ++++++++++++++++
>  3 files changed, 26 insertions(+), 17 deletions(-)

I do not see any msm files moved, is this an ommision?

Regards,
Kamil

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
