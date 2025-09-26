Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32578CAC5B8
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 18:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA6810E148;
	Fri, 26 Sep 2025 18:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1MtgqdM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C77310E148
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 18:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758911000; x=1790447000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j5gZ4dynohzKNlAFper/lyaNJH9NvF8P6ytoALcAlnI=;
 b=f1MtgqdMjQ74P8xGhTdXBdwCOnLaeExXHH1oLUrXDRzpDASN3swjYl08
 aatOrsP9800Ma0rYj8YXFB9iBxgpyxqDE0SnPYXkY19MzlhRPyuTY9TIp
 vtD+D7J1zYgErCr4fthn3pzS0WvJzUYVdWZhlEsjJigzqW7xDExnLwQBX
 6GeGDRTJnjM8Riu8RJ7hdmk0NcqXkALU2zCsZnFtyEj3WgYRm1OVtLnK5
 MhG8DZiiv3LlDBV8/HrE6R7hptLVGsGrcIx/3Fh7/p5hDBss4YpvLkXJc
 5G3sVlo6OAz17b+nN2XT97oTnBRqRc2kAOsjkWw7Nm2lZMOxLbOeQDqJv Q==;
X-CSE-ConnectionGUID: JzUUorI/Q0yjwRNanHo0iA==
X-CSE-MsgGUID: TzEZRMTzQNuHHdSbA1u83A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61203580"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61203580"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:23:19 -0700
X-CSE-ConnectionGUID: wSjNMESUTMKDAuPsaDIOfg==
X-CSE-MsgGUID: LE7Hp3suTDqSkEVwTCPCIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="214821947"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:23:18 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_vrr: Skip DRRS-related tests on LNL and
 newer platforms
Date: Fri, 26 Sep 2025 23:53:05 +0530
Message-ID: <20250926182305.3939296-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924093226.3899875-1-ramanaidu.naladala@intel.com>
References: <20250924093226.3899875-1-ramanaidu.naladala@intel.com>
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

To prevent false failures and maintain test relevance, seamless VRR
and DRRS test cases are skipped. This ensures the test suite aligns
with current hardware capabilities and avoids unnecessary execution
on platforms where DRRS is no longer supported.

Bspec: 68917
HSD: 14016007525
Link: https://lore.kernel.org/intel-gfx/20250912135926.18910-1-ville.syrjala@linux.intel.com/

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 233143770..ee0f057d5 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1016,7 +1016,7 @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags
 		return false;
 	}
 
-	if (flags & TEST_SEAMLESS_DRRS)
+	if (flags & TEST_LINK_OFF)
 		goto out;
 
 	/* For Negative tests, panel should be non-vrr. */
@@ -1030,6 +1030,12 @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags
 		return false;
 	}
 
+	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
+	    (intel_display_ver(data->drm_fd) >= 14)) {
+		igt_info("DRRS is not supported on LNL and newer platforms\n");
+		return false;
+	}
+
 out:
 	if (!output_constraint(data, output, flags))
 		return false;
-- 
2.43.0

