Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ABFC54E58
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 13:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5E710E265;
	Fri, 15 Mar 2024 13:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkN8M/rP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0620D10E265
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 13:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710508761; x=1742044761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W0oKxs4+lmNVP8FRprSWcdLM4hgrbEl/j88+2dz38YU=;
 b=AkN8M/rPnazfRuuR1tWMR9GuZRJutM/8PrxFkeBzXMpLuh1aa5drp/N4
 2jj6GWbux2mB+Fs8JBmERIVXpv4eFYj4QUcVQhoBJ4eoH7TqElH0CHJ/0
 NiCC7YJy2tjoe5HQ8NUbJHDJYEjeZgusn9BSaEheo6o6QYPl/Qcc7AsCt
 81V5kXMT4Gx5YEfo/gkpKgvZxjnqJbMNuXM1iS3mLOcnLqGNY9vQqjefg
 ckWDnPxHC3rYJuSdKMYnKhfPj9emKwcS7suECUuxh8yWWSk7wKKwN8HlX
 qgNeYHsR7cbH1l85RDL1y0I/Di1MvG5+vCkiHn8FPX2ySDJ+hfCpPw6gL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16023306"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="16023306"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 06:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="43572067"
Received: from unknown (HELO localhost) ([10.245.246.202])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 06:19:19 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bernd Kuhls <bernd@kuhls.net>
Subject: [PATCH i-g-t v1 3/3] tests/intel/xe_debugfs: fix musl build
Date: Fri, 15 Mar 2024 14:19:01 +0100
Message-ID: <20240315131901.28144-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240315131901.28144-1-kamil.konieczny@linux.intel.com>
References: <20240315131901.28144-1-kamil.konieczny@linux.intel.com>
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

On musl build the PATH_MAX define is missing, fixed this with
including limits.h. Also while at this, move system includes
before igt ones and sort them.

Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_debugfs.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 4fd5ebc28..c5a586e9b 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -12,17 +12,18 @@
  * Description: Validate debugfs entries
  */
 
+#include <fcntl.h>
+#include <dirent.h>
+#include <limits.h>
+#include <string.h>
+#include <sys/types.h>
+
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
-#include <fcntl.h>
-#include <string.h>
-#include <sys/types.h>
-#include <dirent.h>
-
 struct {
 	bool warn_on_not_hit;
 } opt = { 0 };
-- 
2.42.0

