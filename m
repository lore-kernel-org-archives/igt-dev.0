Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2CD10E766
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 18:52:11 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 00:23:20 +0530
Message-Id: <20220926185321.2897136-5-kunal1.joshi@intel.com>
In-Reply-To: <20220926185321.2897136-1-kunal1.joshi@intel.com>
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 4/5] tests/kms_invalid_mode.c
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

-> close drm_fd

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_invalid_mode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 0ae98a31..f1c38669 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -306,5 +306,6 @@ igt_main
 	igt_fixture {
 		igt_display_fini(&data.display);
 		igt_reset_connectors();
+		close(data.drm_fd);
 	}
 }
-- 
2.25.1
