Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05DACD98CE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 14:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911BD10EA4B;
	Fri, 12 Jun 2026 14:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGVxUly2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B19410EA4B
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781275127; x=1812811127;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/cRajFc3hOw+1XPPRc4zD2eUJUXjLHcC04dyKQhmEq4=;
 b=fGVxUly2tezUSaXh/LaZqnAyc/Y1lI+0Tx9SVN6PWg/ebfBBcPacnlNu
 E1fl/0WDvi+lBlec4Nm2DocBhkaZz9PQcNdE+uekjGc8nNhvQGYihZYAD
 36lY9A0OTGYnlv8HucztYiCzdCGa1AI+PWWReKESkA45miu7STDbJT9MP
 znJtS+hz047r7SKX/6haDpABWWvyhesRkhRfdOso3bJmyH4CbVrkl/KZK
 Cm/OSrWjm1RZrGAJ1Yz9RvENiJHb9FUBYn+g0yxI8A7rH8nZpa+VGXWHO
 jFf232gO2+d6yjWFgyHJF9/mzdF+zOIbn0baYegGpmtrQBveQoA5Fdemp w==;
X-CSE-ConnectionGUID: lelFEQBtT4uZmJYz2JHrmw==
X-CSE-MsgGUID: YeemrMVKQRew/+AELYnn9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81948751"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="81948751"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 07:38:46 -0700
X-CSE-ConnectionGUID: C9v8YCSHTeSqIUq1jg3EHw==
X-CSE-MsgGUID: k9Gflt/+Rxu8mXB+TxSBzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="248725344"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 07:38:45 -0700
Date: Fri, 12 Jun 2026 16:38:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lahtinen Joonas <joonas.lahtinen@intel.com>
Subject: Re: [PATCH i-g-t 1/4] lib/xe: add xe_vm_restart ioctl helper
Message-ID: <20260612143842.72qej4en7jfgj5qi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lahtinen Joonas <joonas.lahtinen@intel.com>
References: <20260612110619.103198-1-thomas.hellstrom@linux.intel.com>
 <20260612110619.103198-2-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612110619.103198-2-thomas.hellstrom@linux.intel.com>
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

Hi Thomas,
On 2026-06-12 at 13:06:16 +0200, Thomas Hellström wrote:
> Add DRM_XE_VM_RESTART (ioctl 0x10) and struct drm_xe_vm_restart to the
> Xe DRM UAPI header, taken from the xe_event kernel branch.
> 
> Add DRM_XE_VM_CREATE_FLAG_RESTARTABLE (bit 4) to allow VMs to opt in to
> the restart mechanism.
> 
> Add __xe_vm_restart() (failable, with bounded EAGAIN retry) and
> xe_vm_restart() (asserting wrapper) to lib/xe/xe_ioctl.  Both take an
> optional CLOCK_MONOTONIC timestamp_ns which is forwarded to the IOCTL so
> the driver can log event-to-restart latency.
> 
> Assisted-by: GitHub Copilot:claude-sonnet-4.6

You s-o-b is missing here.

> ---
>  include/drm-uapi/xe_drm.h | 40 +++++++++++++++++++++++++++++++++++

This change should be in separate commit, syncing with drm-next.
See git log.

Regards,
Kamil

>  lib/xe/xe_ioctl.c         | 44 +++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h         |  2 ++
>  3 files changed, 86 insertions(+)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 5a96a7910..43b65b1d9 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -84,6 +84,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_MADVISE
>   *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
>   *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
> + *  - &DRM_IOCTL_XE_VM_RESTART
>   */
>  
[cut]
