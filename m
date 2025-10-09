Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEB9CCD184
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 16:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0760810EAB2;
	Thu,  9 Oct 2025 16:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SC95saMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311BE10EAB5
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760026922; x=1791562922;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3zELSQ03dL0lnX14bZjaGI5qnFuGY4tEBOHocViz/ac=;
 b=SC95saMzTd+Aqe/qXnBjauhDVrcj1VFm5BpMlTC9piEdzhp0djlWrpZF
 RdOpt3jC1U/68VYidlJTDUK8zdZ+Icot5iW1W18pogl+8ckl7alQwiWOm
 jC/N85BaAeDEshsyunymp5pH7Ilttm/SuOZfuKPqq8yffGaXZjHJkjLCN
 9F/t4/PC5i/Lo1hJ7winMO2ZFEWXo8LZC77hZmn/4E/EWj1vOgFkkkjZe
 3DJ7zHiPyWz9DwvnRmgMM+guqSvNIhQDnxEpuKO+Swyv+XlUED2TG/A02
 cufNM68mTO4Q7n40YOcCpdd3A1HiqM2fKIOo756TAdwq+8KcOtMEcBzGg g==;
X-CSE-ConnectionGUID: D8yst8YpSsSZ6BWhWgq5PA==
X-CSE-MsgGUID: 10nTN3glTTeyrew1E7FUQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73586671"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="73586671"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 09:21:57 -0700
X-CSE-ConnectionGUID: sSfSsHkVQaiTERIhzMJEhw==
X-CSE-MsgGUID: DQJajXUFQKa7j1XDDrfS0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="186013389"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:21:56 -0700
Date: Thu, 9 Oct 2025 18:21:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v4 i-g-t 1/6] benchmarks: Move xe tests to intel_latency
 folder
Message-ID: <20251009162141.3lfbcwsj4g3yih2j@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
 <20250917121626.67917-9-gajendra.uttamchand@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250917121626.67917-9-gajendra.uttamchand@intel.com>
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

Hi Gajendra,
On 2025-09-17 at 12:16:25 +0000, Gajendra Uttamchand wrote:
> Move existing xe benchmark into folder intel_latency to
> separate those from other benchmarks
> 
> Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
> ---
>  benchmarks/{ => intel_latency}/xe_blt.c      | 0
>  benchmarks/{ => intel_latency}/xe_create.c   | 0
>  benchmarks/{ => intel_latency}/xe_exec_ctx.c | 0
>  3 files changed, 0 insertions(+), 0 deletions(-)
>  rename benchmarks/{ => intel_latency}/xe_blt.c (100%)
>  rename benchmarks/{ => intel_latency}/xe_create.c (100%)
>  rename benchmarks/{ => intel_latency}/xe_exec_ctx.c (100%)

Please also fix meson.build so it will build with only
first patch applied.

Regards,
Kamil

> 
> diff --git a/benchmarks/xe_blt.c b/benchmarks/intel_latency/xe_blt.c
> similarity index 100%
> rename from benchmarks/xe_blt.c
> rename to benchmarks/intel_latency/xe_blt.c
> diff --git a/benchmarks/xe_create.c b/benchmarks/intel_latency/xe_create.c
> similarity index 100%
> rename from benchmarks/xe_create.c
> rename to benchmarks/intel_latency/xe_create.c
> diff --git a/benchmarks/xe_exec_ctx.c b/benchmarks/intel_latency/xe_exec_ctx.c
> similarity index 100%
> rename from benchmarks/xe_exec_ctx.c
> rename to benchmarks/intel_latency/xe_exec_ctx.c
> -- 
> 2.43.0
> 
