Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833D9D3B7F0
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 08:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BEA10E5D5;
	Mon, 25 Nov 2024 08:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RatasJwH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503AC10E5D5
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 08:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732523015; x=1764059015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b00ieYk0uh/LfctGGuEnxEZuWqlNlh3niw4TMzzzUp0=;
 b=RatasJwHT02bx/QM9+4FceTp4QQSHrI6tqMZ96fOtAT5KpNgO8W+pWDK
 BQqUkcD4Tsg4KTFxhiDAksLb1muwI25m0dWTgmR20QFOwANqfTsLHObRR
 Tq9gKgtllsm6XbSUl+g5efrTJovV+jGOVhWoJRo62h5bA0f/rjZWd8+E0
 9LTcm0s4vLBgQzdkuTd40dygLqF4m5k+50RkNtG71x/p4QbiAW+ZRzp6x
 a93Rx3OJTAYfbgsEYv9KkUnwJwyU4TscPeB9XvvYodOaKPkAkhnFo/h6v
 yyD1rtzL4gB222SYC/rQSzyZXMVQBpgdZDsJ1Qojni+3JqZj16Z9wRBw4 A==;
X-CSE-ConnectionGUID: E/GWCGbsTf+VBOoUEOFniQ==
X-CSE-MsgGUID: 5Puk+b1cRr6a4MZ/v8+zBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="20206682"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="20206682"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 00:23:34 -0800
X-CSE-ConnectionGUID: upxS8QITQO6QehTwbH1vSQ==
X-CSE-MsgGUID: rdt+SCztTx6L0AZvlTxNxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="96118871"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.224])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 00:23:32 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v7 6/6] tests/gem_gpgpu_fill: Add offset-16x16 subtest
Date: Mon, 25 Nov 2024 09:22:58 +0100
Message-Id: <20241125082258.74889-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125082258.74889-1-zbigniew.kempczynski@intel.com>
References: <20241125082258.74889-1-zbigniew.kempczynski@intel.com>
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

Add subtest which verifies rectangle filled by pattern starts at
offset <x,y> == <16,16>.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/gem_gpgpu_fill.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index ba32a6f318..0e60a49919 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -58,6 +58,10 @@
  * Feature: compute
  *
  * SUBTEST: basic
+ * Description: run gpgpu fill
+ *
+ * SUBTEST: offset-16x16
+ * Description: run gpgpu fill with <x,y> start position == <16,16>
  */
 
 #define WIDTH 64
@@ -239,6 +243,14 @@ igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_subtest("offset-16x16") {
+		gpgpu_fill(&data, fill_fn, 0,
+			   surfwidth, surfheight,
+			   16, 16,
+			   surfwidth / 2,
+			   surfheight / 2);
+	}
+
 	igt_fixture {
 		igt_collection_destroy(region_set);
 		free(region_info);
-- 
2.34.1

