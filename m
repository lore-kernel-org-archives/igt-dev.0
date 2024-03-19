Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4A8C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 17:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA8410ED74;
	Tue, 19 Mar 2024 17:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuWVZUvI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD9110FBFB
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710868637; x=1742404637;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DTlsbUcH7nAmtL2r0iLj0ZCFE6ipUQSr+li7BiqXDK8=;
 b=HuWVZUvIazqhGRHfTH47ocQwQRkucmatHuBSN7w/YcH1rWJ8nL0Tms9I
 YjijC03jF/5Sa0/1/oMnzffei4ZnWiflIu2Zch5Dsroh5s8eCR5jh9aRJ
 SwNVbhgmgscB1OXbSJJeaNhVn36Ld3Y8iIO4Bjq+OHP4U43Tnq70MxhUY
 6s2OPQCbOL3e2f/SGppDY73pVylq31gA3q/LHLpa9mfi0jGsv+M+3CJCW
 wvpJbTAaUlwhFa6JsmLMiPqQnIJNfIpZoD+qpvvuxzKrW8asDqAGRCb14
 oOpj8LfTQeLE8SViAa4yLTEVv4thz/wJTaGOwEF4w9++Bls7qpJZWHF+I w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="6362411"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="6362411"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 10:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="14537579"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 10:17:15 -0700
Date: Tue, 19 Mar 2024 18:17:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Antonio Argenziano <antonio.argenziano@intel.com>,
 Feng Qi <feng.qi@intel.com>, Tony Ye <tony.ye@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 11/25] tests/intel: Introduce Firmware subcategory
Message-ID: <20240319171712.z4qigrfeoumbxvoc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Antonio Argenziano <antonio.argenziano@intel.com>,
 Feng Qi <feng.qi@intel.com>, Tony Ye <tony.ye@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-12-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314143455.1436688-12-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-03-14 at 14:34:41 +0000, Katarzyna Piecielska wrote:
> Let's put huc & guc tests under Firmware subcategory.
> 
> v2: Let's introduce Firmware subcategory and put there GUC and HUC related
> tests.
> v3: Make Sub-category/Functionality/Feature unique values. (Kamil)
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Antonio Argenziano <antonio.argenziano@intel.com>
> Cc: Feng Qi <feng.qi@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gem_huc_copy.c  |  5 ++++-
>  tests/intel/i915_selftest.c | 12 ++++++++----
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
> index 246fa0a8b..bacc03966 100644
> --- a/tests/intel/gem_huc_copy.c
> +++ b/tests/intel/gem_huc_copy.c
> @@ -38,7 +38,10 @@
>  /**
>   * TEST: gem huc copy
>   * Description: A very simple workload for the HuC.
> - * Feature: huc
> + * Feature: firmware feature
> + * Sub-category: Firmware
> + * Category: Desktop client
> + * Functionality: HUC

Why not "HuC copy"?
In tests/, run: grep -ri ": huc" *

intel/xe_huc_copy.c: * Sub-category: HuC
intel/xe_huc_copy.c: * Functionality: HuC copy
intel/xe_huc_copy.c: * SUBTEST: huc_copy
intel/gem_huc_copy.c: * Functionality: HUC
intel/gem_huc_copy.c: * SUBTEST: huc-copy

Regards,
Kamil

>   * Run type: BAT
>   *
>   * SUBTEST: huc-copy
> diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
> index bb0e844e9..2c5f6bce2 100644
> --- a/tests/intel/i915_selftest.c
> +++ b/tests/intel/i915_selftest.c
> @@ -192,25 +192,29 @@
>   * SUBTEST: live@guc
>   * Category: Selftest
>   * Feature: GuC
> - * Functionality: Guc specific selftests
> + * Sub-category: Firmware
> + * Functionality: GUC
>   * Test category: GuC
>   *
>   * SUBTEST: live@guc_doorbells
>   * Category: Selftest
>   * Feature: GuC
> - * Functionality: Guc specific selftests
> + * Sub-category: Firmware
> + * Functionality: GUC
>   * Test category: GuC
>   *
>   * SUBTEST: live@guc_hang
>   * Category: Selftest
>   * Feature: GuC
> - * Functionality: Guc specific selftests
> + * Sub-category: Firmware
> + * Functionality: GUC
>   * Test category: GuC
>   *
>   * SUBTEST: live@guc_multi_lrc
>   * Category: Selftest
>   * Feature: GuC
> - * Functionality: Guc specific selftests
> + * Sub-category: Firmware
> + * Functionality: GUC
>   * Test category: GuC
>   *
>   * SUBTEST: live@hangcheck
> -- 
> 2.34.1
> 
