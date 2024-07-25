Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141EAC3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 05:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FEF10E500;
	Thu, 25 Jul 2024 05:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeABwrW7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886D410E70D
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 05:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721886126; x=1753422126;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P49kyD/SCutTvKuaKIeN9+psil29LoIhcRhOdrpc97o=;
 b=JeABwrW7mUOqgCPw2PoCcgfncvsoyF4INfDQmeNVxUYPXzrFOZsGUZMV
 sdYTxYpqVae5H16h55ZnykZIMMRtFjU4I3vlnkkViA+Ofqn0eSxJK3EKC
 jbP8vWtn0xZwhMJBLXivuWFtBqHk1luCZBXPj7Sbso953T3fJgq1ARiEd
 cWARbuP5uXPd1uTKo9dFbClnyIklJIQnK0iXXoEV1bD91qAut2zrLeNDJ
 VCX+Mb7n0CtC5zeKM4bweZQJmz9FofLsf5LPYFYifjLsXNLB+JRBQUXim
 PAzF1Rp08yogYAGEw6tmFSalg4iNbR5G1mx1hvVTczPeR0LgaUqMb8sk3 Q==;
X-CSE-ConnectionGUID: W/xI2wb3RVKjcB6RnVvUBQ==
X-CSE-MsgGUID: iWj9bopHT4Wqxmh+xjqWmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="23408286"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="23408286"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 22:42:06 -0700
X-CSE-ConnectionGUID: MNgNqT5dQESQfJ/u7SCelg==
X-CSE-MsgGUID: O1Drbx7QRX6OSzF5fpiplw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="57623009"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa003.jf.intel.com with ESMTP; 24 Jul 2024 22:42:03 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t] tests/core_setmaster: Change break to continue in
 tweak_perm function
Date: Thu, 25 Jul 2024 11:13:11 +0530
Message-Id: <20240725054311.1420162-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
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

Existing userspace assumes there's no gaps card’s, but I see cards
are not continues, after running “gta@core_hotunplug I am not seeing card0,
hence test is failing.

Test result before this changes:
root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools#
root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools# cat /sys/class/drm/
card0/      renderD128/ version
root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools# ./core_setmaster --r master-drop-set-user
IGT-Version: 1.28-NO-GIT (x86_64) (Linux: 6.10.0-rc7-xe x86_64)
Using IGT_SRANDOM=1721882790 for randomisation
Starting subtest: master-drop-set-user
Opened device: /dev/dri/card0
Subtest master-drop-set-user: SUCCESS (0.066s)
root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools#
root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools# ./core_hotunplug --r hotrebind-lateclose
IGT-Version: 1.28-NO-GIT (x86_64) (Linux: 6.10.0-rc7-xe x86_64)
Using IGT_SRANDOM=1721882819 for randomisation
Opened device: /dev/dri/card0
Starting subtest: hotrebind-lateclose
Opened device: /dev/dri/renderD128
Unloaded audio driver snd_hda_intel
Realoading snd_hda_intel
Opened device: /dev/dri/card1
Opened device: /dev/dri/renderD129
Subtest hotrebind-lateclose: SUCCESS (2.721s)
root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools#
root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools#
root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools#
root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools# cat /sys/class/drm/
card1/      renderD129/ version
root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools# ./core_setmaster --r master-drop-set-user
IGT-Version: 1.28-NO-GIT (x86_64) (Linux: 6.10.0-rc7-xe x86_64)
Using IGT_SRANDOM=1721882840 for randomisation
Starting subtest: master-drop-set-user
(core_setmaster:4366) CRITICAL: Test assertion failure function check_drop_set, file ../tests/core_setmaster.c:85:
(core_setmaster:4366) CRITICAL: Failed assertion: master != -1
(core_setmaster:4366) CRITICAL: Last errno: 2, No such file or directory
(core_setmaster:4366) CRITICAL: error: -1 == -1
Stack trace:
  #0 [__igt_fail_assert+0x10a]
  #1 [check_drop_set+0x70]
  #2 [__igt_unique____real_main145+0x355]
  #3 [main+0x2d]
  #4 [__libc_init_first+0x90]
  #5 [__libc_start_main+0x80]
  #6 [_start+0x2e]
child 0 failed with exit status 98
Subtest master-drop-set-user failed.
No log.
Subtest master-drop-set-user: FAIL (0.019s)
root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools#

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/core_setmaster.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 9c2083f66..c02eaf671 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -116,9 +116,9 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
 	for (i = 0; i < max_perm; i++) {
 		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
 
-		/* Existing userspace assumes there's no gaps, do the same. */
+		/* Existing userspace assumes there is a gaps, hence continues. */
 		if (stat(path, &st) != 0)
-			break;
+			continue;
 
 		if (save) {
 			/* Save and toggle */
-- 
2.25.1

