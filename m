Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3DF6E25F
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 06:37:13 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 25 Jun 2020 12:05:47 +0530
Message-Id: <20200625063551.26622-4-mohammed.khajapasha@intel.com>
In-Reply-To: <20200625063551.26622-1-mohammed.khajapasha@intel.com>
References: <20200617180354.17770-1-mohammed.khajapasha@intel.com>
 <20200625063551.26622-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 3/7] tests/kms_lease: Get pipe from crtc
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
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Get pipe from drm crtc for enabled pipes only.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_lease.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 927c2315..007ae47f 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -684,6 +684,8 @@ static void lease_unleased_crtc(data_t *data)
 	/* Find another CRTC that we don't control */
 	bad_crtc_id = 0;
 	for (p = 0; bad_crtc_id == 0 && p < data->master.display.n_pipes; p++) {
+		if(!(data->master.display.pipes[p].enabled))
+			continue;
 		if (pipe_to_crtc_id(&data->master.display, p) != data->crtc_id)
 			bad_crtc_id = pipe_to_crtc_id(&data->master.display, p);
 	}
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
