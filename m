Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026F06E9E0
 for <igt-dev@lists.freedesktop.org>; Mon,  3 May 2021 16:53:58 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Tue,  4 May 2021 06:13:13 +0530
Message-Id: <20210504004313.28804-15-bhanuprakash.modem@intel.com>
In-Reply-To: <20210504004313.28804-1-bhanuprakash.modem@intel.com>
References: <20210504004313.28804-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v4 i-g-t 14/14] tests/kms_vblank: Reset the state before
 exiting the test
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
List-ID: <igt-dev@lists.freedesktop.org>

Before starting the next subtest, clean up the states to default
values, those are assumed by other tests.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vblank.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index e561e41d7..93b01eba0 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -96,6 +96,8 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 
 static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
 {
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
 	igt_remove_fb(fd, &data->primary_fb);
 }
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
