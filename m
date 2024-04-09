Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C418C67861
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 15:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C8C10F70D;
	Tue,  9 Apr 2024 15:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckvoSaYv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8A510F70D
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 15:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712675605; x=1744211605;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aIkWRuB3UxiBwtREFSo2lMW7sYt+6Vp6+msi8Yc9qtA=;
 b=ckvoSaYvKBKoNrDH3XiWStDytRgu/ZWfomOeADVEf6Wy7YhAhBt2guiq
 GmMIAg7SxAfZAmTUZK3RYEc+uYzsjvGG3eevE8DXBT+AeMsMmie0PDfmq
 TntBtNr9JWb9vIk9pT5NSSbTJIAo5mpyxKh0P2osCdDY4Eh1qYpzA17bu
 h5QmpbjXRauCwuzrqurlLZ7bJl+mcNYec6zdj2+c3+SgSe8yCIubOu6eU
 n1veFyMOi9VcOVjvepjCW2VrXO7nnml0pP0NDeye98/RkBEYhy3tgmoCX
 rgdBBUdo96n/VgaQi8Dgy37aN/KTaxkrQUv7Te3P/KXmCllDSlC3GFRr3 w==;
X-CSE-ConnectionGUID: XnSaQYSpTFqb5IWGGZ/llw==
X-CSE-MsgGUID: J0uTtqYpQcidQDuK8bIK7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7854492"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7854492"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 08:13:12 -0700
X-CSE-ConnectionGUID: mm4W1rlFRAu93ACpg5LMdQ==
X-CSE-MsgGUID: g8K3i8I3TO+HBg3D/T+ucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20216940"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 08:13:11 -0700
Date: Tue, 9 Apr 2024 17:13:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t 0/5] Fix name collisions in Core test documentation
Message-ID: <20240409151309.b3pxz3vewiztg2jl@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-04-09 at 11:19:10 +0000, Katarzyna Piecielska wrote:
> After updating i915 and XE test documentation for Core there is a need to fix
> some name collisions to make our infrastructure happy. These changes are around
> Core tests. To make sure all name collisions were removed I was using
> scripts/doc-tests-cross-check.sh. Remaining collisions are around KMS tests.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 

There are few collisions left, could you also remove them?

Possibly colliding doc words ( cat e.* |sort -u ):
display
obsolete
synchronization

grep -i -E -w display n.*|head
n.Category:../tests/chamelium/kms_chamelium_audio.c: * Category: Display
n.Category:../tests/chamelium/kms_chamelium_color.c: * Category: Display

Collision for 'display' is in one test documentation:

grep -i -E -w display n.Sub*
../tests/intel/i915_selftest.c: * Sub-category: Display

Maybe name it 'Display selftest'? Or create new one sub-category
'driver selftest'?

'Obsolete' is in Category:
grep -i -E -w obsolete n.*
n.Category:../tests/intel/gen3_mixed_blits.c: * Category: Obsolete
n.Category:../tests/intel/gen3_render_linear_blits.c: * Category: Obsolete

So collisions are in two subtests:
n.Functionality:../tests/intel/kms_pipe_b_c_ivb.c: * Functionality: kms_core, obsolete
n.Functionality:../tests/kms_tv_load_detect.c: * Functionality: obsolete

Collision for 'synchronization' is in one doc:
grep -i -E -w synchronization n.*
n.Functionality:../tests/intel/kms_fence_pin_leak.c: * Functionality: kms_core, synchronization

as I ssume this should be Sub-category:
n.Sub-category:../tests/intel/gem_sync.c: * Sub-category: Synchronization
n.Sub-category:../tests/intel/i915_selftest.c: * Sub-category: Synchronization
n.Sub-category:../tests/intel/xe_waitfence.c: * Sub-category: Synchronization
n.Sub-category:../tests/syncobj_basic.c: * Sub-category: Synchronization

Regards,
Kamil

> 
> Katarzyna Piecielska (5):
>   tests/intel: Add missing Sub-category for xe_waitfence
>   tests/intel: Remove name collision in Display tests visible in Core
>     docs
>   tests/intel: Remove documentation collision for Obsolete category
>   tests/intel: Remove documentation collisions in i915_selftest
>   tests: Remove collisions with Subcategory and Functionality
> 
>  tests/dmabuf.c                         |  2 +-
>  tests/dmabuf_sync_file.c               |  2 +-
>  tests/drm_mm.c                         |  2 +-
>  tests/drm_read.c                       |  2 +-
>  tests/intel/gem_exec_endless.c         |  4 ++--
>  tests/intel/gem_exec_params.c          |  4 ++--
>  tests/intel/gem_fence_thrash.c         |  2 +-
>  tests/intel/gem_fence_upload.c         |  2 +-
>  tests/intel/gem_fenced_exec_thrash.c   |  6 +++---
>  tests/intel/gen3_mixed_blits.c         |  4 ++--
>  tests/intel/gen3_render_linear_blits.c |  4 ++--
>  tests/intel/gen3_render_mixed_blits.c  |  4 ++--
>  tests/intel/gen3_render_tiledx_blits.c |  4 ++--
>  tests/intel/gen3_render_tiledy_blits.c |  4 ++--
>  tests/intel/i915_pipe_stress.c         |  2 +-
>  tests/intel/i915_selftest.c            | 24 ++++++++++++------------
>  tests/intel/perf.c                     |  6 +++---
>  tests/intel/prime_mmap_kms.c           |  2 +-
>  tests/intel/xe_exec_compute_mode.c     |  2 +-
>  tests/intel/xe_live_ktest.c            |  6 +++---
>  tests/intel/xe_waitfence.c             |  1 +
>  tests/prime_nv_api.c                   |  2 +-
>  22 files changed, 46 insertions(+), 45 deletions(-)
> 
> -- 
> 2.34.1
> 
