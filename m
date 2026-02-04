Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E3DE83046
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 06:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8844210E18E;
	Wed,  4 Feb 2026 06:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPmHbS7C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D58210E187
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 06:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770187572; x=1801723572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dPCQ2FxN9PNVedBGK2dI2fhca9dbUcYGxEbU8daxFN8=;
 b=BPmHbS7CTCJl974zaCgKpJh7A68pGq5sCjGy2Vcko6UiaCvVfwr7GhcV
 WRqZ0uCUeElo/3tbyDh8XAKVl3APYXPayR6dMSOJm76EXSOv+gyKmypnq
 58AXDvrTuJuPxHqfzlq+3y5pNi61wzslMH36I5NwJCmJly0atv4wumeZO
 I5I80JiTeSsh2OMNi7+57weU09TIn2Wgab+TnSvuyhNpYbAEEEYTbwOsC
 q1Kp4WCpyyzDoAlQfpDzBb80+IimRDvSvL/yiJ2iPS+wdK7OEho8s/o3D
 2j8vC8g587oTMZ+H5kTQNrZpiypC+Vyzro+pmFoqjX5P8JFlUhC+JNDE6 A==;
X-CSE-ConnectionGUID: 9kfM+rtqQ9uLQgcE/bGF7Q==
X-CSE-MsgGUID: gpmg6zBiQYuSprAmqEtJzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82108145"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82108145"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 22:46:12 -0800
X-CSE-ConnectionGUID: Tv3DXPWFQfimu/sMFjGRRQ==
X-CSE-MsgGUID: KlpAToPNSIW/tQ8RTekNWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210152126"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 22:46:11 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 2/3] intel-ci: Add tests applicable after display 35
 to blocklist
Date: Wed,  4 Feb 2026 12:12:11 +0530
Message-ID: <20260204064212.751758-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204064212.751758-1-karthik.b.s@intel.com>
References: <20260204064212.751758-1-karthik.b.s@intel.com>
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

