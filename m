Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5110C6EC06
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Mar 2021 16:43:17 +0000 (UTC)
Received: by mail-qv1-f72.google.com with SMTP id e10so1943046qvr.17
 for <igt-dev@lists.freedesktop.org>; Fri, 05 Mar 2021 08:43:14 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Fri,  5 Mar 2021 11:42:53 -0500
Message-Id: <20210305164253.11788-3-jcline@redhat.com>
In-Reply-To: <20210305164253.11788-1-jcline@redhat.com>
References: <20210219172738.263820-1-jcline@redhat.com>
 <20210305164253.11788-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/2] kms_hdr: Fix bpc-switch tests on AMD
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
index 7617e8a5..8aa3ea78 100644
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
