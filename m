Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2E8C54E69
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 13:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D661910E156;
	Fri, 15 Mar 2024 13:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IKL2eCvK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBFE10E156
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710508754; x=1742044754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rmpXprq7tpKaqJEXKkWofPkmDxEaur2m7z8CAS4nMKM=;
 b=IKL2eCvKbVVfcyoKh7QSjaCauVGJtGSJYia0VgqHiZZiKXP1zejWmUZU
 cNf9jgxeI6s7v630E0WT0Gzch+GbNJdrHc6Mbq7SLs5WvQmVeQJbWk6m4
 FdY4xQjCpw+YoQxk1jvzXXTSV7ZS+EcsOlSwSNS5PI4/wOdTBHZKHYnnT
 4YgLOedCBgpNELjam+u0gweAy4tArJYSeCm1Hp1ymUgi6JtvspgBF9Plo
 Ru0yuXcoM0y2FanIr2/vFOttQYGcLVT+ppiPjvLAdhqgAU4dXbKbgBn6z
 7nU+pMLzkl78t4+19lvkhtul7yFHtvJZIyV1ldT4NrbCPvGOcd9B5FGYl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22897135"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="22897135"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 06:19:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="17372706"
Received: from unknown (HELO localhost) ([10.245.246.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 06:19:11 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bernd Kuhls <bernd@kuhls.net>
Subject: [PATCH i-g-t v1 1/3] lib/igt_sriov_device: fix musl libc build
Date: Fri, 15 Mar 2024 14:18:59 +0100
Message-ID: <20240315131901.28144-2-kamil.konieczny@linux.intel.com>
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
including limits.h

Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_sriov_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index f425a5ecf..a0ef05d5c 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -5,6 +5,7 @@
 
 #include <dirent.h>
 #include <errno.h>
+#include <limits.h>
 #include <pciaccess.h>
 
 #include "drmtest.h"
-- 
2.42.0

