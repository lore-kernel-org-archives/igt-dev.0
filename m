Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB61C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1258A10E50E;
	Tue, 30 Jul 2024 11:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfDDMrdP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D1E10E519
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340174; x=1753876174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uUT7Tyzes83ZaPcYoXwQ8BozI+NTyydFDaV5wy06K00=;
 b=jfDDMrdPdPVSf/x2mmpLRGlKV00LoKaDxV8oV6bcIALQebfGzaThIM3I
 z+46i3nbAvhMHj/AkDu1iMklqWCP3J9Meh08GHcsHYidxvbLCPaiGWuKH
 eSdUrbOnV9XFyKVWuibRFShgWRECwCUS7JILZVMLYhjOJreg85KADxy/o
 spbsiE7L1fpGFpPhQid7ihyjeNQpWznU7On3EVQywoZDS5e8gvqWOrexl
 W+50y38c17lLE6I6mYRWOl1Cp+pwhjPAoeqoQAZf2QOB5Vzi/pPW9rcDw
 +fiQEzM5+97XyndlJGJ/B7Wh3+y8CeqfmrQXiTQxLx16e1KK6QyWg7IaN Q==;
X-CSE-ConnectionGUID: fipQPpv8QPqsWD7cUV0B8Q==
X-CSE-MsgGUID: PHV6ZWIUQsqfLj53C+zUmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20286749"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20286749"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:34 -0700
X-CSE-ConnectionGUID: 43YkmfS6R1+CZBRmCe/Zqg==
X-CSE-MsgGUID: RXG17Oe5TSe2P/zYS5zuiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217632"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:30 -0700
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
Subject: [PATCH i-g-t v2 57/66] lib/xe_eudebug: Expose xe_eudebug_connect
Date: Tue, 30 Jul 2024 13:45:14 +0200
Message-Id: <20240730114523.334156-58-christoph.manszewski@intel.com>
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
index 254a7261a..c9f0c63f1 100644
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
@@ -816,6 +806,26 @@ static void event_log_sort(struct xe_eudebug_event_log *l)
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

