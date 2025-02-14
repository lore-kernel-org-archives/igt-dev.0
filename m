Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0771C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 12:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF9110EC6B;
	Fri, 14 Feb 2025 12:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVOf8/mX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E07A10EC6B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 12:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739537233; x=1771073233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WGnQCqD/hKga46mV0EqMdLd0rNnNwmv88b1qBIkCYkI=;
 b=GVOf8/mXKj9950kS3uVV8pyQZZgTXAvJPQ8t7YmojhULQFE2Gmj8IHx8
 ufwvnV4fbtVXWEZfqFh9a6h6wIIq4xgnVswWSsxR8tKKoT/ipuEcSKzhz
 2zDJA+2hZCKqaB7zJrTJoMlRxIguWyqRZR1+TM3u3q8gUVdHv0kwdf4q8
 hNudmPeMFVNTdbPHT518cQdbhVLeapEHsbjBPziaAKkggp1Tm8gYkE1l1
 F/9YQP32ZRHzBDUY2850jtfpBlfMzxhxn6Du2rmwUgg/DbYJJCe2a3HaU
 n7SNLneAoTY+LE8pDc7fhus5jxm+0z/YX3Rh0vgmW/7czTsJOp0HqLsOW g==;
X-CSE-ConnectionGUID: 4TGUfhEQQu626DfAUv0agg==
X-CSE-MsgGUID: l8AvANhxR7Odjq86Mi2k9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="62749313"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="62749313"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 04:47:13 -0800
X-CSE-ConnectionGUID: XzbsUf0OQtWj5YkNg09coQ==
X-CSE-MsgGUID: wltilTitRZSM6MYQqvOt3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="150625106"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 04:47:09 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
	Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
	Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
	Laguna@freedesktop.org, Lukasz <lukasz.laguna@intel.com>,
	Wajdeczko@freedesktop.org, Michal <Michal.Wajdeczko@intel.com>,
	Mika Kuoppala <mika.kuoppala@linux.intel.com>,
	Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe_eudebug: Export __xe_eudebug_enable_getset
Date: Fri, 14 Feb 2025 13:46:42 +0100
Message-Id: <20250214124643.20908-2-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214124643.20908-1-christoph.manszewski@intel.com>
References: <20250214124643.20908-1-christoph.manszewski@intel.com>
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
 lib/xe/xe_eudebug.c | 4 ++--
 lib/xe/xe_eudebug.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 1205d945b..2db3ca433 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1710,7 +1710,7 @@ static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
 	xe_eudebug_event_log_write(c->log, (void *)&em);
 }
 
-static int enable_getset(int fd, bool *old, bool *new)
+int __xe_eudebug_enable_getset(int fd, bool *old, bool *new)
 {
 	static const char * const fname = "enable_eudebug";
 	int ret = 0;
@@ -1767,7 +1767,7 @@ out:
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

