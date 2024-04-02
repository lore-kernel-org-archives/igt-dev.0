Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75769C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 22:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D75F1120E8;
	Tue,  2 Apr 2024 22:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naCJY5oH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E645C1120E8
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 22:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712096218; x=1743632218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+z5AjdBTrdhcr+/RPthlHqEgCAQDpYFRmk18KdCHLa4=;
 b=naCJY5oHvnZAzVRNK/T8/7G1ZkawVncFEqWua3F3sRFnqRR6g+0x16dr
 RYBehWZskDPwxWb3/XQq2ciEpGzX6xXkx4p7bzyjNHfLZyBA62UR+qxX2
 e0+ll8JHYDeNxBfyrZcKmrQ4big94gSJHGd+lhHCn4Ktj0gE/dPDj7t+b
 9uen3fERIoW+Eaq4kGeXHqBr/POIZdNbQEx9CjCdbD+5zMkTBf2w8En7X
 uwTNzXHj2l34lDdEZxR786p1vfR0K6tPrP8uMF4M1bGCuX72XSFgOJJHU
 FICpy9NCfAnAl2CeVTrLRJ1pXSnmh+P24hY0hQRX0ReaNRIyFPcnWFKDV Q==;
X-CSE-ConnectionGUID: L5/uAvxJTuyFK7uuSRx1Rw==
X-CSE-MsgGUID: QJmydsHoRj6Q3a/gZYR1AA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7424322"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7424322"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
X-CSE-ConnectionGUID: 1cM7Ke32TP2yqJ0s6gTPOA==
X-CSE-MsgGUID: pomOgdxnRn6KUAbjp+3EAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18035598"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/8] lib/igt_drm_clients: Fix sizeof calculation
Date: Tue,  2 Apr 2024 15:17:10 -0700
Message-ID: <20240402221716.1840148-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240402221716.1840148-1-lucas.demarchi@intel.com>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
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

val and last are arrays of certain types. For the latter, it's
underallocated on 32-bits since it should be sizeof(u64) not the size of
a pointer. When running on 64-bits, no real bug.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_clients.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 90ca6d61c..c8dc21d6a 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -182,8 +182,8 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 		c->engines->num_engines++;
 		c->engines->max_engine_id = i;
 	}
-	c->val = calloc(c->engines->max_engine_id + 1, sizeof(c->val));
-	c->last = calloc(c->engines->max_engine_id + 1, sizeof(c->last));
+	c->val = calloc(c->engines->max_engine_id + 1, sizeof(*c->val));
+	c->last = calloc(c->engines->max_engine_id + 1, sizeof(*c->last));
 	assert(c->val && c->last);
 
 	/* Memory regions */
-- 
2.43.0

