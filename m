Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE41E6E854
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 22:42:36 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 17 Mar 2021 18:42:21 -0400
Message-Id: <20210317224222.447100-3-lyude@redhat.com>
In-Reply-To: <20210317224222.447100-1-lyude@redhat.com>
References: <20210317224222.447100-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_color: Allow tests to run on
 any driver
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
Cc: nouveau@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

There's no reason I can see for this being Intel/AMD only

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_color.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 705c9160..02a1a2de 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -847,7 +847,7 @@ igt_main
 	enum pipe pipe;
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_AMDGPU);
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		if (is_i915_device(data.drm_fd))
 			data.devid = intel_get_drm_devid(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
