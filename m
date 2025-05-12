Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4D2C3ABBC
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 09:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED30710E0E7;
	Mon, 12 May 2025 09:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+QdJC1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D76410E0E7
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747043297; x=1778579297;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aVMWlVDs+H5+3f+eXY+3QXfQReQkm7uIaRRVa1foisQ=;
 b=b+QdJC1xrhtjSCkexTY25hE/myJS73IxtVHnj6rO4/vPAXLVhVu7iJqe
 0FwaTLvXbLVtx4bh+nRsaQMaHE9mCrBauJfXXlo55L4JiHU2vdhKK41z3
 72KHRICCSf1EEbKOs4lqrf3Ah53jeUi8zE1iXBhz+7Qv9AlIj8mphaubJ
 Lodku7cHwW9qyVQhtxYsHX5ify3kZNe45tK4aLYCL8kFOdNZ+oRcKb3+P
 iOvP00VmPCYAjCvF7MoCguJNJctHhyGt1wANQvOf4y6Pft7v97q8nb8/Y
 9ahyRdhkLecBPQAMBKJV7DFhAbrK9QH5AnNce8BJ5LZxmXxCszvz3JvWH g==;
X-CSE-ConnectionGUID: BhAJLocxSHC/k0U9QyAzvg==
X-CSE-MsgGUID: ZJZntPmDT2GZ+S4uMNiIlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="60235862"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="60235862"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 02:48:17 -0700
X-CSE-ConnectionGUID: nn+djbrkQU2M517MjAlT7g==
X-CSE-MsgGUID: 4kodrvRfTWCNWu2VrXhv3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137172628"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.254.149])
 ([10.245.254.149])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 02:48:15 -0700
Message-ID: <c413fd7d-52e1-4f25-ae51-ae5df1058e8b@linux.intel.com>
Date: Mon, 12 May 2025 11:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci/xe.blocklist: remove
 device_reset@unbind-*-rebind
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250509132602.27205-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250509132602.27205-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 5/9/2025 3:26 PM, Kamil Konieczny wrote:
> Remove device_reset subtests unbind-reset-rebind and
> unbind-cold-reset-rebind as they should work with Xe.
> 
> v2: unblock only *-rebind subtests (Marcin)
> 
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 541917393..cf5844c9d 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -37,7 +37,7 @@ igt@xe_live_ktest@xe_bo_shrink
>   # Exclude all other non-Xe tests
>   ##################################################################
>   igt@debugfs.*
> -igt@device_reset
> +igt@device_reset@.*reset-bound
>   igt@drm_read
>   igt@dumb.*
>   igt@prime_.*
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
