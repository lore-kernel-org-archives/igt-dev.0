Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E96BD6ACF5
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 13:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC4510E282;
	Thu, 18 Dec 2025 13:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ksBZd2Pl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A68110E282
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766063978; x=1797599978;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CjNJPyqINaifn7eIshwNvfMuHtH0l2GdcRJS+ihe1EY=;
 b=ksBZd2PlAe1gmyOyCIpk2tz1b2tM1kBMiL0ZfMYNV7p/K22rAbhpsCgg
 I1Vj5cB3g7ZFsHeJJ85d15cFToco4JJL4j9kGL1CbffaPcezJOKwD76UM
 wpprGPchSEoWmRZRcqmq9tK7IRquLwcIDUruOYYejbYPX8w6fWtxL5Euf
 nPQ959oAC2G/+pKtjl3bOsC9qkjJ06jRmzKXHuVQaqtwxWotv0Nr1abmJ
 ZAxsl4XTeg4/6ZgevKwm8ZZ3kKBVxg4JM3FPlv4w5jB0NyEhaAK9iCbvD
 HFvCnUbSJFnGpjYL6MoxAYgk7kQ+lQlgjLzIilhf6NYZt37dcart92d36 Q==;
X-CSE-ConnectionGUID: lZfVfUyfTg+tB8x6ecv0RQ==
X-CSE-MsgGUID: nMZu0QkHReyV8kstHRwN8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79139174"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79139174"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 05:19:38 -0800
X-CSE-ConnectionGUID: nRBAmTHcQiGdSAspn0U4ig==
X-CSE-MsgGUID: yLbql58cQxiUKQNzu/I72w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198348443"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 05:19:36 -0800
Date: Thu, 18 Dec 2025 14:19:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Piotr Rudnicki <piotr.rudnicki@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Himanshu Girotra <himanshu.girotra@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: Re: [PATCH v2 1/1] intel-ci: add eudebug tests to multigpu blocklist
Message-ID: <20251218131933.gsa6lbu57ne6avkd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Piotr Rudnicki <piotr.rudnicki@intel.com>,
 igt-dev@lists.freedesktop.org,
 Himanshu Girotra <himanshu.girotra@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
References: <20251218121308.2991594-2-piotr.rudnicki@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251218121308.2991594-2-piotr.rudnicki@intel.com>
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

Hi Piotr,
On 2025-12-18 at 13:13:09 +0100, Piotr Rudnicki wrote:
> Add eudebug tests to multigpu blocklist, as they are not yet supported
> on Xe multigpu setups.
> 
> Cc: Himanshu Girotra <himanshu.girotra@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@intel.com>
> Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
> V1 -> V2: Separate the eudebug blocklist entry.
> 
>  tests/intel-ci/xe.multigpu.blocklist.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.multigpu.blocklist.txt b/tests/intel-ci/xe.multigpu.blocklist.txt
> index 387c3413e..5affcc8fa 100644
> --- a/tests/intel-ci/xe.multigpu.blocklist.txt
> +++ b/tests/intel-ci/xe.multigpu.blocklist.txt
> @@ -3,3 +3,6 @@
>  #####################################################
>  igt@(?!.*xe.*multigpu.*|xe_peer2peer.*).*
>  #####################################################
> +# Kernel support not available
> +#####################################################
> +igt@xe_eudebug@multigpu-basic-client*
> -- 
> 2.43.0
> 
