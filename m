Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118C6CCD194
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC0810E53D;
	Mon, 13 Oct 2025 20:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzJatacD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BA610E52D
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387450; x=1791923450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m77AMNum+ZzZWBhi5vxH9IlIj/ogaUmLl7VDAhckCqI=;
 b=BzJatacDGgyP+YaY7PYt5W0gutVq/w/akF235K3Ps87FwodvruobUib5
 W46klf0aie7wFo/zz0ESCnZgmXtrC5nmH7kuhWRpPLtwR92u4i4+mZYti
 53s0nnNPXQ44MTvfcxkm5BaRPvt/286C8z9umIkAAGZfxMPpffQc+v/hK
 axu8N2ssm+XRywRtBCAo07g5sWsmu9D1S+9byc/6jMyqgEoNnH5QVZOQB
 3z1RPqN33X0kDuxQ1NS8Uszrl/cfNt6xysWC+8T7gN0DDkuoXc1GRegmf
 PG/enY6AtMQOG/cYgGpoGXFTpdYyYK7neDBRYUcUB3jsxkvAdXWj7mQU8 g==;
X-CSE-ConnectionGUID: YLB8J5TbQGyzy9fAFs2NQw==
X-CSE-MsgGUID: rxyB0wIFT2SbeMBe3q67lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641944"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641944"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: ipyVZXBkTvqly6v11l3Asw==
X-CSE-MsgGUID: Mm5Suet0TVWNXSlvQlYrgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924056"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 17/18] tests/intel/xe_oa: Add new non-zero-reason-all
 test
Date: Mon, 13 Oct 2025 13:30:40 -0700
Message-ID: <20251013203042.925115-18-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013203042.925115-1-ashutosh.dixit@intel.com>
References: <20251013203042.925115-1-ashutosh.dixit@intel.com>
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

To demonstrate the new infrastructure, add a new non-zero-reason-all test
which runs the non-zero-reason test on all OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 128283ddd7..d8543eea88 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4931,6 +4931,10 @@ exit:
 	if ((oau = oa_unit_by_type(drm_fd, k))) \
 		igt_dynamic_f("%s-%d-%s", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id, str)
 
+#define __for_each_oa_unit(oau) \
+	for_each_oa_unit(oau) \
+		igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id)
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	uint32_t tmp;
@@ -5076,6 +5080,16 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 			test_non_zero_reason(oau, 0);
 	}
 
+	/**
+	 * SUBTEST: non-zero-reason-all
+	 * Description: Non zero reason over all OA units
+	 */
+	igt_subtest_with_dynamic("non-zero-reason-all") {
+		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
+		__for_each_oa_unit(oau)
+			test_non_zero_reason(oau, SZ_128K);
+	}
+
 	igt_subtest("disabled-read-error")
 		test_disabled_read_error();
 	igt_subtest("non-sampling-read-error")
-- 
2.48.1

