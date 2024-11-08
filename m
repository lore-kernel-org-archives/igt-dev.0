Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ABFD5E130
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 05:44:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495B210E1CA;
	Fri,  8 Nov 2024 05:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgMpRd4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B1110E1CA
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 05:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731044650; x=1762580650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YKXIIpQcQEHlQvwyyTTTnf1O3UHXEhIi08aZswFpo3E=;
 b=RgMpRd4UWC2zeZh/VMxBd+rxBiG8pAPuJBqaN/QtcVfmmoEA0PNCfuWw
 QduC/TBkMcDuVREEWH9E+Zh3BYXf1UPxNpHxl+QBl9XhHhLGKPFtUr7HZ
 n0BjZ6JscmSA9H49iy2MJqb8fj30N5usWyFz3RinItW7QXpiU6ezLfODL
 iipFeaUoUQu7OzYtPDJcbAnXjuI2RFwu/2vRbFsnW9jDJYIzc4U8oK0yw
 cWbZ5bf9mLzYSGSXKp70vMS9WYhgbvEBjrd7gAjEd+nvi1J4yPZ6VoNuO
 5djhBsCulWrJppMbxVRAiTk49xHjy8015luE/n4OyrGEMtVyydDBrDXJe g==;
X-CSE-ConnectionGUID: LZ1vYeeITPS/drKkHn2vnQ==
X-CSE-MsgGUID: 1kFmjtQYSemqN7eNUxfT3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="48429510"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="48429510"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:44:09 -0800
X-CSE-ConnectionGUID: VKgwqvHpRK+vOJfZT8S5lQ==
X-CSE-MsgGUID: 0Yv6T4dESaOS66idmYBuXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="116237260"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:44:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Increase sampling period
Date: Thu,  7 Nov 2024 21:43:50 -0800
Message-ID: <20241108054350.3484532-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

This reverts commit 4f79f059766c ("tests/intel/xe_drm_fdinfo: Half the
execution time") and goes in the opposite direction, doubling it.
Although in some machines we pass consistently, others like LNL
show sporadic failures.

Even after changes in the kernel to improve it, it still shows those
failures. Also, the failures can be much more frequent by stressing all
the CPUs. Raise the period to reduce the error introduced due to
additional scheduling delays. This shows a good improvement on LNL that
doesn't fail anymore without CPU load and fails once every ~200
iterations with 100% CPU load (vs once every ~3 iterations).

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 5fd7c0416..ef9273e2a 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -82,7 +82,7 @@ struct pceu_cycles {
 	uint64_t total_cycles;
 };
 
-const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 4;
+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC);
 
 static const char *engine_map[] = {
 	"rcs",
-- 
2.47.0

