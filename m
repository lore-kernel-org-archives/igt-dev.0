Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086301067044
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFEE10E02C;
	Thu, 12 Mar 2026 15:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cT8jLubB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5514410E02C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773329275; x=1804865275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qIhFa1jaJrV70QHZ1CMLMgiPrFKFMnMmUZciaX+2EHU=;
 b=cT8jLubB3JcTa/7rDKOkHua/Zx8yu3sgxSfhpUPbx0zSmL1cLzeKX5Uj
 M/k5HlOboI2ZWjHO9SfaVQiosq9J6iVY1Trw6XVYOWurJtST4yvnpOFNT
 rGizHThSlCERfhrq5seC/H5+YfjfSygPln1ad0ljDfIgFMhybjLXZj4KE
 Fg5rzBgVhkWMzwROljZNFnGguBbZ0I6DAbi1ZJgMQbfp545WPwg4cNPlI
 0ouz/M8TYF+Uafehsm8O00CZF0I3G/o8bZdJCjBICusfkWeQYJ9x0y9x7
 fOWo8GcozZTgivir685+RwNL2IxqFeSj1MXdjS0Q1r+H4Ynycl7AaDjw7 w==;
X-CSE-ConnectionGUID: 8tMXH8KzTsODbtLMuxe3rQ==
X-CSE-MsgGUID: SsLn3QldTf6MuAYz4i6n3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74318298"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74318298"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:27:54 -0700
X-CSE-ConnectionGUID: YY9K9gRnQoqIfcQXWomMmg==
X-CSE-MsgGUID: /seqxp6HSfaXvQO7IzeF6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220914624"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 08:27:53 -0700
Date: Thu, 12 Mar 2026 16:27:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, ryszard.knop@intel.com, karol.krol@intel.com
Subject: Re: [PATCH v5 1/6] intel-ci: Remove chamelium testlist symlinks
Message-ID: <20260312152749.efqbj2vhuiztp5jo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@intel.com, ryszard.knop@intel.com,
 karol.krol@intel.com
References: <20260305083906.3098168-1-mohammed.bilal@intel.com>
 <20260305083906.3098168-2-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305083906.3098168-2-mohammed.bilal@intel.com>
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
On 2026-03-05 at 14:09:01 +0530, Mohammed Bilal wrote:
> Remove symlinks before splitting into driver-specific testlists.
> 
> v2:
> -Remove symlinks first before renaming (Kamil)
> 
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>

This is the same as in previous version, no changes. You already
got mine and Swati r-b in v4 so they should be placed here when
you sent v5.

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

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
