Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BF110E0FD
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 03:21:59 +0000 (UTC)
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 19:21:30 -0800
Message-ID: <20231130032130.2709-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/kms_writeback: fix kms_writeback
 failure for XRGB8888 only devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, quic_parellan@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

commit ac56ba97248b ("tests/kms_writeback: support DRM_FORMAT_XRGB2101010
for writeback") seems to have broken kms_writeback for devices which
support only XRGB8888 because check_writeback_config() will return a value
based on the last format in the fourcc[] array.

For devices such as MSM which do not support DRM_FORMAT_XRGB2101010, this
will return an error and overall kms_writeback_get_output() will not
return a valid output for the writeback connector.

Change the return of check_writeback_config() to return based on the
supported_colors bitmask so that only when neither XRGB8888 or
DRM_FORMAT_XRGB2101010 is supported, then the test is skipped.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 tests/kms_writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 25b49eccdbd3..f6e55c809de1 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -171,7 +171,7 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			data.supported_colors |= 1 << i;
 	}
 
-	return !ret;
+	return data.supported_colors;
 }
 
 static igt_output_t *kms_writeback_get_output(igt_display_t *display)
-- 
2.40.1
