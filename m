Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA79C3DA7E
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D646910E431;
	Mon, 29 Jul 2024 16:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwTDZ6BM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73B110E431
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269135; x=1753805135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AeRKBQCE75kG0NOnChibgjxvs93u6amaagIvHeZ31i8=;
 b=bwTDZ6BMu6AUTjwU3Q2dhcbkCNKO9qZ4AipphNRNzQDeXG8kEKESqDYU
 UrcyC/iNC9z518FAFHs0r+cSH18Qp6fcXu8LQke+dhEcRMijThccW3Z1R
 VbnQ6iN7Y1DN/OyfReh0mWjbc4ftbhVg+HMtiBNmpXubhmJOllI91HgyS
 u5WlQzjUkkSOvROkd6OjjCiSFDmw/UbazbMMIhlOUydZTApFBuck5TzYa
 wp4JOcNlXbKOtZfspmCkRlP8bYfAqD6r2CNItG81Pin9wJB0f24GCaRvC
 lBs5BzpV+4FAy4zgSalba27DZoiNSAAW9c52z1D+160uFgvSbovBg81Ly w==;
X-CSE-ConnectionGUID: OF2Ho1WpT0S+TtgCiqo83Q==
X-CSE-MsgGUID: QWtQbJloQuuFUoAjiiYNIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427796"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427796"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:21 -0700
X-CSE-ConnectionGUID: GAe405HiRMOSL7N2Z1sLgQ==
X-CSE-MsgGUID: MMi9XP9QRbCicMvG4aSU/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53739770"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:17 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 57/66] lib/xe_eudebug: Expose xe_eudebug_connect
Date: Mon, 29 Jul 2024 18:01:50 +0200
Message-Id: <20240729160159.37036-58-christoph.manszewski@intel.com>
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

From: Karolina Stolarek <karolina.stolarek@intel.com>

Expose xe_eudebug_connect library function to use it directly in tests.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_eudebug.c | 30 ++++++++++++++++++++----------
 lib/xe/xe_eudebug.h |  1 +
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 41809429d..1fa9cbaf1 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -329,16 +329,6 @@ static int __xe_eudebug_connect(int fd, pid_t pid, uint32_t flags, uint64_t even
 	return debugfd;
 }
 
-static int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags)
-{
-	int ret;
-	uint64_t events = 0; /* events filtering not supported yet! */
-
-	ret = __xe_eudebug_connect(fd, pid, flags, events);
-
-	return ret;
-}
-
 static void event_log_write_to_fd(struct xe_eudebug_event_log *l, int fd)
 {
 	igt_assert_eq(write(fd, &l->head, sizeof(l->head)),
@@ -810,6 +800,26 @@ static void event_log_sort(struct xe_eudebug_event_log *l)
 	xe_eudebug_event_log_destroy(tmp);
 }
 
+/**
+ * xe_eudebug_connect:
+ * @fd: Xe file descriptor
+ * @pid: client PID
+ * @flags: connection flags
+ *
+ * Opens the xe eu debugger connection to the process described by @pid
+ *
+ * Returns: 0 if the debugger was successfully attached, -errno otherwise.
+ */
+int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags)
+{
+	int ret;
+	uint64_t events = 0; /* events filtering not supported yet! */
+
+	ret = __xe_eudebug_connect(fd, pid, flags, events);
+
+	return ret;
+}
+
 /**
  * xe_eudebug_event_log_create:
  * @name: event log identifier
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index a499cc977..4654b462f 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -112,6 +112,7 @@ typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
 #define XE_EUDEUBG_FILTER_ALL			GENMASK(DRM_XE_EUDEBUG_EVENT_MAX_EVENT, 0)
 #define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)	((1UL << _e) & _f)
 
+int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags);
 const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e, char *buf, size_t len);
 struct drm_xe_eudebug_event *
 xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t seqno);
-- 
2.34.1

