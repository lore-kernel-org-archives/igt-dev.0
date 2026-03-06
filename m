Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51474F01804
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 07:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A29310E3A1;
	Fri,  6 Mar 2026 07:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRWNiqRX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7302310E3A1
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 07:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772783909; x=1804319909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JQizWapDMcmhFdkb9R0ncurEmIvlFlavl0u6P7p8UIk=;
 b=IRWNiqRXiRIWyMEFbKZ0GayR7wcwf5Ve3vq4cIIleblU5ZyHzb41wR1j
 bgOI+f3uHqEXRJgJO3/KLV3da+qMqlTIcnxxqWpoj9ALA0yqNQasf858s
 aZofldPpP91kd6ni2AQBvc8ua99IQVqrMr7CI1/kZcZknS5pNSzAuXg0y
 seHDxnAKQqBc05KnW3FDojf8PaY4ME9MBovcpD/sWd+VrIPIMH4fJA9aC
 CCTDuTnBHd7VvecNH1tIHAjFCarz3gzhPFrfe/cXJ/wNfCzkOvZkcvRbb
 r/MyHi55lp1aoQNhITyNRMVbp9Z6QwCxKxis3QV5dIPjEp7A+EbFAKOyi w==;
X-CSE-ConnectionGUID: 23qdP0ZkR5q9lU7DfT6g0Q==
X-CSE-MsgGUID: KkUwBnk9Tgi06IhTrLV2kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73934235"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73934235"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:58:28 -0800
X-CSE-ConnectionGUID: 8tC3Gl6RRDiMKosyZxtedg==
X-CSE-MsgGUID: b9QlPUHdS7ygzUd4E/EPMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="249416208"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 23:58:27 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v6 6/6] tests/xe_compute: Limit loop count on PVC
Date: Fri,  6 Mar 2026 08:58:06 +0100
Message-ID: <20260306075759.1153032-14-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
References: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
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

New compiler changes argument positions what requires altering
the pipeline. Limit number of loops to 64 what is currently
supported and leave to fix this limitation for the future.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_compute.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 2a4e428699..4017bafdc2 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -614,7 +614,12 @@ test_compute_square_userenv(int fd, uint32_t flags)
 		env.output_addr = OUTPUT_BO_ADDR;
 	}
 
-	env.loop_count = env.array_size / 2;
+	/* FIXME: remove shader limitation to 64 elements */
+	if (IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
+		env.loop_count = 64;
+	else
+		env.loop_count /= 2;
+
 	env.skip_results_check = true;
 
 	for (i = 0; i < env.array_size; i++)
-- 
2.43.0

