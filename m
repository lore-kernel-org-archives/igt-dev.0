Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF29CCA468
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 10:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0179510E560;
	Tue, 30 Sep 2025 10:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KI+Vu2py";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C7610E560
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759228949; x=1790764949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bW4TUGnVWApB4PeymJyYh8JjCF7Q09EQPM7BIHTtSHo=;
 b=KI+Vu2pyPrsW2UaQIMO3npHtq/00+h+zC/fAW5qK80i3azyfaxXjsZyu
 H61SWwfPukZmBiWbZW549zhFznKXHfer7IGXzsT28dfraRIiUerrz4odh
 lZyDq9vWJZVmEKEEIzYOd6WjijoJSd3o7cM6n05+b2TXCsnABY2GKvfWS
 ydap1fO7pnXppPS3zdqAtIrA9a8VhwdilguhktsOrtqrDMr5CJm7ME4A3
 qC2qRwWHlhebTpb1D0X+WXuRXv3rAaY0jst6IZACb3KDiSr12q7P9M9ij
 KMRkRh5RrYfnIFTOKTOFHH0Vt+GS9OyGAKEzPiEvXg2LNHMQJTMVxgrZH g==;
X-CSE-ConnectionGUID: cdArVkp/RIagZKv6iEAOtw==
X-CSE-MsgGUID: KAfZOihcT7apbGy+M4CIBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61371470"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61371470"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:23 -0700
X-CSE-ConnectionGUID: fdn6uodjTgmvOAjFu2qUcg==
X-CSE-MsgGUID: yJIErp4+QMGxH//5uyQ4CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178446577"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:22 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v8 i-g-t 1/9] lib/xe_eudebug: Fix safe_pipe_read
Date: Tue, 30 Sep 2025 12:42:01 +0200
Message-Id: <20250930104209.22462-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
References: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
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

In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
misleading, as the underlying error may be different. Do an early return
with -errno if the poll fails.

Don't break on poll failure in debugger_worker_loop if errno was EINTR
and continue instead to repeat the poll.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 667c31c6e..65297d623 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -271,6 +271,8 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 		if (!ret) {
 			catch_child_failure();
 			t += interval_ms;
+		} else if (ret == -1) {
+			return -errno;
 		}
 	} while (!ret && t < timeout_ms);
 
@@ -1078,6 +1080,9 @@ static void *debugger_worker_loop(void *data)
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

