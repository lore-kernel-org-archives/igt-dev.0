Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1899BC5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 19:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE89610E203;
	Tue,  3 Jun 2025 19:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnWOwa24";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E0E10E203
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 19:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748978679; x=1780514679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lbOF34kGeB1J/05nbW+Tx67f/Kqt2NLQXqvkGEwQtHk=;
 b=PnWOwa24g1o0KOKQYQLQ6SxbYNacUFher1pjvsnrcZKk8jwCGDB1c1yU
 VxJr1/g0mhyybhIUbktdVvtQUHwwzgoMpWaafLP7JuwGF096dpSiNv5Y0
 igrpCIJSBarDX3SGMXMsUwhFJx+9/3YKo3LsUHv/FmkJU9z2xjWlOPjza
 zRn0WHB74wJDoKs3XiyoGYApG5Aprtr2x0/9KA3oK4ZeSMg2mGPYTRaFm
 Yt1s1PguhoWIV9X/1Pg6UXmcZAnCpeCL3+IbSQMXqDb+h2Y6NYs/zmrkH
 64rXLFCmVs3ia0Yc097gWnQX4TeaoxBFTNiI1E9HiFVedvm16Xe70cpmv w==;
X-CSE-ConnectionGUID: N3SnlBwtTi2l+PC8U6xDIQ==
X-CSE-MsgGUID: a8TIfzzcSHeTR1eaN9IOYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76424305"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="76424305"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:24:39 -0700
X-CSE-ConnectionGUID: eILAGnyOSdW05j/7EanGUQ==
X-CSE-MsgGUID: 3PAZbwryQCaVbOe+PSPbVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="175821287"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 03 Jun 2025 12:24:36 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v14 05/11] lib/igt_aux: Include local igt procps header
 for Android
Date: Tue,  3 Jun 2025 19:23:48 +0000
Message-ID: <20250603192355.77019-6-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
References: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
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

As procps is not available in Android, added local stub procps header
to build igt for Android. Inclusion of libproc2/pids.h is now
conditional, based on the HAVE_LIBPROC2 definition, ensuring that it
is only included when the library is available.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_aux.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 2905824a5..83809e770 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -55,8 +55,12 @@
 
 #ifdef HAVE_LIBPROCPS
 #  include <proc/readproc.h>
-#else
+#elif HAVE_LIBPROC2
 #  include <libproc2/pids.h>
+#else
+#  ifdef ANDROID
+#    include "android/procps.h"
+#  endif
 #endif
 
 #include <dirent.h>
-- 
2.49.0

