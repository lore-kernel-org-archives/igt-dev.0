Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BE61125858
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 17:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA5310E304;
	Wed, 11 Mar 2026 17:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jd2t4f1A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D88A10E304
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 17:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773250758; x=1804786758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oLwSyifvs2k7k6IvQ2yecSTpjY9Yahe/ui0vVnWb9us=;
 b=jd2t4f1ANz+jHyQ8HneFoD3aXswab3LIcgbTtTAMtRWPnuvww5p+01oK
 EuUFws/gFcWZt+R+DH2X+Cc4ABOeyVCFU1S/PcIj6BG+w6VFwyZ1GpNQa
 rEON2jgMgUwuKg546Vt7VtWNNvVl9jbxKK3K8guQ1iNW2i3tV5TI7AGO5
 mYI+P3niVx/pDDTDTj/8ec6llYyEjuZuJj+2hKvgrxT/6ojVKAymc8xud
 +pX0USELThDm/C5ZPxTdy6jdz4PZWYAOiokTtA30aiW/unORtoj12ej4e
 7WkIkDlkMG/R8MyZyU6X8pZrxyKHQNH2B0lL5IlACp7FTcjkSFrNivaid w==;
X-CSE-ConnectionGUID: exRSaC+FTY2+COvJl3zLdQ==
X-CSE-MsgGUID: jp7a+BaPTSix87ZeHKw83w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77935394"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="77935394"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 10:39:17 -0700
X-CSE-ConnectionGUID: efN1y4A2SjOGyRfSOK0Qnw==
X-CSE-MsgGUID: 2rGEz7u0SSC5pyraIm708Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224688942"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 10:39:15 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] lib/igt_kms: Fix joiner force debugfs entry and
 expected value
Date: Wed, 11 Mar 2026 23:10:01 +0530
Message-ID: <20260311174001.224347-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311105033.220652-1-ramanaidu.naladala@intel.com>
References: <20260311105033.220652-1-ramanaidu.naladala@intel.com>
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

Change the debugfs entry and use the number of pipes in IGT as
introduced in KMD.

v2: Update return logic and commit message. (Ankit)

Link: https://lore.kernel.org/all/20240927083831.3913645-4-ankit.k.nautiyal@intel.com/

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0b05ddd72..58dd25697 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7138,7 +7138,7 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
 		return false;
 	}
 
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
 	close(debugfs_fd);
 
 	if (ret < 0) {
@@ -7146,7 +7146,7 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
 		return false;
 	}
 
-	return strstr(buf, "Y");
+	return (atoi(buf) > 1);
 }
 
 /**
-- 
2.43.0

