Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE27CA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 11:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F74A10E029;
	Thu,  1 Oct 2026 11:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MusN7MW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470D110E029
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 11:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790853148; x=1822389148;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m/iVD8KCKSmk7nf93szO9O4Bn2f9Vzd0ohsaGWUM4xY=;
 b=MusN7MW/OhDBXYwONH3BiwOd2LQIF61kvlPtUb8HviYf+TkzrLjUMYkz
 fxhJ5/YtRM9C9lMGEzrlaESUXzDIqknI1DI9uQn5r8c/4yGrtm/tIND6q
 vjGu6J0hSuwWqbCQ82KlZT/nV7tVXeaWbe1/d/gh/SMvG5n3kRGL3FmWL
 7q42o5+BTuOl6g0P6N2M1y4FKRfLC2yUQiepKhjQEsRhOvMyG8bn+vOcW
 yqpor9tY3BCHIEDOOlZ6eOqpFIEXpyEpcv7EKiJBYiWukjfPcCNDX3Wi0
 F0CIsRBpyLoRRHmotlqu1ZDgdJf85PVqSJRtDoe5IpHkzwTi9Kx7/GU7s w==;
X-CSE-ConnectionGUID: ZQuxDh10SCimQZupitUQtw==
X-CSE-MsgGUID: ORWZjfIrQ9OlwC+v1hQXsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91703606"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91703606"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:12:28 -0700
X-CSE-ConnectionGUID: mbCQvNlZRzqSqVt4Nrf0sA==
X-CSE-MsgGUID: hzohsWBfQDe5OCcmgDIvtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="276012091"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 04:12:26 -0700
Date: Thu, 1 Oct 2026 13:12:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v8 3/3] tests/intel-ci/xe.pm.d3cold.testlist: add xe_pm
 sysfs coverage subtests
Message-ID: <20261001111223.ka72ryoiyknh4ggz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
References: <20261001055902.5430-1-shivtej.eknath.patil@intel.com>
 <20261001055902.5430-4-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001055902.5430-4-shivtej.eknath.patil@intel.com>
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

Hi,
On 2026-10-01 at 05:59:02 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> Add the newly introduced xe_pm sysfs coverage subtests
> to xe.pm.d3cold.testlist so they are executed by CI.
> 
> Also sort existing testlist entries alphabetically.
> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>

Also +cc few other developers, here
Karthik Poosa <karthik.poosa@intel.com>
Gandi Ramadevi <ramadevi.gandi@intel.com>
Badal Nilawar <badal.nilawar@intel.com>

> ---
>  tests/intel-ci/xe.pm.d3cold.testlist | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
> index 783859fc7..71d91e9fd 100644
> --- a/tests/intel-ci/xe.pm.d3cold.testlist
> +++ b/tests/intel-ci/xe.pm.d3cold.testlist
> @@ -1,11 +1,17 @@
> -igt@xe_pm@s2idle-d3cold-basic-exec
> -igt@xe_pm@s3-d3cold-basic-exec
> -igt@xe_pm@s4-d3cold-basic-exec
> +igt@xe_pm@auto-link-downgrade-capable-show
> +igt@xe_pm@auto-link-downgrade-status-show

How are these auto-link-.* related to d3cold?

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

How are lib-(fan|regulator).* related to d3cold?

> +igt@xe_pm@s2idle-d3cold-basic-exec
> +igt@xe_pm@s3-d3cold-basic-exec
> +igt@xe_pm@s4-d3cold-basic-exec
>  igt@xe_pm@vram-d3cold-threshold
> +igt@xe_pm@vram-d3cold-threshold-show
> +igt@xe_pm@vram-d3cold-threshold-store

These are fine, they add new *d3cold* subtests here.

Regards,
Kamil

> -- 
> 2.43.0
> 
