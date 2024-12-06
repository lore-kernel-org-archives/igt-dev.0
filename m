Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342F0E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 08:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECABD10F033;
	Fri,  6 Dec 2024 08:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0x2iVwy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4771F10F033
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 08:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733473078; x=1765009078;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=Nuhd4+PYw0Amlywx7WoxCx6+6votyYLncFPI2QmpV3g=;
 b=m0x2iVwy6Gawyny3Z5svB24zENM1B4slLp14gaUu+oddcVwdXM2VSVdp
 oPggvJVC2VrbYRuQDnYn3atfMNO98ObUmVjc+3Zv2d6DxezPMoS1l5PnZ
 osnJeNahISY7axRpufgmqMfndtDf4uWuZxAwpZlhHi96osqwWC67jQuSO
 pYNbvffgSxzDUT5DYQ6wFL+46IRR0hELi8P0GoeSkdZdyL+cku+CbA+0C
 t/cFGikP1fKVOC1BOUgTPMOuelxOpyakN1upXlESNPxOeQ5R3YL5ikVwy
 rU8g8oG1y5Zorjbx8j+WBm65J40wXqQOSKV2AcqYoEEwqysQeJsyHgLc8 A==;
X-CSE-ConnectionGUID: KRik4txqTv26OEF9plIrCQ==
X-CSE-MsgGUID: b6t3BXcyT3KoVYgCfru1nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37493207"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="37493207"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 00:17:58 -0800
X-CSE-ConnectionGUID: XKuXY22lSIaThSHRZbfTVw==
X-CSE-MsgGUID: K5djlbFNRJegVe+BEzg7WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="98789686"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 00:17:57 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 06 Dec 2024 09:17:48 +0100
Subject: [PATCH] tests/xe_exec_sip: increase timeout margin for tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-xe_exec_sip_eudebug_increase_timeout_for_devcoredump-v1-1-6736edd67447@intel.com>
X-B4-Tracking: v=1; b=H4sIACuzUmcC/x3NwQqDMBCE4VeRPTegQSztq5QSTDLqHkzCxoggv
 rtpj99h5j8pQxiZ3s1Jgp0zx1DRPRpyyxhmKPbVpFvdd7od1AGDA85kTgbFw5bZcHCCMcNsvCK
 WzUxRjMfuosCXNamhRz9Y/3rqzlO9ToKJj3/28622daysjMEtv1hJma7rBlVVw8KcAAAA
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=Nuhd4+PYw0Amlywx7WoxCx6+6votyYLncFPI2QmpV3g=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnUrM01UrOQL4cH7Y1P3kiM6CGfnHyoyShj4YHQbyF
 POUQxQKJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ1KzNAAKCRAjYrKT3hD919eLDA
 CYMCQyrPSGNct9/kf06NQe7HHc0vAhL7wKYGHANJEcTRVeUEFh+Qsvg8BZ+8+b0RrSrgDJ4NiddfXQ
 m8FDoHxuN4IqhQMSynvpzRXId4HSyGi/xx/kBLYv13MDJGpj1xdvx56HCcQMVtqXoAkAHRL6uicok7
 w4wLMOCzcPMQdgYyDcuvzGKc1j69Co9HKpvesoo1FFMZKXbnpwkWbdYJyt6a0cuxnmhA3YOI1B92vK
 QNCMNiTV3m5Ibri3LtRZViZ0Kw1wCDfwbCw/4TWCstYnbvAUJNmHsj6X5UaYKncXU+VGb5YgAucIZX
 0FSD/EzzY+8VLV2BH4bsCr1YYJcSHJiCpntPKiL8SbHuvRy27nHudarl6q2qKmvf0tz/uYRv4YEKcs
 aS+lKVrzongtNwl9AhJHEG+Rn/cqcoylUtAcVWPIZWmJSiHs7aQr7R+UhEnIkWN+IYST4Q1p1imzYA
 6TUvav6eI6ViiHoXP5invau/nyuzp0b1wqKfqJVlCH1pc=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

In case engine reset happens 4s timeout margin sometimes is not enough
and test fails. It happens mostly on LNL/BMG due to devcoredump creation.
On CI it does not pass 5s, let's increase it to 8s to be on safe side.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_exec_sip_eudebug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
index d056a14a2d7f..c317112b4154 100644
--- a/tests/intel/xe_exec_sip_eudebug.c
+++ b/tests/intel/xe_exec_sip_eudebug.c
@@ -263,8 +263,8 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
 	debugger_enabled = xe_eudebug_debugger_available(fd);
 	vm_id = xe_vm_create(fd, debugger_enabled ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
 
-	/* Get timeout for job, and add 4s to ensure timeout processes in subtest. */
-	timeout = xe_sysfs_get_job_timeout_ms(fd, eci) + 4ull * MSEC_PER_SEC;
+	/* Get timeout for job, and add 8s for devcoredump processing. */
+	timeout = xe_sysfs_get_job_timeout_ms(fd, eci) + 8ull * MSEC_PER_SEC;
 	timeout *= NSEC_PER_MSEC;
 	timeout *= igt_run_in_simulation() ? 10 : 1;
 

---
base-commit: e776f39da6b3666a2834f7e02a1eed9a87f21d74
change-id: 20241206-xe_exec_sip_eudebug_increase_timeout_for_devcoredump-64e46bd9721d

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

