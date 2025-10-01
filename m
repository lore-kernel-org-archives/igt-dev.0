Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5192CCA472
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 11:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1BB10E6C2;
	Wed,  1 Oct 2025 11:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XuFr3Gyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7631710E6DA
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759319726; x=1790855726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cL44Wp0XDlpaiVXR+t/3pIA+z/jJEi7D2nvLWoO66II=;
 b=XuFr3GyyckyrQvI0kMA4c/NrBrpCEQzveGEf6PGs3T43yBKQoMkHntgW
 6kb+d2PVL0sk+qKnWycXUBxBNOGshs2OMAmSEP2+zG+GeM1aRHaCWUgW/
 L71fedKc7m7UPrem1waO3BF0Y/D3LxOgt73AeVpIL+7aT79GWJz4xbf5m
 YMSqkBFH3KNx6m80dVd14cvcPD1rsr4nz1F2N2neuP8usgcVZgWsDc9im
 qSELkms3HuskChFeLPU1VbMf/gu0yNrBUvaz4T34A9pLYY6YRP5pT0LIQ
 6svIKzJ0xupDEwrUFIwwZBvc0ei+oARcE6wQa7/l6GFyLx12+r0ZhkJJf A==;
X-CSE-ConnectionGUID: SSl7EdQpQx6hrT2vxOfLuA==
X-CSE-MsgGUID: c8cF1nprR+aGNFWvJiYccQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73014997"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="73014997"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:26 -0700
X-CSE-ConnectionGUID: E6BOuwjxTNqnolEliPa6pw==
X-CSE-MsgGUID: oTCDcS0NRDOqFXis3y52fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="209496266"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 04:55:24 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v9 i-g-t 10/10] tests/xe_eudebug_online: Issue SIGTERM in
 set-breakpoint-sigint-debugger
Date: Wed,  1 Oct 2025 13:54:47 +0200
Message-Id: <20251001115447.11843-11-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
References: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
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

Issue some SIGTERM signals in quick succession before SIGINT to raise
the odds of hitting the ioctl.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index e388ea888..4c6c31da3 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -65,6 +65,8 @@
 #define CACHING_POISON_VALUE	0xcafedead
 #define CACHING_VALUE(n)	(CACHING_INIT_VALUE + (n))
 
+#define SIGTERM_COUNT		50
+
 #define SHADER_CANARY 0x01010101
 #define BAD_CANARY 0xf1f1f1f
 #define BAD_OFFSET (0x12345678ull << 12)
@@ -1600,6 +1602,14 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 		else if (event_count > 0 && event_count < events_max)
 			sigints_during_test++;
 
+		/*
+		 * Issue some SIGTERM signals in quick succession before SIGINT
+		 * to raise the odds of hitting the ioctl
+		 */
+		for (int i = 0; i < SIGTERM_COUNT; i++) {
+			xe_eudebug_debugger_kill(s->debugger, SIGTERM);
+			usleep(rand() % 1000);
+		}
 		xe_eudebug_debugger_kill(s->debugger, SIGINT);
 		/* Don't close debugger fd before it dies */
 		while (!s->debugger->handled_sigint)
-- 
2.34.1

