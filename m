Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBA7EF8FFC
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 16:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B0910E9F7;
	Wed,  4 Mar 2026 16:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFuNRUQU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA8A10E9F7
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772642613; x=1804178613;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=raI2ZQHWT4hKx2cEnmNqmVMGbgxDPeHMeEvhusR7DfU=;
 b=XFuNRUQUF6hNsA1rtVeI4NYLoKSxLKMTes7n4vxMWYLUusKeshUZFCz7
 1L7KmvJqkWC9zHqRP3zs5Wni+L05sm9sj9FNhl4hboSpzpK2SIC2uq6Ix
 TgDHYjjoCjb5ZYd7oIOh3Sj8AEGVWUM+WjDjUubKwVdoLUd6xFvkX//Lt
 r9Enae8qDegoOnXVh2bvE4KWXhyj3iK8JJmcR0uv15NZ9RyfAS5IyFPtY
 wymzKDQu2zxtLTuWNrDRKKgYlKAA06wyu/KYU0tWBMdyXiutfyxJ5nTlY
 LsyKE15BfZO4DTxaPlg9lou7U2wSxv+m+fcVLVZVmubMa5i+ApFmMrMkg Q==;
X-CSE-ConnectionGUID: rp3Cs0bVQoSjn+Yy2YT4cA==
X-CSE-MsgGUID: 7UAejKoKQi23xwjONXP62Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77580622"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77580622"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:43:31 -0800
X-CSE-ConnectionGUID: xv9fv3gbQ3qMLUnbv5v+zA==
X-CSE-MsgGUID: RuG+IoZdT1iIX8UKCbPazg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="222896421"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 08:43:29 -0800
Date: Wed, 4 Mar 2026 17:43:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com
Subject: Re: [PATCH v4 1/5] intel-ci: Remove chamelium testlist symlinks
Message-ID: <20260304164312.qoygwexpriuj2kno@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com
References: <20260302101926.3015380-1-mohammed.bilal@intel.com>
 <20260302101926.3015380-2-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302101926.3015380-2-mohammed.bilal@intel.com>
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

Hi Mohammed,
On 2026-03-02 at 15:49:22 +0530, Mohammed Bilal wrote:
> Remove symlinks before splitting into driver-specific testlists.
> 
> v2:
> -Remove symlinks first before renaming (Kamil)
> 

This is much cleaner for review, before final merge it could be
squashed into one commit.

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/intel-ci/i915.chamelium-only.testlist | 1 -
>  tests/intel-ci/xe.chamelium-only.testlist   | 1 -
>  2 files changed, 2 deletions(-)
>  delete mode 120000 tests/intel-ci/i915.chamelium-only.testlist
>  delete mode 120000 tests/intel-ci/xe.chamelium-only.testlist
> 
> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> deleted file mode 120000
> index d7c492973..000000000
> --- a/tests/intel-ci/i915.chamelium-only.testlist
> +++ /dev/null
> @@ -1 +0,0 @@
> -chamelium-only.testlist
> \ No newline at end of file
> diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
> deleted file mode 120000
> index d7c492973..000000000
> --- a/tests/intel-ci/xe.chamelium-only.testlist
> +++ /dev/null
> @@ -1 +0,0 @@
> -chamelium-only.testlist
> \ No newline at end of file
> -- 
> 2.48.1
> 
