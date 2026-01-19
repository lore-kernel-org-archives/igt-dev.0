Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B391D29C33
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 15:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BDE10E4A5;
	Mon, 19 Jan 2026 15:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3SrU+Sd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E0F10E4A5
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 15:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768837915; x=1800373915;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=71ML7e1ypcTokhrk2kMwWVBZYAn5j9G+FFvsWD3H004=;
 b=O3SrU+Sdez/PjdNLK3cW3ksozmXidgAu/1kZ9/8M8WZ9rmmHJEzs1Eys
 fiZBUhjOgdecZJrsYtVvtrEj90N7OobuyDmgDB4kDC3qkZx2tCk2M9uYt
 zvMg6QJBCtNrjlNjf/tYMYaGh65SZEldzhxHdFm/flqI8dSqpuNNI5nun
 nQOdO6TM7lINnfcDJkIM4gZ1BznV0sZ71bUsO1vEbxWRoZ0Kln31Kftek
 wMh31VOTVItJjaV8YWh76Xdl81eb8Fv4gLIkWRXRRYiUGZrxb5WP4a8ZD
 sbKaZPaEZhP0ny0Z+whNJtryYezKvmX2t7Vqp8mka8RFq6EHKEXgjsLE2 w==;
X-CSE-ConnectionGUID: vN+OuuJQSlqRt7SO74/Q9w==
X-CSE-MsgGUID: Femikm/9RMG+zNzjdZ11yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80351260"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="80351260"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 07:51:55 -0800
X-CSE-ConnectionGUID: GgzPL9VJRUiuyQahk6O6PQ==
X-CSE-MsgGUID: 4TEhH5a2Q62NaUGYfAihRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="237168170"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 07:51:54 -0800
Date: Mon, 19 Jan 2026 16:51:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 1/5] lib/xe/xe_legacy: Drop duplicate BATCH_DW_COUNT
 comment
Message-ID: <20260119155151.4c7qd3dlocybpi5y@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <20260117000456.26207-1-shuicheng.lin@intel.com>
 <20260117000456.26207-2-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117000456.26207-2-shuicheng.lin@intel.com>
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
On 2026-01-17 at 00:04:52 +0000, Shuicheng Lin wrote:
> Remove a redundant copy of the batch buffer dword-count comment.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/xe/xe_legacy.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index 084445305..d4f060f76 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -22,7 +22,6 @@
>  #define CAT_ERROR			(0x1 << 5)
>  #define CLOSE_EXEC_QUEUES		(0x1 << 2)
>  #define CLOSE_FD			(0x1 << 1)
> -/* Batch buffer element count, in number of dwords(u32) */
>  #define GT_RESET			(0x1 << 0)
>  #define MAX_N_EXECQUEUES		16
>  
> -- 
> 2.34.1
> 
