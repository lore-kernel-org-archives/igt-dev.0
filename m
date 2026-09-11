Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E31C88E58
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 15:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1666A10E3D8;
	Fri, 11 Sep 2026 15:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVd3pDd+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE00810F662
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789138846; x=1820674846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dmLqaFtZdaaxSnzCOss/igAOHU+/OmKk0bh4bKBl58E=;
 b=JVd3pDd+FZpVKGN6yX9iuc5/kFv6IOa/eobNWo1nHMEp2yg4FaVoQUFo
 1e8greMdex+cJQS0Cxav5xk/ClrRR5eFfbyoc0hfQAu99IMlFBaUZ1ROC
 srazNQegu507wZA+kPdKdgYtbiFUC/GATWvEejxh9R5kMy9iINZfLsZTA
 03KetsNRUEuvJtfDOPieXifuTBaD31QaJSzdHdqITMqdtKecingjMIpS1
 4NYBnhvTaNGwHdAqoh9vybqmMNd4TwIhc2AaUbwggEckiBvFWQ5H4U+gz
 w9PzS8/IDooEuJ+qkevBdmbyaRFrUqNft7RdyMJXHX6lPQoBIasLmQyJR Q==;
X-CSE-ConnectionGUID: j25zb50zSnO+4Oj7n6GIjQ==
X-CSE-MsgGUID: wetwOHXiS8mTfpmNjRCQFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="110383"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="110383"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 08:00:45 -0700
X-CSE-ConnectionGUID: tuFEadxmSq6MuUMCm5XWug==
X-CSE-MsgGUID: W5O2OKsiR3Go2xBil22BcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="272447206"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 08:00:44 -0700
Date: Fri, 11 Sep 2026 17:00:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Subject: Re: [PATCH v6 3/3] intel-ci: add xe_pm sysfs coverage subtests
Message-ID: <20260911150041.jaeoidaasycfjljc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com
References: <20260911071409.56112-1-shivtej.eknath.patil@intel.com>
 <20260911071409.56112-4-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911071409.56112-4-shivtej.eknath.patil@intel.com>
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
On 2026-09-11 at 07:13:33 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
> 
> Add the newly introduced xe_pm sysfs coverage subtests
> to xe.pm.d3cold.testlist so they are executed by CI.
> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel-ci/xe.pm.d3cold.testlist | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
> index 783859fc7..e240fe7fb 100644
> --- a/tests/intel-ci/xe.pm.d3cold.testlist
> +++ b/tests/intel-ci/xe.pm.d3cold.testlist
> @@ -9,3 +9,9 @@ igt@xe_pm@d3cold-mmap-system
>  igt@xe_pm@d3cold-mmap-vram
>  igt@xe_pm@d3cold-mocs
>  igt@xe_pm@vram-d3cold-threshold
> +igt@xe_pm@vram-d3cold-threshold-show
> +igt@xe_pm@vram-d3cold-threshold-store
> +igt@xe_pm@lb-fan-control-version-show

Please keep it sorted aplhabetically.

> +igt@xe_pm@lb-voltage-regulator-version-show

Same here.

> +igt@xe_pm@auto-link-downgrade-capable-show

Same here.

> +igt@xe_pm@auto-link-downgrade-status-show

Same here.



Regards,
Kamil

> -- 
> 2.43.0
> 
