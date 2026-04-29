Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5CFCCFA13
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 17:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E6310E0B6;
	Wed, 29 Apr 2026 17:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMtUgpW3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255CE10E2E5
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 17:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777484652; x=1809020652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sS4aU4HXUgpQs5SpKCavMH//3yqB2p4y2BAYdrwfazA=;
 b=TMtUgpW3lgEr+8yhzTU1Bps1MqH1rUDJqYBlKYuDeeRKyNE6hQhrL+2b
 LJFz+0ZqcLWWzjEnqrdYx5ULrlXEJ3TxyiFM9UYJg1chSR0/n+HTtSmqt
 W0lBEBxytikCY7gmP8TKskKKBTZ0TSYeBp32R6vhyoEgMNUo7MNLnROzP
 CsC51gWWxRmFbyHv5pDjlPAiRMR0xLvrTXfbj2LOGDgwWnvC2Sn4agpu4
 kotWm3eausbXxh7dAOsfDtzVuv4/2e9Hbwt7G7vY+qDAKrJtHmPWo+Cry
 H5ELi2BML1unSLlh1plh0p/kNUSdOpzLYwSQU4D3ev5UX2dP0hERyZ4BE Q==;
X-CSE-ConnectionGUID: TgLaEesrQq6PqyzxHrxTXQ==
X-CSE-MsgGUID: q+Ies8q9S1ebt+zaWSeekA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="65950872"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="65950872"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 10:44:12 -0700
X-CSE-ConnectionGUID: Vf+w9yh7QOaO0+WA3zFiRg==
X-CSE-MsgGUID: 9kAt9+BkRuqXviVkGnWw8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="233309059"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 10:44:11 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t,
 v5 2/4] lib/igt_hdr: Add helpers to enable and disable HDR on an
 output
Date: Wed, 29 Apr 2026 23:22:03 +0530
Message-Id: <20260429175205.2327206-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260429175205.2327206-1-swati2.sharma@intel.com>
References: <20260429175205.2327206-1-swati2.sharma@intel.com>
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
index 25658ab9e..c0ed9e843 100644
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

