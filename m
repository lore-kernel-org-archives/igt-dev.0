Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCE9E65D2C
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 07:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D9910E049;
	Fri, 22 Nov 2024 07:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrv0gDsA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEAA10E049
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732260580; x=1763796580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X8pbbbLhyPQXiAcPL9PWgrHLk/GudkmNLJTH1dZQtX4=;
 b=nrv0gDsAIBcTodvt0qqfEA1m65kFEtAAge4EuDsYFQjuSaH7o/01ILhI
 64kR6HEdMVeX2CFo8Kt4brhJKVQpVoWISF42tYmWUDszwWhCC9WkjjY7s
 KI/7CJESqH10LOya3Kff5qScs3auMPrS9wTP7fFuW0PuYrkFIn3f2BTom
 F5VreQutNmzdfSak3VazeDOUoxcvlAt2CQkdb5fr77fy5r1B5/c6tEJL8
 178/b3/p94Q3i2fiLjdKVNOYwWmP+oCqNkUHvO/BNgJYX8QO3738K9sG6
 ds21t1OrCicyRWkGrsttxpxi/jSKq3+XKyPERjXE64rWWSrCSSOySbKy7 Q==;
X-CSE-ConnectionGUID: U390mq4OSX2VauHlg+TVEw==
X-CSE-MsgGUID: wNKJ6AvwRaCv+tdlHVn1qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32558934"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="32558934"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:29:40 -0800
X-CSE-ConnectionGUID: R6Gqq0nZQ9yHzxOoYf6LPQ==
X-CSE-MsgGUID: mt8W7ejuRvCrk/O4w3TOjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90868242"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:29:39 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v6 6/6] tests/gem_gpgpu_fill: Add offset-16x16 subtest
Date: Fri, 22 Nov 2024 08:29:04 +0100
Message-Id: <20241122072904.164247-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122072904.164247-1-zbigniew.kempczynski@intel.com>
References: <20241122072904.164247-1-zbigniew.kempczynski@intel.com>
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
---
 tests/intel/gem_gpgpu_fill.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index ec34e95844..961e075d08 100644
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

