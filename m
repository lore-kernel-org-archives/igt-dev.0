Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4A0E9536D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 10:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E74510E5AC;
	Wed,  4 Feb 2026 10:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vnr6MZix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF4E10E5AC
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770200479; x=1801736479;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fsca3+KoOPVuzaOCJiZv7ISpdbDnJbiss3To2CYSigs=;
 b=Vnr6MZixU+PfVaQnKKdmK8jPI03xeJFV/UhlL7R/9ePqXPEgSHz3DkhN
 +ozKpFdnPorl5D5irwCVL9PnlNv+B0V0jB2pJN/ae+o0dgA+EdTOysX6u
 2QKv8x1BauHpLq/euuabDgCPLPtdmufZqrGkWc+ascffRTj1Ni2d7Q5bo
 v+oH4ZxfnzP3XnYsHxsxif964iZs+8azRgSi2XXXvvntZ2sHPCP6Gl1xw
 rI9c3i0TTbzvv5UGziraERRQdnr+j7/M/brIgMllQv5J5q0jo3jx8glfM
 STFb3z3kvrDY0IYX75Pi7tubDtbxqcRl2yVb06VOkSeoyHAIzTjzb8Vxs Q==;
X-CSE-ConnectionGUID: KVptZVkzTs2GagsJk2v7bA==
X-CSE-MsgGUID: n8GJpRTDRP2GobY8ebZ9WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71444084"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71444084"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 02:21:19 -0800
X-CSE-ConnectionGUID: r9UPhCgxSQiEipAqeLBhYQ==
X-CSE-MsgGUID: 8c6RuaaGQ2StX6rja4ya/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="209221649"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:21:18 -0800
Date: Wed, 4 Feb 2026 11:20:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: Re: [PATCH i-g-t v1 1/1] tests/intel/xe_exec_multi_queue: update
 test doc
Message-ID: <20260204102058.mtjcvqlhisyhj22y@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
References: <20260204092653.112994-1-pawel.sikora@intel.com>
 <20260204092653.112994-2-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204092653.112994-2-pawel.sikora@intel.com>
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
On 2026-02-04 at 10:26:53 +0100, Pawel Sikora wrote:
> As 'Hardware Building block' is not being used elsewhere,
> change this documentation category for the test to 'Core'.
> 
> CC: Jari Tahvanainen <jari.tahvanainen@intel.com>

s/CC/Cc/

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> ---
>  tests/intel/xe_exec_multi_queue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
> index 9a0274496..4a0e88402 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -5,7 +5,7 @@
>  
>  /**
>   * TEST: Basic tests for exec functionality with multi-queue feature
> - * Category: Hardware building block
> + * Category: Core
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: multi-queue
> -- 
> 2.51.0
> 
