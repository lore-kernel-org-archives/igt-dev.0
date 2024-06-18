Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29195C2BA15
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 08:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE9110E251;
	Tue, 18 Jun 2024 08:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHC2vTc7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5453810E251
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718699997; x=1750235997;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EuDmFFdixdsRj6z87GcM03xWMzx84nec/TpvQ17nmh8=;
 b=JHC2vTc7pjYHTg1M1g5NUU9C9uZdK6d15FQu/+z0OwjW4bcE7CJkHBS2
 P/uf+NJFxrzGv75899F8YSd9xJlYqJJt/HBjqjgYxzAV3L4w5QtZJuKRx
 E8TCp5uFlr7NRjmaFxNzOP1+4oiQXqBBA6aAcJljhktFxkMrqK54lbEsc
 DYvOF/VVrWuUv4Z3WBGxsG2cnESkFYEJmLGhyFYrIuTmpWTB2iffa+xRD
 FOep/3OfppdW/B2FNloGRSDy08lHqz9LWZiSftPdgL9HSkFVsjgFKTGdH
 kwHSiHNe8edAncltcodpUhRO2bZqUW4P3G4bhoecGl9LGyNS0M9hMuP6r Q==;
X-CSE-ConnectionGUID: 0FvChskpQcKy8ErhPO899A==
X-CSE-MsgGUID: cR5Zzxu+RZ6YeuGzqhnugA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15707196"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15707196"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:39:57 -0700
X-CSE-ConnectionGUID: NfAMIJLMTY+EeQHvMBeywg==
X-CSE-MsgGUID: sMPa60OqQES5LSxajrNK+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41341632"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 01:39:55 -0700
Date: Tue, 18 Jun 2024 10:39:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>,
 Helen Koike <helen.koike@collabora.com>
Subject: Re: [i-g-t V2 1/3] tests/panfrost: Move Panfrost tests to new dir
Message-ID: <20240618083952.ox46lkc34o6ebzap@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@collabora.com>,
 Helen Koike <helen.koike@collabora.com>
References: <20240612070335.3758500-1-bhanuprakash.modem@intel.com>
 <20240612070335.3758500-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240612070335.3758500-2-bhanuprakash.modem@intel.com>
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
On 2024-06-12 at 12:33:33 +0530, Bhanuprakash Modem wrote:
> Move all Panfrost specific tests (tests/panfrost_*) to
> new dir (tests/panfrost/panfrost_*).

Add also here that binaries will be placed in subdir
<build>/tests/panfrost

> 

+ Cc: Helen Koike <helen.koike@collabora.com>

Regards,
Kamil

> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Alyssa Rosenzweig <alyssa@collabora.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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
