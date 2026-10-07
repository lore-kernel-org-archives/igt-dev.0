Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEE0CA5FF1
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 14:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF12510E29C;
	Wed,  7 Oct 2026 14:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="llPawuTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D9B10E29C
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 14:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791382651; x=1822918651;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=mcFdwqw9YTjHj4b/rzRxUi8UzzI10nXF5s6QiTA4Tdg=;
 b=llPawuTW68UObSiQlx1Bf0jvL09wL6kHaUTEXg+pf3lGS1c4Y8shb26Y
 mIkh2fyjFXHKSbTmTYfl2Pb8zBbCx+LseBi8i0qIUhR1C4ArHhOAJj0Kx
 0HtK1LFSrytgjMThfB/g+Q2oYdR1kpVuSkkqaDlBXX7GRqTC0llqIdCIx
 y5/k/sGZrOeILeVGLjV+eaj4MHp/liQQE0zyalbDTIoD4V8HbxQfTOZlz
 ZT6QJWgfaHnee4kDulos3ZcTrdAPIe+7X6zauj7hCN5NzFUkMyrj2VNNT
 SjUwlzZ+UnHN6e0LuLOlImNUdzEzTlWqkG2QBuW13DzUE3Iy9iK/ECo+8 Q==;
X-CSE-ConnectionGUID: EIErxRHTRB+u5VzZmhPOMw==
X-CSE-MsgGUID: BOUithf7SYSJIzKBSoAH8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="32046"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="32046"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 07:17:30 -0700
X-CSE-ConnectionGUID: nhzpR0wZRbm2l7tW7PFlaA==
X-CSE-MsgGUID: lanDK5k4QbKot4XAeiMFWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="275233270"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 07:17:29 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH i-g-t 0/2] Fix igt_runner hang and resource leak associated
 with pw-reserve
Date: Wed, 07 Oct 2026 11:16:25 -0300
Message-Id: <20261007-stop-pw-reserve-v1-0-abbd3b879612@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgNtlQpeRRyKxpqlLY2oIN7d4
 PiH9x8QqkwCY/NApZOFc9KwbQPLHlIk5FUbnHHeGuNRjlywXFhJ5UkYyHemH8Lm1h5UlUob3/9
 xAsaIB8zv+wEWp7JyaAAAAA==
X-Change-ID: 20261006-stop-pw-reserve-ae63047af2d4
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

When running igt_runner on an interactive SSH session we realized that
the runner would hang when testlists contained test cases that would
unbind/rebind (or unload/reload) the driver multiple times.

Some debugging revealed that the hangs were caused by pw-reserve
processes created by IGT not being properly terminated.  Let's fix
that.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index dbb90756babc..18053db8ff46 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1898,13 +1898,10 @@ static void pipewire_reserve_wait(void)
 		setenv("HOME", homedir, 1);
 		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
 
-		/*
-		 * pw-reserve will run in background. It will only exit when
-		 * igt_kill_children() is called later on. So, it shouldn't
-		 * call igt_waitchildren(). Instead, just exit with the return
-		 * code from pw-reserve.
-		 */
-		exit(system("pw-reserve -n Audio0 -r"));
+		if (execlp("pw-reserve", "pw-reserve", "-n", "Audio0", "-r", NULL)) {
+			igt_warn("Failed to start pw-reserve: %s\n", strerror(errno));
+			exit(1);
+		}
 	}
 }
 

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Gustavo Sousa (2):
      lib/igt_core: Check if helper proc was alive before kill()
      lib/igt_aux: Call pw-reserve with execlp()

 lib/igt_aux.c  | 11 ++++-------
 lib/igt_core.c | 20 +++++++++-----------
 2 files changed, 13 insertions(+), 18 deletions(-)
---
base-commit: faad2cd0e3e8eb2e18111c2358823a7bdfb56d94
change-id: 20261006-stop-pw-reserve-ae63047af2d4

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

