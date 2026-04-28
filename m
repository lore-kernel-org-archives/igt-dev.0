Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5889FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 21:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7000B10E031;
	Tue, 28 Apr 2026 21:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dL9e9Lxo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1148510E031
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 21:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777411320; x=1808947320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NwYaEKeU0/mSdVGxxy8SNkZhyyAQPTIPVLI52NVrQg8=;
 b=dL9e9LxowI+HoRmpFl4xbYWGJJPOkJbTaAestgN2j0Tv59tJRfoAxnE5
 duqV9mMU7h2ezAKOD+WoMHJkdFm0stok3/tiwNm89utmZVfHBLmkIq52t
 DgvQOqIZtR7xYSJofN5YNxRBKqmNhdZSB7Ld+6B81/wgE7tzL0Yn4l65Y
 uKAo+W/7hm7Y7qNBLBcI+TI+zC0yONNVYwouL89CWv0xltvW5lVbyQOJf
 2WYgG2b/SMzaybPDHGLXRM3m36PsiHw4U7L/R0cJtTCoTID3G9KJNKNRH
 om9w3vjBVAFVed+LW1VUDPJsxoak3i/8njtRjWhQ5qHHRYyfy4uMjWFf9 Q==;
X-CSE-ConnectionGUID: uUIZ9gBZR7qAPY1lMmRcQw==
X-CSE-MsgGUID: r+hmHZAKSNyxKmuO0Jhmfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78526169"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78526169"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 14:22:00 -0700
X-CSE-ConnectionGUID: oDOSvJlrTWmCAFWwaG9izg==
X-CSE-MsgGUID: eXoNkmA2RHqFlIyICxGk6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238400780"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 14:21:59 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v4 2/5] lib/igt_hdr: Fix EOTF bit flag checking
Date: Wed, 29 Apr 2026 03:00:37 +0530
Message-Id: <20260428213040.2293921-3-swati2.sharma@intel.com>
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

From: Alex Hung <alex.hung@amd.com>

EOTF values are bit positions, not masks. Use (1 << value) to create
proper bit masks when checking HDR support in CTA-861 EDID blocks.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_hdr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
index f7df2dfde..1baf61ca6 100644
--- a/lib/igt_hdr.c
+++ b/lib/igt_hdr.c
@@ -42,8 +42,8 @@ static bool cta_block(const char *edid_ext)
 
 	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
 	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
-	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
-	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
+	     ((edid_ext[2] & (1 << HDMI_EOTF_TRADITIONAL_GAMMA_HDR)) ||
+	      (edid_ext[2] & (1 << HDMI_EOTF_SMPTE_ST2084))))
 			return true;
 
 	return false;
-- 
2.25.1

