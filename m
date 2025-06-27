Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B6AC7EE39
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 06:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2696410E973;
	Fri, 27 Jun 2025 06:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4ntWn/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DF310E971
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 06:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751004051; x=1782540051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ol4z/XJByEgZOLe4hPLDVBsWlaHm6G8oK7np/E9hXAI=;
 b=Y4ntWn/J/x1ZQgLAuiZkbhgVg0UuoWVVvYao17+YocsNlwNAKEuw5+NX
 En9yrBdztMqOj4EzCjMMQvwp96PjadqsBLEuFRQ38tQ95lVKar3U2pn4s
 4RRM/osRO8/5kSE0kTHraOe8xEbrpRVUKzGxymzSlWUn79Z0KKN0l+YZc
 Sn+rxW/V0+fikIyXNfEoae9YHHIc4CwtEC8Hnc7XIEABicEpkh/FJarMK
 jf0wuNeZjiB+CA4AIjA/zW0vuwBgFAqwtMu1ENIFYOxjMJNQxkKz4dYby
 TJXLfFYjh3YHn5QLJzz9W0gxE7E8FFdOXky86MWAjqw4D2iQSOF3jkrmd Q==;
X-CSE-ConnectionGUID: AH0JSVTzSJurKQbO0v9ACA==
X-CSE-MsgGUID: CqCsmCaASeOQF8reCD/N9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53278519"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="53278519"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 23:00:50 -0700
X-CSE-ConnectionGUID: WA/78rQWTdGeMlu0tNpdcQ==
X-CSE-MsgGUID: QB1Q36aPS+yVD67lBDoyIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="152809519"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2025 23:00:49 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 7/7] tests/intel/kms_psr2_sf: Enable the tests support
 variations based on the WAs
Date: Fri, 27 Jun 2025 11:34:46 +0530
Message-Id: <20250627060446.29615-8-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627060446.29615-1-mohammed.thasleem@intel.com>
References: <20250627060446.29615-1-mohammed.thasleem@intel.com>
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

This update stops skipping fbc-* tests support variations based on the WAs.

v2: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr2_sf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 68842b020..50582c42a 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -561,6 +561,11 @@ static void prepare(data_t *data)
 	igt_plane_set_position(primary, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f(data->op_fbc_mode == FBC_ENABLED &&
+		      !intel_is_fbc_disabled_by_wa(data->drm_fd),
+		      "WA has disabled FBC on BMG\n");
+
 	if (data->coexist_feature & FEATURE_DSC)
 		igt_require_f(igt_is_dsc_enabled(data->drm_fd, output->name),
 			      "DSC is not enabled\n");
-- 
2.34.1

