Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EC8E9E30B
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 13:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5145210E0C8;
	Wed, 11 Feb 2026 13:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXhaTmRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E29010E5C0
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770818007; x=1802354007;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K7L3PSieT6VO6bGcqN64YmE8jEXFyL+xWqPJCPmYRKE=;
 b=UXhaTmRygo6W6ZX/a/CJic9rwPpy48YZa91Wg9eB6ikhtBkx5RowxpT9
 F5i7IIRJg/XT8XDylHjKhoGJ4D5pBmBqzZUutLlQUubL2YBQffaUn7RaP
 VKFoHyEpsbKL65gK9LARtnKeMhb+oAf+M1yM9nicnspMIlN+sLzXb4AMH
 Kc2kOPdssA+9qesi+Gqdt7rSYbPFD2Y9qG47nSs3Hr0Ef5jioMf8bKq18
 35+PzuV5NqCCRGQ5dZ6UiK67ZLbFD1MkLoqoZhRO8Eg1Ino/orFeGhjrp
 g7mEv+vT6ADVUmWi+aXP1Mg4SFISBlKfcntW1ZBMVlxfg3XTY+Ln6E6DN A==;
X-CSE-ConnectionGUID: 2ZU94XDvQn+mh6CSV7tkPg==
X-CSE-MsgGUID: GsjXIfzyQLioegUOR2Xg8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="82694578"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82694578"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 05:53:27 -0800
X-CSE-ConnectionGUID: mfzoYjZ+SRe7L/6WEhsRnw==
X-CSE-MsgGUID: ZDu881sRQPy6g4yz+RIwNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211633660"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 05:53:26 -0800
Date: Wed, 11 Feb 2026 14:53:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 mohammed.thasleem@intel.com, mohammed.bilal@intel.com
Subject: Re: [PATCH i-g-t] lib/igt_pm: Move DC State Counter Functions to
 common library
Message-ID: <20260211135310.sbdexrm6chsubzln@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 mohammed.bilal@intel.com
References: <20260210032433.250680-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260210032433.250680-1-jeevan.b@intel.com>
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

Hi Jeevan,
On 2026-02-10 at 08:54:33 +0530, Jeevan B wrote:
> Move DC counter utility functions from tests/intel/kms_pm_dc.c
> to lib/igt_pm.c for reuse across other tests.
> 
> v2: Add 'igt_' prefix before all functions.
> v3: Fix typos, fix debugfs_fd type and add errno.h include.
> v4: Add IGT_INTEL_ prefix to all CHECK_DC* flag constants and
>     PACKAGE_CSTATE_PATH constant.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_pm.c            | 170 +++++++++++++++++++++++++++++++++++
>  lib/igt_pm.h            |  15 ++++
>  tests/intel/kms_pm_dc.c | 191 ++++++++--------------------------------
>  3 files changed, 222 insertions(+), 154 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 1ffcdcef3..ebf39baab 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -31,6 +31,7 @@
>  #include <pciaccess.h>
>  #include <stdlib.h>
>  #include <string.h>
> +#include <errno.h>

You forgot about this, it should be moved up before
#include <fcntl.h>

Regards,
Kamil

>  #include <unistd.h>
>  #include <sys/stat.h>
>  #ifdef __linux__
> @@ -1543,3 +1544,172 @@ void igt_pm_dpms_toggle(igt_output_t *output)
>  				   DRM_MODE_DPMS_ON);
>  	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
>  }
[cut]
