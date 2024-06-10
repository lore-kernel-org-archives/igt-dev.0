Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBAFC27C55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 11:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E0610E2BC;
	Mon, 10 Jun 2024 11:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9gcxieT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36F710E2BC
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 11:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718020796; x=1749556796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=REYFNRiJhIYExI33Oltgeg+lxQ2aE4ZgekyoZyjWj3Q=;
 b=L9gcxieTJdhsVWldkHtQz76aiTBvy4ewNR9gEfLX5J2UI4+NgKeZWHM4
 w8Tx6Y1yQy2wJPuU3Q5Zg7y7NvnIswOz39cNew3L50QcN3hRWwKLPj9eC
 4UDVu57kHaqoKxY5UMD1qvHR+8oYfyJBdatvaA8ZWJ8AUf14PxvOlNbjG
 WlC29YmeW/VxCicJT+cUmKAe4m+zzI1mJR33u2tCDOH9TMPoHh0BZ2FLj
 NXXAcJAdMctMDkHQsUWxvx5bXunBWP5nMhVjjhss0aqclVoCDzOU2l/RG
 W5+4TcY36uXgXhJzUZC8YajxRO67ZEUn7YugoRt4hUKO9zf5f7pYaZ1rd g==;
X-CSE-ConnectionGUID: jqiNS/zyTkSpt46dvhRZQg==
X-CSE-MsgGUID: bYl90AUoTJKIs8tm1TpmdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14626132"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14626132"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 04:59:55 -0700
X-CSE-ConnectionGUID: 5Ih5AsnIT6eS+ki2mXkAjA==
X-CSE-MsgGUID: g1i3WJjhSHmN+tx0EUYZtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43472014"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.54])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 04:59:52 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v2 0/5] tests/kms_dirtyfb: few fbc related updates
Date: Mon, 10 Jun 2024 14:59:36 +0300
Message-Id: <20240610115941.35279-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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

Add check if the plan size is within FBC enforced restrictions otherwise
skip the test. Some updates to FBC debug prints to make debugging easier.
And disable PSR feature only if psr is supported by the sink

v2: Add a function to get max plane size supported by FBC
    Fix a build isssue by updating the usage of drrmmode info

Vinod Govindapillai (5):
  lib/i915/fbc: print current fbc status if cannot be enabled
  lib/i915/fbc: add fbc frame size check helper functions
  tests/kms_dirtyfb: disable psr feature only if psr possible
  tests/kms_dirtyfb: populate modeinfo before feature support check
  tests/kms_dirtyfb: ensure plane size is within fbc supported limit

 lib/i915/intel_fbc.c      | 61 ++++++++++++++++++++++++++++++++++++++-
 lib/i915/intel_fbc.h      |  2 ++
 tests/intel/kms_dirtyfb.c | 16 +++++++---
 3 files changed, 74 insertions(+), 5 deletions(-)

-- 
2.34.1

