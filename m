Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762CDC61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 05:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC7910E71F;
	Thu, 12 Jun 2025 05:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DE5TfZW1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E0E10E71F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 05:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749705300; x=1781241300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XMo8kFRGPHxC6fKHXob47Nu2SjkgdpVJs4Z0bW+d1pE=;
 b=DE5TfZW1qKNTg5aFMpgCfbB5cy0ju8BEEUtSLlK0TAl12yRTurth1Hah
 ntRdNsIw3X8KI4KYCPHsiyrYs/CHsnd9RUWYYSzwFceF5m4Zdarn0Px5C
 oOQBBfHFlS96AMmlV6dmGpVWQCfOUcJY4B3238CEGSPtUPoOqWo3ZuStQ
 Z3rmK1vPqMwEgG7WwI7I37j1eEJCnYrHK4sOK0s3JhhFxbzLjfewnJZiL
 OGEJlm0HITbwsDtrD7+aMks/GRTzZvRngREuiqIllvrNP8CR4LwJjaiX+
 UEpCdL7DrET3ummPYQmZzTfUf8oyZ31s3ScXhRtPWrqbSI2Xc0qzhP42q g==;
X-CSE-ConnectionGUID: AuOF5pgwRgOPy08GGfPhZQ==
X-CSE-MsgGUID: 4Q9gECmKRdmMRjR6a4vLKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="50974847"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="50974847"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:15:00 -0700
X-CSE-ConnectionGUID: +PFOhZOTR3SDY7VdXqZbeQ==
X-CSE-MsgGUID: N+1AbauKTLCVufmVfZ+X0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="151210262"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:14:58 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 1/2] lib/igt_panel: Validate vendor name in
 igt_is_panel_blocked
Date: Thu, 12 Jun 2025 10:43:25 +0530
Message-Id: <20250612051326.430330-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250612051326.430330-1-santhosh.reddy.guddati@intel.com>
References: <20250612051326.430330-1-santhosh.reddy.guddati@intel.com>
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

Avoids false positives by returning false early when the vendor name is
NULL, empty, or a single whitespace character.

V2: Add Fixes tag (Suraj)

V3: Split the commit and indentation (Kamil)

Fixes: ec444a83c8ff ("lib/igt_panel: Skip hdcp tests on unsupported panels")
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_panel.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/igt_panel.c b/lib/igt_panel.c
index c89bf9123..a5aa83e8b 100644
--- a/lib/igt_panel.c
+++ b/lib/igt_panel.c
@@ -20,11 +20,15 @@
  * true if the vendor name is found in the blocklist, false otherwise.
  */
 bool igt_is_panel_blocked(const char *vendor_name,
-			    const char *const blocklist[],
-			    size_t blocklist_size)
+			  const char *const blocklist[],
+			  size_t blocklist_size)
 {
 	int i;
 
+	if (!vendor_name || vendor_name[0] == '\0' ||
+	    (vendor_name[0] == ' ' && vendor_name[1] == '\0'))
+		return false;
+
 	for (i = 0; i < blocklist_size; i++) {
 		if (strstr(blocklist[i], vendor_name) != NULL)
 			return true;
-- 
2.34.1

