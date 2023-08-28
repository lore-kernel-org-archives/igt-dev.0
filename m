Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C1610E348
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Aug 2023 20:24:13 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-34cacab5e33so12887665ab.2
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Aug 2023 13:24:13 -0700 (PDT)
From: Drew Davenport <ddavenport@chromium.org>
To: igt-dev <igt-dev@lists.freedesktop.org>
Date: Mon, 28 Aug 2023 14:23:57 -0600
Message-ID: <20230828142356.1.I6b63e745635f9cad8c698001ce08f406fe0f0bcb@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_atomic_transition: Address test
 flakiness
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Drew Davenport <ddavenport@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Nonblocking commits can sometimes return -EBUSY. It's expected that
this error is transient and that userspace should retry the commit.

Since kms_atomic_transition uses nonblocking commits for some test
cases, the test fails flakily.

This change will handle -EBUSY to ensure that the test does not
fail in that case.

Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/144
Signed-off-by: Drew Davenport <ddavenport@chromium.org>

---

 tests/kms_atomic_transition.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 6ab5267ca..46ce9f929 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -683,7 +683,11 @@ static void commit_display(data_t *data, unsigned event_mask, bool nonblocking)
 	if (nonblocking)
 		flags |= DRM_MODE_ATOMIC_NONBLOCK;
 
-	igt_display_commit_atomic(&data->display, flags, NULL);
+	do {
+		ret = igt_display_try_commit_atomic(&data->display, flags, NULL);
+	} while (ret == -EBUSY);
+
+	igt_assert_eq(ret, 0);
 
 	igt_debug("Event mask: %x, waiting for %i events\n", event_mask, num_events);
 
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog
