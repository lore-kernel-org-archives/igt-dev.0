Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D236D65526
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 09:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF7B10E55C;
	Wed, 17 Dec 2025 09:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L1hJZFCt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BF910E55C
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 09:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765964529; x=1797500529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xZWfXos5aVuDAM9saUUbZ7wXBV0v58+KScNC/UjEYW0=;
 b=L1hJZFCtWZejG06As0K9yc6najIuq+RO5/ltlcgkZpHGAVYA7zQ3Uljl
 r8ZAIyo9QtMAGcBSgv4dSTz0ZlozvVte8LjdFvGE2ZLZQo8akhwjThSlr
 lCFHixa3v4CxwQ9023JmXWZsPtRSaX24lt6r+JfDqR6v39nFyzmufQMV6
 CyA+osKEabIkxf1xi0g6v86PRyqOB1dNEKtSUfdIA5S1kj9lQeXHjct8R
 jtjMEEgqckSnIBmDGR7rqyxV8rdy/2fQreYomhNtJ/yVKKCm5fBLwcoiu
 kwh/Y20WpIEFDt96041JeO8kF0eZ97U6atX9mUSoShze2sh02Rwp9+4Zi Q==;
X-CSE-ConnectionGUID: /7vW08aiTMmE85Ku1+MtfA==
X-CSE-MsgGUID: af1MVJ69QeilBtB/vKA7yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71754624"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="71754624"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:42:09 -0800
X-CSE-ConnectionGUID: xiFHoy2ATQeXPpO4X0yUZA==
X-CSE-MsgGUID: 67qpZ49XSf2ampNesTHcpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198255501"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:42:06 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v2 1/2] tools/gputop/xe_gputop: Close card_fd after
 engine population in xe_populate_engines()
Date: Wed, 17 Dec 2025 15:01:08 +0530
Message-Id: <20251217093109.4096902-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217093109.4096902-1-soham.purkait@intel.com>
References: <20251217093109.4096902-1-soham.purkait@intel.com>
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

During the engine initialization for a specific device in GPUTOP,
IGT helper functions need card_fd to access each engine and
respective configs. These are required in obtaining the busyness
of the respective engines through PMU in GPUTOP. But for KMS tests
no other DRM client should run while it is running. So once the
required configs and engines are obtained, the card_fd is closed
as opened card_fd in xe_populate_engines() makes appear itself as
DRM client.

v1:
 - Initialize pmu_device_obj to null.

Fixes: c8106465683f ("tools/gputop/xe_gputop: Add gputop support for xe specific devices")
Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop/xe_gputop.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index bb2caa6ea..45cb5bf93 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -92,6 +92,7 @@ void xe_gputop_init(void *ptr, int index,
 
 	obj = ((struct xe_gputop *)ptr) + index;
 	obj->card = card;
+	obj->pmu_device_obj = NULL;
 }
 
 static int pmu_format_shift(int xe, const char *name)
@@ -197,6 +198,8 @@ void *xe_populate_engines(const void *obj, int index)
 		engines->num_engines++;
 	}
 
+	close(card_fd);
+
 	if (!ret) {
 		errno = ret;
 		return NULL;
@@ -263,11 +266,11 @@ int xe_pmu_init(const void *obj, int index)
 		fd = _open_pmu(type, &engines->num_counters, &engine->engine_active_ticks,
 			       &engines->fd);
 		if (fd < 0)
-			return -1;
+			return fd;
 		fd = _open_pmu(type, &engines->num_counters, &engine->engine_total_ticks,
 			       &engines->fd);
 		if (fd < 0)
-			return -1;
+			return fd;
 	}
 	return 0;
 }
-- 
2.34.1

