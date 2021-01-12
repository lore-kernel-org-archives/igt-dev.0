Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188706E19C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jan 2021 09:57:46 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Tue, 12 Jan 2021 15:28:26 +0530
Message-Id: <20210112095826.14352-1-jeevan.b@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_rotation_crc: reduce execution
 time
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

Restricting the execution to 2 pipes
with this change we see 50% improvement in time efficiency.

v2: Updated commit message.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 tests/kms_rotation_crc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index be27103f..f720a7af 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -425,6 +425,10 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 		if (IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
 			continue;
 
+		/* restricting the execution to 2 pipes to reduce execution time*/
+		if (pipe > PIPE_B && !data->extended)
+			break;
+
 		igt_output_set_pipe(output, pipe);
 
 		plane = igt_output_get_plane_type(output, plane_type);
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
