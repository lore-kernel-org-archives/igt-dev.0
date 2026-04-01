Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C4C107637B
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 13:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E108410ECE4;
	Wed,  1 Apr 2026 13:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i6IT6Iaf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13BC10ED91
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 13:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775051641; x=1806587641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c/EWCLrste7iqukbynk5AayGc5e1MoYAwwL0yL6ndmw=;
 b=i6IT6Iafpvs6qyanYfvUH1gWloz0JOOPU7i3tK46IV3hkyqupZu3hvw6
 TR+HIL+c8YXKH2CkGhoIEM2rT9XmG9qfQvD2v8xPLl2GvIwQUdCBSlM8c
 16LWbz43OLyahyf+M9OrwK4uFfuwGDNbqQCf1rWCfoITNZcTwRC+64MqY
 q4TApEf/jZH8ahhTLZugA8HoQwO4pqeZv64JssUEPaQ+up9dXLBhxs+DX
 nYVm1ZkXiiblOvnldaJ9p04PGCSK2WtQwPfxfh46o6jeICdmUB1prL0MN
 299zghCXHgZ3h7roDsQkTyrqaYxzYgluk3gVgeyrwyNG+WXCs/uzyTfZA A==;
X-CSE-ConnectionGUID: XJxBkUfqQimuCYcRbG7Syw==
X-CSE-MsgGUID: HVEFYXs7Tkav5VRNlHFuMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75972744"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75972744"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 06:54:01 -0700
X-CSE-ConnectionGUID: iHadWVJNQn2CkZvGq15HSQ==
X-CSE-MsgGUID: qFb9v1zyRmeUpK+CIVTVfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="257161881"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.206])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 06:53:59 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v7 3/4] lib/intel_pat: Set PTA + ATS PAT entries to
 invalid value
Date: Wed,  1 Apr 2026 15:53:47 +0200
Message-ID: <20260401135343.2874239-9-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401135343.2874239-6-zbigniew.kempczynski@intel.com>
References: <20260401135343.2874239-6-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Some platforms (like LNL) requires PTA PAT entries shouldn't be
programmed and default register value should be used.

Setting this to max during parsing pat_sw_config or pat debugfs
allows detect these platforms and ignore some actions if necessary.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_pat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index f1f5644dce..2f35bb7724 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -51,6 +51,8 @@ static int32_t xe_get_pat_config(int drm_fd, struct intel_pat_cache *xe_pat_cach
 
 	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
 	xe_pat_cache->uc_comp = XE_PAT_IDX_INVALID;
+	xe_pat_cache->pta_mode = UINT32_MAX;
+	xe_pat_cache->pat_ats = UINT32_MAX;
 
 	while ((nread = getline(&line, &line_len, dbgfs_file)) != -1) {
 		uint32_t value = 0;
-- 
2.43.0

