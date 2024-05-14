Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C8AC25B75
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 14:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286C010E985;
	Tue, 14 May 2024 14:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLos0dt7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F43110E985
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715698599; x=1747234599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DOiwa6ZdxBa0yGeeW8lZ1IHKs1rPLuJMnLIB3L6UgrE=;
 b=DLos0dt7Se8dsC1EswGr42zlevSGauscPzDdpcXCp8ZVePD4Inv5RgR5
 +PurzwjiXla8Eu/MbCgmSEnAdX5YAhRiC7Rj7N82ny/iGTBqP1riKA9J/
 UoWjxGadChj/psrSKw7WLYj3wFhqVcqz1ZLrmcMyDZGtFsd8cHPcM99mN
 jXb1MSFfwds5OKrmyagoYdigXl9KH6uk0GEX/c+M6HTgQFQdiGriF33TQ
 Il/flcLAoLFth5Fj/VTLSBiIWi33DmXP6q9fcORfuticoCSrBln2886Ys
 n/OVNTkmAkVMha+NZ3EZTfMmSVkmPzfsDNU9mlr9Zf0MnAKI6boeuRuJd w==;
X-CSE-ConnectionGUID: hy5KB9NwRZyGo00k9dSTTQ==
X-CSE-MsgGUID: mFoNpw2gT2SkruAE56d1Wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11537729"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11537729"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 07:56:38 -0700
X-CSE-ConnectionGUID: xtp6ykfcROyal1q03kwfVg==
X-CSE-MsgGUID: TPPC1MEjTo+fDXXnI9EOLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35420475"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 07:56:38 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, brian.welty@intel.com,
 tomasz.mistat@intel.com, himanshu.girotra@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH igt-dii-client v3 2/2] tests/intel/xe_exec_fault_mode: account
 for EBUSY in support check
Date: Tue, 14 May 2024 07:41:22 -0700
Message-Id: <20240514144122.3778902-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240514144122.3778902-1-jonathan.cavitt@intel.com>
References: <20240514144122.3778902-1-jonathan.cavitt@intel.com>
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 0b3f4cb8de..ecea4d53ee 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -406,8 +406,20 @@ igt_main
 	int fd;
 
 	igt_fixture {
+		struct timespec tv = {};
+		bool supports_faults;
+		int ret = 0;
+		int timeout = igt_run_in_simulation() ? 20 : 2;
+
 		fd = drm_open_driver(DRIVER_XE);
-		igt_require(xe_supports_faults(fd));
+		do {
+			if (ret)
+				usleep(5000);
+			ret = xe_supports_faults(fd);
+		} while (ret == -EBUSY && igt_seconds_elapsed(&tv) < timeout);
+
+		supports_faults = !ret;
+		igt_require(supports_faults);
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
-- 
2.25.1

