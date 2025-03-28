Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B49C36016
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 08:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D8810E9A7;
	Fri, 28 Mar 2025 08:24:47 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5803910E9AF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 08:24:40 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 52S8OaTw1470084; Fri, 28 Mar 2025 13:54:36 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 52S8OaMH1470083;
 Fri, 28 Mar 2025 13:54:36 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 19/19] tests/amdgpu: Disable the UMQ tests under a macro
Date: Fri, 28 Mar 2025 13:54:16 +0530
Message-Id: <20250328082416.1469810-19-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328082416.1469810-1-sunil.khatri@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
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

disable the umq tests under a macro till we have all
dependencies resolved.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 tests/amdgpu/amd_basic.c  | 3 +++
 tests/amdgpu/amd_cs_nop.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index f8886fab8..eb8447220 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -788,8 +788,10 @@ igt_main
 		}
 	}
 
+#ifdef AMDGPU_USERQ_ENABLED
 	arr_cap[AMD_IP_GFX] = 1;
 	arr_cap[AMD_IP_COMPUTE] = 1;
+
 	igt_describe("Check-GFX-CS-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
 	igt_subtest_with_dynamic("cs-gfx-with-IP-GFX-UMQ") {
 		if (arr_cap[AMD_IP_GFX]) {
@@ -813,6 +815,7 @@ igt_main
 			amdgpu_sync_dependency_test(device, true);
 		}
 	}
+#endif
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 0b7c29421..c71a2b63d 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -194,8 +194,10 @@ igt_main
 		}
 	}
 
+#ifdef AMDGPU_USERQ_ENABLED
 	arr_cap[AMDGPU_HW_IP_GFX] = 1;
 	arr_cap[AMDGPU_HW_IP_COMPUTE] = 1;
+
 	for (p = phase; p->name; p++) {
 		for (e = engines; e->name; e++) {
 			igt_describe("Stressful-and-multiple-cs-of-nop-operations-using-multiple-processes-with-the-same-GPU-context-UMQ");
@@ -208,6 +210,7 @@ igt_main
 			}
 		}
 	}
+#endif
 
 	igt_fixture {
 		amdgpu_cs_ctx_free(context);
-- 
2.43.0

