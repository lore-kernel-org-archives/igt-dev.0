Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1924D6E98D
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Aug 2021 14:58:03 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Fri, 27 Aug 2021 17:57:53 +0300
Message-Id: <20210827145756.3342904-4-imre.deak@intel.com>
In-Reply-To: <20210827145756.3342904-1-imre.deak@intel.com>
References: <20210827145756.3342904-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/6] tests/kms_ccs: Fix small aux stride
 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Use the correct CCS plane stride for the small aux stride subtest.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_ccs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 5bc50b4bb..52252c633 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -307,7 +307,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 		if (fb_flags & FB_SMALL_AUX_STRIDE) {
 			igt_skip_on_f(width <= 1024,
 				      "FB already has the smallest possible stride\n");
-			f.pitches[index] = ALIGN(f.pitches[1]/2, 128);
+			f.pitches[index] = ALIGN(f.pitches[index]/2, 128);
 		}
 
 		if (fb_flags & FB_ZERO_AUX_STRIDE)
-- 
2.27.0
