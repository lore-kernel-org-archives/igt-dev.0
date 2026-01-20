Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC66CA5FA2
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 16:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C0D10E626;
	Tue, 20 Jan 2026 16:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHm+rVyf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF8C10E626
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 16:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768925280; x=1800461280;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xqj6XFr5HADQ/B61TCkyHCwCQSQrFYpDFV320mzFqbc=;
 b=BHm+rVyf/7+OmJRgwzbzMqAmmaruNfMgMcR/kyB3LCE7546j7HVBKH+R
 Y7cP6WVnm9QioSJtyZqW+UaJCcaF5eN4CmUudUrQHYpXWnSTu/LTNQHif
 bGnNM4sJlKGMJnv9Jspwev2/KuT/t2RkspQR7uqf4hcEaSXbbcPnv0h9Z
 e8IXpwJFDHYv1VwNqU6HqiPPgFGMftPqiO3tQa3Ws87V2nhZ4HuUiOKsN
 R7vJvYM1SR5S/JtX5um3MoEQbL7q6ZHKJthTszocRHSkXDunb+7otCBxI
 xHuxUuA/2ATkXEI7MWnDVTl/aPVMOIh1buc6cXXwe2AcIlNIjn9KEnqFn A==;
X-CSE-ConnectionGUID: FpW6uwv3SX6Z+e994TDibw==
X-CSE-MsgGUID: z1zaxO5BTG6Vk/y6VEERPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70039063"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70039063"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:07:59 -0800
X-CSE-ConnectionGUID: +i4MwQBqRFO3oTCWXWjPpQ==
X-CSE-MsgGUID: yNW44F3XR2CJbGjrNN28jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206200241"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 08:07:58 -0800
Date: Tue, 20 Jan 2026 17:07:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 5/5] lib/xe/xe_legacy: Simplify base_addr in reuse loop
Message-ID: <20260120160755.mi3w3o5ms7grwc4j@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <20260117000456.26207-1-shuicheng.lin@intel.com>
 <20260117000456.26207-6-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117000456.26207-6-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2026-01-17 at 00:04:56 +0000, Shuicheng Lin wrote:
> The extra_execs loop starts at n_execs, so i is never zero.
> Always use addr as base_addr.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  lib/xe/xe_legacy.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index 95246ea92..dcd7e2075 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -190,8 +190,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>  
>  	for (i = n_execs; i < n_execs + extra_execs; i++) {
> -		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
> -			? (addr + bo_size * 128) : addr;
> +		u64 base_addr = addr;

Or just:
		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && i != n_execs)

Regards,
Kamil

>  		u64 batch_offset = (char *)&data[i].batch - (char *)data;
>  		u64 batch_addr = base_addr + batch_offset;
>  		u64 sdi_offset = (char *)&data[i].data - (char *)data;
> -- 
> 2.34.1
> 
