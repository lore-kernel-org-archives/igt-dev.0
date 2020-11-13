Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9022F6E50E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2020 13:39:58 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 13 Nov 2020 13:39:51 +0000
Message-Id: <20201113133951.1231761-2-chris@chris-wilson.co.uk>
In-Reply-To: <20201113133951.1231761-1-chris@chris-wilson.co.uk>
References: <20201113133951.1231761-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/i915: Include the device name in
 the submission pretty-printer
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

For tests that care deeply about the submission method, also mention
what platform the test is being run on.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/i915/gem_submission.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index 2c17d93ae..c8980dcee 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -111,6 +111,11 @@ out:
 void gem_submission_print_method(int fd)
 {
 	const unsigned flags = gem_submission_method(fd);
+	const struct intel_device_info *info;
+
+	info = intel_get_device_info(intel_get_drm_devid(fd));
+	if (info)
+		igt_info("Running on %s\n", info->codename);
 
 	if (flags & GEM_SUBMISSION_GUC) {
 		igt_info("Using GuC submission\n");
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
