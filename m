Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85C6FF886C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 21:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F4B10E031;
	Tue, 28 Apr 2026 21:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+frdm8y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988F310E031
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 21:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777411321; x=1808947321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UlrR8ht2VS/de94p0g23kGx5EZUJkyHmbn6t7sqyXhQ=;
 b=V+frdm8yCoj8Kv6HgH9M5zekQNwfdWCiWZ3TD/VonWCflyIoKCFWbwJq
 BTmJp4KLGRLmohyKB64ePCaY21YjsmhAguEuN/QL4WFhCwXGgxL0Qlvye
 eMf6oiYtw6iQAiPGldAUFRY+cB4HDOWTcpPt88UTbWY6PClyi2hhpfMks
 TOhL+Lw1ARg3keV7bgvGkhb4gpJBZTWcqPN5S3rgElGkjU8abUpA2QzdA
 l0VUssVGFhFlFgcaEyT1DqCVgMOimHja+1t5T2W+mPp6k2MtK/P04wqLt
 a9SaSZbYwBhfYIbHCoQf2bPNhSEY1ikpbD3Ze6cP2x8IYvaaK8G6f6lsn g==;
X-CSE-ConnectionGUID: N1Bkw9nDT7+so9b/2kcPfQ==
X-CSE-MsgGUID: Ex+P648dSTaGvJaZdO0nWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78526175"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78526175"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 14:22:01 -0700
X-CSE-ConnectionGUID: xGYAnhLnSaqTmAui7w1pZA==
X-CSE-MsgGUID: mbj7cYyyRpSA7rM66kdZTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238400785"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 14:22:00 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t,
 v4 3/5] lib/igt_hdr: Add helpers to enable and disable HDR on an
 output
Date: Wed, 29 Apr 2026 03:00:38 +0530
Message-Id: <20260428213040.2293921-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260428213040.2293921-1-swati2.sharma@intel.com>
References: <20260428213040.2293921-1-swati2.sharma@intel.com>
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

Add convenience helpers to explicitly enable and disable HDR on an
output connector.

v2: -rebase

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 lib/igt_hdr.c | 16 ++++++++++++++++
 lib/igt_hdr.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
index 1baf61ca6..eae8c298b 100644
--- a/lib/igt_hdr.c
+++ b/lib/igt_hdr.c
@@ -222,3 +222,19 @@ bool igt_output_supports_hdr(igt_output_t *output)
 {
 	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
 }
+
+void igt_hdr_disable(igt_output_t *output)
+{
+	igt_hdr_set_metadata(output, NULL);
+	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 8);
+}
+
+void igt_hdr_enable(igt_output_t *output)
+{
+	struct hdr_output_metadata meta;
+
+	/* Fill HDR metadata and enable it on the output */
+	igt_hdr_fill_st2084(&meta);
+	igt_hdr_set_metadata(output, &meta);
+	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
+}
diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h
index 09243f915..15ce5f117 100644
--- a/lib/igt_hdr.h
+++ b/lib/igt_hdr.h
@@ -25,4 +25,7 @@ void igt_hdr_set_metadata(igt_output_t *output,
 
 bool igt_output_supports_hdr(igt_output_t *output);
 
+void igt_hdr_disable(igt_output_t *output);
+void igt_hdr_enable(igt_output_t *output);
+
 #endif /* IGT_HDR_H */
-- 
2.25.1

