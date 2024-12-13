Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A74EE7717F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 16:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2E410F095;
	Fri, 13 Dec 2024 16:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZ212Wsv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DF910F095
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 16:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734108070; x=1765644070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KhqhuIp9enk12Vu0fx9bGoTI+miAvvvwzG9IjJgV0qk=;
 b=dZ212WsvuG2tmDB4IDWykn34ci/auVzOL7s/OqVRRMRfNXspJPXZE/o5
 huz3GwKRIBtLQIyHL6850zSZpRz7MoLXYoCF9ssrt91DGtXRt2/XlPgGB
 pa0DNWYkQUkOEbiuewMs9tlJ8FgAukjeJ34nuI6cWNoR1doFPUOiSv8OP
 8rSIV9IoJWLzD1xMKO4+2atrbTZZe/sWrrL9irjlaZncpK3Q+vbp7xw08
 HoaeROd8dOKF7PaMdEfBLfdM7kUmRo0aBj8GCwBVh2ZaLOx9LU5mlNlwZ
 upBllnfyWT3Rx+DSvjqK0W8Vkb7pz5N6CoanZnRS2yf13A9FDD66t57R4 Q==;
X-CSE-ConnectionGUID: srwg8Yh5RMC0UlfBwNc5VA==
X-CSE-MsgGUID: y8Cm3i/2QLKn1FmvsFRQUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34700321"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="34700321"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 08:41:10 -0800
X-CSE-ConnectionGUID: +UXJFWvJRs6Yoco+h9sRHQ==
X-CSE-MsgGUID: 4ST9AmBYQzW7ggXGGfn7kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133942553"
Received: from dut4440lnl.fm.intel.com ([10.105.10.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 08:41:10 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, rodrigo.vivi@intel.com,
 zbigniew.kempczynski@intel.com
Subject: [PATCH] tests/intel/xe_wedged: Add AUX error to ignore list
Date: Fri, 13 Dec 2024 16:41:05 +0000
Message-ID: <20241213164105.14015-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

There is yet another warning in dmesg which should be ignored.
Specifically:

xe 0000:00:02.0: [drm] ERROR AUX B/DDI B/PHY B: did not complete or timeout within 10ms (status 0xad40023f)

Extend the regex further to cover this error.

Fixes: 21076ee0 ("tests/intel/xe_wedged: Ignore more dmesg warnings")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Zbigniew Kempzynski <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_wedged.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 613d571b44..65d715e845 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -33,7 +33,8 @@ static void ignore_wedged_in_dmesg(void)
 				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
 				    "|GT[0-9A-Fa-f]*: Failed to submit"
 				    "|Modules linked in:"
-				    "|__pfx___drm_");
+				    "|__pfx___drm_"
+				    "|AUX [A-F]/DDI [A-F]/PHY [A-F]: .*");
 }
 
 static void force_wedged(int fd)
-- 
2.43.0

