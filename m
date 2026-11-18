Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB2606A320
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JAFAWRKH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE58D10E544;
	Wed, 18 Nov 2026 15:33:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633DF10E544
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795015925; x=1826551925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RQhtVx8sKbqm29VK0ybDZNnBYDTMpaB0ynFlx9BnunM=;
 b=JAFAWRKHMKtoIBrH76oZXHzhiDMWJrzSZ1ijtCtI3iiuC6xzgx14Idb3
 whwaVYuCQf9/J8FQfODvzJd3rqfYiLzHPJNPXZv+euZki6FHz7LNva38z
 gWNYq2Iypka6Cm8QWUckKMNQl2X+erWnDCLyRJ6uN41yGOmwPGGfLKcib
 gqfT6WALkIvWERinCE4XDfWpD8a0l4NHuAeLhNnCNIqFGtVqy9BWHdPa/
 8wrpqSxFWrGOEArs6sSxv8/3rArJjfqKOGwBWr2VumJrVGOb47X5QCrSX
 SwLZ/zH00dM4JJXpu+Fwqq5fFsa5s9In1P0bFBexh2fTDonxgwWLZhbol Q==;
X-CSE-ConnectionGUID: QSBuAwu0T8O05KsLlKtZ0g==
X-CSE-MsgGUID: JZGxHyBhRp6S2oSNHCwPHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3871885"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871885"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:31:28 -0800
X-CSE-ConnectionGUID: e62BV5j8Tq+q4JlzV14mvQ==
X-CSE-MsgGUID: rFOVSKRzTIObCTmJ3sJWAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10107347"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:31:27 -0800
Date: Wed, 18 Nov 2026 16:31:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com, 
 himanshu.girotra@intel.com
Subject: Re: [PATCH i-g-t] intel-ci: Update CRI and NVL core blocklists
Message-ID: <xbw4h2fgd5kjruegen4mhnkrj47gp5rufpops3iquotqqalt4x@lvh3fpktxxe5>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com, 
 himanshu.girotra@intel.com
References: <20261118092718.503212-1-venkateswara.rao.muppidi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118092718.503212-1-venkateswara.rao.muppidi@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Venkateswara,
On 2026-11-18 at 14:57:18 +0530, Venkateswara Rao Muppidi wrote:
> Add below entries to the CRI/NVL core blocklist for tests that are not
> applicable on this platform:
> 
> CRI:
> - xe_vm@overcommit.*: the overcommit subtests create an eviction
>   footprint larger than 50% of system RAM, which is not valid on
>   current CRI system.
> - xe_mmap@small-bar: the subtest requires the CPU-visible VRAM size
>   to be smaller than the total VRAM. On current CRI
>   systems vram_bar_size = total VRAM by default, so the precondition
>   is never met and the subtest always skips.
> - xe_vm@single-op-map-mirror-over-bound: SCRATCH_PAGE combined with
>   FAULT_MODE is not supported on Xe3+ and is rejected by the KMD.
> 
> NVL:
> - xe_vm@single-op-map-mirror-over-bound: same SCRATCH_PAGE + FAULT_MODE
>   restriction as above.
> 
> Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>

Applied, thanks!

Regards,
Kamil

> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 14 ++++++++++++++
>  tests/intel-ci/xe.nvl.core.blocklist.txt |  5 +++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
> index 41328186c..6b77523d6 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -62,3 +62,17 @@ igt@xe_page_reclaim@.*
>  igt@xe_pat@l2-flush-opt-svm-pat-restrict
>  igt@xe_pat@xa-app-transient-media-(off|on)
>  ##################################################################
> +# Valid skip: when eviction footprtint > 50 % of RAM
> +##################################################################
> +igt@xe_vm@overcommit.*
> +##################################################################
> +# Valid skip: Current CRI systems CPU-visible (vram_bar_size)
> +# is set to total vram as default
> +#################################################################
> +igt@xe_mmap@small-bar
> +##################################################################
> +# Valid Skip: SCRATCH_PAGE + FAULT_MODE not supported on Xe3+
> +# and rejected by KMD
> +##################################################################
> +igt@xe_vm@single-op-map-mirror-over-bound
> +##################################################################
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index 91f9b1a47..8ce0b09b5 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -111,3 +111,8 @@ igt@xe_wedged@cold-reset-wedged
>  ##################################################################
>  igt@xe_err_injection@.*
>  ##################################################################
> +# Valid Skip: SCRATCH_PAGE + FAULT_MODE not supported on Xe3+
> +# and rejected by KMD
> +##################################################################
> +igt@xe_vm@single-op-map-mirror-over-bound
> +##################################################################
> -- 
> 2.43.0
> 
