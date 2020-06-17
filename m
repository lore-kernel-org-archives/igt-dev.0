Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A186EA02
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2020 17:47:04 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Wed, 17 Jun 2020 23:15:48 +0530
Message-Id: <20200617174550.17589-5-mohammed.khajapasha@intel.com>
In-Reply-To: <20200617174550.17589-1-mohammed.khajapasha@intel.com>
References: <20200610193724.16436-2-mohammed.khajapasha@intel.com>
 <20200617174550.17589-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 4/6] tests/kms_lease: Read crtc id for a
 valid pipe
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
To: suresh.kumar.kurmi@intel.com, kishore.kunche@intel.com, petri.latvala@intel.com, mohammed.khajapasha@freedesktop.org, arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Read crtc id for enabled pipes only.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_lease.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 007ae47f..3c92ca78 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -136,9 +136,11 @@ static enum pipe crtc_id_to_pipe(igt_display_t *display, uint32_t crtc_id)
 {
 	enum pipe pipe;
 
-	for (pipe = 0; pipe < display->n_pipes; pipe++)
-		if (display->pipes[pipe].crtc_id == crtc_id)
+	for (pipe = 0; pipe < display->n_pipes; pipe++) {
+		if (display->pipes[pipe].enabled &&
+				display->pipes[pipe].crtc_id == crtc_id)
 			return pipe;
+	}
 	return -1;
 }
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
