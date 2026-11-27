Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E403606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VMSfjTlV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9C310E576;
	Fri, 27 Nov 2026 13:24:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADF510E576
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795785821; x=1827321821;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H+9JBw81iuIlo3GIzyiYr6QV1nZdpTDqr2qWuyzKaU4=;
 b=VMSfjTlVUJ6XqTBLBvgZfktLcRoyqickia+BEQtQ9n7hDDcjZ4JH7gkT
 rQ2iCVD7tKlC55ASzOa6yR3EJM5ZFWTR8OD+M66Vs5gm1hQDHz652lb+o
 SFYnekAVOe+aMNDCZtmjwdmhfAMpWKfjDrDqWgvskd7ln5XnnU+ie3UIj
 CB9JrteQKGEkwFA8XS7UyfLPtlXp1X55HnbSbztuFYlt2+JTtDlBmAgUO
 Xh1upLpq+GYGxR0RPIrSOq47RqyffospF5DQL0G/hMNhdRokHYIFbJRPA
 fMSqgYU7S1uP+jIJ0e40WeQg6c1zl66xgk2vP5CG0FEDEbnnquWJCvcZt Q==;
X-CSE-ConnectionGUID: jojEA/1eTL23qiXuzNCylg==
X-CSE-MsgGUID: KNxs/N7UQ8WEgZbCwjwb0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4764486"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4764486"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 05:23:40 -0800
X-CSE-ConnectionGUID: LxhUd1naS8KZn4UleHfSTg==
X-CSE-MsgGUID: yTEokK7pRMKNqa5rvnBbIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12432343"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 05:23:39 -0800
Date: Fri, 27 Nov 2026 14:23:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com, 
 himanshu.girotra@intel.com
Subject: Re: [PATCH i-g-t] intel-ci: Update blocklist for CRI core
Message-ID: <qbjlu6kdtmbgtwe7o5ybu3qb746bkd7ymjj4zjbzvjir5cxpu5@g5op5wcasvjr>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>,
 igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com, 
 himanshu.girotra@intel.com
References: <20261127114407.4934-1-venkateswara.rao.muppidi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261127114407.4934-1-venkateswara.rao.muppidi@intel.com>
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
On 2026-11-27 at 17:14:07 +0530, Venkateswara Rao Muppidi wrote:
> Add two more valid skips to the CRI core blocklist:
> 
> - xe_evict@evict(-beng)?-large-multi-vm(-cm)?: bo_size is 3/8 of VRAM,
>   which exceeds the usable system memory on CRI. The working set size
>   evaluates to zero and the test skips.
> - xe_survivability@runtime-survivability: csc_hw_err debugfs support is
>   not currently required on CRI, so the test is skipped.
> 
> Signed-off-by: Venkateswara Rao Muppidi <venkateswara.rao.muppidi@intel.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel-ci/xe.cri.core.blocklist.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
> index 6b77523d6..3c0135288 100644
> --- a/tests/intel-ci/xe.cri.core.blocklist.txt
> +++ b/tests/intel-ci/xe.cri.core.blocklist.txt
> @@ -76,3 +76,12 @@ igt@xe_mmap@small-bar
>  ##################################################################
>  igt@xe_vm@single-op-map-mirror-over-bound
>  ##################################################################
> +#Valid Skip: bo_size (3/8 of VRAM) exceeds usable system
> +# memory -> ws==0 -> skip
> +##################################################################
> +igt@xe_evict@evict(?:-beng)?-large-multi-vm(?:-cm)?
> +##################################################################
> +# Valid Skip: csc_hw_err debugfs support is currently not required
> +##################################################################
> +igt@xe_survivability@runtime-survivability
> +##################################################################
> -- 
> 2.43.0
> 
