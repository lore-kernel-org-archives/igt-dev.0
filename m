Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D485CAC5AE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 07:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E7210E9EA;
	Fri, 26 Sep 2025 07:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpN1aNpK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0F010E9FA
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758872911; x=1790408911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=COw2gtG7mLA2iSfoBIqRCCNONyexXx9O69KSp0zDKQc=;
 b=HpN1aNpK34EErtAznSyufZvhvGQx9pwtryg3cJbdHXmPgAFtaANI8naC
 a5DIABIXoLvDEl+Dr/fTp0x3pCaGK1268JIy6z8DY/7sz2dtVlytuoHhU
 m7p0rEmFdA5VE+0/sk1y/d3DzpEF86cz4grcCvNd+7kOfQj3Iljerlhk5
 NQfvi+QOBAzJ8h3oBVzyIDZV28jj8yeWsVyHipjP0ZcR+WJZM1FITw7nY
 o1YwW8Vc4t7yqmt+DzkSDu6hxSiDRzyKmeOjwtG6wnYB9h8fVG+RRKNVU
 3jZqVcaR5r6WH+3AJGj+864AKYXy0KNfNFTUbIkpzxyaY0Z30g2BdOBSk Q==;
X-CSE-ConnectionGUID: +eoLqvw7SEOS4EOHemg8nw==
X-CSE-MsgGUID: X/cc1p/JRFSJukrragS87Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61372392"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61372392"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:28 -0700
X-CSE-ConnectionGUID: 82u3sqiZTeS3R4Dc7GB6kA==
X-CSE-MsgGUID: ZVRUccX7T9SeSzUjEBbQcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="208474256"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:27 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v7 i-g-t 7/9] tests/xe_eudebug_online: Introduce proper sync
 for closing debugger fd in set-breakpoint-sigint-debugger
Date: Fri, 26 Sep 2025 09:47:59 +0200
Message-Id: <20250926074801.9031-8-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
References: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
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

Wait for the SIGINT handling to complete before closing the debugger fd
to avoid tripping over asserts.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 30e661b13..e388ea888 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1601,6 +1601,9 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 			sigints_during_test++;
 
 		xe_eudebug_debugger_kill(s->debugger, SIGINT);
+		/* Don't close debugger fd before it dies */
+		while (!s->debugger->handled_sigint)
+			usleep(1000);
 		close(s->debugger->fd);
 
 		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
-- 
2.34.1

