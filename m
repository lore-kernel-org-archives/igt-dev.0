Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5FCCF9C77
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 22:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9A310E4AD;
	Mon, 23 Sep 2024 22:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQJintyg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAC110E4A6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 22:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727129517; x=1758665517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p9ECFhRCmMxuB/LzG90f2aHO2bber8OB9jQmtb45RoI=;
 b=MQJintygmWxI21+mlgyQNalp8DzmpqXzpS85PLW5ODOeBEn+di1RxQ7q
 OoBT9JVTX0c8MBVYkXuxKClbkathNtXY4UgYYnvKb+U15RrPzY8uM+KHg
 B7WhMl4KwsCjEVPgHmu18GvJN2Jqk+uOPe8b+f4euo4zsPRMPryln740N
 QXhKko568HdVDOVKCMQjil6YxDjhyyN12p9MBtKoxJVPKSQ2mPW28cZkD
 IG1VMvBkV/QEwpR+LeayONWhLb5Iqo0DXL8xJeFB16YYXOKqCnspNTCA8
 jyiDwV6XcUUwUvnSlLE9oWmVtc+xba6ortxgWTFS5iMw6RVY/MluIsZCz g==;
X-CSE-ConnectionGUID: PfktSjG6RDSaaqob/E0Maw==
X-CSE-MsgGUID: 9kp6UNLJStKxsKn8d1u4qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43615581"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="43615581"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:11:56 -0700
X-CSE-ConnectionGUID: /ovpMdsdQzaZHMuUYJ4oEw==
X-CSE-MsgGUID: ZJgINFeBT7G61x/khBjddA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71244255"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.110.192])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 15:11:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/5] lib/igt_gt: Make igt_open_forcewake_handle()
 xe-compatible
Date: Mon, 23 Sep 2024 17:11:43 -0500
Message-ID: <20240923221146.125848-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923221146.125848-1-lucas.demarchi@intel.com>
References: <20240923221146.125848-1-lucas.demarchi@intel.com>
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

xe uses a different file to hold forcewake. Make
igt_open_forcewake_handle() compatible.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_gt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index b043e2d41..0cc3ee131 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -501,9 +501,17 @@ void igt_stop_hang_helper(void)
  */
 int igt_open_forcewake_handle(int fd)
 {
+	const char *fn;
+
 	if (getenv("IGT_NO_FORCEWAKE"))
 		return -1;
-	return igt_debugfs_open(fd, "i915_forcewake_user", O_RDONLY);
+
+	if (is_xe_device(fd))
+		fn = "forcewake_all";
+	else
+		fn = "i915_forcewake_user";
+
+	return igt_debugfs_open(fd, fn, O_RDONLY);
 }
 
 #if defined(__x86_64__) || defined(__i386__)
-- 
2.46.1

