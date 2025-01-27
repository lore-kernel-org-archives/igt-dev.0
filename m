Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C4FC0218C
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 04:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D9E10E194;
	Mon, 27 Jan 2025 04:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJCFrsqe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C26C10E194
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 04:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737953446; x=1769489446;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=X9q3QO0F8DKTiJuM7KguzabOhaCDpXUmF28HjPtfD88=;
 b=XJCFrsqeRI6qryVxZ9y9VcTEgXhXMsawqo2qC8oXwwsRUbW9wGO2WyrI
 Disw3TMsfyWEmsH6i9lGSXNR23Ac/mi+mkcFr7DoEt1tjOoCS/UIsDGAy
 C9nXao+A9e8vTk7sW25XNa923N5/t89OK76km9PeXy7nmiBjZxRYS00T0
 APIpxR6mK56Jkwu1z+/09AmPXu0jnZAppbkd2YEVboETK6mBvSopobweR
 g7CrQDv5tOlC8QdZqt3dgTAynWMkUYankvJJZdF98A5TdE3imcyxCOftn
 2yTG52dxXFmmHhNpn957KnY3ql0Vrmeq7kIpbpV/7o0ydeN1A+WPLmNWc A==;
X-CSE-ConnectionGUID: ed39T4eaQIyfV/RRQY2Gsw==
X-CSE-MsgGUID: /qs03/VhS4m2IDQ4cayfdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="42337178"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="42337178"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 20:50:46 -0800
X-CSE-ConnectionGUID: JBKp8z4tSMylu6iq1/yiYQ==
X-CSE-MsgGUID: rgiPfLOVSCmA+ga8Hf+bgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="108848290"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.231])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 20:50:45 -0800
Date: Mon, 27 Jan 2025 05:50:42 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 3/3] tests/xe_intel_bb: check multithreading
 rescans won't segfault
Message-ID: <20250127045042.ovehwzuc6hbaqdgh@zkempczy-mobl2>
References: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
 <20250123095208.72984-4-zbigniew.kempczynski@intel.com>
 <20250124162858.vuqe4pcpa2rt7imt@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124162858.vuqe4pcpa2rt7imt@kamilkon-desk.igk.intel.com>
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

On Fri, Jan 24, 2025 at 05:28:58PM +0100, Kamil Konieczny wrote:
> Hi Zbigniew,
> On 2025-01-23 at 10:52:08 +0100, Zbigniew Kempczyński wrote:
> > This test is likely only for checking purposes, it doesn't makes
> > sense to merge it after series review.
> 
> In such cases please add prefix in subject, something like:

Ack, noticed for future patches.

--
Zbigniew

> 
> [PATCH i-g-t v2 3/3] DO_NOT_MERGE: tests/xe_intel_bb: check multithreading rescans won't segfault
> 
> Regards,
> Kamil
> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/intel-ci/xe-fast-feedback.testlist |  1 +
> >  tests/intel/xe_intel_bb.c                | 47 ++++++++++++++++++++++++
> >  2 files changed, 48 insertions(+)
> > 
> ...cut...
