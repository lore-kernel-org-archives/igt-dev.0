Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD744D3F094
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 16:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7E010E1B4;
	Wed, 28 Jan 2026 16:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fxJ1lmVV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BBB10E1B4
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769618553; x=1801154553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EJzR6Q9CceORpxI41iCsweNOZLXys6OhbKuwUhJyB/E=;
 b=fxJ1lmVVKqKsdc9tE7Bns9olkMowX8xiv8CWU3G8z28zsWqnaySKScQq
 T8dZWlsAmadSr3YYdzVWytXSQWeR4jIhwSwRxVveaT/oAv02luqNI7ZvK
 cv2AKHoFVdcVARX+9mDE7nkjYUDcrq9oEUSjBWzYUHJ3AYyRSBc2XD91L
 W4O5jJxfmTtUl/cp9orJUUootdNd88ttJFtucpBDMUn9O7U3U5K7t7sAI
 9r/yk55lVTnbvhUdUjwgUYOvVaPKHw8Vi01RQ7WHteCz8d/WTs/wZqcn2
 fWLnCOd+b6cV36/57SIfKQ9De7vwho4dabcElT1zHkzq1tGWBWTbqdGIj Q==;
X-CSE-ConnectionGUID: rFDM7TIET6iJcnBO80AHFw==
X-CSE-MsgGUID: tWyGR8ISRg2/K8qLhpUhJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96298704"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="96298704"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:42:33 -0800
X-CSE-ConnectionGUID: zsdDF2DkSpeR0auVnhX90A==
X-CSE-MsgGUID: ubagwrWfTF6Z0r5RacrWtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208334309"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.49])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:42:32 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/2] tests/xe_exec_system_allocator: Don't leave
 bo_flags uninitialized
Date: Wed, 28 Jan 2026 17:42:26 +0100
Message-ID: <20260128164224.932886-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128164224.932886-4-zbigniew.kempczynski@intel.com>
References: <20260128164224.932886-4-zbigniew.kempczynski@intel.com>
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

Currently it works by accident because compiler optimization initializes
bo_flags to DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM (even if this
should happen conditionally) so consecutive xe_bo_create() succeeds.
But without optimization many subtests start to fail.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 412ad0384e..fc987ac7f4 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1417,7 +1417,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	};
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
 	struct test_exec_data *data, *next_data = NULL, *original_data = NULL;
-	uint32_t bo_flags;
+	uint32_t bo_flags = 0;
 	uint32_t bo = 0, bind_sync = 0;
 	void **pending_free;
 	u64 *exec_ufence = NULL, *bind_ufence = NULL;
-- 
2.43.0

