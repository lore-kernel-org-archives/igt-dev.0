Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A278EB7ED5
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 11:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B42C10E168;
	Wed,  4 Mar 2026 11:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWuF0V+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF3410E168
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 11:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772624764; x=1804160764;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K4CijPz7cFNYNCyZTqVjPnuO3fs7JrwE0WiCwRie938=;
 b=mWuF0V+hfO34jbGQ0gGOSybtlxumRBCFqO1/mjPLsZsFrYpVX4/OlsFK
 4YDgHsBQysYSjbzSbP2ftsmHuNq+GEOL+J6xOOFUZaZwahAXTwZO7laHy
 IoIoeVKautZzvaqYH5mMqSYMxpS6uitwc2pazxyGZDAO5P2mEwXVy9742
 JXGfIN0KGB7EfnctUA1mAF+ogz6mhBfw8CrEgpRQyVwwSwdOlvzB7qYEx
 Uwuxd1NxLDhdJMoDs0m4RwJAv600+rkV+clhVzTMNtm63WPHnvBcFewoM
 V/RX/JOhEI7i8aXApOIrY84ftR8GdcuFY7z4dQM9Dq9nNGE9RYlXGXk+O A==;
X-CSE-ConnectionGUID: o8A33rqOTrq3bwSO5smspA==
X-CSE-MsgGUID: Zj25tUUgSDqoodB8Wwyakw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="91256456"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="91256456"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:45:57 -0800
X-CSE-ConnectionGUID: TcerMF9ZS8K21IQ56QhvRg==
X-CSE-MsgGUID: edq0itD1S9GWtxmg16t0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="256205128"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 03:45:56 -0800
Date: Wed, 4 Mar 2026 12:45:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: priyanka.dandamudi@intel.com
Cc: zbigniew.kempczynski@intel.com, matthew.auld@intel.com,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_pat: Validate XA App Transient
 feature
Message-ID: <20260304114538.gndtkmzcezx3xa2w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com, igt-dev@lists.freedesktop.org
References: <20260303043853.1656156-1-priyanka.dandamudi@intel.com>
 <20260303043853.1656156-6-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303043853.1656156-6-priyanka.dandamudi@intel.com>
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

Hi Priyanka,
On 2026-03-03 at 10:08:53 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Test the scenarios when media is on/off.
> When media is off/on, for xa app transient buffer, data should be coherent
> between cpu and gpu. Coherency should be maintained from KMD side
> irrespective of media engine on/off.
> 
> v2: Added comment to explain the reason of forcewaking.
> Added 2way also in the index along with XA.(Matt)
> Reordered headers.(Kamil)
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_pat.c | 103 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index aeb84dbb7..dbeb7c7d9 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -16,11 +16,17 @@
>  #include "igt.h"
>  #include "igt_syncobj.h"
>  #include "igt_vgem.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
> +#include "igt_fs.h"
> +#include "igt_kmod.h"

Move these igt_configs.h ... igt_kmod.h headers before igt_syncobj.h

> +#include "igt_sysfs.h"

This one should be after igt_syncobj.h

>  #include "intel_blt.h"
>  #include "intel_mocs.h"
>  #include "intel_pat.h"
>  #include "linux_scaffold.h"
>  
> +#include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"

[cut]
