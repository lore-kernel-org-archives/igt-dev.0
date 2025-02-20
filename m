Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C31C021B2
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 14:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA3B10E995;
	Thu, 20 Feb 2025 14:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdiysM5Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92E010E0FF
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 14:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740063589; x=1771599589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QBGii+oCMtJWx2XKG+5/pHXXtOsHlGMborV9JWSFp6Y=;
 b=FdiysM5QbIpMmg7mvQi/hTGXKWdW312G4PerXo4NbR2nNK9X3V7JE+Cl
 gIggH3Sh88pJBR5ZTNCOh+MEP/pnsXdb1GMNid6Q/syZQ29I+YUpaRL2g
 L1xUyD4rLLCaw8Ee2pSjX33limyFxGvS0if7CBWvC96OufHwR99gf6rLx
 QgWRQmKHm76QtGAKs0yX8u+zDPTtqIdqIkZxsbRm4fKcNvTfsHTh50tQA
 anmcvC0aebjYqF8BNbkbNV9DEdJwyzLFTQJiaBwXFmRNZoNJpKT53oqN7
 8TC5wlMEYMw2Ur9qHXzxXM06YxfAPTR23F6T8Plq0Rt3j8V7ECNQP+GAt Q==;
X-CSE-ConnectionGUID: c01m+iIZR5qS1vKAnO4V3A==
X-CSE-MsgGUID: 2DTClYwCTYyWGqpOXhen5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="52249651"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="52249651"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 06:59:48 -0800
X-CSE-ConnectionGUID: Abx5ucBzSXexFWjspT6BmA==
X-CSE-MsgGUID: ikqWaoL5ROO1KEoOJ240rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119158675"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.232])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 06:59:46 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/xe_eudebug: Export __xe_eudebug_enable_getset
Date: Thu, 20 Feb 2025 15:59:11 +0100
Message-Id: <20250220145912.37735-2-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220145912.37735-1-christoph.manszewski@intel.com>
References: <20250220145912.37735-1-christoph.manszewski@intel.com>
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

Export __xe_eudebug_enable_getset to make it possible to catch error
code in tests.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c | 15 +++++++++++++--
 lib/xe/xe_eudebug.h |  1 +
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 1205d945b..04f0e86e9 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1710,7 +1710,18 @@ static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
 	xe_eudebug_event_log_write(c->log, (void *)&em);
 }
 
-static int enable_getset(int fd, bool *old, bool *new)
+/**
+ * __xe_eudebug_enable_getset
+ * @fd: xe client
+ * @old: pointer to store current toggle value
+ * @new: pointer to new toggle value
+ *
+ * Stores current eudebug feature state in @old if not NULL. Sets new eudebug
+ * feature state to @new if not NULL. Asserts if both @old and @new are NULL.
+ *
+ * Returns: 0 on success, -1 on failure.
+ */
+int __xe_eudebug_enable_getset(int fd, bool *old, bool *new)
 {
 	static const char * const fname = "enable_eudebug";
 	int ret = 0;
@@ -1767,7 +1778,7 @@ out:
 bool xe_eudebug_enable(int fd, bool enable)
 {
 	bool old = false;
-	int ret = enable_getset(fd, &old, &enable);
+	int ret = __xe_eudebug_enable_getset(fd, &old, &enable);
 
 	if (ret) {
 		igt_skip_on(enable);
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 823c7f6ea..3adde5f6c 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -171,6 +171,7 @@ void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t stage);
 uint64_t xe_eudebug_client_get_seqno(struct xe_eudebug_client *c);
 void xe_eudebug_client_set_data(struct xe_eudebug_client *c, void *ptr);
 
+int __xe_eudebug_enable_getset(int fd, bool *old, bool *new);
 bool xe_eudebug_enable(int fd, bool enable);
 
 int xe_eudebug_client_open_driver(struct xe_eudebug_client *c);
-- 
2.34.1

