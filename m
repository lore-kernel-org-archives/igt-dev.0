Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5D410E191
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 05:17:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Mon, 26 Jun 2023 10:40:16 +0530
Message-Id: <20230626051031.2363120-10-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 i-g-t 09/24] tests/xe/xe_gpgpu_fill: Close the fd
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

Close the file descriptor before exiting the test.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/xe/xe_gpgpu_fill.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/xe/xe_gpgpu_fill.c b/tests/xe/xe_gpgpu_fill.c
index 992fb92ad..12bf7c5fc 100644
--- a/tests/xe/xe_gpgpu_fill.c
+++ b/tests/xe/xe_gpgpu_fill.c
@@ -131,5 +131,6 @@ igt_main
 	igt_fixture {
 		xe_device_put(data.drm_fd);
 		buf_ops_destroy(data.bops);
+		drm_close_driver(data.drm_fd);
 	}
 }
-- 
2.40.0
