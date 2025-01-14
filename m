Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD9DE77188
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 20:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A6910E0A1;
	Tue, 14 Jan 2025 20:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgbSMWWe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C956910E0A1
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2025 20:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736887466; x=1768423466;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HkYdMqq4DXoabBIOLtGdYWbXatk3q2hVzirAb25egjs=;
 b=JgbSMWWe9jLojbKfLqpeQdJdv7mXW9qOCWzI3Aby1WMUQj5PSBRBBwyb
 Ma3J5/KZtw4YmlttfBheTqmhSyOP3SuXH83oNz67aj01dY8C11+ux0Slr
 P/90Y6U8uPWaNWSDKdNKsb2To3T/VM6sLGxOXPbxIL2Pw2HS/Cf9Vaq31
 VSO86boox8WJPhgm8p6pb4DW4ZQeYMORXD7Gl7S5WaqnKPvo3us+4I1Xz
 S64Z41ftDRc0laysfxa9k/+l3LpYhZqfMHmlCAN8BTxdS6aAGvzM5eh77
 r5kfSILNogQFAQR+ugNUbN+7eUizbwSuJBynWxhwwOZYk1TfbRrrusTws A==;
X-CSE-ConnectionGUID: oSi7RsL9S62VagMpihwTqQ==
X-CSE-MsgGUID: 8a7oNtc9SFCY7MUDZRTH+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48203897"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="48203897"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 12:44:26 -0800
X-CSE-ConnectionGUID: LHSkbow4RdqIRPcgXmbebw==
X-CSE-MsgGUID: zaEPLw7VS1eWI1Vay+m9Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128163155"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 12:44:24 -0800
Date: Tue, 14 Jan 2025 21:44:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Oak Zeng <oak.zeng@intel.com>
Subject: Re: [i-g-t] tests/intel-ci: Fix a syntax err in xe.blocklist.txt
Message-ID: <20250114204410.czxnygsqcn4vtqwj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>
References: <20250114173523.3267049-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250114173523.3267049-1-oak.zeng@intel.com>
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

Hi Oak,
On 2025-01-14 at 12:35:23 -0500, Oak Zeng wrote:
> The syntax in below lines are wrong:
> 
> igt@xe_evict@*-multi-vm-cm*
> igt@xe_evict@*-threads-*
> 
> With above, those xe_evict tests are not blacklisted from xe.ci.full category.
> 
> Fix the issue by adding a dot (.) preceding star (*).

Good catch!

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index a9b647c1d..fc270198f 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -93,7 +93,7 @@ igt@sriov_basic@bind-unbind-vf$
>  # Exclude xe_evict tests that are not expected to succeed
>  # due to missing TTM exhaustive eviction
>  ##################################################################
> -igt@xe_evict@*-multi-vm-cm*
> -igt@xe_evict@*-threads-*
> -# igt@xe_evict@*-cm* # Rebind and VM_BIND may race.
> +igt@xe_evict@.*-multi-vm-cm.*
> +igt@xe_evict@.*-threads-.*
> +# igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
>  ##################################################################
> -- 
> 2.26.3
> 
