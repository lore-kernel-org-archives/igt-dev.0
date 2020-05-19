Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5A989C49
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 09:48:26 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 19 May 2020 12:48:21 +0300
Message-Id: <20200519094821.29150-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: Don't use igt_fixture in an
 exit handler
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

kms_flip's exit handler was wrapped in an igt_fixture some 7 years ago
because "it can fail". That's not a problem anymore, as igt_fail()
will explicitly handle failing in an exit handler.

Rather, using igt_fixture in an exit handler is harmful because on a
subtest failure, we don't always keep track of the currently running
context (whether we're inside a subtest anymore) and we forcefully
assert correct nesting of IGT magic control blocks now.

We already know the state is cleanable because we only install the
handler on a successful init. Unconditional cleanup in an exit handler
is the correct thing to do in general.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/kms_flip.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 46bfc585..4b6affe1 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1536,10 +1536,8 @@ static void get_timestamp_format(void)
 
 static void kms_flip_exit_handler(int sig)
 {
-	igt_fixture {
-		if (last_connector)
-			kmstest_set_connector_dpms(drm_fd, last_connector, DRM_MODE_DPMS_ON);
-	}
+	if (last_connector)
+		kmstest_set_connector_dpms(drm_fd, last_connector, DRM_MODE_DPMS_ON);
 }
 
 static void test_nonblocking_read(int in)
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
