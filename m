Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC23C3600C
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 03:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F394110E25D;
	Fri,  4 Apr 2025 03:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGQHXKNf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CEC10E25D
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 03:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743737186; x=1775273186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9MGNsBKIj6Tod2rBwPO392oNJ4NkQhWlW74wmdmwSqQ=;
 b=HGQHXKNf6IKxZiqvLYq+TiyDzNTU3I+A9ntOt2p564WORqYTSCo+ZgqA
 QNnk55Ykd+YvecE5YTRaWSuXY5Q7+bETW/OwIEKyxL7cevUtbUsS7oNfa
 OfDYHEwsYtyU6Y+R54rNR7fF+ukUrRbXlyBTRHuy5sacANrik3RnEhH33
 K1j7PLXghomqat0pmzAVCv/lAo0yVSlWGDj1CXBgklDSoV3Xc/aHFmBXy
 z0z+0DLMeMW21HUl9G85gocfYLzIe01PGVI557ipWMz7PgEizzTHQe6JQ
 rXp7jlGnj7MLoiIB5oFjxc1yYyn4IfgbQkjJbxjGvzpByHXItOUDptZJX Q==;
X-CSE-ConnectionGUID: Lvu3CXPQQMW8dUBei7F9tQ==
X-CSE-MsgGUID: +Vp48sT3Qda/2zdfHFXSMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="48965359"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="48965359"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 20:26:26 -0700
X-CSE-ConnectionGUID: di5U6J9+QIeb9GJ/QyydxQ==
X-CSE-MsgGUID: X5RRIbf5TzajMG4VpdpCVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="131904411"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 20:26:24 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
	kamil.konieczny@intel.com
Subject: [PATCH i-g-t 1/1] tests/intel/xe_fault_injection: Inject errors for
 xe_hw_engine_class_to_str
Date: Fri,  4 Apr 2025 03:10:52 +0000
Message-Id: <20250404031052.1848936-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404031052.1848936-1-sobin.thomas@intel.com>
References: <20250404031052.1848936-1-sobin.thomas@intel.com>
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

Use the fault injection infrastructure to make targeted fault injection in
functions xe_hw_engine_class_to_str and check the error handling in the
xe_hw_engine_class_sysfs_init() so that more code paths involving error
handling is tested.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 24c114ba7..94c1bbf38 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -173,6 +173,7 @@ static void set_retval(const char function_name[], long long retval)
  * @xe_guc_ct_init:		xe_guc_ct_init
  * @xe_guc_log_init:		xe_guc_log_init
  * @xe_guc_relay_init:		xe_guc_relay_init
+ * @xe_hw_engine_class_to_str:	xe_hw_engine_class_to_str
  * @xe_mmio_probe_early:	xe_mmio_probe_early
  * @xe_pcode_probe_early:	xe_pcode_probe_early
  * @xe_pm_init_early:		xe_pm_init_early
@@ -388,6 +389,7 @@ igt_main
 		{ "xe_guc_ct_init" },
 		{ "xe_guc_log_init" },
 		{ "xe_guc_relay_init" },
+		{ "xe_hw_engine_class_to_str" },
 		{ "xe_mmio_probe_early" },
 		{ "xe_pcode_probe_early" },
 		{ "xe_pm_init_early" },
-- 
2.34.1

