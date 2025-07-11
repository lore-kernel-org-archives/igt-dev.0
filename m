Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCEEC83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 08:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816B310E3C4;
	Fri, 11 Jul 2025 08:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+5Qygxl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4967610E3C4
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752222440; x=1783758440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dUIgT9vD1/LZ68S19OeL51vj6upuJG3DqdzTW/4qD88=;
 b=K+5QygxlbkxndXCWNWp/nv6RqGX99V8I4ZgRUCrPywm30HdNsmHzahC7
 DfUasT1arAn/rQZ1Rf65+EkgAjA2H8BaV0vGLa3MobyRKblzZm1+L1KP5
 Ew+sEIDrV6QYUXbopqhNKtH2zisaC+buadHCmlF8ppWtqoaX7XgRUNewM
 TqTLGBVcYEz+KoVjtlV3O6cFAz5seDoJZhK79B/I7ZsZ4RBQQdJdnLHW4
 HgV5A4sBz4a2zR8i3O1IwgJnEeaMejSnVWub6RxGJei5ZfYNPcl66HZhn
 DD3guZ2a3N/7V1GSIXKcJ3shFP28x7icNPA3y18SbdWi+MSBVn0BR6gzC A==;
X-CSE-ConnectionGUID: Hl+QtaSBTQ+51RNcKzOfkw==
X-CSE-MsgGUID: vaSA4PktQQ2QHj3UaKQM/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="65579270"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="65579270"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 01:27:19 -0700
X-CSE-ConnectionGUID: A6UrbmlhR/Grao2CK16ecQ==
X-CSE-MsgGUID: gzxpJhJ8SX22VwI0YjEXGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="160328822"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa003.fm.intel.com with ESMTP; 11 Jul 2025 01:27:17 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_plane_cursor: Optimise plane cursor
 behavior on simulation
Date: Fri, 11 Jul 2025 14:05:00 +0530
Message-Id: <20250711083500.1218999-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Reduce the number of cursor positions and limit the
execution only to a single pipe during simulation.

v2:
- Add a message and also shuffle the condition (Santhosh)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_plane_cursor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 1b72515f7..9fa36bfd4 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -237,6 +237,10 @@ static void test_cursor_spots(data_t *data, int size, unsigned int flags)
 
 	for (i = 0; i < ARRAY_SIZE(pos); ++i) {
 		test_cursor_pos(data, pos[i].x, pos[i].y, flags);
+		if (igt_run_in_simulation() && i == 2) {
+			igt_debug("Limiting only to first 3 positions on simulation\n");
+			break;
+		}
 	}
 }
 
@@ -347,6 +351,8 @@ igt_main
 						test_cursor(&data, size, tests[i].flags);
 
 					test_cleanup(&data);
+					if (igt_run_in_simulation())
+						break;
 				}
 
 				test_fini(&data);
-- 
2.34.1

