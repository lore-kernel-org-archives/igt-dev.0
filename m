Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF9DFD88FF
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 05:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0533B10E31A;
	Wed, 11 Mar 2026 05:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngR6s2VP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB4A10E31A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 05:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773208303; x=1804744303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+OHQl3wkgsWeLU00gRQLiJXnr0bzFsdYe0/nyZ98woY=;
 b=ngR6s2VPJXHB6b+Vbrson6c7UKqou1XreCmVKrhXEn00MQIlya8dV4do
 gy1orbh5sdLs/zJCc4e37/VRi7AcxtrjOiH+UuN6FI7hbL9c3fapYHhTA
 zDSmltA7UlxqwKRGQ9rI1mK9Gn47ksYtR81KcrObF2FU9Cxy98oy7cWZW
 8P0xdzLcNpp+TQDdleXvNalnVLqTZX23V6KKCFLX/l7uWfQNltKAg0i3s
 2via7sOeSB8+OauFRkVvpLZnlBqQywz3sN/nIqosar5nNWO5eEteBG6AV
 y7s6J3UcIxk/MJkfJwbFfmh8OmuZTTbrWbAAGCT2Myfmf+6iH+TyrSJnZ A==;
X-CSE-ConnectionGUID: arSBHGjMTHOZiGqJ6GdcNQ==
X-CSE-MsgGUID: mKDD2uFZTruU90iZA8XIQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91837708"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="91837708"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 22:51:41 -0700
X-CSE-ConnectionGUID: X21qs5uTTweEcUj8tjyzxA==
X-CSE-MsgGUID: p0B83PKAR+yJjWBRmxemiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="243365336"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 22:51:40 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, arun.r.murthy@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] intel-ci : Add async-flip with linear modifier subtest
 to Xe blocklist
Date: Wed, 11 Mar 2026 11:17:47 +0530
Message-ID: <20260311054747.1230383-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

Async flips are slower with linear modifier on Xe and so does not meet
the required FPS criterion. This is not an issue as there is no real
world use case which requires this combination.

Blocklist this test to avoid expected failures.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index bd08aa594..edc5039a9 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -123,3 +123,8 @@ igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
 # Exclude one compute mode test
 ##################################################################
 igt@xe_exec_compute_mode@non-blocking
+##################################################################
+# Async flips with linear modifier are slower
+##################################################################
+igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
+##################################################################
-- 
2.43.0

