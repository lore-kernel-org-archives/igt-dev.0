Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0B189E2B
 for <igt-dev@lists.freedesktop.org>; Sun, 17 Jan 2021 13:26:07 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Sun, 17 Jan 2021 18:56:30 +0530
Message-Id: <20210117132630.557502-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_vblank:Added subtest description
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
Cc: S@freedesktop.org, B@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: B S, Karthik <Karthik.B.S@intel.com>
---
 tests/kms_vblank.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index b00ebec5..c71b8c24 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -438,6 +438,7 @@ static void run_subtests_for_pipe(data_t *data)
 			if (m->flags & ~(f->valid | NOHANG))
 				continue;
 
+			igt_describe("checks if test run with NOHANG flag set");
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
 
+	igt_describe("check if test reports INVALID error for garbage values");
 	igt_subtest("invalid")
 		invalid_subtest(&data, fd);
 
+	igt_describe("check the IOCTL events works with given crtc id");
 	igt_subtest("crtc-id")
 		crtc_id_subtest(&data, fd);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
