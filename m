Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC8BC88E45
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 15:14:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE9C10E3D8;
	Fri, 11 Sep 2026 15:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXOXxPn+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872D210E3D8
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789139638; x=1820675638;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pANSdVAcKIxpdwwtzGfMsj2WrvI9h14qgTQL1sW1+to=;
 b=HXOXxPn+QP99+qj/iWFegDjg6iz2QCFrjJOUyxHsSbPVslTbuHdHNt1h
 sPRJycDxfpPpxYcOda+YxpmtfN6ATmYWiSmjGKP8Wm+3TId+Cc3O4odWp
 vsA0Vdbi8sLSU76d0XVwjPv+zY2e3ix1IAEz3DtrFhXUdaQly88rq9Qqj
 YgO0dj4FMwFfNq+ZEmOA9RoLlZnmNyvtcT6S8M6+8CrhcoqE4Nyfc1Pbt
 tpSXqKlSnHNIX0+LkvhCsxMNOo17dcnjOqyTZ45doVNWVEHwFRgrIzc8+
 Hb+V/c6+pZ3Bcegr9+Bf+nhIi5cvLV4QY7MQrnL44OiU6p6jeYGTdtaZE A==;
X-CSE-ConnectionGUID: d7ziyQxIQPqk7blMFsQG3w==
X-CSE-MsgGUID: hszxqjjIRqybWVC9ek69dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="99932695"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="99932695"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 08:13:58 -0700
X-CSE-ConnectionGUID: 3y4/LTiRTcaw7+i9m5Kk1g==
X-CSE-MsgGUID: HjC5TlVyQfWN9/18kn5fjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="267651108"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 08:13:55 -0700
Date: Fri, 11 Sep 2026 17:13:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com
Subject: Re: [PATCH v2] tests/intel-ci: blocklist xe_exec_threads multi-queue
 tests on NVL
Message-ID: <20260911151353.kolsbrbvwh2al6ie@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
References: <20260831143028.22534-1-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831143028.22534-1-shivtej.eknath.patil@intel.com>
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

Hi shivtej.eknath.patil,
On 2026-08-31 at 14:30:28 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> The xe_exec_threads multi-queue subtests require
> xe_has_multi_queue_engine(fd).
>  
> On NVL platforms these subtests are expected to skip because
> multi-queue engine support is not available.
> 
> Add a blocklist entry to avoid reporting expected CI failures.
> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel-ci/xe.nvl.core.blocklist.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index 7de332352..19d7b9692 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -107,3 +107,8 @@ igt@xe_exec_sip@.*
>  igt@xe_exec_sip_eudebug@.*
>  igt@xe_live_ktest@xe_eudebug
>  ##################################################################
> +# Expected skip on NVL due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@xe_exec_threads@threads-multi-queue-.*

Please make it more generic, to catch also other multi-queue test,
I suggest:

igt@.*multi.queue.*
igt@.*multiqueue.*

First one will match multi-queue and multi_queue.

Regards,
Kamil

> +##################################################################
> -- 
> 2.43.0
> 
