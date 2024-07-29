Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1797C3DA7E
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F0710E42A;
	Mon, 29 Jul 2024 16:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDXRoElD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A7310E42A
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269028; x=1753805028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f9kfsZryW6IusIpEprcLL931XfdVdJxs3bQuVxEMNSQ=;
 b=DDXRoElDpwf3+XED9fcv19EIpmNG+/zAr8ofhdGbDELbSndaIOAehsTv
 S8JYLEs6QBjdZIrxAmyOkpG3Z0+aVrRvj2Qa6lbYrSHj+uD8dg+L8eBe7
 GJzWm05RsPk2t4kCxfzBmA5KQtkuii7d8k+6ePWvecFllPLwl0H6t74cv
 E7b7KWbNybf3uYlwcnnoKaHJlGCppiFabiLSnUXMX3bwwf9iwYQsrPFX7
 BEmwAdedNuOAQxOKiBvusJdx16ivuTEHPkHQupCek8Pi44P1nvJElhxVe
 iVbe6JaMUYPlPyaG84B4rpkF3CdLdyIS4ZuNPGpoxuD9js3KjvANpCSJM w==;
X-CSE-ConnectionGUID: bTBvynFXRUecOqJZNQ0lJg==
X-CSE-MsgGUID: CwhKnO/DTT+8Xy6AhSl/TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427137"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427137"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:48 -0700
X-CSE-ConnectionGUID: jcnLWlSqQqiR04ZSHnCYBA==
X-CSE-MsgGUID: 2X82oxS8RvCdXaPHlgmcug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53738062"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:03:45 -0700
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
Subject: [PATCH 27/66] lib/xe_eudebug: Add mutex for log events write
Date: Mon, 29 Jul 2024 18:01:20 +0200
Message-Id: <20240729160159.37036-28-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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
index 919dd1d49..41809429d 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -830,6 +830,7 @@ struct xe_eudebug_event_log *xe_eudebug_event_log_create(const char *name, unsig
 	igt_assert(l->log);
 	l->max_size = max_size;
 	strncpy(l->name, name, sizeof(l->name) - 1);
+	pthread_mutex_init(&l->lock, NULL);
 
 	return l;
 }
@@ -842,6 +843,7 @@ struct xe_eudebug_event_log *xe_eudebug_event_log_create(const char *name, unsig
  */
 void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l)
 {
+	pthread_mutex_destroy(&l->lock);
 	free(l->log);
 	free(l);
 }
@@ -851,7 +853,7 @@ void xe_eudebug_event_log_destroy(struct xe_eudebug_event_log *l)
  * @l: event log pointer
  * @e: event to be written to event log
  *
- * Writes event @e to the event log.
+ * Writes event @e to the event log, thread-safe.
  */
 void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eudebug_event *e)
 {
@@ -862,6 +864,7 @@ void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eu
 	 */
 	igt_assert_lt(e->seqno, 10 * 1000 * 1000);
 
+	pthread_mutex_lock(&l->lock);
 	igt_assert_lt(l->head + e->len, l->max_size);
 	memcpy(l->log + l->head, e, e->len);
 	l->head += e->len;
@@ -870,6 +873,7 @@ void xe_eudebug_event_log_write(struct xe_eudebug_event_log *l, struct drm_xe_eu
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

