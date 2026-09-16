Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C654C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 07:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5036310E4A2;
	Wed, 16 Sep 2026 07:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fj0FXqBj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A6E10E376
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789544934; x=1821080934;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bd+MMAf0iDZM+BTuY2t4bV6wQn3iBvIAQ2MxFfv+ino=;
 b=fj0FXqBjGGfyvohj/7HZzyfTfOj6snpkACsMVBt556twV+EnvIDpIhIc
 M+8PkO+PTbsgUqJimMuXLy7mBJUgPmOK2JIwsoPS/wHvQaZUnfWBIsoC+
 VMdcyuQR2AmfdJslyIO8LKX5DQdl0i7+UXnwSIx4p4z5QRXmbNVU5yNIt
 x4LoTQ2mFvpclWtl+FqdTloOHF/EDFe7FXBcWFvOIX+jiAYiUBvzoXuON
 niIL2+engAbgMk/ZLUA3n1vlvTsgp6roWQLx3i/+3tSodEG/9xJvYXR8e
 tZTR0utLd7Muzi1KdmbcVUNiuRW8QoZt96UpavhUJ0W0vsHbp8EMAoi1P Q==;
X-CSE-ConnectionGUID: 7HWl79QfQ16pQAhc4/CADw==
X-CSE-MsgGUID: zBihXWiEQUmc2uvLAfIuTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115455829"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="115455829"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 00:48:54 -0700
X-CSE-ConnectionGUID: FFI6ndYSThioukGf3Vzorg==
X-CSE-MsgGUID: S0l0rHXDTCSTXrRAvqviSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="273227743"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:48:53 -0700
Date: Wed, 16 Sep 2026 09:48:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Subject: Re: [PATCH v4] tests/intel-ci: blocklist multi-queue tests on NVL
Message-ID: <20260916074850.xxtfrju7li3455nr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com
References: <20260915101414.66216-1-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915101414.66216-1-shivtej.eknath.patil@intel.com>
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

Hi Shivtej,
On 2026-09-15 at 10:14:14 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> The multi-queue subtests require xe_has_multi_queue_engine(fd).
>  
> On NVL platforms these tests are expected to skip because
> multi-queue engine support is not available.
>  
> Add blocklist entries to suppress expected CI failures.
> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel-ci/xe.nvl.core.blocklist.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index 7de332352..71715235b 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -107,3 +107,8 @@ igt@xe_exec_sip@.*
>  igt@xe_exec_sip_eudebug@.*
>  igt@xe_live_ktest@xe_eudebug
>  ##################################################################
> +# Expected skip on NVL due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@.*multi.queue.*
> +##################################################################
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> -- 
> 2.43.0
> 
