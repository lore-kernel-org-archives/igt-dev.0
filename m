Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B325CFF8868
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 15:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBAD10ED59;
	Tue, 28 Apr 2026 15:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNZdu4cQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C265B10E110
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 15:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777388991; x=1808924991;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5D801NMsPBKNmJhZ9D3aveN4sldTbSwBFN7CmUrxTcw=;
 b=WNZdu4cQyzVp/I7/vqLgElST4O4zZ4WEEZ7SR/a+xRmoP/h33TBr8Nz5
 7swsHlBi320LNKBZks206mSwxe8/EILrDzkKA9OKDlTj0soCQ1G/z7Oor
 ZsHdtUSjl09CyFCKirJrsbv9phtfu5VsZwlNj0PXvIpQdnE5oVMRVEnSO
 c3E+q9YMorW5aFCPtXsuLFiwaEEkV1Giy0xl5zR3+Un3ziImpXMFnhsUX
 FlU7TRP0zsLjMIA6OujIWDz1enWZupY1lTTn2V5/Uw9546XP+7GhVbYOu
 fFlneCKZ850XoHzgvseWfaLQtReU56+zOLRcL1FpDstOfODLW2xLcav8v A==;
X-CSE-ConnectionGUID: sQDbFAnEQ3S0zIEHRx0y/g==
X-CSE-MsgGUID: TBr4xNPiQGmeUPEXBoYXBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="65830232"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="65830232"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 08:09:51 -0700
X-CSE-ConnectionGUID: hIlgo154T6ewql/8iYTPIQ==
X-CSE-MsgGUID: hLba1U7iR8CA912ndWt7gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238320577"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 08:09:50 -0700
Date: Tue, 28 Apr 2026 17:09:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t] tools/vmtb: Add VMTB fast-feedback testlist
Message-ID: <20260428150934.5cifxdcou2jvhafv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20260428082243.299243-1-adam.miszczak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428082243.299243-1-adam.miszczak@linux.intel.com>
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

Hi Adam,
On 2026-04-28 at 10:22:43 +0200, Adam Miszczak wrote:
> Enable basic VM tests as BATs:
> - create and provision VFs, assign to VMs and probe guest driver
> - execute simple IGT workloads on booted VMs
> 
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>  .../vmtb/vmm_flows/intel-ci/fast-feedback.testlist | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist
> 
> diff --git a/tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist b/tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist
> new file mode 100644
> index 000000000..37c4dea3a
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/intel-ci/fast-feedback.testlist

imho it would be better to keep CI-related lists in tests/intel-ci/

+cc Ryszard
Cc: Ryszard Knop <ryszard.knop@intel.com>

Regards,
Kamil

> @@ -0,0 +1,14 @@
> +#####################################################
> +#
> +# VMM Flows fast-feedback test list:
> +# defines tests to be executed pre-/post-merge BATs.
> +#
> +# This is allow list, needs to be extended if new
> +# tests need to be added to scope.
> +#
> +#####################################################
> +######################
> +# Basic VF/VM create
> +######################
> +test_basic.py::TestVmSetup
> +test_basic.py::TestVmWorkload
> -- 
> 2.39.1
> 
