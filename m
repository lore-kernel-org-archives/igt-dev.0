Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB05CA0FE7
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 14:43:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498FA10E4DB;
	Mon, 25 Aug 2025 14:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQ0sByDc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EED10E4DB
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756132996; x=1787668996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y/uf0n5t/4ygeMIhmFhFUs+72J1SlPASlHIu5Sls/sE=;
 b=gQ0sByDc1EWULV4kJ01DJkbFK7H2cS8bs8HBxM+DJZVSWW8dcZdxn0nS
 aH//ynDnJdjzyR5AxxtS+iiuy4DhAwX5Ukhpf5+U1kK0QTHcME3fNjxms
 bKKF8i9JXNtP6bqcUsKIOgh97pUvh8XPzkGQGkb/2SXoum0Kc/8gnuoaQ
 83HaTEsg0ZfOQJm1IWG/5k1v0LESVVYdLl2oi+5qpM5YvJe2IIrN3SGHa
 7WBWE96d/UUGgc0BheSTzCbN2n9GKSGUbEZjF/csDtb/LCpWKJMSleF+o
 VQ6I1QxvOe7KXN3OYmJfxjnEaVGciL5sqOHZfP5qwmr888DoWIxG2wi9Q g==;
X-CSE-ConnectionGUID: Kp7Nu4ahRwqDFgCiUAeFJw==
X-CSE-MsgGUID: 2LRy7V4MTiGOFHazHQD6HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="57548869"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="57548869"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 07:43:16 -0700
X-CSE-ConnectionGUID: vMCIwbsTR/6G68z5X+plbw==
X-CSE-MsgGUID: B/TA6zf4SLqIIPTFcqc68w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168914758"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 07:43:14 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] intel-ci: Blocklist cursor frontbuffer rendering tests
 on xe
Date: Mon, 25 Aug 2025 20:13:24 +0530
Message-ID: <20250825144324.1585829-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

Blocklist kms_psr@.*cursor-(render|blt) subtests as these are
expected to skip on xe.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 2176764cf..14e0b9482 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -79,6 +79,7 @@ igt@kms_pm_lpsp@screens-disabled
 igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
 igt@kms_pm_rpm@.*pc8-residency.*
 igt@kms_pm_rpm@cursor.*
+igt@kms_psr@.*cursor-(render|blt)
 ##################################################################
 # KMS: Yet to add/missing XE support
 ##################################################################
-- 
2.43.0

