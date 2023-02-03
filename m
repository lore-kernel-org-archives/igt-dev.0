Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF99710E80E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 16:07:06 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Feb 2023 21:34:09 +0530
Message-Id: <20230203160409.1585968-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_lease: Set Aspect ratio client
 cap in case of legacy commit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For clients setting DRM_CLIENT_CAP_ATOMIC, the support for aspect ratio
bits in mode flags is enabled by default. For legacy commit, clients need
to set the aspect ratio cap explicitly, if they want to set aspect ratio
bits in the mode flags.
Currently in case of setcrtc_implicit_plane, the client using the lease
does not set the aspect-ratio property before using setcrtc ioctl. This
creates a problem, when there are aspect-ratio bits present in the mode
flags. In such a case the setcrtc ioctl fails, as driver expects the
aspect ratio bits unset.

So set DRM_CLIENT_CAP_ASPECT_RATIO, if the mode flags do have aspect
ratio bits set, before calling the setcrtc ioctl.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_lease.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 67e8d3bec700..5c8e58dd86ea 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -345,6 +345,15 @@ static void setcrtc_implicit_plane(data_t *data)
 	do_or_die(create_lease(data->master.fd, &mcl));
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
+	/*
+	 * For Legacy commit, If userspace wants to send modes with aspect-ratio bits
+	 * then the client cap for aspect-ratio bits must be set.
+	 */
+	if (mode->flags & DRM_MODE_FLAG_PIC_AR_MASK) {
+		drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_ASPECT_RATIO, 1);
+		drmSetClientCap(mcl.fd, DRM_CLIENT_CAP_ASPECT_RATIO, 1);
+	}
+
 	/* Set a mode on the leased output */
 	igt_assert_eq(0, prepare_crtc(&data->master, data));
 
-- 
2.25.1
