Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9229EC25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 18:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1A010E0E7;
	Fri, 10 May 2024 18:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qfzc+3li";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDE110E5DE
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 18:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715366396; x=1746902396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M++R8npTxVIGBgjs7Ht3/sufiIqcqATtmfcovpQsw7w=;
 b=Qfzc+3liANo/TuCz3nYxI36chnmcyfHlTJzOPeQpLGBoX8mx8XOuh8Ix
 zlmXEsU9o4VBlMniaFQ6sQ2nKW+2fHWHo2JUBQSsZAqNyL0JpEcDMPrrG
 y0GhGYys1B0fKRPvkZaP7eoIb/orku6t3JAuxftUSKYojd/Hrb+lzc9rN
 ooKWaU4clY4F61I7yAdZsMR7KDn9cpHG9I8a8AJEG2Gj/UvBI6z9BFiNi
 FR8dMdj7Ic+yTouAgydidZvuiFwOYR4g2kcGoEhgaaqFnRNRYH76VW8Ns
 VmiI5Y0w5ioM3PPNIIMW3NNaTEt5ynnQ3ZsbZXp/k99p1A0Rc6k5R+4/v w==;
X-CSE-ConnectionGUID: qXKGiWr7R9Oq7MIeI3lYQQ==
X-CSE-MsgGUID: im09AsLrRby03RWKc0HYdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11489597"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11489597"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:39:55 -0700
X-CSE-ConnectionGUID: SxBAAkiNRkaaQKIujqf/zg==
X-CSE-MsgGUID: p9/E8Y5HQyiXn/E6dO39Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29764434"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:39:55 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, brian.welty@intel.com,
 tomasz.mistat@intel.com, himanshu.girotra@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_exec_fault_mode: account for
 EBUSY in support check
Date: Fri, 10 May 2024 11:24:38 -0700
Message-Id: <20240510182438.3178575-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240510182438.3178575-1-jonathan.cavitt@intel.com>
References: <20240510182438.3178575-1-jonathan.cavitt@intel.com>
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

It's possible for xe_supports_faults to return false if the system is
busy with multiple running tests.  This is because the check looks for
all active VMs and searches for VMs that do not have faults enabled,
returning false if any exist.  Recently, this check has been changed to
return EBUSY when the check fails in this way, so wait for up to two
seconds for all the active VMs to flush out before proceeding.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 0b3f4cb8de..4f55756e92 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -406,8 +406,18 @@ igt_main
 	int fd;
 
 	igt_fixture {
+		struct timespec tv = {};
+		bool supports_faults;
+		int ret;
+		int timeout = igt_run_in_simulation() ? 20 : 2;
+
 		fd = drm_open_driver(DRIVER_XE);
-		igt_require(xe_supports_faults(fd));
+		do {
+			ret = xe_supports_faults(fd);
+		} while (ret == -EBUSY && igt_seconds_elapsed(&tv) < timeout);
+
+		supports_faults = !ret;
+		igt_require(supports_faults);
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
-- 
2.25.1

