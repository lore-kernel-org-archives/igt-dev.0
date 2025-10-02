Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B86CAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 10:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBE510E7B0;
	Thu,  2 Oct 2025 10:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8USGGS1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4561910E7B0
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 10:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759401899; x=1790937899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZPzX9bXvtV5ogMhDRAtBvHY11DyY/pdkaGlCt7juWCs=;
 b=V8USGGS14URdBjQLFrjvb9fMGDa9qzqy8F/g6cX6MqkS09QNcIGhvbuV
 QqAaSSfj3jU9SZc+W0ZUtrlJL88wTnk8UIylFm0vHH0MRss7jEu/3M9KK
 YrYb5Joz1Zb/UU547JzzQLCZWSkTwhsLsWDep/NJ3mmMRTHw4kcGzNVJg
 sTOivDhPsGlkfn193S3WFre7r4dGSAjAOnajHWHOHf0WV0uPpzoIb2+uW
 MpbEKPrUeHpGiW/YuthKx/ZlthiK4n5yB07SbIYX3lEOXhxkm5zB6aCcU
 TVy2beJyyzPosZRRDuyC6AaRz6YMZgcZB94F0BCikGAoAibgLDGeBjAg9 w==;
X-CSE-ConnectionGUID: ibebosdlSZm8AUyRwDfgUQ==
X-CSE-MsgGUID: yhp2/TfuR1OGd3i32LPBXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60895235"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="60895235"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:44:59 -0700
X-CSE-ConnectionGUID: BhAhLEKYScCuFRjOUOiytA==
X-CSE-MsgGUID: 4wjTzE3pRya9O6pooLLVng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="184213184"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.176])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:44:58 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v10 i-g-t 01/10] lib/xe_eudebug: Fix safe_pipe_read
Date: Thu,  2 Oct 2025 12:44:34 +0200
Message-Id: <20251002104443.7021-2-dominik.karol.piatkowski@intel.com>
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

In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
misleading, as the underlying error may be different. Do an early return
with -errno if the poll fails, unless errno is set to EINTR - repeat the
poll in this case.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 667c31c6e..3587f4cbe 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -271,6 +271,12 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
 		if (!ret) {
 			catch_child_failure();
 			t += interval_ms;
+		} else if (ret == -1) {
+			if (errno == EINTR) {
+				ret = 0;
+				continue;
+			}
+			return -errno;
 		}
 	} while (!ret && t < timeout_ms);
 
-- 
2.34.1

