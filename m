Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDBECCF9FC
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 14:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6884310E3FB;
	Thu, 30 Oct 2025 14:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dW+GFtND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E40A10E3FB
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 14:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761833066; x=1793369066;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r2uYfZrz0agKeZ0Ge9d6WqPSdLHOj6hWdac4q60mLoE=;
 b=dW+GFtNDlcaGJIaqIi7O5uA+I1zg4EteNWhV4gEgFH57ysR+qjhbk0m/
 dUo15CxKIBF9/Ty03IJPILkSkq2Om6tYeLWbE4eZhRHpi0bhFySvtAnQe
 oxrxzLcVGwCzeamm/xHcs/8dnFJtf42OqK0+jE76iCyEkOmydT3YTrFK0
 YH9abbawRYqQOkv0ifxZfA38TsEIzHwbEl+5+AY/VlVZRDvzBfcj5GjPk
 7dZOneJUfQnL1+GdSB6SLFwLlE4y4hJGGbEgwZFqg+0AIGCDtXqZsnHzu
 koCjWQnMk0yT1aCHtvxB55dn/dfoOFh2JoXSNpmJlAlkjx6VMgm02G/La w==;
X-CSE-ConnectionGUID: nTPbcObFS7GlZ8fJKR7kRg==
X-CSE-MsgGUID: iul08H+SQAiVdKWwnu3g+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75322864"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="75322864"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:04:26 -0700
X-CSE-ConnectionGUID: Mrc8VQOBTAmTX6TwVZRwhA==
X-CSE-MsgGUID: EAVdfA6CQXisa64gY9S/vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="209540571"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 07:04:25 -0700
Date: Thu, 30 Oct 2025 15:04:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t v13 4/6] docs: Initialize MkDocs documentation
 structure
Message-ID: <20251030140422.4iychjuo6otgfbww@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>
References: <20251029141946.1165010-1-pawel.sikora@intel.com>
 <20251029141946.1165010-5-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029141946.1165010-5-pawel.sikora@intel.com>
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

Hi Pawel,
On 2025-10-29 at 15:19:43 +0100, Pawel Sikora wrote:
> This commit establishes the groundwork for a comprehensive
> documentation site, enhancing accessibility and organization.
> 
>  * Move detailed documentation into the docs directory,
>    splitting content across multiple markdown files.
>  * Set up the structure for automatic site generation using
>    MkDocs,facilitating easier navigation and maintenance.
>  * Moved some content from README.md to docs/overview.md,
>    docs/building.md
> 
> Co-developed-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> ---
>  docs/api.md                          |  29 ++
>  docs/blocklists.md                   | 354 ++++++++++++++++++++++++
>  docs/building.md                     |  27 ++
>  docs/{chamelium.txt => chamelium.md} |   2 +-
>  docs/ci_infrastructure.md            | 390 +++++++++++++++++++++++++++
>  docs/code_coverage.md                |  68 +++--
>  docs/cross-building.md               | 260 +++++++++++++-----
>  docs/download.md                     |  25 ++
>  docs/faq.md                          |  92 +++++++
>  docs/how_to_build_docs.md            |  54 ++++
>  docs/index.md                        | 159 +++++++++++
>  docs/issues.md                       |  31 +++
>  docs/new_driver.md                   | 231 ++++++++++++++++
>  docs/patchwork.md                    |  18 ++
>  docs/running_tests.md                | 130 +++++++++
>  docs/test_categories.md              | 266 ++++++++++++++++++
>  docs/test_documentation.md           |  66 +++--
>  docs/test_plan.md                    | 216 +++++++++++++++
>  18 files changed, 2277 insertions(+), 141 deletions(-)
>  create mode 100644 docs/api.md
>  create mode 100644 docs/blocklists.md
>  create mode 100644 docs/building.md
>  rename docs/{chamelium.txt => chamelium.md} (99%)
>  create mode 100644 docs/ci_infrastructure.md
>  create mode 100644 docs/download.md
>  create mode 100644 docs/faq.md
>  create mode 100644 docs/how_to_build_docs.md
>  create mode 100644 docs/index.md
>  create mode 100644 docs/issues.md
>  create mode 100644 docs/new_driver.md
>  create mode 100644 docs/patchwork.md
>  create mode 100644 docs/running_tests.md
>  create mode 100644 docs/test_categories.md
>  create mode 100644 docs/test_plan.md
> 

I glanced over it and it looks for me,

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

[cut]
