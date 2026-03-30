Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5078A1061B06
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 14:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F8C10E214;
	Mon, 30 Mar 2026 14:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4tjwHGh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB7A10E214
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 14:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774881654; x=1806417654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sq8i5M3y3lauhyULJXNd959WulZFZm+ekJUR0WFio1k=;
 b=Z4tjwHGhAAbl2txAf6N78JgC6l/reW/5dYgDx7IuKZzQm5sK+jvSIiaz
 LTGZbPGxOzaJNJAf7wBajvC1ogceUGA7aNNuxnrnXkzirOdcJ20oBnyIb
 SwbGOTzJY5gHK5/TRqEp6PFVnstX2xLyF8kAa8+c27H4bdJCwSl0wfPMK
 R8KO/ikrs7BsBVrU0PtnFvicIy6M7ZVv9p6xp4eg9Uyu3neMacpK5XBNu
 v9sM8xLC/Osc+H4CRAqqtf6KPmW/3pAtGo4r5GqQE/ciaswXHNaOlm4ri
 C3YZb89hmzagNiV36tTgKUUQPiLiireGm431iZ6j9Jgd49f5dAdtn28kc A==;
X-CSE-ConnectionGUID: iZqy6F/HTZOcWjoUpFAmFA==
X-CSE-MsgGUID: SXbV5zu0SBS95oqTWoAkzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75771103"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75771103"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:40:51 -0700
X-CSE-ConnectionGUID: /9hAZdNNTnqtUR+30iRgVA==
X-CSE-MsgGUID: 6fo5Zy7qSTWKt6ptOcH7DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="264013365"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 07:40:49 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v4 3/5] lib/intel_pat: Set PTA + ATS PAT entries to
 invalid value
Date: Mon, 30 Mar 2026 16:40:36 +0200
Message-ID: <20260330144032.1954771-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
References: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
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

