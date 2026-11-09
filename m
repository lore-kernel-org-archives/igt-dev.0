Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B155606A321
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iR7yu/O7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE77B10F20F;
	Mon,  9 Nov 2026 11:52:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC4710E8A3
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 11:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794225085; x=1825761085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DOhbJ2tIntDQLnHF29se0rOGGhdTcKr9stzzlWw+eeY=;
 b=iR7yu/O7d7TPVj+47GdQ341kO+jLRRvfnD3BRl5RNgJGDxjIyCZ2tnb/
 XIWqRkI5kLtxuoR7Bs+jMoTOKD1kOxRK5rfOGH7C+DTHHV3Boh3VJ3fz9
 nibEPPK8bZl2x2ulsn9HKfvTCd7HnUgrDRnt3lPVPcGHE1qWy6Cdqousy
 qiatb8SGD2pEGL+Ixf+Y5Pf/h6L3e3Nx1XigaDLELh/f6dIeuArbJSKZj
 M0gTRb1kQfqQGrYmQn/lNkMvgC26JotrAeJt6PbFReOX7cbZzKn/xxGUG
 ZVI3mynE43nSOdI42z7gkRGdGVOS8620wDVnLY2U/2AubteFf2BFRBxbf Q==;
X-CSE-ConnectionGUID: UKK+SiqkTdGvs0hqLnQdHQ==
X-CSE-MsgGUID: YKK5XIQ0TdGJoYbXwYt9rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2984158"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2984158"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:51:25 -0800
X-CSE-ConnectionGUID: ddsj8dW1T2mX3J7Yh4qqzg==
X-CSE-MsgGUID: VyA3SsOVQkCGRSyKMj2PVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7701789"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 03:51:23 -0800
Date: Mon, 9 Nov 2026 12:51:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, alex.zuo@intel.com, 
 himanshu.girotra@intel.com, ramadevi.gandi@intel.com
Subject: Re: [PATCH] intel-ci: Block xe_oa render test on CRI
Message-ID: <rkbqqrmup3oplatnh7jkhunqoqpe6xykj2hywnenyn4arce6du@ofptl77drc2j>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, igt-dev@lists.freedesktop.org,
 alex.zuo@intel.com, 
 himanshu.girotra@intel.com, ramadevi.gandi@intel.com
References: <20261103211308.232161-1-jonathan.cavitt@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103211308.232161-1-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2026-11-04 at 05:13:08 +0800, Jonathan Cavitt wrote:
> CRI does not expose a render engine, so the test
> xe_oa@unprivileged-single-ctx-counters should be blocklisted, as it will
> hit a skip condition regardless.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Himanshu Girotra <himanshu.girotra@intel.com>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
> index 41328186cc..57e3141e0d 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -23,6 +23,7 @@ igt@xe_peer2peer@.*
>  # Valid skip: No render engine support on CRI
>  ##################################################################
>  igt@.*render.*
> +igt@xe_oa@unprivileged-single-ctx-counters
>  ##################################################################
>  # Valid skip: PAT index tests targeting older/different platforms
>  ##################################################################
> -- 
> 2.43.0
> 
