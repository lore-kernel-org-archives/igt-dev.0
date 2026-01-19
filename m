Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2F0CCF2D1
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 09:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404A710E391;
	Mon, 19 Jan 2026 09:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3b+7070";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EAB10E391
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 09:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768814770; x=1800350770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mx3y5Uo+lEP6Uq2YU/dmRFLqbgrs1MFbiEDlqeofRXs=;
 b=A3b+7070JUbFSFPZH4mvmbYXKhmROnz9qG5HkmB2XA1NA5A2jeJRCNs2
 HtBxBWKvFk1QLRKEc765Vethxp3+1bx2+wOSp0yIxaoYInOJmL9x1bp4w
 8FfwVmOEPctlgYgXUuvmE6pMFZ/qgswKl5l82Zy6Kzm/KxfmPeHZbVLb1
 kn+s5sU1qxoggoqJBOXn6o9XXKb4Aep34G0vpn8nYyH4CsLsrXTN5aO4r
 Sq0/x0TYjaVdFxNcrsRNMOf5aLw0CPAllKeK23IjTn0D/KZPH9YTBzzdZ
 xk4MB+VJHnP5zFu6M2o7R/O20P/UNgNCfUG4jCXfd2nlCZioXWnSpIhRZ g==;
X-CSE-ConnectionGUID: HV0rqimlQ9OXHRFU4aCxwA==
X-CSE-MsgGUID: WQUN7Nm7RYehwHEOk7ViAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81394139"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="81394139"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 01:26:10 -0800
X-CSE-ConnectionGUID: hhY2+DTpTw6FDna8kjGsSA==
X-CSE-MsgGUID: APOECaH/TgeS3I4fbYbNbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="206173019"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 01:26:08 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t] tests/intel-ci/xe.sriov-vf.blocklist: add xe_live_ktest
Date: Mon, 19 Jan 2026 10:26:00 +0100
Message-Id: <20260119092600.21586-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

KUnit executes tests for every device instance bound to the driver and
doesn't provide a way to select a specific device on which the test
should be executed. In SR-IOV VF runs this causes KUnit tests to be
executed on both PF and VF devices.

Block xe_live_ktest in VF runs. It should instead be executed only in VM
runs, where only a VF device instance is present.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel-ci/xe.sriov-vf.blocklist.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.sriov-vf.blocklist.txt b/tests/intel-ci/xe.sriov-vf.blocklist.txt
index 69d647ef08..4a19aa943d 100644
--- a/tests/intel-ci/xe.sriov-vf.blocklist.txt
+++ b/tests/intel-ci/xe.sriov-vf.blocklist.txt
@@ -56,4 +56,8 @@ igt@xe_pmu@gt-frequency
 #
 # The feature query_cs_cycles is not supported on VF
 #
-igt@xe_query@.*cs-cycles
\ No newline at end of file
+igt@xe_query@.*cs-cycles
+#
+# Tests that need to be executed in VM instead.
+#
+igt@xe_live_ktest.*
\ No newline at end of file
-- 
2.40.0

