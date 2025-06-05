Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE15C5AE59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 18:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06AD10E162;
	Thu,  5 Jun 2025 18:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3qgcDzi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A652610E162
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 18:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749149288; x=1780685288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ljh4nzqLBF7MKQNZaCbQktqgBftR28KBHz5RWI2QLno=;
 b=T3qgcDzi3j2baGrM1LlToZQk3GzLt4BOde8DRQt+xPSGxHOvvRCyyUnu
 pSdwifHqrIBxPJToajeCfj3/7DUUvIo9IKk3zeCLhlzyAMGUvi/UwhcYD
 MQX5CH7pgp7pQIqDOzN115bn5XNvSqa6FlZ/0laxliuUhV9KIwDu7fLWN
 Hb0vBXd2Nuf91Q33Nd58QIBLMnX1DMcp7Z4zOpvVTF7lWHc0hp1ebWoXT
 P448MgHuJOohMX8qVqn6M5u8CSxS6qY13kefUpJnh7Fcqso6636Ogf7o4
 yFaLf7TYBmE20iXXc2TuL9ZFD3MWs472K/k3divJd4UPRbYrM7Va7x2UR w==;
X-CSE-ConnectionGUID: gTERhSK6Sz2zAgagkXirEQ==
X-CSE-MsgGUID: Vv9W3CYMTvK7n0a+G1kzmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38916806"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="38916806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:48:08 -0700
X-CSE-ConnectionGUID: Ah50ghpMTnCS1uupL6KTPw==
X-CSE-MsgGUID: 6ln2VsrGRTSdB3Dx4aXrzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="182782989"
Received: from opintica-mobl1 (HELO localhost) ([10.245.244.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:48:07 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t] tests/intel/gem_eio: Fix SIGABRT in kms subtest
Date: Thu,  5 Jun 2025 20:48:01 +0200
Message-ID: <20250605184801.118619-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

Subtest kms runs display helper in a separate process, which in
turn prepares patterns for screen and there makes additional
checks resulting in skip. This leads to a SIGABRT as igt_core
require all such skips in main process, not in child.

Add this check before starting a kms subtest, also move other
skip checks into one place.

Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13658
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_eio.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index b65b914fa..d6384efe2 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -1188,14 +1188,17 @@ igt_main
 
 		igt_fixture {
 			igt_device_set_master(fd);
+			intel_allocator_multiprocess_start();
+		}
 
+		igt_subtest("kms") {
 			igt_display_require(&display, fd);
 			igt_display_require_output(&display);
-			intel_allocator_multiprocess_start();
-		}
+			if (!gem_has_relocations(fd))
+				igt_require(gem_has_contexts(fd)); /* for display_helper() */
 
-		igt_subtest("kms")
 			test_kms(fd, &display);
+		}
 
 		igt_fixture {
 			intel_allocator_multiprocess_stop();
-- 
2.49.0

