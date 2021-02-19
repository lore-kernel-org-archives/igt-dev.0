Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31576EB82
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 17:27:56 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id f140so4022594qke.0
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Feb 2021 09:27:53 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Fri, 19 Feb 2021 12:27:38 -0500
Message-Id: <20210219172738.263820-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_hdr: Fix bpc-switch tests on AMD
 hardware
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

Kernel commit b836a274b797 ("drm/amdgpu/dc: Require primary plane to be
enabled whenever the CRTC is") causes the bpc-switch tests to fail,
since the primary plane fb is being removed, which leads to the next
atomic commit failing with -EINVAL.

This stops the removal of the primary plane fb before switching to 10
bits per component and the test now runs successfully.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_hdr.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index e9dd7f27..70a4b456 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -223,8 +223,6 @@ static void test_bpc_switch_on_output(data_t *data, igt_output_t *output,
 			data->h = afb.height;
 		}
 
-		igt_plane_set_fb(data->primary, NULL);
-
 		/*
 		 * i915 driver doesn't expose max bpc as debugfs entry,
 		 * so limiting assert only for amd driver.
-- 
2.30.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
