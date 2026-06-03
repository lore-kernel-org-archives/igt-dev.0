Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665E2CD6E55
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 07:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B39B10F957;
	Wed,  3 Jun 2026 07:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vz4fOB1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC4210F957
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 07:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780472176; x=1812008176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CcVTlR9Cd9UuzunvjXSjJUecPJpGTMdCJ1HaZxxh2HQ=;
 b=Vz4fOB1xuBtqygHUtd0hsH90g9l4Kki/WY7ebTYa5X8n/j3gqX6W9OoK
 IY9OU/U3x2BJPk7px4KBu0nAicROjbT+Op6QwEq6eeUs8z34eo7/ZzO73
 HKoNoTJqqMNmZmjGdmAcYIrqWCTsjGvYDFgZHXjFLCJQZVTQQmga/bPBl
 E1MI3iGvssfxLFkHlj/LknJv+jFh8W7jlnFd/+YIKIvVD67bDNRz3a1R6
 4y+Q/RxATt4bK8lSeJA5VEw9h0hNso1BgNKK7HdfkDEyJA8kq03bhrJ3B
 Ocf84CO2uN0COXR7IF0hWacX/VFmGrMpSHfd5sKLwYIV5svUq08IxB/Nu g==;
X-CSE-ConnectionGUID: 7wLEdzqkQNGSf61RxOaa+g==
X-CSE-MsgGUID: 0MHvt3OrQnOQaOZQZicIzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81330329"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="81330329"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 00:36:16 -0700
X-CSE-ConnectionGUID: x5/bNSZ4QCeSpywPoF7fRg==
X-CSE-MsgGUID: 9Qcpm9XtQy28P2b7+zZMNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="239980054"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:36:14 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] lib/igt_kms: treat equal limits as bigjoiner
Date: Wed,  3 Jun 2026 13:06:06 +0530
Message-ID: <20260603073606.2168574-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use '>=' instead of '>' so modes equal to max hdisplay or dotclock
are considered for bigjoiner.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0f1ce03a9..e5ffaeac1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6946,8 +6946,8 @@ static int get_max_pipe_hdisplay(int drm_fd)
  */
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
 {
-	return (mode->hdisplay > get_max_pipe_hdisplay(drm_fd) ||
-		mode->clock > max_dotclock);
+	return (mode->hdisplay >= get_max_pipe_hdisplay(drm_fd) ||
+		mode->clock >= max_dotclock);
 }
 
 /**
-- 
2.43.0

