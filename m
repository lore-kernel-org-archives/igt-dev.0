Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AA86E0A1
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 14:29:14 +0000 (UTC)
From: Anson Jacob <Anson.Jacob@amd.com>
Date: Fri, 18 Jun 2021 10:28:55 -0400
Message-ID: <20210618142855.5750-5-Anson.Jacob@amd.com>
In-Reply-To: <20210618142855.5750-1-Anson.Jacob@amd.com>
References: <20210618142855.5750-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_plane_multiple: Disable CRTC
 if no planes
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
Cc: Petri Latvala <petri.latvala@intel.com>, Anson Jacob <Anson.Jacob@amd.com>, Victor Lu <victorchengchi.lu@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Victor Lu <victorchengchi.lu@amd.com>

[why]
amdgpu will reject commits where the CRTC is enabled and there are no
active planes.

[how]
Disable the CRTC when committing with no active planes.

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
Acked-by: Anson Jacob <Anson.Jacob@amd.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Mark Yacoub <markyacoub@google.com>
---
 tests/kms_plane_multiple.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 4424b864b2d6..805c2a2130d7 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -315,6 +315,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		for_each_plane_on_pipe(&data->display, pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
+		/* Disable CRTC if no active planes */
+		igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int x = 0; x < c; x++)
@@ -344,6 +346,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		for_each_plane_on_pipe(&data->display, pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
+		/* Disable CRTC if no active planes */
+		igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int x = 0; x < c; x++)
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
