Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8C26E8CE
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2020 13:53:30 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu, 26 Mar 2020 15:53:22 +0200
Message-Id: <20200326135322.9958-3-mika.kahola@intel.com>
In-Reply-To: <20200326135322.9958-1-mika.kahola@intel.com>
References: <20200326135322.9958-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 2/2] tests/kms_concurrent: Plug possible
 memory leaks
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

Free dynamically allocated memory that has a potential
to leak memory.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_concurrent.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 1a7c12fc..1403e990 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -193,6 +193,10 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 				    max_planes, output);
 
 	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
+
+	free(x);
+	free(y);
+	free(size);
 }
 
 static int test_bandwidth(data_t *data, enum pipe pipe, igt_output_t *output)
@@ -228,6 +232,10 @@ test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
 	while (i < iterations || loop_forever) {
 		prepare_planes(data, pipe, max_planes, output);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		for (int c = 0; c < max_planes; c++)
+			igt_remove_fb(data->drm_fd, &data->fb[c]);
+
 		i++;
 	}
 }
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
