Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC28BCD1284
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 22:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFCD1120E7;
	Tue,  2 Apr 2024 22:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAKrkd9p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FB21120E7
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 22:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712096218; x=1743632218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iA/OmqyZTOCRx30TSSzr2/5EcvOlkyet0eFuyql2FXo=;
 b=XAKrkd9phEMiWm8BGAmJefaGNJxQkpKhXIVIb8GFN6KEaoXmIr7xZ6hh
 rMa0tmBId3Ljx29GEAKrDhPse1KIyDA2MOaNWtMM71j+0UYhCuJ3RXKMp
 1rqqM/QWnL0UymgcidU/vFVzpLQIHRUyvsn7cHn/3oK1G8A8B9dQNNqFp
 +eD3otAOekgU6gPgmsvQY1rtnEt0KYKPc2IAJib9m5Dwq4hrOCGiZWSYC
 gg0+KjtScpyV69VeLukcjpwCxozpB0JljfHG15dZrI7w8gmwVCZGJ4CyH
 CllxbhfHjzQynEH5FWlJsaXXlYEIBjIAB2U2eHmD3UK+yxOCmBy786qgH w==;
X-CSE-ConnectionGUID: rmCc5bwUSGC1esXw9Q58aQ==
X-CSE-MsgGUID: uv61PetKTOOLREObq8PuIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7424320"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7424320"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
X-CSE-ConnectionGUID: nOw18z73T1Sbr2Amw4oHug==
X-CSE-MsgGUID: uKvMWXjhQQOZNr8dJLjsbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18035595"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 15:16:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/8] lib/igt_drm_clients: Use calloc
Date: Tue,  2 Apr 2024 15:17:09 -0700
Message-ID: <20240402221716.1840148-2-lucas.demarchi@intel.com>
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

Replace malloc + memset with a single calloc as it's shorter and there's
no point keeping them separate.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_clients.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 025d60c51..90ca6d61c 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -35,12 +35,10 @@ struct igt_drm_clients *igt_drm_clients_init(void *private_data)
 {
 	struct igt_drm_clients *clients;
 
-	clients = malloc(sizeof(*clients));
+	clients = calloc(1, sizeof(*clients));
 	if (!clients)
 		return NULL;
 
-	memset(clients, 0, sizeof(*clients));
-
 	clients->private_data = private_data;
 
 	return clients;
@@ -165,9 +163,8 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 	c->clients = clients;
 
 	/* Engines */
-	c->engines = malloc(sizeof(*c->engines));
+	c->engines = calloc(1, sizeof(*c->engines));
 	assert(c->engines);
-	memset(c->engines, 0, sizeof(*c->engines));
 	c->engines->capacity = calloc(info->last_engine_index + 1,
 				      sizeof(*c->engines->capacity));
 	assert(c->engines->capacity);
@@ -190,9 +187,8 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 	assert(c->val && c->last);
 
 	/* Memory regions */
-	c->regions = malloc(sizeof(*c->regions));
+	c->regions = calloc(1, sizeof(*c->regions));
 	assert(c->regions);
-	memset(c->regions, 0, sizeof(*c->regions));
 	c->regions->names = calloc(info->last_region_index + 1,
 				   sizeof(*c->regions->names));
 	assert(c->regions->names);
-- 
2.43.0

