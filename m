Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F77DC04FF8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 15:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0F510F18C;
	Thu, 18 Apr 2024 15:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQN+Z0cY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAB910E48E
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 15:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713453451; x=1744989451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bwtnSzs9rmXld54WDyP+T3/mzpiJ5C/ZMDqdQkl/7ew=;
 b=aQN+Z0cYieCCgZWidy7APHb+FqAU5+6oba9JAlwaA7exemTLiCRWDZZA
 lXLaYVnsjWl+6VfoAvp4zpZOdHaVrdm9pt4QTfM7A9d18IRCRPOTMhz/D
 2nwYtPld6qg+UcNM8GjbUMUf3wz4gyOzkGOoYWsTXRINEjdQ7wCiEoa/9
 hGB1pqC2EIn5RZSrPih01AE0e+ENS855k0uPpmQH8pZotJms826wGEiMz
 FHY59GBbI9Df4CiriO4eaCQdxqCnAMWQgKDU6NV4eJPT1PiPW22sGVN9w
 9DNA1TcNOAv16i856dM1WrNtVGwahFb2psCUUXlOqUU/eNCHQxH+pH+pK g==;
X-CSE-ConnectionGUID: Geu1BW/gS1CQ6fCe4cZ8eA==
X-CSE-MsgGUID: T1t8BvWaSYOiD1BoDn6q6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26465803"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="26465803"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:17:31 -0700
X-CSE-ConnectionGUID: UM+Kq/OzQoG6qeQSEfCBaw==
X-CSE-MsgGUID: OfjShpuzSm+qdxFuaiBtjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23463246"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 08:17:28 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 1/7] lib/igt_kms: don't run on unsupported platform
Date: Thu, 18 Apr 2024 20:58:11 +0530
Message-Id: <20240418152817.2352850-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240418152817.2352850-1-kunal1.joshi@intel.com>
References: <20240418152817.2352850-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

kmd exposes debugfs for all the platforms, so add
a check in igt

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Suggested-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3216fe7e4..6f093fed7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6246,6 +6246,14 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
 	char buf[512];
 	int debugfs_fd, ret;
 
+	/*
+	 * bigjoiner is supported on display>= 12 and only on
+	 * Pipe A for Display 11
+	 * For simplicity avoid Display 11 and check for >= 12
+	 */
+	if (intel_display_ver(intel_get_drm_devid(drmfd)) < 12)
+		return false;
+
 	igt_assert_f(output->name, "Connector name cannot be NULL\n");
 	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
 	if (debugfs_fd < 0)
-- 
2.25.1

