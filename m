Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1910F10E930
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Dec 2023 17:11:43 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] lib/intel_bufops: Don't memcpy() simple structs
Date: Thu,  7 Dec 2023 19:11:36 +0200
Message-ID: <20231207171136.30669-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20231207171136.30669-1-ville.syrjala@linux.intel.com>
References: <20231207171136.30669-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Just use a regular assignment when possible instead of
complicating things with memcpy().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/intel_bufops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 46eba3fb43a2..6ceea55caa81 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1498,7 +1498,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 	for (int i = 0; i < ARRAY_SIZE(buf_ops_arr); i++) {
 		if (generation >= buf_ops_arr[i].gen_start &&
 		    generation <= buf_ops_arr[i].gen_end) {
-			memcpy(bops, &buf_ops_arr[i], sizeof(*bops));
+			*bops = buf_ops_arr[i];
 			break;
 		}
 	}
-- 
2.41.0
