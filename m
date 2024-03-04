Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDA4C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D5F10E23D;
	Mon,  4 Mar 2024 15:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhnLW7JT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1755810E23D
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565893; x=1741101893;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tcOpycRXIoAiGYNGg5YXTogD2rnAlXbp7bd02kpbpvs=;
 b=lhnLW7JTsXFxM5FYv1dkSsp8nCIc8RFoT49P4TN7UMwqci6y4HBKnzS+
 iwfYateV28jKj8Wmju0909OuzViZ+bqsq8EQtuF+VORhzoiUNYoN8Ehmk
 eHh8S+6EKTc+ATZPH+c/F1tmkYKXmxQJXS+60DYQfAmXjt+0ZzuVLA1vq
 Q/WbxH9tHTwdD99c5NW404vQjcHP/ZQv0PMnXwjJEPIPJN3so+kdazWmR
 kaKOGgAAGIEDGwss5zs/q3/J+8j9QPz25x3eVXkVTPO2NcL+QZ9nOX4Rx
 eZKvl33iNn6MTzXG0MVdWR8f7Au5iEZYnf570QRFL35t1NPahSqt293J5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15469779"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15469779"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:24:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13609712"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:24:52 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 103A15807E7;
 Mon,  4 Mar 2024 07:24:49 -0800 (PST)
Date: Mon, 4 Mar 2024 16:24:46 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH i-g-t 22/24] tests/intel: Add more tests to Performance
 subcategory
Message-ID: <20240304162446.2faac118@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-23-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-23-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Mon,  4 Mar 2024 11:16:15 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Tag tests/intel/perf.c & tests/intel/perf_pmu.c as performance.

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/intel/perf.c     | 1 +
>  tests/intel/perf_pmu.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/tests/intel/perf.c b/tests/intel/perf.c
> index e5d3fbd0e..fdfb75603 100644
> --- a/tests/intel/perf.c
> +++ b/tests/intel/perf.c
> @@ -52,6 +52,7 @@
>   * Test category: Perf
>   * Functionality: oa
>   * Sub-category: Performance
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: blocking
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 718a3ed37..b80273a56 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -55,6 +55,7 @@
>   * Feature: i915 pmu perf interface, pmu
>   * Test category: Perf
>   * Sub-category: Performance
> + * Category: Desktop client
>   * Functionality: pmu
>   * Run type: FULL
>   *
