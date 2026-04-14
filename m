Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586F9F9D0CA
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 12:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFA310E5D7;
	Tue, 14 Apr 2026 12:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWbOYoEQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF7910E5D7
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 12:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776169537; x=1807705537;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XZG2Pmz4ChE45I1UBjVlhhMRLrjK10BvDYDpeP013WM=;
 b=QWbOYoEQ+f184VIF0oJBLD1spvvDmMy/+Vr7B4ABpmXJtCFfrhyMEuc4
 xT9bKF5jekZAbxxrc58d58++K8ISjlU7rhWMLyKl2QFJkHRu2Y2vGQaaY
 Vyz+0lvpF7sn0Y9yz7EPE7/7koJAdpPwYUwBfzAdS95/ZEQWkApj7mOfF
 xcYA873QTLPJ+jx70z+9qU1HjH4PXH3ZHSRbQ48Hu/qN4xWYN1nnrY9DO
 S4qAnUgbmAmHX/jzPypzRqNhejcrr7/93RMeQWTKh5Xykg2k7H4YuCrKK
 15oz7vTny+uxDNjFs3D1GGybzWCFroPDRLPbxLt1ICun/8GuEgDdr6P8q A==;
X-CSE-ConnectionGUID: n4WfixYiTZ6bqKfAvFwL+Q==
X-CSE-MsgGUID: djLTghG/Rj6fi2FnV5kv0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77195528"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77195528"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 05:25:36 -0700
X-CSE-ConnectionGUID: bz4MkUApThiOTbj9Zwa1Bw==
X-CSE-MsgGUID: HnAi5faaQqKhYnpspEK1xw==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:25:35 -0700
Date: Tue, 14 Apr 2026 14:25:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com
Subject: Re: [PATCH v2 1/2] tests/intel : Add data structs & helper utilities
 for VM_Bind Neg tests
Message-ID: <20260414122533.fbxjfbuwc3gyspdg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com
References: <20260309060901.642399-1-smitha.balasubramanyam@intel.com>
 <20260405115046.939344-1-smitha.balasubramanyam@intel.com>
 <20260405115046.939344-2-smitha.balasubramanyam@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260405115046.939344-2-smitha.balasubramanyam@intel.com>
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

Hi Smitha,
On 2026-04-05 at 17:20:44 +0530, Smitha Balasubramanyam wrote:

please improve subject, add test name and also imho change description
into something more descriptive, so imho better:

[PATCH v2 1/2] tests/intel/xe_ccs: Add helpers for neagtive tests

This could be done at next revision or, if you will got r-b,
without sending new series.

Regards,
Kamil

> Introduce data structures and helper utilities used by the VM
> negative tests in xe_vm.
> 
> These helpers provide resource management and setup/cleanup
> logic that simplifies the implementation of the test cases
> introduced in subsequent patches.
> 
> No functional tests are introduced in this patch.
> 
> Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
> ---
>  tests/intel/xe_ccs.c | 279 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 279 insertions(+)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 4c5fe0311..029b8bdaa 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
[cut]
