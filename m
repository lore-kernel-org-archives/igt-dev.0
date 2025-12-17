Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D33D64093
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 09:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB9A10EBE5;
	Wed, 17 Dec 2025 09:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBaRaS+n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5052510EB5A
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 09:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765962583; x=1797498583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ojXIo2R0g6gq/2z0HVKgZ6tH/cgJaWbZwH93j7LttLU=;
 b=mBaRaS+nYrCjWc4bu+Bm4vX0Yljw38MXPb0+sNca7C86rdFSYO5ybOpi
 SAj6qJRJ0feU3j9QjlT1dQjY7CfK+vbb4uvaEHIfQGYx1HqaYFKB17/XO
 osuiDAtAqIrurb9ojJB+m3yRHoA81oyEULahChp6B7rWTr7HEHgzR/W5h
 UAOYmwuK3WzCtFiuNNDYaLegPzZAnClr+m/8W7gDUZVHcGrW+dspdmSpa
 us31HcngXSoKo6KW8t8YPhCEptViM7j4DV6/aKFoPbqa7Mx+SPJ5vEpNj
 ule5gPLsO+mVLn/hxaqRxHFcQzmPNOGxzRFXU1qXv9hHIUqrDbzdQoQd7 w==;
X-CSE-ConnectionGUID: WOA3cirdTAykgLeCjTfI7Q==
X-CSE-MsgGUID: MjTdQSLVQrOvVOtxSWqLng==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67834384"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67834384"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:09:43 -0800
X-CSE-ConnectionGUID: wuzUUvJkRQmMa+HPGMX4uA==
X-CSE-MsgGUID: c7g2HzjsQtaXWf+oKUvXZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198011475"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:09:41 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v4 2/2] HAX: Add throttle_basic_api test to fast feedback list
Date: Wed, 17 Dec 2025 14:31:49 +0530
Message-ID: <20251217090146.1558855-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217090146.1558855-4-sk.anirban@intel.com>
References: <20251217090146.1558855-4-sk.anirban@intel.com>
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

Add throttle_basic_api test to fast feedback list.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 15fce6a42..bd5b1789d 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -135,6 +135,7 @@ igt@xe_exec_reset@cm-close-fd-no-exec
 igt@xe_exec_reset@virtual-close-fd-no-exec
 igt@xe_exec_store@basic-store
 igt@xe_gpgpu_fill@basic
+igt@xe_gt_freq@throttle_basic_api
 igt@xe_gt_freq@freq_basic_api
 igt@xe_gt_freq@freq_fixed_idle
 igt@xe_gt_freq@freq_range_idle
-- 
2.43.0

