Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC520C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 08:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680BF10E281;
	Wed, 31 Jul 2024 08:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHnqOVUS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7983A10E281
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 08:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722414699; x=1753950699;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CS6ObYF5NZZs0E52Ykt1a9upohYOz8MUL/icfs0yrbg=;
 b=mHnqOVUSdDfH+sZ1V1ugeoAfSaggdG5AcIXj/y45CJ1yYAVWdurNC18W
 qH+jJJA5t4NtCtKcPZqPWP+cNkcTQunxQB8UQmGEBgpnlTA8T4n8Hgryg
 z0hHx/LW/Aw1wG39dBS5Jt44g4oEqCew8mGeeoryL6jxpm+YtzdPxVx89
 qbXwE9nJ7565kU0IlPYc6A2Uh9xK/MHanpQaKA7P1hAX2WolPhIzT0aGX
 +AULoXva+Q6HgxIrfRXD0Jyvb879TaFPs7I2/HHM/wgj6KHTh4p89GJcq
 MEva0fFbO7btH72Rzn2UJcD6/7+9ByEZhIL74YqKvXt3HtU1S7ZfFXeZN w==;
X-CSE-ConnectionGUID: Je7zv3f7QfiXLnWBzzAJuQ==
X-CSE-MsgGUID: +Zaj7DrOSA6pIzxdwOCPaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="31427056"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31427056"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 01:31:38 -0700
X-CSE-ConnectionGUID: H036uewQSd2s/MQodzqB0w==
X-CSE-MsgGUID: BhxHzjsASD+FLWW6/e/6Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59464973"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by orviesa003.jf.intel.com with ESMTP; 31 Jul 2024 01:31:37 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH i-g-t v3] tests/core_setmaster: Adjust loop control in
 tweak_perm
Date: Wed, 31 Jul 2024 13:50:37 +0530
Message-Id: <20240731082037.1069-1-krishnaiah.bommu@intel.com>
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

The `tweak_perm` function now uses `continue` instead of `break` when
encountering non-existent card paths. This change addresses the assumption
in existing userspace that card paths are contiguous, which may not be true
if cards are dynamically removed.

Problem Description:
The test fails after running the `core_hotunplug@hot*` subtest, where card0 is missing.
This leads to a failure in the subsequent `master-drop-set-user` test.

Command sequence for reproducing the issue:
- Check available cards: `ls /dev/dri/`
  - Output: by-path  card0  renderD128
- Run the test: `# ./core_hotunplug --r hotrebind-lateclose`
- Check again: ‘ls /dev/dri/’
  - Output after failure: by-path  card1  renderD129
- Run the test: `# ./core_setmaster --r master-drop-set-user`

This failures on both XE and i915 for above sequence.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/core_setmaster.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 9c2083f66..a2758e2f2 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -116,9 +116,10 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
 	for (i = 0; i < max_perm; i++) {
 		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
 
-		/* Existing userspace assumes there's no gaps, do the same. */
+		/* Userspace cannot always have continuous card0...N due to
+		 * dynamic unloading or removal of cards */
 		if (stat(path, &st) != 0)
-			break;
+			continue;
 
 		if (save) {
 			/* Save and toggle */
-- 
2.25.1

