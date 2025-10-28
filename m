Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EC2CCF9EA
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 08:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A147C10E5C3;
	Tue, 28 Oct 2025 08:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FG3dAgMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7669510E5C1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 08:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761641044; x=1793177044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+OoNaI7whAGAabJ4haKNXUVozWtlryfys9VwH+L4Waw=;
 b=FG3dAgMjQKiQSrfxZJ4Yrl3eyVZ3atJzDoS3ISveY6UqkNcivukqlKJB
 e93FbvWqey9XKqewUQLTLPwgxPjjV+1x/Vdy0Pi4HrySaAOL3gZqC0Rnu
 pHGoWYboX/Y1+r0wKEZq2Ibw/nUMJs8wr9w//ZI1lyS65sbLwxQZGblZ5
 1K4686KuqTq7rdbSQwo40aXUnABcP3193ckTjpj/CYQgV0suxyOdv9Ks4
 IhZwOTo3ZfZ4ryWL3XScez7PgIqock1P82wkmqF8IoXo15hXEPKqKdhr+
 rV9Vcr7L3yDmwQcodXaGjBva4SgoLrH3CMPgHFE/erWJUTZ6qx2zSKUKg Q==;
X-CSE-ConnectionGUID: 1Vakg3lrRGOEVNQLlWKEDA==
X-CSE-MsgGUID: kK96GCBjSVKKaEoz/jHqlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81156336"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="81156336"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:44:04 -0700
X-CSE-ConnectionGUID: MgiGC6p5Tiy1TTfXHwouAQ==
X-CSE-MsgGUID: ZFIgY90TSsaaonWJZxoiBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184914710"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 01:44:00 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com
Subject: [PATCH v1 3/4] tests/kms_vrr: Indicate force refresh rate request
Date: Tue, 28 Oct 2025 14:13:53 +0530
Message-ID: <20251028084354.2682743-4-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
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

Use data->flag to indicate if user has asked for forced
refresh rate to try.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 tests/kms_vrr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d677a0a07..73c556a68 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -106,6 +106,7 @@ enum {
 	TEST_CMRR = 1 << 9,
 	TEST_LINK_OFF = 1 << 10,
 	TEST_NEGATIVE = 1 << 11,
+	TEST_FORCE_RR = 1 << 12,
 };
 
 enum {
@@ -1109,6 +1110,7 @@ static int opt_handler(int opt, int opt_index, void *_data)
 		break;
 	case 'r':
 		data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(atoi(optarg));
+		data->flag |= TEST_FORCE_RR;
 		break;
 	case 's':
 		data->static_image = true;
-- 
2.48.1

