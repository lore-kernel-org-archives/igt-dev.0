Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE741C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB8D10E50D;
	Tue, 30 Jul 2024 11:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMa8FQA+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95ABA10E514
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340083; x=1753876083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5b3LMaVg0aaDuhHuYnonETwnX6dQYSYnmqRSFI3fcBE=;
 b=MMa8FQA+sPTCtTCztqkZr+yu7uJkx104jD29MHpVWmT2gvgZ/+e0TLK/
 poasnkZfkp65pTkbiS7uPErszigvDlQ54rEswaTg8gQhethqM3Ln0X4jO
 U9v3zNvTIsI8Lk531vRHcPbpCFflDAmfnh6bcadphwv5w7Acq/3AHBywb
 TQ2krx56a3yqhedf1O6TwolfbsIjTXrdrcOaPA0OBATkWFoWK1G++99v3
 c4UR+pFzG31aWW+0fbGuLvY3YlPuQdump1sSWvpk11KMn6lzjQyRAtXw4
 1dFWbgG/MYqg5AJk74uvWeScriJZNdUMWsiS22sqm/xwxkaDzfk1H7eab Q==;
X-CSE-ConnectionGUID: Kg/hN5vxQGi4w5dWWI7FuQ==
X-CSE-MsgGUID: HjxIg4mCQWCEd5MsWyVOBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23937318"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23937318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:48:03 -0700
X-CSE-ConnectionGUID: DjOvg5RVSWKq7zq2yCkshQ==
X-CSE-MsgGUID: BUnPhI9mRAuYSB+KJYwhNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54216859"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:47:59 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 27/66] lib/xe_eudebug: Add mutex for log events write
Date: Tue, 30 Jul 2024 13:44:44 +0200
Message-Id: <20240730114523.334156-28-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From: Pawel Sikora <pawel.sikora@intel.com>

Make 'xe_eudebug_event_log_write' to be thread-safe.

Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.c | 6 +++++-
 lib/xe/xe_eudebug.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index ed1e382c7..254a7261a 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -836,6 +836,7 @@ struct xe_eudebug_event_log *xe_eudebug_event_log_create(const char *name, unsig
 	igt_assert(l->log);
 	l->max_size = max_size;
 	strncpy(l->name, name, sizeof(l->name) - 1);
+	pthread_mutex_init(&l->lock, NULL);
 
 	return l;
 }
@@ -848,6 +849,7 @@ struct xe_eudebug_event_log *xe_eudebug_event_log_create(const char *name, unsig
  */
 void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l)
 {
+	pthread_mutex_destroy(&l->lock);
 	free(l->log);
 	free(l);
 }
@@ -857,7 +859,7 @@ void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l)
  * @l: event log pointer
  * @e: event to be written to event log
  *
- * Writes event @e to the event log.
+ * Writes event @e to the event log, thread-safe.
  */
 void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eudebug_event *e)
 {
@@ -868,6 +870,7 @@ void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eu
 	 */
 	igt_assert_lt(e->seqno, 10 * 1000 * 1000);
 
+	pthread_mutex_lock(&l->lock);
 	igt_assert_lt(l->head + e->len, l->max_size);
 	memcpy(l->log + l->head, e, e->len);
 	l->head += e->len;
@@ -876,6 +879,7 @@ void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eu
 	igt_info("%s: wrote %u bytes to eventlog, free %u bytes\n",
 		 l->name, e->len, l->max_size - l->head);
 #endif
+	pthread_mutex_unlock(&l->lock);
 }
 
 /**
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 81c33417f..a499cc977 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -14,6 +14,7 @@ struct xe_eudebug_event_log {
 	unsigned int head;
 	unsigned int max_size;
 	char name[80];
+	pthread_mutex_t lock;
 };
 
 struct xe_eudebug_debugger {
-- 
2.34.1

