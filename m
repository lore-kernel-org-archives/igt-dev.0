Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C0089D02
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2019 03:41:24 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 30 Dec 2019 05:40:39 +0200
Message-Id: <20191230034040.21943-10-imre.deak@intel.com>
In-Reply-To: <20191230034040.21943-1-imre.deak@intel.com>
References: <20191230034040.21943-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 09/10] tests/kms_ccs: Test YUV formats too
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

Enable testing of packed and semiplanar YUV formats for better coverage
of the display's media decompression functionality.

Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_ccs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index a86a3470..9e5bb559 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -75,6 +75,10 @@ static const struct {
 
 static const uint32_t formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_P012,
+	DRM_FORMAT_P016,
 };
 
 static const uint64_t ccs_modifiers[] = {
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
