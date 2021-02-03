Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E256EB91
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Feb 2021 19:14:59 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Thu,  4 Feb 2021 00:44:47 +0530
Message-Id: <20210203191447.2894572-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_vblank:Added subtest
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Modem@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Modem, Bhanuprakash <Bhanuprakash.Modem@intel.com>

v2: Modified description to be more specific. (Bhanu)
---
 tests/kms_vblank.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 31b3f0a6..e561e41d 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -438,6 +438,7 @@ static void run_subtests_for_pipe(data_t *data)
 			if (m->flags & ~(f->valid | NOHANG))
 				continue;
 
+			igt_describe("Check if test run while hanging by introducing NOHANG flag");
 			igt_subtest_f("pipe-%s-%s-%s",
 				      kmstest_pipe_name(data->pipe),
 				      f->name, m->name) {
@@ -451,6 +452,7 @@ static void run_subtests_for_pipe(data_t *data)
 			if (f->valid & NOHANG || m->flags & NOHANG)
 				continue;
 
+			igt_describe("check if injected hang is working properly");
 			igt_subtest_f("pipe-%s-%s-%s-hang",
 				      kmstest_pipe_name(data->pipe),
 				      f->name, m->name) {
@@ -521,9 +523,11 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
+	igt_describe("Negative test for vblank request");
 	igt_subtest("invalid")
 		invalid_subtest(&data, fd);
 
+	igt_describe("check the Vblank and flip events works with given crtc id");
 	igt_subtest("crtc-id")
 		crtc_id_subtest(&data, fd);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
