Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69F0C5B572
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 12:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0F010E405;
	Wed, 12 Aug 2026 12:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gxbyfnn5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAC710E405
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 12:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786538641; x=1818074641;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cY6SVaPhD4iSuGlmWgrGXYfIljeW+vTBSi8v/jh/WzM=;
 b=Gxbyfnn5kprTaMB5TJOvWMumzSqLXebg2KvPsN/4Z9WGpZN6MHpJAW9p
 UQ/vGnIe+p79y0Pj/ZZgN1wo6070Z9UtJh681hjhCXGTJN4h17Maly/9n
 u4uBS6dULvi4pf9KSG22uPpvYf79zULpiJQNHgUoixivSlr8dgCz4LdW0
 GmfgP1inWuOPUB1v2bdfmRA0qu1EnOEuFfZRkoOR+w3l2+Z4Auz25JuyE
 gT1BxgiWfU4xjgYiPR8p4MIpRzD6gQMyTlDLdJyu2RQ6qa5hlE5gzFIzj
 iCX5lkHu1eTEzY8lh1PRI+BcVCvmuUIfzH3JFCBysQI+LZzqhcH/jkEYb Q==;
X-CSE-ConnectionGUID: tkOcx7ApQ++TZQiqJmPbdQ==
X-CSE-MsgGUID: oxPGKmzMR3u1fwMJL40JmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86051056"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86051056"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:44:00 -0700
X-CSE-ConnectionGUID: s/zFF+exTxmW0tmcRvDkcA==
X-CSE-MsgGUID: E2ByxA1MSUy4MNfZVNJaww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="287069256"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 05:43:59 -0700
Date: Wed, 12 Aug 2026 14:43:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org, Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] intel-ci/i915/blocklist: Add sriov tests to blocklist
Message-ID: <20260812124334.yzoulkjsvwxwh35k@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
References: <20260812094514.1362168-1-krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812094514.1362168-1-krzysztof.karas@intel.com>
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
On 2026-08-12 at 09:45:14 +0000, Krzysztof Karas wrote:

please make prefix short, it could be:

[PATCH] intel-ci: Block sriov tests on i915

> With addition of commit c9a41149d843
> ("tests/sriov_basic: Validate PF unbind with VFs enabled")
> a set of sriov tests was enabled on i915 machines what,
> expectedly, produces multitude of SKIPs in our CI [1].
> 
> Amend the problem by disabling all sriov testing on i915.
> 
> [1] https://gfx-ci.igk.intel.com/cibuglog-ng/issue/24557?table=&page=3&page_size=100#query_key=dc51d83bc41c2b44b58762c6cd35195d043d85ce
> 
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  tests/intel-ci/i915.blocklist.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index da467ae49..9f7aef0a5 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -221,3 +221,6 @@ igt@kms_vrr@lobf-dc3co
>  ##################################################################
>  igt@kms_setmode@basic-no-cpu-idle
>  ##################################################################
> +# Valid skip :- SRIOV is not supported by i915

Please make it short, basically all are valid reasons so just:

# SRIOV is not supported by i915

> +##################################################################
> +igt@sriov_basic.*

If you want all, better:
igt@.*sriov.*



Regards,
Kamil


> -- 
> 2.34.1
> 
