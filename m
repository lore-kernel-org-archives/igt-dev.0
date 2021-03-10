Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1496EA35
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Mar 2021 16:34:55 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id a11so8336293qtd.4
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Mar 2021 08:34:52 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Wed, 10 Mar 2021 11:34:34 -0500
Message-Id: <20210310163434.71450-1-jcline@redhat.com>
In-Reply-To: <20210219172738.263820-1-jcline@redhat.com>
References: <20210219172738.263820-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_hdr: Fix bpc-switch tests on
 AMD hardware
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Kernel commit b836a274b797 ("drm/amdgpu/dc: Require primary plane to be
enabled whenever the CRTC is") causes the bpc-switch tests to fail
since the primary plane fb is being removed, which leads to the next
atomic commit failing with -EINVAL.

Fix this by leaving the primary plane in place for amdgpu devices.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
Changes from v2:
  - Instead of skipping on pre-Kaby Lake, only remove the primary
    plane for AMD devices (thanks for the feedback Petri, Swati,
    and Uma!)

 tests/kms_hdr.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index e9dd7f27..5b8529c8 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -223,7 +223,14 @@ static void test_bpc_switch_on_output(data_t *data, igt_output_t *output,
 			data->h = afb.height;
 		}
 
-		igt_plane_set_fb(data->primary, NULL);
+		/*
+		 * amdgpu requires a primary plane when the CRTC is enabled.
+		 * However, some older Intel hardware (hsw) have scaling
+		 * requirements that are not met by the plane, so remove it
+		 * for non-AMD devices.
+		 */
+		if (!is_amdgpu_device(data->fd))
+			igt_plane_set_fb(data->primary, NULL);
 
 		/*
 		 * i915 driver doesn't expose max bpc as debugfs entry,
-- 
2.30.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
