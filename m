Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101F9C27C65
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 16:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7E510E105;
	Tue, 11 Jun 2024 16:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyAv0V+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0188A10E105
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 16:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718123641; x=1749659641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X1U4HSmkKohtw1XicTGNffm0Xi+hNqhIUYqlBVY2FX8=;
 b=CyAv0V+iSsxtdMK+aN85Nh0CSc6l/qAaXW7HWMwCSZwbkKOyYjA25mtx
 SijkaDTHGf9ML5AGW9FLz1y25AZ4tK1s+VIzwUMoCwyv5BdH/kztUe0iT
 nyzQ6l7Qt80BygyTdVR+3NHvLLjRYo3IxXkmp3aoxWPcw+QvF8gZjzGvN
 y/dLLCUPmMIcqArqqDTfSdCkivjw29cwmcZpVAT7e4ikvK94ohkgRmNdB
 SRG7KGjoy3tBGG8a1X8DzkdC2iCteVHzcPplyagV3k7L46+ATtNae7DBr
 A4x2hWJ8i+ybXr6YYlrn801YUXSQQ4nrGw9/6jzDcHAk3azZ/GW2uzA5N g==;
X-CSE-ConnectionGUID: 6um+h1IDTyiXCpR3cWGwVA==
X-CSE-MsgGUID: reuW4FAeTRW5AoywyXc/JQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15005679"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="15005679"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:34:00 -0700
X-CSE-ConnectionGUID: fRTFRN+pTQS68nTfmOhH2w==
X-CSE-MsgGUID: exIJf120QYyL4hP/COIdJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44436834"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 09:34:00 -0700
Date: Tue, 11 Jun 2024 18:33:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>
Subject: Re: [PATCH i-g-t 1/3] tests/panfrost: Move Panfrost tests to new dir
Message-ID: <20240611163356.pp7kcgashc5ovmqh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>
References: <20240610080150.3610871-1-bhanuprakash.modem@intel.com>
 <20240610080150.3610871-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240610080150.3610871-2-bhanuprakash.modem@intel.com>
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
On 2024-06-10 at 13:31:47 +0530, Bhanuprakash Modem wrote:
> Move all Panfrost specific tests (tests/panfrost_*) to
> new dir (tests/panfrost/panfrost_*).
> 

Adding panfrost devs to Cc:

Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alyssa Rosenzweig <alyssa@collabora.com>

> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  meson.build                               |  8 ++++++++
>  tests/meson.build                         |  6 ++----
>  tests/panfrost/meson.build                | 15 +++++++++++++++
>  tests/{ => panfrost}/panfrost_gem_new.c   |  0
>  tests/{ => panfrost}/panfrost_get_param.c |  0
>  tests/{ => panfrost}/panfrost_prime.c     |  0
>  tests/{ => panfrost}/panfrost_submit.c    |  0
>  7 files changed, 25 insertions(+), 4 deletions(-)
>  create mode 100644 tests/panfrost/meson.build
>  rename tests/{ => panfrost}/panfrost_gem_new.c (100%)
>  rename tests/{ => panfrost}/panfrost_get_param.c (100%)
>  rename tests/{ => panfrost}/panfrost_prime.c (100%)
>  rename tests/{ => panfrost}/panfrost_submit.c (100%)
> 
> diff --git a/meson.build b/meson.build
> index ab44aadb1..701a5cc35 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -276,6 +276,7 @@ includedir = get_option('includedir')
>  libdir = get_option('libdir')
>  libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
>  amdgpudir = join_paths(libexecdir, 'amdgpu')
> +panfrostdir = join_paths(libexecdir, 'panfrost')
>  v3ddir = join_paths(libexecdir, 'v3d')
>  vc4dir = join_paths(libexecdir, 'vc4')
>  vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
> @@ -315,6 +316,12 @@ if get_option('use_rpath')
>  	endforeach
>  	amdgpudir_rpathdir = join_paths(amdgpudir_rpathdir, libdir)
>  
> +	panfrost_rpathdir = '$ORIGIN'
> +	foreach p : panfrostdir.split('/')
> +		panfrost_rpathdir = join_paths(panfrost_rpathdir, '..')
> +	endforeach
> +	panfrost_rpathdir = join_paths(panfrost_rpathdir, libdir)
> +
>  	v3d_rpathdir = '$ORIGIN'
>  	foreach p : v3ddir.split('/')
>  		v3d_rpathdir = join_paths(v3d_rpathdir, '..')
> @@ -336,6 +343,7 @@ else
>  	bindir_rpathdir = ''
>  	libexecdir_rpathdir = ''
>  	amdgpudir_rpathdir = ''
> +	panfrost_rpathdir = ''
>  	v3d_rpathdir = ''
>  	vc4_rpathdir = ''
>  	vmwgfx_rpathdir = ''
> diff --git a/tests/meson.build b/tests/meson.build
> index 758ae090c..16896de99 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -65,10 +65,6 @@ test_progs = [
>  	'kms_vrr',
>  	'kms_writeback',
>  	'meta_test',
> -	'panfrost_get_param',
> -	'panfrost_gem_new',
> -	'panfrost_prime',
> -	'panfrost_submit',
>  	'prime_udl',
>  	'prime_vgem',
>  	'sriov_basic',
> @@ -461,6 +457,8 @@ endif
>  
>  subdir('amdgpu')
>  
> +subdir('panfrost')
> +
>  subdir('v3d')
>  
>  subdir('vc4')
> diff --git a/tests/panfrost/meson.build b/tests/panfrost/meson.build
> new file mode 100644
> index 000000000..b633d1be9
> --- /dev/null
> +++ b/tests/panfrost/meson.build
> @@ -0,0 +1,15 @@
> +panfrost_progs = [
> +	'panfrost_get_param',
> +	'panfrost_gem_new',
> +	'panfrost_prime',
> +	'panfrost_submit',
> +]
> +
> +foreach prog : panfrost_progs
> +	test_executables += executable(prog, prog + '.c',
> +				       dependencies : test_deps,
> +				       install_dir : panfrostdir,
> +				       install_rpath : panfrost_rpathdir,
> +				       install : true)
> +	test_list += join_paths('panfrost', prog)
> +endforeach
> diff --git a/tests/panfrost_gem_new.c b/tests/panfrost/panfrost_gem_new.c
> similarity index 100%
> rename from tests/panfrost_gem_new.c
> rename to tests/panfrost/panfrost_gem_new.c
> diff --git a/tests/panfrost_get_param.c b/tests/panfrost/panfrost_get_param.c
> similarity index 100%
> rename from tests/panfrost_get_param.c
> rename to tests/panfrost/panfrost_get_param.c
> diff --git a/tests/panfrost_prime.c b/tests/panfrost/panfrost_prime.c
> similarity index 100%
> rename from tests/panfrost_prime.c
> rename to tests/panfrost/panfrost_prime.c
> diff --git a/tests/panfrost_submit.c b/tests/panfrost/panfrost_submit.c
> similarity index 100%
> rename from tests/panfrost_submit.c
> rename to tests/panfrost/panfrost_submit.c
> -- 
> 2.43.2
> 
