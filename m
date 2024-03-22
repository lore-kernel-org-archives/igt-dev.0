Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71790C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 07:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC88610ED5B;
	Fri, 22 Mar 2024 07:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3fYRm+X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4080810F04A
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 07:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711093417; x=1742629417;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W44H9zfSjK1Lrq2wTK4HF2ioDnVKNWyv7FXg91juvQs=;
 b=K3fYRm+XUMBlHExPHu61aj5t77lHGQrQmgmmnXDw6cIK1iT8HySM5MW+
 5oNxGI1WIF8e9nfmVV2xIeex/x9KZ4KFwynCZGasG2k3xTxzYnFzVTMVZ
 p6SmMBz9hAEoiAUZrkbkn+C0G/YbfhHMxvGKXRAdw8O/YjCQMEG3zTFTP
 wIWz+zCYpb1C5YbTraywh6IQVLgfXG8p5vkoebGDqqb8MN9h7kadZSBF4
 fdXPEmgFKNGcouGS5Kv6pujOtIi78ejzG9dXSewV6tNgVPrb/OCLWNyi2
 dw7Xvbyfk8dW7fbWTWpabwV7WRSqj0X4S6zhLQvvhZllsOu953CDt9bRJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16764799"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="16764799"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 00:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="14810674"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 00:43:35 -0700
Date: Fri, 22 Mar 2024 08:43:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Antonio Argenziano <antonio.argenziano@intel.com>,
 Tony Ye <tony.ye@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 10/24] tests/intel: Introduce Firmware subcategory
Message-ID: <20240322074332.x2ss63lx6pspdmjf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Antonio Argenziano <antonio.argenziano@intel.com>,
 Tony Ye <tony.ye@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
 <20240321153847.1787625-11-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240321153847.1787625-11-katarzyna.piecielska@intel.com>
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
On 2024-03-21 at 15:38:33 +0000, Katarzyna Piecielska wrote:
> Let's put huc & guc tests under Firmware subcategory.
> 
> v2: Let's introduce Firmware subcategory and put there GUC and HUC related
> tests.
> v3: Make Sub-category/Functionality/Feature unique values. (Kamil)
> v4: change functionality name s/HUC/huc copy/
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Antonio Argenziano <antonio.argenziano@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/gem_huc_copy.c  |  5 ++++-
>  tests/intel/i915_selftest.c | 12 ++++++++----
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/gem_huc_copy.c b/tests/intel/gem_huc_copy.c
> index 246fa0a8b..a5b891247 100644
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
> + * Functionality: huc copy
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
