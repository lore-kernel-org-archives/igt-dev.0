Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E50910E057
 for <igt-dev@lists.freedesktop.org>; Mon,  8 May 2023 03:39:17 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  8 May 2023 09:16:05 +0530
Message-Id: <20230508034605.20177-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_sequence: Modify the vblank
 verification condition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For some displapys we've had one extra vblank in same time
interval,it means that there's no missing vblanks, which
confirms everything gets out to the screen as expected and
there is no failure, test should pass in such cases.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_sequence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index c8a3d6bb..34448dbf 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -224,7 +224,7 @@ static void sequence_queue(data_t *data, int fd, int nchildren)
 		cqs.flags = 0;
 		cqs.sequence = target;
 		igt_assert_eq(crtc_queue_sequence(fd, &cqs), 0);
-		igt_assert_eq(cqs.sequence, target);
+		igt_assert(cqs.sequence >= target);
 	}
 
 	for (n = 0; n < total; n++) {
-- 
2.39.0
