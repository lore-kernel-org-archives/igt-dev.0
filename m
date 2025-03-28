Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D91EC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5444F10E063;
	Fri, 28 Mar 2025 08:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNM77LaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1316D10E063
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743150013; x=1774686013;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fGoAbryr+iBeygDgQrkzPorDIlJ70b6KA/gBMemWiIM=;
 b=eNM77LaMGedYpQjGD17dsaQp7i6CX+VDlyCtGEOn8rlIB0OESvqlsDga
 1aBLx8v1Rl6aFY3175jJETflXYr5KjOLHmMvHJihhGoOh2yCsP7NLfxhN
 qG9SQg02o4vJM2+45HAVvd8xz4pQ9u1VEx21bTtjyqfa7tqIq2aSzsVcD
 iDNoXo5OyYOmCfS0/q+ZNeIHJ8R4GfIoBgWdYIAmoW5AFf/qksYjp/DGW
 QqAnkWvHpPNtOqEG6Uw0GdI3gGoqP2fejpMsKKWQ/EfGqgpObBGFfpucn
 qkAEd+4p0NOcHrspNIo4BSNOzxMI2k2pNmTJlKxfz1FjNPnHhFZ1HmQDZ Q==;
X-CSE-ConnectionGUID: aolkjxEpTWCkGn9sVrWQkg==
X-CSE-MsgGUID: mKDVWSqpSoGlqwtjUAqrLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48378883"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="48378883"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:20:12 -0700
X-CSE-ConnectionGUID: X8bLagKaQ5yHAqS7lQlG/w==
X-CSE-MsgGUID: YknrY4pSToqUuQIJHAVT8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="125900108"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 01:20:11 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_exec_sip_eudebug: disable some tests
 on VF
Date: Fri, 28 Mar 2025 08:19:16 +0000
Message-Id: <20250328081916.251987-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Tests wait-writesip-nodebug and breakpoint-writesip-nodebug
were found to be incompatible with SR-IOV functionality, and
should only be available to run if on PF.

Disable these tests if ran on VF.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_exec_sip_eudebug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
index c317112b4..26b3f9176 100644
--- a/tests/intel/xe_exec_sip_eudebug.c
+++ b/tests/intel/xe_exec_sip_eudebug.c
@@ -22,6 +22,7 @@
 #include "xe/xe_eudebug.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "lib/igt_sriov_device.h"
 
 #define WIDTH 64
 #define HEIGHT 64
@@ -316,6 +317,7 @@ igt_main
 		igt_fixture {
 			was_enabled = xe_eudebug_enable(fd, false);
 			igt_require(!xe_eudebug_debugger_available(fd));
+			igt_skip_on(intel_is_vf_device(fd));
 		}
 
 		test_render_and_compute("wait-writesip-nodebug", fd, eci)
-- 
2.34.1

