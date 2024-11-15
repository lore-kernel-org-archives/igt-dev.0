Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD0BD6DDE3
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 13:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E36610E0A1;
	Fri, 15 Nov 2024 13:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8pPl5bY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9040710E0A1
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731678044; x=1763214044;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uq6DlK3Bwm4CRP5TeHskXwFibQY7P4r78qNnVjX5iJs=;
 b=a8pPl5bYMCyhYHvN4sCNPnJwiul7/N/Q/9QWF0BWJeIwraqN1xM1liZi
 v8yfoSi5ETkO2T3UetZLgJozLNPc0lqZlEFCdGweiKMYocf7QPNCGjZbx
 a/CaLXzdmIXuvqXIe/GEFTyus9ejmr3r32blQT4sJ5lvvX34bnR5lKyeH
 xbxvRk2X/z2conTg1LzGgpeUqcw9Qm/emZeMdyAs0ONxQPId3aWgRM06c
 LJQk63XqyRsLbMO5U7AOP/0aRxNEZkqb+LlHsEx58y03XN/Dt2jkoOMQ7
 QW65oh6JIab0t2/l8qzwQmnC+MvOdu0KNIpQPhE8LaW/RwL5B3bDGlDg2 A==;
X-CSE-ConnectionGUID: KEGHCo3KTTmJVf/vHwH/bg==
X-CSE-MsgGUID: movJ4oKFQKyjZquBBob8fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31837491"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="31837491"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 05:40:43 -0800
X-CSE-ConnectionGUID: XA60LK6kTmGYSxwqEbWa9g==
X-CSE-MsgGUID: Cd3rX509TEaMySm6d5dxHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="93647502"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 05:40:34 -0800
Date: Fri, 15 Nov 2024 14:40:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel-ci: Remove xe_bo_shrink_kunit
Message-ID: <20241115134032.gj6pzxxzpx3pswxz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20241114102257.2857826-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241114102257.2857826-1-nirmoy.das@intel.com>
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

Hi Nirmoy,
On 2024-11-14 at 11:22:57 +0100, Nirmoy Das wrote:
> Remove xe_bo_shrink_kunit which takes a while to run on various
> machines. There is no good way to make it faster.
> 
> Also add it to the blocklist so this doesn't executed by non-BAT
> test.
> 
> v2: Add it to blocklist(Matt)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2998
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 3 ++-
>  tests/intel-ci/xe.blocklist.txt          | 4 ++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index d9fb98aab..c263473e0 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -217,7 +217,8 @@ igt@xe_waitfence@reltime
>  igt@core_hotunplug@unbind-rebind
>  
>  # Run KUnit tests at the end
> -igt@xe_live_ktest@xe_bo
> +igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit
> +igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit
>  igt@xe_live_ktest@xe_dma_buf
>  igt@xe_live_ktest@xe_migrate
>  
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index f9ef612c4..b76f6061c 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -29,6 +29,10 @@ igt@drm_buddy
>  igt@drm_mm
>  igt@kms_selftest.*
>  ##################################################################
> +# Exclude slow KUnit test which should run as manual test
> +##################################################################
> +igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit
> +##################################################################
>  # Exclude all other non-Xe tests
>  ##################################################################
>  igt@debugfs.*
> -- 
> 2.46.0
> 
