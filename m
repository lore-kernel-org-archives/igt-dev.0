Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BF7C02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 16:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DA310E9DB;
	Fri, 24 Jan 2025 16:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igMXXV8o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBF610E9E2
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 16:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737736142; x=1769272142;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DGUF/mZbOy5grIZXWCLADeQnl9yrpLwW1A2TSAR6irg=;
 b=igMXXV8oVyE/h31o1/2KDywBRLooCkTbdwckkewY7FnLlavmiP3dnye0
 ChWDunkuZp3EE497g7GqW974hGMb+aNk3EdRsCHPevZGk+n5eejca1DK3
 VI39enzPQ9o8vKGRnlcDmdiWAz3G5lpipoHd+MeNvCglo3OP75lMbidCS
 L6s0UpXtteoMn7XI+tuwVsqnH/kIewzFaGXq1a+URr90NmzMBc4SHUIVE
 yobUwW04ITpKuICKcyIHIO2OzpDDlmlwbJ07swZgsGdYLxAQfzG/T7Djy
 p361kaWc+KfwBIDHp2ABvQe8rTRpRLzzP2lPbbbXJkZ++sUBohiqUPn8t g==;
X-CSE-ConnectionGUID: 4WW/jV3QQ9C5FyWJ5cbEbw==
X-CSE-MsgGUID: 9YGEe879TAK4ZqIfVSMVBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="41108854"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="41108854"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 08:29:02 -0800
X-CSE-ConnectionGUID: /5TuagaDRI2qDS7f2+6sGg==
X-CSE-MsgGUID: AISReL2aSuKHOEhTyB/PyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112439102"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 08:29:01 -0800
Date: Fri, 24 Jan 2025 17:28:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/xe_intel_bb: check multithreading
 rescans won't segfault
Message-ID: <20250124162858.vuqe4pcpa2rt7imt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
 <20250123095208.72984-4-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123095208.72984-4-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2025-01-23 at 10:52:08 +0100, Zbigniew Kempczyński wrote:
> This test is likely only for checking purposes, it doesn't makes
> sense to merge it after series review.

In such cases please add prefix in subject, something like:

[PATCH i-g-t v2 3/3] DO_NOT_MERGE: tests/xe_intel_bb: check multithreading rescans won't segfault

Regards,
Kamil

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist |  1 +
>  tests/intel/xe_intel_bb.c                | 47 ++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
> 
...cut...
