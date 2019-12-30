Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3603A89CDF
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2019 03:41:22 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 30 Dec 2019 05:40:37 +0200
Message-Id: <20191230034040.21943-8-imre.deak@intel.com>
In-Reply-To: <20191230034040.21943-1-imre.deak@intel.com>
References: <20191230034040.21943-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 07/10] tests/kms_ccs: Add GEN12 CCS media
 compression format modifier
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

From: Mika Kahola <mika.kahola@intel.com>

Add GEN12 CCS format modifier for media compression.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_ccs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 32b69f3b..60cdd70c 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -80,6 +80,7 @@ static const uint64_t ccs_modifiers[] = {
 	LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS,
 	LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
 	LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC,
+	LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS,
 };
 
 /*
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
