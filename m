Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361946EC04
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Mar 2021 16:43:18 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id b18so2068470qtt.6
 for <igt-dev@lists.freedesktop.org>; Fri, 05 Mar 2021 08:43:13 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Fri,  5 Mar 2021 11:42:52 -0500
Message-Id: <20210305164253.11788-2-jcline@redhat.com>
In-Reply-To: <20210305164253.11788-1-jcline@redhat.com>
References: <20210219172738.263820-1-jcline@redhat.com>
 <20210305164253.11788-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/2] kms_hdr: Skip HDR tests on pre-Kaby
 Lake Intel devices
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

According to the Intel documentation[0] I could find, HDR support is
only in Kaby Lake+. Skip tests in kms_hdr if the hardware doesn't
support HDR.

[0] https://www.intel.com/content/dam/support/us/en/documents/graphics/HDR_Intel_Graphics_TechWhitePaper.pdf

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_hdr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index e9dd7f27..7617e8a5 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -644,6 +644,12 @@ igt_main
 		igt_require(data.display.is_atomic);
 
 		igt_display_require_output(&data.display);
+
+		/* According to Intel documentation, hardware prior to Kaby Lake does
+		 * not support HDR.
+		 */
+		if (is_i915_device(data.fd))
+			igt_require(AT_LEAST_GEN(intel_get_drm_devid(data.fd), 9));
 	}
 
 	igt_describe("Tests switching between different display output bpc modes");
-- 
2.30.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
