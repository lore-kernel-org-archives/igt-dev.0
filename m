Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442366EB27
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 15:12:49 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 24 Nov 2021 17:12:45 +0200
Message-Id: <20211124151245.29369-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Accept
 missing FBC debugfs files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

With multiple FBC instances becoming a thing at some point
the current plan is to go with separate debugfs files for
each FBC instance. Which also means that if there is no
FBC there will be no debugfs files either. Adapt the test
to tolerate such conditions.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index d6a884926c48..532bfbb9b481 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -724,7 +724,7 @@ static void __debugfs_read(const char *param, char *buf, int len)
 {
 	len = igt_debugfs_simple_read(drm.debugfs, param, buf, len);
 	if (len < 0)
-		igt_assert_eq(len, -ENODEV);
+		igt_assert(len == -ENOENT || len == -ENODEV);
 }
 
 static int __debugfs_write(const char *param, char *buf, int len)
-- 
2.32.0
