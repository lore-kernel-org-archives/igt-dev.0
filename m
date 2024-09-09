Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEB9CD4F4C
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 07:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D02110E2DB;
	Mon,  9 Sep 2024 07:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSBIcYgc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6166D10E2DB
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 07:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725866475; x=1757402475;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s5gfLlzykpTzG32nEjC5ZtLcnOyl6MxCe9+0uxFcIJg=;
 b=dSBIcYgcP4Bdjl10idxJamOJfssapLpkpYJBtOHlsMUGCJaM3ddq2M4O
 aBuoCP41hjjzmQoL90XlW/PFixW/ZW6Vf8ZLmAXl81diMYOcLlxMS4IFY
 gSwO4fnpTIfkA7MLX1DGv6IlEdgg/ODS0m5bX+X1cQ+FP/OrVw8XBbHDf
 oggTMQhhJQVT0HpDBEWuejxcTq2ZbQAhaqsUY91Lg7bs8t4xV1xZaN+lu
 0bVdoiQxxQjeblvpWfRsus/8q33NOlaA1bh3pRZmE/l3/RfofTONfykSb
 6Rt9hl7+B618/zGW7CXncqmPFa/db8SsBb9r4ZrOGp6x7wpjRF8HDCW/c A==;
X-CSE-ConnectionGUID: uLlDgktLQRyoXlmadBvB/Q==
X-CSE-MsgGUID: DW4Ru7FMRw2E0eXV6LzjHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="27466137"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="27466137"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:21:15 -0700
X-CSE-ConnectionGUID: n8yHjCtsRoeP0mzK4jqDUQ==
X-CSE-MsgGUID: d1qQNqi7RJaWcfRjYiMtAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; d="scan'208";a="71373479"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.143])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 00:21:11 -0700
Date: Mon, 9 Sep 2024 09:21:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v6 09/17] tests/xe_exec_sip: Introduce invalid
 instruction tests
Message-ID: <20240909072108.gdvdr5t74243s434@zkempczy-mobl2>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-10-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905092812.94553-10-christoph.manszewski@intel.com>
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

On Thu, Sep 05, 2024 at 11:28:04AM +0200, Christoph Manszewski wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Xe2 and earlier gens are able to handle very limited set of invalid
> instructions - only illegal and undefined opcodes, other errors in
> instruction can cause undefined behavior.
> Illegal/undefined opcode results in:
> - setting illegal opcode status bit - cr0.1[28],
> - calling SIP if illegal opcode bit is enabled - cr0.1[12].
> cr0.1[12] can be enabled directly from the thread or by thread dispatcher
> from Interface Descriptor Data provided to COMPUTE_WALKER instruction.
> 
> Implemented cases:
> - check if SIP is not called when exception is not enabled,
> - check if SIP is called when exception is enabled from EU thread,
> - check if SIP is called when exception is enabled from COMPUTE_WALKER
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>

I've some observation - tests are passing but I've doubts regarding
their completion. I mean I observe hang and test report success after
job timeout.

--
Zbigniew
