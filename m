Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F0ECAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 10:45:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD58310E7B8;
	Thu,  2 Oct 2025 10:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lf/ZqWER";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AD610E7C4
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759401916; x=1790937916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cL44Wp0XDlpaiVXR+t/3pIA+z/jJEi7D2nvLWoO66II=;
 b=Lf/ZqWERoiW95o9B81rFsgO9GraQBwSJQSz7JWoVkD/HCnu7fWLQDe8i
 cMl5by09Airdf/Z+gpmtYGSLnevl7izyz70h+096NLFU7pQOxYzaM7EqB
 CYgmBd+SPZoPvrS36ulN7naahfGfLNdvvhya/0hb/ou6mOMrfBEF+msQz
 j0K2BPvHl0BkcetBnjj/hPXHdYFZmScV4gZUknb9FCutuhY2aqD9HeC77
 Nn8JFsXXGpxQolFoQngQ//EZfY/J60/kRbh/Men3QYVuqLdias9IiOwLx
 W8eXmqANm3YPB4D6NCX6RNaPALVnjk1O/ILTOmPKrbBwu/wpW3nvx5+CI A==;
X-CSE-ConnectionGUID: CV6N3PatSx6uxf3MBBCCIQ==
X-CSE-MsgGUID: 8WbdaELfQW6cFCOAimDcpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60895289"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="60895289"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:45:15 -0700
X-CSE-ConnectionGUID: w0EK7e5VQHmP4iWx57KNBg==
X-CSE-MsgGUID: VGjhcBwzQ5WGtWquTdIkOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="184213269"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.176])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:45:14 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v10 i-g-t 10/10] tests/xe_eudebug_online: Issue SIGTERM in
 set-breakpoint-sigint-debugger
Date: Thu,  2 Oct 2025 12:44:43 +0200
Message-Id: <20251002104443.7021-11-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002104443.7021-1-dominik.karol.piatkowski@intel.com>
References: <20251002104443.7021-1-dominik.karol.piatkowski@intel.com>
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

