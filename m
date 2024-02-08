Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4947C48260
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 11:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693FF10E663;
	Thu,  8 Feb 2024 11:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDDW0c9H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D97510E663
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 11:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707391642; x=1738927642;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5sXVdgMBomsCzMQSG5qTPvQF+FcrfeJU4Ameoxrt7VU=;
 b=aDDW0c9HLLWHQkVk+kDRnrSbBgp0t735goobkHgVwjEJvwz7cPk7J/EQ
 OTos5UdcfhxrfZAANbVR2EpGnnp+Z+EgDqELNs8P68MqYMRHcDse5Hkxf
 FeX0iFrbYIjIAKf7u3YVouu9BLmXZI+RpxUxsbb4XT0B7+dgQE/Nou9U8
 KHkwqf295ctUDs2iPwAxNEUiF9YZr8gke+AYTYeyMPxBVXfvRKCJrmC0q
 ciQ+/ucXUf+fN3mKr6Jwnih2v6T3L05srcXQD13fKtIYUkGtLy0IqNA8H
 TMH0As1yrYdHqAn+Wde7gNkNDP4Qsh/m/xjjS08LqtYWbReAx6623y+os A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="5061419"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="5061419"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 03:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1624547"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 03:27:20 -0800
Date: Thu, 8 Feb 2024 12:27:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, mchehab@kernel.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel-ci/xe-fast-feedback: Add xe_mocs
 to kunit tests
Message-ID: <20240208112718.2cmozhey37acrxna@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, mchehab@kernel.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20240207224643.250958-1-lucas.demarchi@intel.com>
 <20240207224643.250958-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240207224643.250958-2-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2024-02-07 at 14:45:01 -0800, Lucas De Marchi wrote:
> xe_live_ktest@xe_mocs was added, but never included in the BAT tests. We
> should really be checking mocs as BAT.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 6c01374c1..82e02e3bd 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -231,6 +231,7 @@ igt@core_hotunplug@unbind-rebind
>  igt@xe_live_ktest@xe_bo
>  igt@xe_live_ktest@xe_dma_buf
>  igt@xe_live_ktest@xe_migrate
> +igt@xe_live_ktest@xe_mocs
>  
>  # Move fault_mode tests at the end to unblock execution
>  igt@xe_exec_fault_mode@twice-basic
> -- 
> 2.43.0
> 
