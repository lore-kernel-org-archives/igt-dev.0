Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83626CCA471
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 10:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA3C10E7C1;
	Thu,  2 Oct 2025 10:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJY79Dx+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4446010E7C1
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759401908; x=1790937908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pOyU/s/bgTQ5aVE/rIgq2Lc7K7Rh8+R066eBWqS9kM8=;
 b=ZJY79Dx+cjr3dHVfRh1JX3JV2+p3Z5QDsOdpXH+Ps8w4QB21r0F7XlHu
 hxHxoh1u4ajLQ0GDbZBGJHCsj0j0KT41qeaNmuoBG5WNxzDG+AY4x8oXp
 mZnFYdqEDeL2Hz4Ei9aVzrsWzs+gX59GqqSREGTcsIzrPRz3YkzSulyQ5
 NhZ652wtp8TFq6KGF11gaJ65qfJh9UMW1FVkSKZCeu05ca/RrjAaMc+9j
 Q/s6BExZzQ9GWha9QjH8byP8pMly9VxDK0gVLy9MiLEBRYcwOFtAsJkQV
 mjns8mbAb1Nv39mMd7DCX2fr1+cYRGzaNA1W5E3Rk7Qv339LmCYzgZ0kI w==;
X-CSE-ConnectionGUID: lOrBMsypRbOTg5gxo/SKUA==
X-CSE-MsgGUID: ujZf++GSSLGg+k8m/QgM/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60895256"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="60895256"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:45:08 -0700
X-CSE-ConnectionGUID: lcythPN/TW6f5f/RaJ7gdg==
X-CSE-MsgGUID: xM2swPmBQymntaQfDWqcZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="184213221"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.176])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:45:07 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v10 i-g-t 06/10] lib/xe_eudebug: Repeat poll in
 debugger_worker_loop if interrupted
Date: Thu,  2 Oct 2025 12:44:39 +0200
Message-Id: <20251002104443.7021-7-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002104443.7021-1-dominik.karol.piatkowski@intel.com>
References: <20251002104443.7021-1-dominik.karol.piatkowski@intel.com>
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

If poll() fails with errno set to EINTR, repeat the poll by restarting
the loop.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_eudebug.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 6def162ce..74adeff35 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1106,6 +1106,9 @@ static void *debugger_worker_loop(void *data)
 		ret = poll(&p, 1, timeout_ms);
 
 		if (ret == -1) {
+			if (errno == EINTR)
+				continue;
+
 			igt_info("poll failed with errno %d\n", errno);
 			break;
 		}
-- 
2.34.1

