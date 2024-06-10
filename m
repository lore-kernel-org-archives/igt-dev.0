Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AC4C27C5E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 08:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A30710E35D;
	Mon, 10 Jun 2024 08:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmfXn/G4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA28210E35C
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718006981; x=1749542981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aWcxINnNlP7TTyIaqjsp9Crg2+y0FM5anNLT2gqljms=;
 b=BmfXn/G4wooCr5auQFoPdNG9MpTDIDihVF2nNAGk3NFCZ9G5sxEBulD1
 eEifETHFZdMo/ZBBdOnf0eXO0dCKx+TsrlBtp7A4ShI9gpLNq6Dl826pl
 HtRJy4m6OIhwpIv4s5NRDiVZHoGx7xaoXhFJIqXVsPj1r5Y9tW2qKsfKQ
 YkWvRKUNzXzGvpxqqhUspHoBsXyB/feYP3laMlJ4ZNrmlBu9yNOG7dU0I
 ns2hKqUsVICGhBGUOj+hmFP1cwzX+D0rbdKO2eMy/i7k8/jxRP6VhqViL
 x4staHOmvovn9UPQVUnmV/8ofE/LTkq1eOl3XiL3nlzYPXFsIvlJfB6k4 w==;
X-CSE-ConnectionGUID: VFs0OgoTQmimg6vMZZZY9w==
X-CSE-MsgGUID: VlugWJpATQal8+M5JXkybQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="18439429"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="18439429"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 01:09:41 -0700
X-CSE-ConnectionGUID: QQ2TpE4WTHmC+V4dbM2wbg==
X-CSE-MsgGUID: +nCxJo3ET0au8VWgioJVpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39109804"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 01:09:40 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel-ci: Update blocklists
Date: Mon, 10 Jun 2024 13:31:49 +0530
Message-ID: <20240610080150.3610871-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610080150.3610871-1-bhanuprakash.modem@intel.com>
References: <20240610080150.3610871-1-bhanuprakash.modem@intel.com>
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

As non-Intel tests are moved to different directories,
update the Intel CI blocklist accordingly.

Fixes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11129
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/blacklist.txt    | 12 ++++++------
 tests/intel-ci/xe.blocklist.txt | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 4fdefb90d..45a24a8aa 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -91,24 +91,24 @@ igt@kms_chamelium_frames@hdmi-.*-planes-random
 ###############################################
 # Broadcom
 ###############################################
-igt@vc4_.*
-igt@v3d_.*
+igt@vc4@.*
+igt@v3d@.*
 ###############################################
 # AMD
 ###############################################
-igt@amdgpu/.*
+igt@amdgpu@.*
 ###############################################
 # VMware
 ###############################################
-igt@vmwgfx.*
+igt@vmwgfx@.*
 ###############################################
 # Panfrost
 ###############################################
-igt@panfrost_.*
+igt@panfrost@.*
 ###############################################
 # Qualcomm
 ###############################################
-igt@msm_.*
+igt@msm@.*
 ###############################################
 # Hibernate: not configured correctly on CI
 ###############################################
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index b33b568fa..8bf5b45cc 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -3,14 +3,14 @@ igt@meta_test(@.*)?
 ##################################################################
 # Non-Intel driver tests
 ##################################################################
-igt@amdgpu.*
-igt@msm_.*
+igt@amdgpu@.*
+igt@msm@.*
 igt@nouveau_.*
-igt@panfrost_.*
-igt@v3d.*
-igt@vc4.*
+igt@panfrost@.*
+igt@v3d@.*
+igt@vc4@.*
 igt@vgem_.*
-igt@vmwgfx.*
+igt@vmwgfx@.*
 ##################################################################
 # Exclude all i915 tests
 ##################################################################
-- 
2.43.2

