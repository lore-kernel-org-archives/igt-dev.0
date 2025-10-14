Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9BCCCD190
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 09:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12B310E58F;
	Tue, 14 Oct 2025 09:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFeDr61N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBA910E58F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 09:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760434756; x=1791970756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2XOjZuGKampRDqX+jll42woprRYMbnpdiybe3CDQ7R8=;
 b=fFeDr61NRPEskqI2FNmQPsLPGfGuTPR5DE8TL6gSfANZepacZgO94g+/
 Vk+a+Mqs/0wXmhbBkB20aT57WknZJjh3xBwQa4bf8VSdqBRn7Z9KxmODA
 Nfxkod8QyoDSPJDczZin6pbkxrW/2rXzA9UsjQs4OIeUZRxZc2rywUU5s
 NZCGhH8RFgIzvsNedF9TPnf7ORAwxmslQ8fn92yAU1+Bx83xZL9M9Ahy1
 bAlDEeMP0DXG89yhdK/q2LURKto3tqn2LCqjOINfKI9ZXiCFR7KL7ZCWq
 wRKRdgRJEQrwa/3YgeJL67r7JGBVV8P37T9aSiqJBjfF7+RAX2vG7qeV4 w==;
X-CSE-ConnectionGUID: WnLfQP5vQzaZAKYjUXwJ3A==
X-CSE-MsgGUID: admL8WaXRGSliUXvXd+lZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73192507"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73192507"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:16 -0700
X-CSE-ConnectionGUID: RAknj67NTGyziFKKxHqGmg==
X-CSE-MsgGUID: fM3KEnsjSoWilBisNOXDrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181066511"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.244.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:14 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 6/7] lib/xe/xe_eudebug: Allow empty event log
Date: Tue, 14 Oct 2025 12:38:47 +0300
Message-ID: <20251014093848.2394531-7-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
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

When we sort event log, we make assumptions that there are some. Remove
these assumptions as for some tests, debugger might not get any events.

If events are expected the assertions should be held in test
case side.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 3 +++
 lib/xe/xe_eudebug.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 7ea63b22b4..68ab9dc320 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -870,6 +870,9 @@ static void event_log_sort(struct xe_eudebug_event_log *l)
 		events++;
 	}
 
+	if (!events)
+		return;
+
 	tmp = xe_eudebug_event_log_create("tmp", l->max_size);
 
 	for (i = first_seqno; i <= last_seqno; i++) {
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index db79726c00..2a0110fe92 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -101,8 +101,12 @@ next_event(struct drm_xe_eudebug_event *e, struct xe_eudebug_event_log *l)
 
 	igt_assert(l);
 	igt_assert(l->log);
+	igt_assert(l->max_size);
 	igt_assert(l->head <= l->max_size);
 
+	if (!l->head)
+		return NULL;
+
 	if (!e)
 		return (struct drm_xe_eudebug_event *)l->log;
 
-- 
2.43.0

