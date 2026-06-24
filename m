Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F303CDB47F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jun 2026 11:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D501B10E033;
	Wed, 24 Jun 2026 11:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOHEyUr9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D1410E033
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jun 2026 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782301850; x=1813837850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wt0ivfdRweQSsavz5AScJ60e8kRsLvLm45sWmPlvyJs=;
 b=bOHEyUr9va+/ThrC2UdQJYwu2LyKkFstYxi30zUMUfQBVUmiwHvv8Tps
 GQw7RhR81oCGiqD6UTM0lhVm/sEuwMyGdJ51Pig2LByKY0d9a0o3NQnYT
 tcIhohcSuALG6hmUmC6FrHOnoaA1FpSWyb2Kbuiw79SCuV7OJyCCjFZpq
 UMjbaKOVb78v7NEuyzIxhQHMIndVZ7JSzPDfeiXvdrGPqzHCscq2EtX6s
 IF430ch40d3jdJrc4cjpSog7VB+nsK9ihuCFGimarFi6fPcGEdyhBTdYH
 Rz+AuDeBEZPLMtP4LxkPUFE6vLRABr67BhQrOO/KQUSj+FmWJ10ShbVz+ g==;
X-CSE-ConnectionGUID: uSpD5JClSsiCXZsNubebqQ==
X-CSE-MsgGUID: CWjf+UaXSASliRBQFFE91A==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83181355"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="83181355"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:50:50 -0700
X-CSE-ConnectionGUID: mA8ihY7oROuX1lDqXsns5w==
X-CSE-MsgGUID: Ng32Un3NRn2W1Ind/grceg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="246915771"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 04:50:48 -0700
Date: Wed, 24 Jun 2026 13:50:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t 3/3] tests/intel-ci: Remove dmabuf tests from i915
 fast feedback
Message-ID: <20260624115046.lvwtvj5drsei2rte@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 igt-dev@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
References: <20260623200152.12996-1-krzysztof.niemiec@intel.com>
 <20260623200152.12996-4-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623200152.12996-4-krzysztof.niemiec@intel.com>
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

Hi Krzysztof,
On 2026-06-23 at 22:01:52 +0200, Krzysztof Niemiec wrote:
> Intel CI runs KUnit tests separately from regular tests. Remove the
> dmabuf tests from the i915 fast feedback testlist, as they are now
> KUnit tests, instead of selftests.
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tests/intel-ci/i915.fast-feedback.testlist | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/intel-ci/i915.fast-feedback.testlist b/tests/intel-ci/i915.fast-feedback.testlist
> index 2799bbaa5..5b33f29e4 100644
> --- a/tests/intel-ci/i915.fast-feedback.testlist
> +++ b/tests/intel-ci/i915.fast-feedback.testlist
> @@ -168,4 +168,3 @@ igt@i915_pm_rpm@module-reload
>  
>  # Kernel selftests
>  igt@i915_selftest@live
> -igt@dmabuf@all-tests

This should be first patch in a series.
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> -- 
> 2.45.2
> 
