Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324F7CCD18D
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E7010E8EF;
	Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cx0ofAf4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FAC10E8EB
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958297; x=1791494297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YDT9LS2jgyhxxIOotIw1vlQ3t8IItMrdqNlOuF4HryU=;
 b=Cx0ofAf4rbF+Slz4CBUjCcngQP25i5SifBeX7IDvLTToCOfdKXBNL6jx
 rnn72U1vuV/pwHuaudhi0ok9k+w8pKzv4T8wTiS2BvlR3Fzqnc2zJHq/b
 Nq6sQMgM8j5P+sjVhej7hhbou7u/i86b7kshux9U2ukPZSVpGONfEUf9e
 CeOFx9ZXyiKE4fKVt41+UDMz4OfEcx2uvMogYD7dwC25btK1amqzs3HmM
 1BN9EhlZRwyS3fB1ACAAC/h37SqYWBYZBu+aYReTm72qJ8lHA1Bu1crSz
 ViPWlX7X+JMpOq8k8a1HdDcu1cQHAeJawMZGrUDMzqAdlxC092Wbu0XZe w==;
X-CSE-ConnectionGUID: HEJtKh82Q4efuXCVZOTs0g==
X-CSE-MsgGUID: CvUC47dbSk2rWaj4kLSzIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989660"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989660"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:15 -0700
X-CSE-ConnectionGUID: P8sFeg4BQXyE3zGChM4H7A==
X-CSE-MsgGUID: clzfk2qyTCuhLXLKlQU7wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805308"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 17/18] tests/intel/xe_oa: Add new non-zero-reason-all
 test
Date: Wed,  8 Oct 2025 14:18:04 -0700
Message-ID: <20251008211806.625154-18-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008211806.625154-1-ashutosh.dixit@intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
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
---
 tests/intel/xe_oa.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 2d956286d2..36b1785bbd 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4921,6 +4921,10 @@ exit:
 	if ((oau = oa_unit_by_type(drm_fd, k))) \
 		igt_dynamic_f("%s-%d-%s", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id, str)
 
+#define __for_each_oa_unit(qoa, oau, poau, i) \
+	for_each_oa_unit(qoa, oau, poau, i) \
+		igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id)
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	uint32_t tmp;
@@ -4971,8 +4975,11 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		{ "ufence-wait", OA_SYNC_TYPE_UFENCE, WAIT },
 		{ NULL },
 	};
+	struct drm_xe_query_oa_units *qoa;
 	struct drm_xe_oa_unit *oau;
 	struct xe_device *xe_dev;
+	u8 *poau;
+	int i;
 
 	igt_fixture {
 		struct stat sb;
@@ -5066,6 +5073,16 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 			test_non_zero_reason(oau, 0);
 	}
 
+	/**
+	 * SUBTEST: non-zero-reason-all
+	 * Description: Non zero reason over all OA units
+	 */
+	igt_subtest_with_dynamic("non-zero-reason-all") {
+		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
+		__for_each_oa_unit(qoa, oau, poau, i)
+			test_non_zero_reason(oau, SZ_128K);
+	}
+
 	igt_subtest("disabled-read-error")
 		test_disabled_read_error();
 	igt_subtest("non-sampling-read-error")
-- 
2.48.1

