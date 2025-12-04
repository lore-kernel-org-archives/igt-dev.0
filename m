Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA44AD1D86A
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 06:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7893810E122;
	Thu,  4 Dec 2025 06:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/FYHQ53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA96D10E857
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 06:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764829891; x=1796365891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+XZTrDgq/YmUgDZ+q6/LWw6Cp6T5+oMfBIStU0sgnXI=;
 b=g/FYHQ53Jv8vd6QWiXNOTtpkbWDyyf51Nl+libsu5Y9Lzs42r+oz3wIf
 Prj0hzPzGASEMky1QNfo2K/aTpEFXk5mrj9zIkKgqKn9CbJ2sSC1mUIIC
 AsTI65BVbyQFr9OJ64F4zRDrSdXZ735MY/YDUIN/iw4HKSCl5IC61CZ5j
 a0LGED2VTB2Zj1MWxXzHUEAlh9b8KIkZay471RbJPrJxVkIZWtMCAkSAk
 iu/BZl/ceoFxDz7uuEHZLCC1R5JdDmzwRlWCmKVKjK8m8Xo0D16pJaBG2
 92QT/ufqZd0WY55wYUH4bT892WGJrPivjgwsLeNgl2X/vGwQf7DlJn97i Q==;
X-CSE-ConnectionGUID: G9JEWvKmSbaz8ZtdL5784Q==
X-CSE-MsgGUID: xtXKMGQaSciacnWmyoZABg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70691578"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="70691578"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 22:31:30 -0800
X-CSE-ConnectionGUID: nwx4mbTWSlSo4OCvU2/N2w==
X-CSE-MsgGUID: Q/ad2po6Ta+8+VSeU/rUNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="200033557"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 22:31:28 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 2/2] HAX: Add throttle_basic_api test to fast feedback list
Date: Thu,  4 Dec 2025 11:54:31 +0530
Message-ID: <20251204062428.401397-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204062428.401397-4-sk.anirban@intel.com>
References: <20251204062428.401397-4-sk.anirban@intel.com>
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
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 017e3ba2a..62eaf7078 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -134,6 +134,7 @@ igt@xe_exec_reset@cm-close-fd-no-exec
 igt@xe_exec_reset@virtual-close-fd-no-exec
 igt@xe_exec_store@basic-store
 igt@xe_gpgpu_fill@basic
+igt@xe_gt_freq@throttle_basic_api
 igt@xe_gt_freq@freq_basic_api
 igt@xe_gt_freq@freq_fixed_idle
 igt@xe_gt_freq@freq_range_idle
-- 
2.43.0

