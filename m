Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD45C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 05:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E995610E188;
	Thu, 12 Jun 2025 05:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/C7Vjar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4066F10E09D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 05:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749704990; x=1781240990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XMo8kFRGPHxC6fKHXob47Nu2SjkgdpVJs4Z0bW+d1pE=;
 b=W/C7VjarxNPLPaXsSGir9FDw0Ayx3Ab/MxS46PgRjV/uncL4NB0hR8O4
 OFae50CV5dFfdCx1ME3PzM4o7i8lihKmOJqmo11qaXY6z5/DojiSC5X6b
 NcJiMZ1LiJmnKCL0boyijv/WelxFzOl/Tixm465cQiB2D1QiNxuLit2T5
 R6kdPNzQqIZ4Dwm/mKIlZsslyTYaa4q2vpywibJ20sCfvwBLVYgseS8IO
 T9lzofCga8oqlyzG8ZqB1ClQpmZkjw2Hdw0+G6HkgiqYB8u9O/6dO++JD
 di/woA2O8DkDWV0DCv5lo9bb5D94mz/+qQqxPpJDYbOkbkbNz2VTm26Q7 A==;
X-CSE-ConnectionGUID: efJr0uOQRAGlXfzS8ggccQ==
X-CSE-MsgGUID: n7jjHukXQXesoJYL6IhGuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="77269124"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="77269124"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:09:50 -0700
X-CSE-ConnectionGUID: 0RQH7yFSS62qkEdoFh57Hw==
X-CSE-MsgGUID: DHE0ZlZvSkWBHCnZ5aiGAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="152400226"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:09:48 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 1/2] lib/igt_panel: Validate vendor name in
 igt_is_panel_blocked
Date: Thu, 12 Jun 2025 10:38:15 +0530
Message-Id: <20250612050816.430252-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250609065936.415814-1-santhosh.reddy.guddati@intel.com>
References: <20250609065936.415814-1-santhosh.reddy.guddati@intel.com>
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

