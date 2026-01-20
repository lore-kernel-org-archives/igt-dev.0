Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A68DCA5FA0
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 16:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE1B10E626;
	Tue, 20 Jan 2026 16:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GafG7nwL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8868B10E626
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 16:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768925403; x=1800461403;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3p8SQy6F9lXbFithYfNPkQ+kcEUfma40tLEFFqkIT0U=;
 b=GafG7nwL52MCXRlg/VAtJtga5VmF3N5WUhLQvx8eyB+Mceh+UZZtRy7X
 36l6yII4G88JYIMemJwULr4fyiNG2KDs8USwzY4eahtvjQJWwL8BQWhHg
 iIi78sWJJa1oLB8CTNStcQL0cPd5GBRp2TVgQfrWugZtZQvte1MpNEDXM
 AqRuHVrhN5mrx8jGWfKor2SwVKoUcrIoFPuZqRllEHpz97e9loa34GHZb
 Tnuc5XrKF9WBf2UhJOCibAl89mwj6zvmrM4L/Au03yUMIpDS1TucErysW
 IguXK6oUuPqAv9If/pF3w3Q060b7mhGrsaQ8qC9kbVvNj4EaIW+9b06TH g==;
X-CSE-ConnectionGUID: ioMYSotDRIWPSTR8QhmcLw==
X-CSE-MsgGUID: L2c2mwd9QNm2fX2ciKwxjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80440793"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="80440793"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:10:02 -0800
X-CSE-ConnectionGUID: +GtF77RnSiaBgtKWwmMTFw==
X-CSE-MsgGUID: zJAa2472Sq6rp2+pijwFjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="243739789"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:10:01 -0800
Date: Tue, 20 Jan 2026 17:09:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 4/5] lib/xe/xe_legacy: munmap BO before closing fd
Message-ID: <20260120160958.ay33tw5xip46qc4j@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <20260117000456.26207-1-shuicheng.lin@intel.com>
 <20260117000456.26207-5-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117000456.26207-5-shuicheng.lin@intel.com>
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
On 2026-01-17 at 00:04:55 +0000, Shuicheng Lin wrote:
> Unmap the mapped BO before returning in the CLOSE_FD path.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  lib/xe/xe_legacy.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index 6c0ed56c9..95246ea92 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -177,6 +177,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  			for (i = 0; i < n_exec_queues; i++)
>  				xe_exec_queue_destroy(fd, exec_queues[i]);
>  		}
> +		munmap(data, bo_size);

Sorry, this is in 'if (flags & CLOSE_FD)' path
and it is in sync with drm_open_driver(), so
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  		drm_close_driver(fd);
>  		/* FIXME: wait for idle */
>  		usleep(150000);
> -- 
> 2.34.1
> 
