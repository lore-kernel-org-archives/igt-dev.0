Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B99C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD5611228F;
	Mon,  4 Mar 2024 15:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NM+ASNNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5DD11228F
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565749; x=1741101749;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NgZSlOwC7haHRr3i/nKJ+dkC/Idv9B09Mak1TTNFfmY=;
 b=NM+ASNNhVYiAeC2nDwpfg+JD1XrexUmddhT4KFnh+3d6GN4U2LW68O93
 +bXJI+AZpWqtlDbJHHIinPfdIQNRyb/Y/iWHo2XzGERAaNLo4zq2GE+fI
 SNOya74UqwLIbeMkLjBcCGX8wgR43QOUZsx6Iv6CFMYL43/G7igWFj3QI
 iWe5C6w33czxnjyh8YyG5w4MnSuRieWHPMNpFHM9loZIpRnHOu8JCmHbf
 pLIEZJXiETkeEBWESwClMX7lk7p3kSgKWiV6oQk3AucsALbKfgHdLHg+E
 0BHqw3bbgMco+pxbU+2Xk3qjMxXFrjm9IpJz0R6YtezcGSM70rWYH6B6f w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14773979"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="14773979"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9088062"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:22:27 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 44D58580960;
 Mon,  4 Mar 2024 07:22:26 -0800 (PST)
Date: Mon, 4 Mar 2024 16:22:23 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 18/24] tests: Introduce Synchronization subcategory
Message-ID: <20240304162223.70e12621@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-19-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-19-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon,  4 Mar 2024 11:16:11 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> DRM and i915 subcategories seems to be too wide and general. Let's use
> Synchronization subcategory.

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/intel/gem_sync.c   | 2 +-
>  tests/intel/gem_wait.c   | 2 +-
>  tests/sw_sync.c          | 2 +-
>  tests/syncobj_basic.c    | 2 +-
>  tests/syncobj_timeline.c | 2 +-
>  tests/syncobj_wait.c     | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
> index d3de2e77e..129ee3b68 100644
> --- a/tests/intel/gem_sync.c
> +++ b/tests/intel/gem_sync.c
> @@ -38,7 +38,7 @@
>   * Description: Basic check of ring<->ring write synchronisation.
>   * Feature: synchronization
>   * Functionality: semaphore
> - * Sub-category: i915
> + * Sub-category: Synchronization
>   * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
> index e2a598c64..0d4a959b1 100644
> --- a/tests/intel/gem_wait.c
> +++ b/tests/intel/gem_wait.c
> @@ -37,7 +37,7 @@
>   * Description: Tests the GEM_WAIT ioctl
>   * Feature: synchronization
>   * Functionality: semaphore
> - * Sub-category: i915
> + * Sub-category: Synchronization
>   * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> diff --git a/tests/sw_sync.c b/tests/sw_sync.c
> index 6c476ff46..40ecec665 100644
> --- a/tests/sw_sync.c
> +++ b/tests/sw_sync.c
> @@ -45,7 +45,7 @@
>   * Feature: synchronization
>   * Functionality: semaphore
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Synchronization
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: alloc_fence
> diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
> index f079baf09..6c75fce96 100644
> --- a/tests/syncobj_basic.c
> +++ b/tests/syncobj_basic.c
> @@ -33,7 +33,7 @@
>   * Feature: synchronization
>   * Functionality: semaphore
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Synchronization
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: bad-create-flags
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index ea8341a30..083091583 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -37,7 +37,7 @@
>   * Feature: synchronization
>   * Functionality: semaphore
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Synchronization
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: 32bits-limit
> diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
> index e0ff69b79..687f2613e 100644
> --- a/tests/syncobj_wait.c
> +++ b/tests/syncobj_wait.c
> @@ -37,7 +37,7 @@
>   * Feature: synchronization
>   * Functionality: semaphore
>   * Run type: FULL
> - * Sub-category: DRM
> + * Sub-category: Synchronization
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-multi-wait-all-unsubmitted
