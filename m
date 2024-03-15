Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096DDC54E68
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 06:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A26310F9F3;
	Fri, 15 Mar 2024 06:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCHtot6i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB68C10F9F3
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 06:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710483082; x=1742019082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uTxnqhv9ruHusxE04vgxmaz7OV27+Xtl1SW8kjsf8Ts=;
 b=SCHtot6iXN6qjE4vD52wxVSAT+8ZmRyycPzXhkB2GiUMZu0EeXfVU+x2
 W2Q212MFEmPZaBgVZpxaqVaNhoqy3K2u/f1P1KXvSUlhBebHbA07e00XM
 qtBSHqJUcD+YsujmkNhnA4PFiqlLFXZqSzWrsBwchUSh1zAGdwW8IBeNp
 pYLoP/BpPK1t09MGC/zr5MIugs1y2mF7Vzqp13P5Qv5uVPUk4ZIgGIG/7
 3rFnR74vckNGw0ENvmvLIWjUhvZ0wJAXgtETW9tPWa+OwXUodOuwGZh0d
 QrkL0FZsPmP5Wqo9P8u7/8mfh6CEEJP9mCEnMEjY/XVTMh/sf0VG1gYKL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5187371"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5187371"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 23:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12463531"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 23:11:20 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, bhanuprakash.modem@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [PATCH i-g-t 3/3] tests/kms_frontbuffer_tracking: Align to new
 igt_draw_rect usage
Date: Fri, 15 Mar 2024 11:41:42 +0530
Message-ID: <20240315061142.6591-4-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240315061142.6591-1-vandita.kulkarni@intel.com>
References: <20240315061142.6591-1-vandita.kulkarni@intel.com>
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

Pass NULL as we dont have any mmaped buffers

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index db2db0ff1..392539408 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2254,7 +2254,7 @@ static void *busy_thread_func(void *data)
 {
 	while (!busy_thread.stop)
 		igt_draw_rect(drm.fd, drm.bops, 0, busy_thread.handle,
-			      busy_thread.size, busy_thread.stride,
+			      busy_thread.size, busy_thread.stride, NULL,
 			      busy_thread.width, busy_thread.height,
 			      busy_thread.tiling, IGT_DRAW_BLT, 0, 0,
 			      busy_thread.width, busy_thread.height,
-- 
2.34.1

