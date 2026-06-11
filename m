Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F84CD98CC
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 14:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F40C10EF5E;
	Thu, 11 Jun 2026 14:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaHJjeqs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21D210E042
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 14:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781187895; x=1812723895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/rtqs/i4ltRg3yo7yQu5Kp2SbhexYXc4zlYwn2z5ZA0=;
 b=ZaHJjeqsOUPCB4QM4bOCIBw/2sQziNNP0BRnzUElM2pE3WNiafEYKekU
 Dk9NCdunS1MweTf3RsfPO+skMP4V9Po3ZCPMzO3egzNUR9Ctj/YCvNgIy
 2FVdraGOOYC5sDs6qT8EHrhp8BPgi5RoWHJ6FQDrD+Cpep//8STRdEh0I
 cUp2OJ2n1SzNUNF/VcUiRRDLavX1Bsf+wsmSqHeIBuoDyOueyAkXryHXy
 Ygc0AeHCEVgcFn7jmyr9ptnkc9kE0cOYRuwQ79ZVZIZEYlso8BW77TTxw
 yH/zMN4Tzs4R+XK/HuDDs7RiDVA3R7RmeEpWr30BnMBOWKbYeyATMspyj g==;
X-CSE-ConnectionGUID: Do/bgGxbQFiWKzfII1j8ew==
X-CSE-MsgGUID: nFUqYQNQQdyBDSkRI+zBEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81743465"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="81743465"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:24:54 -0700
X-CSE-ConnectionGUID: u41M221qSAq7Ccu768NZUA==
X-CSE-MsgGUID: ev2gPukZQ7yY21AuDA/KLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="270511141"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:24:52 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: janusz.krzysztofik@linux.intel.com, lukasz.laguna@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 stuart.summers@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_dummyload: Adapt helpers for Xe
Date: Thu, 11 Jun 2026 16:24:37 +0200
Message-ID: <20260611142438.260647-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611142438.260647-1-marcin.bernatowicz@linux.intel.com>
References: <20260611142438.260647-1-marcin.bernatowicz@linux.intel.com>
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

Adjust dummyload helpers igt_spin_has_started and
igt_spin_busywait_until_started to work correctly
with Xe-backed runs.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
 lib/igt_dummyload.c | 14 ++++++++++++++
 lib/igt_dummyload.h | 11 ++---------
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index cc0b4ac3b..b5ca8f643 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -670,6 +670,20 @@ static void __igt_spin_free(int fd, igt_spin_t *spin)
 	free(spin);
 }
 
+bool igt_spin_has_started(igt_spin_t *spin)
+{
+	if (spin->driver == INTEL_DRIVER_XE)
+		return xe_spin_started(spin->xe_spin);
+
+	return READ_ONCE(spin->poll[SPIN_POLL_START_IDX]);
+}
+
+void igt_spin_busywait_until_started(igt_spin_t *spin)
+{
+	while (!igt_spin_has_started(spin))
+		;
+}
+
 /**
  * igt_spin_free:
  * @fd: open i915 drm file descriptor
diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
index b771011af..e96f72652 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -128,16 +128,9 @@ static inline bool igt_spin_has_poll(const igt_spin_t *spin)
 	return spin->poll;
 }
 
-static inline bool igt_spin_has_started(igt_spin_t *spin)
-{
-	return READ_ONCE(spin->poll[SPIN_POLL_START_IDX]);
-}
+bool igt_spin_has_started(igt_spin_t *spin);
+void igt_spin_busywait_until_started(igt_spin_t *spin);
 
-static inline void igt_spin_busywait_until_started(igt_spin_t *spin)
-{
-	while (!igt_spin_has_started(spin))
-		;
-}
 
 void igt_terminate_spins(void);
 void igt_unshare_spins(void);
-- 
2.43.0

