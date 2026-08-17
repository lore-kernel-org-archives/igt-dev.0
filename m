Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FF7C5CFC1
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 08:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C4510E6CD;
	Mon, 17 Aug 2026 08:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juwZbm5S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F5310E3E3
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 08:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786955191; x=1818491191;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HW11cTSOcIym4ZaJQd98XM9ABWI1RcCc8XFTv/qyems=;
 b=juwZbm5SdSm6MsM8FQ7kVQFhh6XCJRK+W5bZY1lj2meGxLebj9Vu8TRu
 30N2XuIY6owrrFHdt/wc9OOlW4eXknDqtWMDwJGW7v+64r4/+8iGgE3u2
 USnOLFZksixUbS/N6WAkOvoXCUJFcLjV55hVu2ZKj1/EQc+7XP7C617gs
 Z/wTf80Io3Vh91bP9IDp/46yX6bYruBqsxSXsoJBTjSXJWrRbeiIneU8x
 e04R0Vv5nOrQTtUt0O0cGITWvG8KlLWOTUoktMevKw4LvJHOmc/7t0BSa
 v1gTkOpFzN9uweMwdZxbenX5OcDBiK6Mwexb1FIaH4ZvIW4+A2bi6mzQd g==;
X-CSE-ConnectionGUID: saiuTbvQQgKka4jDDh8nHw==
X-CSE-MsgGUID: p3wdJYwoQmWV970pGFzmaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="104959208"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="104959208"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 01:26:30 -0700
X-CSE-ConnectionGUID: S/2RecVcQ4elyhwXRg8eFg==
X-CSE-MsgGUID: ILMUT18NT7aHuaSh1siY4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="265463981"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 01:26:30 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 4/4] tests/intel/kms_dp_linktrain_fallback: commit
 display reset before fallback
Date: Mon, 17 Aug 2026 13:56:12 +0530
Message-ID: <20260817082612.1101382-5-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817082612.1101382-1-sowmiya.s@intel.com>
References: <20260817082612.1101382-1-sowmiya.s@intel.com>
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

igt_display_reset() only clears IGT's in-memory state without a
commit, so the link from a previous run stays trained as-is. The
next setup_outputs() call re-applies the same mode on the same pipe,
which the driver satisfies with a fastset instead of a real modeset,
so the link never gets retrained from the sink's max. This makes
prev_link_rate/lane_count start from an already-reduced config and
fail with "Fallback unsuccessful".

Fix it by committing the reset, forcing the pipe off and the link
retrained from the max before each run.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 2e72957e1..4ceaad8b5 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -383,6 +383,7 @@ static bool test_fallback(data_t *data, bool is_mst, bool force_uhbr)
 	retries = SPURIOUS_HPD_RETRY;
 
 	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	/*
 	 * For the UHBR-to-HBR fallback case, pin the link at the highest
-- 
2.43.0

