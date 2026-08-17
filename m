Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAC2C5B572
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 15:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF2010E839;
	Mon, 17 Aug 2026 15:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHjKQqES";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0854A10E839
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 15:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786979664; x=1818515664;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hOmDPVm2FEnXP4Y3WnzP2O7HoRr1umNTa81OfMqcgPc=;
 b=EHjKQqES2ggcEGuQ84G+V3At/u1MIGLOq9riPhpk/FopSxLjUUAvQtZh
 CgD7HrbfZdhS5ybAs3ma1UrIH6XchzjL02m8qQmsjJ2lwMI3V94akLl0x
 jc9W/Rl2ol0NlkEvlFQLWfoSvglX6QXApnpDbh9lAnzcBzHKAJoJYFzaB
 1fInNBimv+Lhc9rcTOlokv/eAG6OHTy3AQpxcxzvqRCYb2SBmziA1ZUSn
 iFvaloR6UAfz1a5vUWVBl8jZSfC1ejsWUMw23e0JntVSX2iQlGMASuTJU
 qj0TJ8wdRWx6ym7ayp5IFC5Bt4AWkHAQk/ms7UUjUiF0fZiBjAbadmXU9 A==;
X-CSE-ConnectionGUID: WdhN9Kw4T0SCv59KkpJd+g==
X-CSE-MsgGUID: hGipDu9fT2SF1wXWcY/8RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87476827"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="87476827"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 08:14:23 -0700
X-CSE-ConnectionGUID: mnO8XgoTRj6zNLa6aUPtrQ==
X-CSE-MsgGUID: tZG9Y2D4StSgQPR31np2gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="270142311"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa005.fm.intel.com with ESMTP; 17 Aug 2026 08:14:22 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH] tests/intel/xe_wedged: ignore expected fault/CAT dmesg in
 wedged paths
Date: Mon, 17 Aug 2026 15:14:21 +0000
Message-ID: <20260817151421.528272-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

The wedged test flow intentionally triggers hang/reset behavior that can
emit a known multi-line fault dump and CAT error in dmesg during
wedged-mode-toggle and related wedged scenarios. Updated existing
test to extend ignore_wedged_in_dmesg with regex patterns that match:
1. Tile/GT fault header and fault detail lines (ASID, faulted address,
fault type, access type, fault level, engine class/instance)
2. Fault response: Unsuccessful -EINVAL
3. Engine memory CAT error line

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_wedged.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index e1ac629ca..9281fbdb0 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -35,7 +35,18 @@ static void ignore_wedged_in_dmesg(void)
 				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
 				    "|GT[0-9A-Fa-f]*: Failed to submit"
 				    "|Modules linked in:"
-				    "|__pfx___drm_");
+				    "|__pfx___drm_"
+				    "|Tile[0-9]+: GT[0-9A-Fa-f]*:$"
+				    "|[[:space:]]+ASID: [0-9]+"
+				    "|[[:space:]]+Faulted Address: 0x[0-9A-Fa-f]+"
+				    "|[[:space:]]+FaultType: [0-9]+"
+				    "|[[:space:]]+AccessType: [0-9]+"
+				    "|[[:space:]]+FaultLevel: [0-9]+"
+				    "|[[:space:]]+EngineClass: [0-9]+ [a-z]+"
+				    "|[[:space:]]+EngineInstance: [0-9]+"
+				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
+				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error \\[[0-9]+\\]:"
+				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+");
 }
 
 static void force_wedged(int fd)
-- 
2.43.0

