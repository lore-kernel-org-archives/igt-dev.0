Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B21C4829E
	for <igt-dev@archiver.kernel.org>; Mon, 12 Feb 2024 21:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5AF10E098;
	Mon, 12 Feb 2024 21:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyEYORjS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A2C10E098
 for <IGT-Dev@lists.freedesktop.org>; Mon, 12 Feb 2024 21:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707773155; x=1739309155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/nc/I27RD1vmAy6Nr8LoG8hZvFrPTQVqIfKWSZ9QT4o=;
 b=QyEYORjSO5W2h8Du1xmyySQip7+lSbt6+SxeL7/+XJLkRpfotJOOhANe
 t3Q2QXiwDAjKFcnSWRA+Ib4vXPSz0AhcF0KCCMa5ZAtXtCgBgCteH8I/I
 Xpz9On/GiItYcwVO/7soWBE6CAoBdXG+AP1+ERYMwX4V4HK72eCQ0NN0O
 EONQIjN/TKMgaFx86saBx9UxutplzGlHq5oQqJn3+mwdhO4fjai4vyJ4z
 rmjdeYA19oCT3HvS1PNNhmqXY5La7TfoW4Y79Q+fOcsHm1ehZb/kD7Tku
 LBhe5OJHZlUjYjBMLGMVFSgXJJ96wpvV14CB9r8W4loOXyNq2LkdJDUfR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19278949"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; d="scan'208";a="19278949"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 13:25:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="2683216"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa009.fm.intel.com with ESMTP; 12 Feb 2024 13:25:54 -0800
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t] tests/intel/gem_watchdog: Reduced timeouts for worst
 case scenario
Date: Mon, 12 Feb 2024 13:23:28 -0800
Message-ID: <20240212212328.3794573-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The watchdog test reduces the watchdog timer from 20s to 1s and then
uses a 5s timeout waiting for the watchdog to do its stuff. This works
fine in general, but if an engine reset is required by a context that
is actually dead for real then a pre-emption timeout must be factored
in. For RCS/CCS engines, that timeout is 7.5 seconds by default. Thus,
the test timeout expires first and the test fails.

Normally, the system is not so dead when running this test as to
require an engine reset. A simple pre-emption works fine for the
spinner contexts that is uses. However, there is a hardware workaround
coming which prevents context switches when both RCS and CCS are busy.

So add an explicit override of the pre-emption timeout as well as the
watchdog timeout. That will allow the test to keep working after the
new w/a lands.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/intel/gem_watchdog.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
index 1e4c350214c0..c9dd0deb51aa 100644
--- a/tests/intel/gem_watchdog.c
+++ b/tests/intel/gem_watchdog.c
@@ -577,6 +577,16 @@ igt_main
 
 		i915 = drm_reopen_driver(i915); /* Apply modparam. */
 		ctx = intel_ctx_create_all_physical(i915);
+
+		for_each_ctx_engine(i915, ctx, e) {
+			/*
+			 * Context termination by watchdog may require an engine reset. That only
+			 * occurs after a pre-emption attempt has expired. For RCS/CCS engines,
+			 * the pre-emption timeout is longer than this test is wanting to wait.
+			 * So reduce that timeout in addition to the watchdog timeout itself.
+			 */
+			gem_engine_property_printf(i915, e->name, "preempt_timeout_ms", "%d", 640);
+		}
 	}
 
 	igt_subtest_group {
-- 
2.43.0

