Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CB3E9A047
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 11:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F48589F71;
	Wed, 18 Feb 2026 11:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8ortgjU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C6189F71
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771412984; x=1802948984;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/vs6Cd7GHblBvhVg8Ql7A9ZYyRMFq+ZCDaNrRif1N+4=;
 b=c8ortgjU/X5+jCr4QNuRJvk7vB6rlEfEsUqrRyiXJhaBsgEG0wrz6q4E
 gUulwxFAwQHt5ti9st30a5n29LtZrDjLSpRoDVSO1bpARB4yQDZFpUvxv
 dxpbRGSR/52ssT5TnPbEqpZ1bscM/rK8wxJPFwA/MVTRXX6NmiLCvQpdR
 9CDCkFZEfvLrQ2zxdGbcq3id/y5xRKxBrgrkwbhkFU80M0VwjxcvvfrnY
 V77jUjIvlALpj7FNbiZ15w09CEjnS4iYTx7MgRn3MG/HjzH6C9KoGzrj1
 hrjbsyC4Fh96f1KJSMHA+nwpaebEpeHwTazZe39piA0QEIGZry3JLi5T9 Q==;
X-CSE-ConnectionGUID: i8uU6ILIQg++3Eh27r50Lg==
X-CSE-MsgGUID: JJ5/GI1sSqGtxXV+pyJgQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="71506955"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="71506955"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 03:09:44 -0800
X-CSE-ConnectionGUID: lvF8X2HKQ6aJEZXwroTE5w==
X-CSE-MsgGUID: 59e8LgiQSKqTEj9JT+K2MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="218694099"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 03:09:43 -0800
Date: Wed, 18 Feb 2026 12:09:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: zbigniew.kempczynski@intel.com, matthew.auld@intel.com,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_pat: Validate XA App Transient
 feature
Message-ID: <20260218110940.lz7bs4nwftwmsxpy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com, igt-dev@lists.freedesktop.org
References: <20260213084603.1404162-1-priyanka.dandamudi@intel.com>
 <20260213084603.1404162-6-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213084603.1404162-6-priyanka.dandamudi@intel.com>
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

Hi priyanka.dandamudi,
On 2026-02-13 at 14:16:03 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Test the scenarios when media is on/off.
> When media is off/on, for xa app transient buffer, data should be coherent
> between cpu and gpu. Coherency should be maintained from KMD side
> irrespective of media engine on/off.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_pat.c | 101 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index f2dff62a9..30e427634 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -19,16 +19,24 @@
>  #include "intel_blt.h"
>  #include "intel_mocs.h"
>  #include "intel_pat.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
> +#include "igt_fs.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"

Please keep them sorted, they should be before intel_ ones,
not here.

>  #include "linux_scaffold.h"
>  
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
> +#include "xe/xe_gt.h"

Same here, move before xe/xe_ioctl.h

Regards,
Kamil


>  
>  #define XE_COH_NONE          1
>  #define XE_COH_AT_LEAST_1WAY 2
>  
>  static bool do_slow_check;
> +static char bus_addr[NAME_MAX];
> +static struct pci_device *pci_dev;

[cut]

