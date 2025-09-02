Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6C6CA1005
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 12:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580B110E6B3;
	Tue,  2 Sep 2025 12:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTM7U24d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6903110E6B3
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 12:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816360; x=1788352360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6q9zpMKRLRiDROwTn14GFwGdmg2MKFIU3FsLXp15GHA=;
 b=DTM7U24dNCdt/W+GAR1IOykj1/MaDhBix71ej70O8QRHr8HHGLWVRtuC
 bx553esPLrY8517v+Ylokrbvrv377wrbc+AhSiyAAfESLA5eVRqEdDpXa
 eiZESTmd46GXChP0slXiUo16jzEN6ltkfG2zGPRA6+sttMgIB93D/troo
 3fbkjcv87x4qgnpgrBhaXCSD6binBCW78Hr9SJOriBBqtejltqbxVBZZv
 4PllhoutVzC/QdBGckuENmhelU9Tdna8NwD2iSufUFIm0OXCXRFvtTcKI
 5qzYsn2F04UkvWEZdE+mOQsCNyOJSE4LZvv3LAlTyUTTZWKr0Pkj6T3gw A==;
X-CSE-ConnectionGUID: JEwnk7uXQcuuCS9F1lWVnQ==
X-CSE-MsgGUID: Oyh9lbvLTFq4Y9SdfFy9dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70517421"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70517421"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:40 -0700
X-CSE-ConnectionGUID: vvc0y49mS12cDo9zG69s2g==
X-CSE-MsgGUID: 3A3tT/miShOAmR1st5Ym/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171153349"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:38 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 6/7] tests/xe_eudebug_online: Introduce
 SIGINT_DURING_TEST flag
Date: Tue,  2 Sep 2025 14:32:02 +0200
Message-Id: <20250902123203.4907-7-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
References: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
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

Introduce SIGINT_DURING_TEST flag for set-breakpoint-sigint-debugger
test, use it to disable igt_vlog calls from xe_eudebug_ack_ufence in
ufence_ack_set_bp_trigger. This allows for deadlock avoidance caused by
sporadic timing of SIGINT during igt_vlog.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index c505b3082..d48f6a724 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -40,6 +40,7 @@
 #define SHADER_PAGEFAULT_READ		(1 << 14)
 #define SHADER_PAGEFAULT_WRITE		(1 << 15)
 #define FAULTABLE_VM			(1 << 16)
+#define SIGINT_DURING_TEST		(1 << 17)
 #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
 #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
 #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
@@ -1391,7 +1392,7 @@ static void ufence_ack_set_bp_trigger(struct xe_eudebug_debugger *d,
 
 	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
 		set_breakpoint_once(d, data);
-		xe_eudebug_ack_ufence(d->fd, ef);
+		__xe_eudebug_ack_ufence(d->fd, ef, !!(d->flags & SIGINT_DURING_TEST));
 	}
 }
 
@@ -2565,7 +2566,9 @@ igt_main
 
 	test_gt_render_or_compute("set-breakpoint-sigint-debugger", fd, hwe)
 		test_set_breakpoint_online_sigint_debugger(fd, hwe,
-							   SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
+							   SHADER_NOP |
+							   TRIGGER_UFENCE_SET_BREAKPOINT |
+							   SIGINT_DURING_TEST);
 
 	test_gt_render_or_compute("breakpoint-not-in-debug-mode", fd, hwe)
 		test_basic_online(fd, hwe, SHADER_BREAKPOINT | DISABLE_DEBUG_MODE);
-- 
2.34.1

