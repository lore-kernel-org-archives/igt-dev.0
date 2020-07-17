Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD266EDEA
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2020 15:41:08 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Fri, 17 Jul 2020 15:40:54 +0000
Message-Id: <20200717154101.8849-5-mohammed.khajapasha@intel.com>
In-Reply-To: <20200717154101.8849-1-mohammed.khajapasha@intel.com>
References: <20200717154101.8849-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 04/11] tests/kms_lease: Get pipe from crtc
 for enable pipes
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
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org, petri.latvala@intel.com, kishore.kunche@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Get pipe from drm crtc for enabled pipes only.

v2:
    Using for_each_pipe() macro for enable pipes <Hiler, Arkadiusz>

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_lease.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 2e6cf9b0..0481bba7 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -683,7 +683,10 @@ static void lease_unleased_crtc(data_t *data)
 
 	/* Find another CRTC that we don't control */
 	bad_crtc_id = 0;
-	for (p = 0; bad_crtc_id == 0 && p < data->master.display.n_pipes; p++) {
+
+	for_each_pipe(&data->master.display, p) {
+		if (bad_crtc_id != 0)
+			continue;
 		if (pipe_to_crtc_id(&data->master.display, p) != data->crtc_id)
 			bad_crtc_id = pipe_to_crtc_id(&data->master.display, p);
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
