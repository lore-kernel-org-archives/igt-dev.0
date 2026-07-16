Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2CDC44515
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 18:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF7210E3AA;
	Thu, 16 Jul 2026 18:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UtBDWXEt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A157F10E3AA
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 18:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784226924; x=1815762924;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bJmcRY4HHLbXa6GuKmFnoLYXlBkgfHkrXOS5JkuVuLc=;
 b=UtBDWXEtJXsOVsYeCxcYzBDUgCTNj84lUKu9be27eK/RNj+t14/fhMi5
 WtXwekI4v9SolFvvH6j2crMkVUA0VYE7vrMDSHf/vW9ox5OcL277JG8lU
 kgKg4cTqCfWRthzIZ8SWag1CUIFDcLcWVbYC6FIC8/AEgDUy07f3pA2vu
 o6AVJFmi9IZ5y1WYg+ck1qfkBYGLHUZakmi55+h0Xt+iAUyOJ4BcGJU9Y
 F/HW0mhRfVdtKmoOBgjuOaH2e7gmruXnyKeUW5ovZNYAYyfmekGxZnEO6
 F4YcvSqW4fkqXN/UJSngXsuotTLuXgdaz4qSN8KtYj8iVab4IfoH7mU0E A==;
X-CSE-ConnectionGUID: 5a2J6GAkQ0izt2NAcAWTRA==
X-CSE-MsgGUID: gxCAaZxpSueqZkCzrrBB1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="87444710"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="87444710"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 11:35:23 -0700
X-CSE-ConnectionGUID: 9ifnjeFWQA+bCSmCcEC32g==
X-CSE-MsgGUID: HTJmMRb5SqiW2/DmhDQ96w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="253182229"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:35:22 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] intel-ci: remove dc3co-vpb-simulation from NVL blocklist
Date: Fri, 17 Jul 2026 00:14:22 +0530
Message-Id: <20260716184422.3255515-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Remove simulation-only kms_pm_dc subtest from the NVL display blocklist.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/xe.nvl.display.blocklist.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
index e6390d16b..d44c4030f 100644
--- a/tests/intel-ci/xe.nvl.display.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
@@ -81,7 +81,6 @@ igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
 ##############################################################################
 # Valid skip: Simulation specific
 ##############################################################################
-igt@kms_pm_dc@dc3co-vpb-simulation
 igt@kms_simulation_hpd@sim-hpd
 ##############################################################################
 # Valid skip: Mei interface not supported MTL+
-- 
2.25.1

