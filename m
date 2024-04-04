Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42401CD1284
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 05:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15DF10E4EF;
	Thu,  4 Apr 2024 05:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZszoiYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0037F10E4EF
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 05:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712210072; x=1743746072;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qpU3cgSvjyEwo//lgn3DMJnp74rL26L+SLzKW7nUZuw=;
 b=eZszoiYDSHSMfJcpaZj8a9yRxqGZBfERI7mVesz3ZGO6p3L8FA3d/PaC
 /3z7uuSU8nZaWBtAjrrgs9MLY4j/wZKoJwb3mB0ARi0Fc2h5zmLjF+3bI
 vpGE8SXVatPLw6ZfILgYTDXvAuJbYnJmkUjdiyhXA1PYlJuwRy9VXfGSO
 1KCuswDtWxl7bL3gKbCHaXu33xGoJQEOpB5nRfIrXr6K+RKw2ELh0xdYY
 1a7RNvZzILHjoq7nDO65hPeDXnq1Cn4witY6XRpj7k8ggvUquW03ip1We
 WAPU0eItmBHor8HFK1Z9eRSx7wa7NCklNJcD2AV69VNyrHbN1vra9Rj6h Q==;
X-CSE-ConnectionGUID: VH1q7/beRvutuzuT6oZz7Q==
X-CSE-MsgGUID: fgM4P0h2REKYZDVIYA+rOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7342801"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7342801"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 22:54:32 -0700
X-CSE-ConnectionGUID: +d07vjoqSDme9Y38s3zkSQ==
X-CSE-MsgGUID: Z3mYLN8JTmG40Z8tA5gGww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="18707576"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 22:54:31 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com,
 zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t 0/2] Update compression check based on platform
Date: Thu,  4 Apr 2024 10:52:33 -0700
Message-Id: <cover.1712252787.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In Xe2+ platforms, we need to run the xe_ccs test regardless of the status of
flat-ccs.
Check if the platform supports compression and has flat ccs enabled,
and if it doesn't, then update the check on compression
and proceed with the test.

Akshata Jahagirdar (2):
  lib/intel_blt: Add helper function to ensure platform has flat-ccs
    enabled
  tests/xe_ccs: Update compression check based on flat-ccs enablement

 lib/intel_blt.c      | 14 ++++++++++++++
 lib/intel_blt.h      |  1 +
 tests/intel/xe_ccs.c |  8 +++++---
 3 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.34.1

