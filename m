Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A322D10E60C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 06:37:33 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oTdpR-0016UT-GB
 for igt-dev@lists.freedesktop.org; Thu, 01 Sep 2022 08:37:29 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 08:36:52 +0200
Message-Id: <20220901063722.261828-45-mauro.chehab@linux.intel.com>
In-Reply-To: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
References: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 44/74] i915/kms_pwrite_crc: Close device
 before exit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Close the device fd before we check for leaks during the atexit
handlers.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Acked-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/kms_pwrite_crc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index 584e6a19ce9d..7df4b36924fa 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -191,4 +191,5 @@ igt_simple_main
 	run_test(&data);
 
 	igt_display_fini(&data.display);
+	close(data.drm_fd);
 }
-- 
2.37.2
