Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B700F10E1F7
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 05:14:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 10:41:42 +0530
Message-Id: <20220922051142.2003118-9-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
References: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 8/8] tests/kms_color: Fix crc compare check in
 CTM tests
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

!igt_skip_crc_compare || igt_check_crc_equal() is always true
which is not correct.

Fixes: 1a42910d
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index ba06947b..e2462aa3 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -510,7 +510,7 @@ static bool test_pipe_ctm(data_t *data,
 	/* Verify that the CRC of the software computed output is
 	 * equal to the CRC of the CTM matrix transformation output.
 	 */
-	ret &= !igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
+	ret = igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);

 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
--
2.37.3
