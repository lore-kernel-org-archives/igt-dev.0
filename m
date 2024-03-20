Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C01EC54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 11:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E5610F424;
	Wed, 20 Mar 2024 11:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSiqIbJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9687610F424
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 11:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710933053; x=1742469053;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JiN/knkEAnQo06ABnDZJ0QJVyfg6k9iVBYfgDgFqwj4=;
 b=VSiqIbJCGeSSi8PYnT+a9GWzPeK0BCj9/bZMDtQemnzoQUIrodblyQ/6
 OgVzOl1yQJAiAYkJj5B9fYkmIevKHmUsrBkt8oYFzxh70IF0FPlKxXM9L
 juPo3iH+Ug4ECM9JgIhvgGBZNqiK4MmrbOaTz3tfcxx9IsgKzYy1zdnl4
 4BFPHGOTNLYOdY5ccvh4cMnL0rDzPQeYlb/oIyoNkJ5ck+QuKk/FLgzN+
 5C+LdZXiPnLmOBg8GouWgT5TEVq5+vWYa2u6DPhWvEykHnsnBTZW7FqwM
 diS9DbiiedVGE9qZSrffgNeUMqpxwUzdjVXaJq0dAOfKCdlCI/6TTQFvv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5787827"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5787827"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 04:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14021805"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 04:10:51 -0700
Date: Wed, 20 Mar 2024 12:10:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Himanshu Nayak <himanshu.nayak@amd.com>, sjamadar@amd.com,
 Leo.Liu@amd.com, Boyuan.Zhang@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, Ruijing.Dong@amd.com,
 Sathishkumar.Sundararaju@amd.com
Subject: Re: [PATCH 2/2] new files are added in meson.build file
Message-ID: <20240320111047.vvtjyegjul44itnm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Himanshu Nayak <himanshu.nayak@amd.com>, sjamadar@amd.com,
 Leo.Liu@amd.com, Boyuan.Zhang@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, Ruijing.Dong@amd.com,
 Sathishkumar.Sundararaju@amd.com
References: <20240319125915.1122577-1-himanshu.nayak@amd.com>
 <20240319125915.1122577-2-himanshu.nayak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240319125915.1122577-2-himanshu.nayak@amd.com>
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

Hi Himanshu,
On 2024-03-19 at 18:29:15 +0530, Himanshu Nayak wrote:

your subject should be:

[PATCH i-g-t 2/2] tests/amdgpu/meson: change amd_vcn in meson.build

Add also description here. For your patches, please use
checkpatch.pl script from Linux kernel to spot some problems, for
example missing s-o-b.

Regards,
Kamil

> ---
>  tests/amdgpu/meson.build | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index a58d18ad3..0f5eb197f 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -60,10 +60,19 @@ if libdrm_amdgpu.found()
>  endif
>  
>  foreach prog : amdgpu_progs
> -	test_executables += executable(prog, prog + '.c',
> +        if prog == 'amd_vcn'
> +              test_executables += executable(prog, prog + '.c', 'amd_vcn_common.c', 'amd_vcn_hevc.c',
>  				       dependencies : amdgpu_deps,
>  				       install_dir : amdgpudir,
>  				       install_rpath : amdgpudir_rpathdir,
>  				       install : true)
> +
> +        else
> +            test_executables += executable(prog, prog + '.c',
> +				       dependencies : amdgpu_deps,
> +				       install_dir : amdgpudir,
> +				       install_rpath : amdgpudir_rpathdir,
> +				       install : true)
> +        endif
>  	test_list += join_paths('amdgpu', prog)
>  endforeach
> -- 
> 2.34.1
> 
