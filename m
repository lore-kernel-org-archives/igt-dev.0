Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE48ACCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 18:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A1710E2FA;
	Wed,  5 Nov 2025 18:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oA2Lyye6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A776F10E2FA
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 18:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762368069; x=1793904069;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1oSL3jeDSb4mhHsdJ+HH5cUN6/xBqvOXsPJCwykid/g=;
 b=oA2Lyye6ZX84s7Npnyza8FxUHjw/E6h8QwrjEBJz1XZKx/BgEO6WluNG
 thNSLTlylwFp65Qa2xpk7jj8MO1ppfgAbVVicUSrI1XzazZqTZ1+DasxA
 b2B6u16N2d+Jxla2ESJLNJ3+JISx4s5yJpv8cICiY2crSr97rzEUzSwth
 eWdqYB3gQwE9g2Kr9c6tqKkz3zBu6/J9FTR68jp5sdMqmuwFENRn2eHMY
 Wu/hXjWdIFHi+EnzbEHS1RcQf2+Lci34q9oA4UpuFQwrLMvfGRkgHrrIw
 HpdnyqZc1iv7PYp4OsNdzfbjTeV4Hqw7NxlgxCIsOwl100deLBIzTzLcA A==;
X-CSE-ConnectionGUID: 3wIv3gNATW2Lae0RNQrDgg==
X-CSE-MsgGUID: rWY8pJfoR7CDyG0dQAFHRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75102830"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="75102830"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:41:09 -0800
X-CSE-ConnectionGUID: iMt2qTFcT+2bMly1vdSj9g==
X-CSE-MsgGUID: HkOrQyzQScy2g//HaDmQfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="218184912"
Received: from dut4449lnl.fm.intel.com ([10.105.8.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:41:09 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	saurabhg.gupta@intel.com,
	alex.zuo@intel.com
Subject: [PATCH] tests/intel/xe_pmu: Reset sched_if_idle value smartly
Date: Wed,  5 Nov 2025 18:41:09 +0000
Message-ID: <20251105184108.161889-2-jonathan.cavitt@intel.com>
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

Only reset the sched_if_idle value in unprovision_and_disable_vfs if
doing so is necessary (I.E. if sched_if_idle has been changed).

Additionally, there may be some delay in processing the value reset
request, so add a short usleep after resetting the value via
xe_sriov_set_sched_if_idle.  This will presently only have a performance
impact on the fn-engine-activity-sched-if-idle subtest because of the
first change.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 9525655ba2..f3dc85bb1b 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -1010,7 +1010,10 @@ static void unprovision_and_disable_vfs(int fd)
 	unsigned int gt, num_vfs = igt_sriov_get_enabled_vfs(fd);
 
 	xe_for_each_gt(fd, gt) {
-		xe_sriov_set_sched_if_idle(fd, gt, 0);
+		if (xe_sriov_get_sched_if_idle(fd, gt)) {
+			xe_sriov_set_sched_if_idle(fd, gt, 0);
+			usleep(100000);
+		}
 		for (int fn = 0; fn <= num_vfs; fn++)
 			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
 	}
-- 
2.43.0

