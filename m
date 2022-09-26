Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AB910E76D
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 18:52:13 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 00:23:21 +0530
Message-Id: <20220926185321.2897136-6-kunal1.joshi@intel.com>
In-Reply-To: <20220926185321.2897136-1-kunal1.joshi@intel.com>
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 5/5] tests/kms_hdmi_inject: test cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>, Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

-> Free resources
-> close drm_fd

Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_hdmi_inject.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index abae0ab4..0bb51165 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -219,5 +219,7 @@ igt_main
 
 	igt_fixture {
 		drmModeFreeConnector(connector);
+		drmModeFreeResources(res);
+		close(drm_fd);
 	}
 }
-- 
2.25.1
