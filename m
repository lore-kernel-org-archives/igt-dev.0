Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE3ECD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 15:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF50113401;
	Wed, 10 Apr 2024 15:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/8dYrfL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA58A1133FF
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 15:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712761624; x=1744297624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TAqaLREAxIwlXhVmMEHJB2MxL5MUrBcKktWn5GRBbS4=;
 b=M/8dYrfLrSoQn+vRtxgSYmzCiQxyYc7V/3cUnfeoRHQCQJD3wxrbm3MY
 FTJYjZQ4t3HiA7UQUouX+OZUsTG/vrxAeDJ6g+HmaYKAFx3P5IgYuRh6g
 1Nz+1kkE87np8hAsr1j6YW7UhVjht9tzQ+9C8SVA5RsFppj+VdWBdN9ax
 dI9sV6n1K71GgF5za7nhvi+SEXfDTdRLHJaqphk4Gy6i15QGxoMi7pakb
 W9amIORhgnmo4PC4Gl3qp1AOoIeIhuS2Qp+fiH1qd0QONDo52/iO/NWbn
 rn2Is8WGu978VVDvT3ipyguwpJ8vKpD0WS7yMU/1RdH/wHVOmOstXgXax g==;
X-CSE-ConnectionGUID: s+ij3kyjRhi4CoJLaBgKdQ==
X-CSE-MsgGUID: mme+zAZGQCax0faHZAcm9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19278405"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="19278405"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 08:07:03 -0700
X-CSE-ConnectionGUID: ohN4JZCvQIusVxskaLdnoA==
X-CSE-MsgGUID: jQa8TFrCSSumHn8sgpZMhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20532820"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 08:07:03 -0700
Date: Wed, 10 Apr 2024 17:06:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t v2 1/4] benchmarks: fix calloc calls with inverted
 arguments
Message-ID: <20240410150643.e7rwcurvhrjntctk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240410144321.44766-1-mauro.chehab@linux.intel.com>
 <20240410144321.44766-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410144321.44766-2-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-04-10 at 16:42:35 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The new gcc version 14 now complains when calloc is called
> with inverted arguments:
> 
> 	../benchmarks/gem_exec_reloc.c:85:31: warning: ‘calloc’ sizes specified with ‘sizeof’ in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
> 	   85 |         target = calloc(sizeof(*target), num_relocs);
> 	      |                               ^
> 	../benchmarks/gem_exec_reloc.c:85:31: note: earlier argument should specify number of elements, later size of each element
> 
> Replace all occurrences of calloc that were warned on gcc 14 by
> placing the arguments at the right order.

Thank you for fixing this,

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


> 
> Logic fixed using this small python script, written specifically
> to catch gcc calloc warnings:
> 
>     #!/usr/bin/env python3
>     import re
>     warnings = [
>     	"lib/igt_kms.c:2781",
>     	"lib/igt_kms.c:2809",
>     	"lib/igt_kms.c:2858",
>     	"lib/igt_chamelium.c:156",
>     	"lib/igt_chamelium.c:1519",
>     	"tests/kms_atomic_transition.c:483",
>     	"tests/kms_atomic_transition.c:485",
>     	"tests/kms_atomic_transition.c:487",
>     	"tests/kms_flip.c:426",
>     	"tests/kms_flip.c:427",
>     	"tests/intel/gem_exec_alignment.c:204",
>     	"tests/intel/gem_exec_alignment.c:409",
>     	"tests/intel/gem_exec_fair.c:1121",
>     	"tests/intel/gem_exec_fair.c:1122",
>     	"tests/intel/gem_fence_thrash.c:153",
>     	"tests/intel/gem_fence_thrash.c:234",
>     	"tests/intel/gem_ppgtt.c:432",
>     	"tests/intel/gem_ppgtt.c:459",
>     	"tests/intel/gem_render_tiled_blits.c:152",
>     	"tests/intel/gem_userptr_blits.c:1433",
>     	"tests/chamelium/kms_chamelium_frames.c:943",
>     	"tests/amdgpu/amd_multidisplay_modeset.c:242",
>     	"benchmarks/gem_exec_reloc.c:83",
>     	"benchmarks/gem_exec_reloc.c:84",
>     	"benchmarks/gem_exec_reloc.c:85",
>     	"benchmarks/gem_latency.c:196",
>     	"assembler/main.c:400",
>     	"assembler/gram.y:219",
>     	"assembler/gram.y:231",
>     	"assembler/gram.y:242",
>     ]
>     split_file = re.compile(r"([^\:]+):(\d+)")
>     calloc = re.compile(r"(calloc\s*\()(.*)\,\s*([\w\d\ \+\*\-\>]+)(\))")
>     for f in warnings:
>         match = split_file.match(f)
>         if not match:
>             continue
>         fname = match.group(1)
>         line_number = int(match.group(2))
>         new = ""
>         with open(fname, 'r', encoding = 'utf8') as fp:
>             for ln, line in enumerate(fp):
>                 if ln + 1 == line_number:
>                     new_line = calloc.sub(r"\1\3, \2\4", line)
>                     if new_line != line:
>                         line = new_line
>                     else:
>                         print(f"{fname}, line {line_number}: FAILED: {line.strip()}")
>                 new += line
>         with open(fname, 'w', encoding = 'utf8') as fp:
>             fp.write(new)
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  benchmarks/gem_exec_reloc.c | 6 +++---
>  benchmarks/gem_latency.c    | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/benchmarks/gem_exec_reloc.c b/benchmarks/gem_exec_reloc.c
> index dadc064f0ca4..0610308669f2 100644
> --- a/benchmarks/gem_exec_reloc.c
> +++ b/benchmarks/gem_exec_reloc.c
> @@ -80,9 +80,9 @@ static int run(unsigned batch_size,
>  	struct drm_i915_gem_relocation_entry *mem_reloc = NULL;
>  	int *target;
>  
> -	gem_exec = calloc(sizeof(*gem_exec), num_objects + 1);
> -	mem_reloc = calloc(sizeof(*mem_reloc), num_relocs);
> -	target = calloc(sizeof(*target), num_relocs);
> +	gem_exec = calloc(num_objects + 1, sizeof(*gem_exec));
> +	mem_reloc = calloc(num_relocs, sizeof(*mem_reloc));
> +	target = calloc(num_relocs, sizeof(*target));
>  
>  	fd = drm_open_driver(DRIVER_INTEL);
>  
> diff --git a/benchmarks/gem_latency.c b/benchmarks/gem_latency.c
> index cc8b3de55df3..6abf366f9285 100644
> --- a/benchmarks/gem_latency.c
> +++ b/benchmarks/gem_latency.c
> @@ -193,7 +193,7 @@ static void setup_workload(struct producer *p, int gen,
>  	struct drm_i915_gem_relocation_entry *reloc;
>  	int offset;
>  
> -	reloc = calloc(sizeof(*reloc), 2*factor);
> +	reloc = calloc(2*factor, sizeof(*reloc));
>  
>  	p->workload_dispatch.exec[0].handle = scratch;
>  	p->workload_dispatch.exec[1].relocation_count = 2*factor;
> -- 
> 2.44.0
> 
