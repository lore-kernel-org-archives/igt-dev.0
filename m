Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FE06EB7B
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Mar 2021 10:08:50 +0000 (UTC)
From: Neil Roberts <nroberts@igalia.com>
Date: Thu, 11 Mar 2021 11:08:25 +0100
Message-Id: <20210311100825.2518293-1-nroberts@igalia.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/vc4_dmabuf_poll: Fix checking for
 POLLOUT
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
Cc: Eric Anholt <eric@anholt.net>
List-ID: <igt-dev@lists.freedesktop.org>

This test has two subtests, one which polls for POLLIN on the dmabuf fd,
and the other which looks like it's supposed to poll for POLLOUT. They
are both implemented with a helper function that takes the polling flag
as an argument. It looks like the helper actually ignores the argument
and both subtests end up checking for POLLIN. This just fixes it to use
the argument.

Fixes: da42b17e45c1 ("igt/vc4_dmabuf_poll: Add a test for polling to wait for dmabuf")
Signed-off-by: Neil Roberts <nroberts@igalia.com>
---
 tests/vc4_dmabuf_poll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vc4_dmabuf_poll.c b/tests/vc4_dmabuf_poll.c
index ac44d4cf..260e30c3 100644
--- a/tests/vc4_dmabuf_poll.c
+++ b/tests/vc4_dmabuf_poll.c
@@ -45,7 +45,7 @@ poll_write_bo_test(int fd, int poll_flag)
 	int dmabuf_fd = prime_handle_to_fd(fd, handle);
 	struct pollfd p = {
 		.fd = dmabuf_fd,
-		.events = POLLIN,
+		.events = poll_flag,
 	};
 	struct drm_vc4_wait_bo wait = {
 		.handle = handle,
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
