Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF990CA5FB1
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 11:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CA710E9F2;
	Wed, 30 Sep 2026 11:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="caipBDC9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E2810E9F2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 11:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790768344; x=1822304344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kthkM8iClp+3AG554cvoTw8wkM/v0wIrLjQyrjfZJMQ=;
 b=caipBDC9f/faiJ6NNgqldfr8D6WdCVqw1b5CK7g3dwnEqkt/I09vLwMa
 7Lk8EE0+pbKOWbeQwdHhBClclLm0EHc/JuMXO3yJ6xxASka8UiycMULTt
 MxmehM5m7M8Vu+ZjdrRrU5trSUkM+zB11k8hivptyLbVwkHMpMoMwN2gt
 E0FZc6IAuuBMPvO7Qwu8CCgEPJDvk0wBrUJFxNLgKZIyeCCV5eHd50Nxr
 eKkb2ZpmEFczFCxyOfhajOCos13HX9BtOx3CK/tdRLW6LL0TdHw+1TCLE
 dGVe6z7ct/foaNdLKeT0vJC1otYdL8iZN7c5h7nRdTHszHAwVkiMYmCas w==;
X-CSE-ConnectionGUID: +pXtjtzxS1yf7HOSEHlFHA==
X-CSE-MsgGUID: oG6zVxPPSmGXg7E8kCoj0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="108990701"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="108990701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:39:03 -0700
X-CSE-ConnectionGUID: 97Sr6zODQLSr6mOBkKE8rg==
X-CSE-MsgGUID: +39AaW1WRxiiJSZ1VtkjMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="280408516"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 04:39:02 -0700
Date: Wed, 30 Sep 2026 13:38:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Subject: Re: [PATCH v7 3/3] tests/intel-ci/xe.pm.d3cold.testlist: add xe_pm
 sysfs coverage subtests
Message-ID: <20260930113859.bsm66ecobtb72hsg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com
References: <20260915052421.23254-1-shivtej.eknath.patil@intel.com>
 <20260915052421.23254-4-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915052421.23254-4-shivtej.eknath.patil@intel.com>
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
On 2026-09-15 at 05:24:16 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> Add the newly introduced xe_pm sysfs coverage subtests
> to xe.pm.d3cold.testlist so they are executed by CI.

Write also that you sorted few others alphabetically.

> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel-ci/xe.pm.d3cold.testlist | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
> index 783859fc7..b34da494c 100644
> --- a/tests/intel-ci/xe.pm.d3cold.testlist
> +++ b/tests/intel-ci/xe.pm.d3cold.testlist
> @@ -1,11 +1,18 @@
> -igt@xe_pm@s2idle-d3cold-basic-exec
> -igt@xe_pm@s3-d3cold-basic-exec
> -igt@xe_pm@s4-d3cold-basic-exec
> +igt@xe_pm@auto-link-downgrade-capable-show
> +igt@xe_pm@auto-link-downgrade-status-show
>  igt@xe_pm@d3cold-basic
>  igt@xe_pm@d3cold-basic-exec
>  igt@xe_pm@d3cold-i2c
> -igt@xe_pm@d3cold-multiple-execs
>  igt@xe_pm@d3cold-mmap-system
>  igt@xe_pm@d3cold-mmap-vram
>  igt@xe_pm@d3cold-mocs
> +igt@xe_pm@d3cold-multiple-execs
> +igt@xe_pm@lb-fan-control-version-show
> +igt@xe_pm@lb-voltage-regulator-version-show
> +igt@xe_pm@s2idle-d3cold-basic-exec
> +igt@xe_pm@s3-d3cold-basic-exec
> +igt@xe_pm@s4-d3cold-basic-exec
>  igt@xe_pm@vram-d3cold-threshold
> +igt@xe_pm@vram-d3cold-threshold-show
> +igt@xe_pm@vram-d3cold-threshold-store
> +

Remove this empty line from here. With this fixed it is

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> -- 
> 2.43.0
> 
