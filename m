Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEF5C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 05:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97E510E0CD;
	Mon, 12 Aug 2024 05:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y10j2aLm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001E210E0CF
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 05:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723440965; x=1754976965;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EMwFxmcDpX1Fe0RL6JOagfToitXT1jrTNyAyWGCaUXU=;
 b=Y10j2aLmJGt9SMuStj0Rf+XpmMfPS/VIUtn6WauAt5i9OlUsNjVr/vyH
 hatwRk7EdD52XTWmx4ZXcw0V7NU5xH6jEeg0iYN6L1p0SOherZKTqJuHE
 ETQhV4D2CiUsmikeq8xQELhyj+OaZlvAjPe/TleK+iTShcpAyOO/BeUVQ
 OpijkmKrBIMsaGz80YLNnl0qX1fdhe2LEhs+Hh6ecJFVoprsjBleY8wID
 VOQ8Rw2GOJ7TNnkSUdeJQbbc916HEkREBLlfsO8Ak1ce9HhY7rmHpdzfF
 OMv0XsqeNLax6EruC5XYeQ+S3KVMic4zXQDzPzqz4DWc9o59pjDDk7B6i Q==;
X-CSE-ConnectionGUID: pIoiHoJDRgG6wX8CClS5zw==
X-CSE-MsgGUID: 48J53TptTk+q7t8gNuWRNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="25330511"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="25330511"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 22:36:05 -0700
X-CSE-ConnectionGUID: cJ59qfEqRlWxgR1iDu8PoQ==
X-CSE-MsgGUID: Wf335HwhTRyKkpTumxweVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58050432"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by orviesa009.jf.intel.com with ESMTP; 11 Aug 2024 22:36:02 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH] tests/core_setmaster: Handle the test even if cards are
 non-continuous
Date: Mon, 12 Aug 2024 10:54:43 +0530
Message-Id: <20240812052443.12856-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
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

Although most of userspace assumes drm cards to be populated continously,

this assumption may not be always true. After hot unpluging and
repluging of card

the card may be non-continous.  To address such scenarios where the
cards can be non-continous

modify the tweak_perm function to loop all possible
cardnumbers(card0-card255) to confirm are they populated or not.

Problem Description:
The test fails after running the `core_hotunplug@hot*` subtest, where
card0 is missing.
This leads to a failure in the subsequent `master-drop-set-user` test.

Command sequence for reproducing the issue:
- Check available cards: `ls /dev/dri/`
	- Output: by-path  card0  renderD128
- Run the test: `# ./core_hotunplug --r hotrebind-lateclose`
- Check again: ‘ls /dev/dri/’
	- Output after failure: by-path  card1  renderD129
- Run the test: `# ./core_setmaster --r master-drop-set-user`

This failures on both XE and i915 for above sequence.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_setmaster.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 9c2083f66..a2758e2f2 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -116,9 +116,10 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
 	for (i = 0; i < max_perm; i++) {
 		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
 
-		/* Existing userspace assumes there's no gaps, do the same. */
+		/* Userspace cannot always have continuous card0...N due to
+		 * dynamic unloading or removal of cards */
 		if (stat(path, &st) != 0)
-			break;
+			continue;
 
 		if (save) {
 			/* Save and toggle */
-- 
2.25.1

