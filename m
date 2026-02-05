Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14559EA795F
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 03:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75AE10E79E;
	Thu,  5 Feb 2026 03:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUoHL4d1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0711610E79E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 03:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770263122; x=1801799122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dPCQ2FxN9PNVedBGK2dI2fhca9dbUcYGxEbU8daxFN8=;
 b=aUoHL4d1BWKmrO2RLKgZiQPjinGmCukC/KRCTFjUT0rEIrOppGVKjmKp
 +06Bt04AMET8cTz6QEy0K+yVA8Br5LvsSrAtENYtyvWjaRD1BqW3SOZDx
 LWI3+msnea7Y9H7xb4j1h5gNE9/YBzjW6NSraLE0+Nc62KWhXJebaH4TW
 iarnWwXhIcg/gufyUmMcR6cWaU2JvMToDpm2GiAozOnSS8CqrTkZiZAzJ
 iuFQItgp/Ji92T+e59J7LPnI8aE15uhlSm+o4ZuBPWue1iWJ6wCdqdt4A
 9hdvY229crmXoix5mAZIy5w+bCJ0qApZisiIlsfhjcqYKsqh4QPoGQfRs A==;
X-CSE-ConnectionGUID: q2XJsbtyTXC5C31NIntjzg==
X-CSE-MsgGUID: 8PzjTUqvQF6xQ/19EbNRYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71353128"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71353128"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:45:22 -0800
X-CSE-ConnectionGUID: CKlR7nseQT+UBY2DQnpUkg==
X-CSE-MsgGUID: nMmIk1KxRKqLtblHsXGwig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214886955"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:45:20 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 2/3] intel-ci: Add tests applicable after display 35
 to blocklist
Date: Thu,  5 Feb 2026 09:11:19 +0530
Message-ID: <20260205034120.793193-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205034120.793193-1-karthik.b.s@intel.com>
References: <20260205034120.793193-1-karthik.b.s@intel.com>
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

Linear-reflect-x modifier and abgr161616f format is valid after
display ver 35. Blocklist these subtest for older platforms.

v2: Update xe blocklists.
    Add kms_frontbuffer_tracking@.*abgr161616f tests

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/i915.blocklist.txt           | 3 ++-
 tests/intel-ci/xe.bmg.display.blocklist.txt | 3 ++-
 tests/intel-ci/xe.lnl.display.blocklist.txt | 3 ++-
 tests/intel-ci/xe.ptl.display.blocklist.txt | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index 583df28e3..1068e2e15 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -204,5 +204,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
 ##################################################################
 # Valid skip :- For display ver >= 35
 ##################################################################
-igt@kms_frontbuffer_tracking@.*argb161616f.*
+igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
+igt@kms_flip_scaled_crc@.*linear-reflect-x
 ##################################################################
diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index 86c1bbd72..04f23af28 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -177,5 +177,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
 ########################################
 # Valid skip :- For display ver >= 35
 ########################################
-igt@kms_frontbuffer_tracking@.*argb161616f.*
+igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
+igt@kms_flip_scaled_crc@.*linear-reflect-x
 ########################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index d280fb16a..82655802a 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -186,5 +186,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
 ########################################
 # Valid skip :- For display ver >= 35
 ########################################
-igt@kms_frontbuffer_tracking@.*argb161616f.*
+igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
+igt@kms_flip_scaled_crc@.*linear-reflect-x
 ########################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index bb5c83f15..d92e9ef35 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -186,5 +186,6 @@ igt@kms_color_pipeline@plane-lut3d-green-only
 ########################################
 # Valid skip :- For display ver >= 35
 ########################################
-igt@kms_frontbuffer_tracking@.*argb161616f.*
+igt@kms_frontbuffer_tracking@.*a(bgr|rgb)161616f.*
+igt@kms_flip_scaled_crc@.*linear-reflect-x
 ########################################
-- 
2.43.0

