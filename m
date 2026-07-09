Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C43C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 05:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03E910E2A2;
	Thu,  9 Jul 2026 05:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMwpoSUq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAEC10E02B
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 05:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783575641; x=1815111641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wR7Tr+TnJ/y55Xc4CML39f1mNbhPAKklF17+O8uTAeQ=;
 b=RMwpoSUq9ifdh8P3EzqfBQ7M0U0Co0YwPAsO38rWDzX/W7KZrHUR7nPJ
 xbdJwzk9YJpZ1Z0M/3xp9j26HPYXm8oGB1QEH0qrD4Wac3B1icN+29zmO
 Mttpxw2L6EUmsoRKW8WQ9Ro0JYE9WsrJV44nhXUqeLuWgJQ3km2xBKvDR
 SaLuNUXx1zzpJLT1pEiphah3hqPQQ4Y5Y01oDSNrqvxnls3UFSzA94/70
 TUHQ2joyvq0W3rEbt2UbzV1bLXLk+qTH53RKOAphU6Th6GZAw3XZfY4ZQ
 BKYPng7+bZ8xtD8Wro4h5kzWjR7LE1MHsAu0QP4eM7fvxhOsAchQjSlQf w==;
X-CSE-ConnectionGUID: LSONgyVyTpaUTUXEjtqU5g==
X-CSE-MsgGUID: pLG37adHQmGEL2vYxB6J4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88162271"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88162271"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 22:40:41 -0700
X-CSE-ConnectionGUID: C2QYebvQQ/2CaaqraLdojA==
X-CSE-MsgGUID: 3HxnXJ9lRY2wq725Qn0ztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="284576071"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 22:40:39 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 2/2] tests/intel-ci/: Blocklist chamelium tests
Date: Thu,  9 Jul 2026 11:23:49 +0530
Message-ID: <20260709055349.66437-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260709055349.66437-1-pranay.samala@intel.com>
References: <20260709055349.66437-1-pranay.samala@intel.com>
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

Add chamelium test to BMG, LNL, PTL blocklists.
This is a valid skip for display version <= 35.

v2:
- Add NVL specific test in other blocklists (Swati)

v3:
- Split the patches (Kamil)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
 tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index 4c2a7390a..18712fb86 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -181,3 +181,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
 igt@kms_pm_dc@dc3co-.*
 igt@kms_vrr@lobf-dc3co
 ########################################
+# Valid skip :- For display ver <= 35
+########################################
+igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
+########################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
index 1dbb24ae3..491d2b512 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -191,3 +191,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
 igt@kms_pm_dc@dc3co-.*
 igt@kms_vrr@lobf-dc3co
 ########################################
+# Valid skip :- For display ver <= 35
+########################################
+igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
+########################################
diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index 1041931a1..584114ff6 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -182,3 +182,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
 igt@kms_pm_dc@dc3co-.*
 igt@kms_vrr@lobf-dc3co
 ########################################
+# Valid skip :- For display ver <= 35
+########################################
+igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
+########################################
-- 
2.53.0

