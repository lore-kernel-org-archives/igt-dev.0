Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2F910EBDF
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Apr 2023 14:21:10 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	mohammed.thasleem@intel.com
Date: Thu,  6 Apr 2023 19:46:57 +0530
Message-Id: <20230406141657.529728-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_lease: Fix the usage of pipe for
 lessee
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

Use pipe enum from the lessee display structure.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_lease.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index cb020cc3dab..29a774ae865 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -77,7 +77,7 @@ static int prepare_crtc(lease_t *lease, data_t *data)
 	drmModeModeInfo *mode;
 	igt_display_t *display = &lease->display;
 	igt_output_t *output = connector_id_to_output(display, data->connector_id);
-	enum pipe pipe = data->pipe;
+	enum pipe pipe = display->pipes[data->pipe].pipe;
 	igt_plane_t *primary;
 	int ret;
 
-- 
2.40.0
