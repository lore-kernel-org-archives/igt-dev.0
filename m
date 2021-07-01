Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AC76EB71
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jul 2021 17:26:24 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id f6so6816183qka.0
 for <igt-dev@lists.freedesktop.org>; Thu, 01 Jul 2021 10:26:24 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu,  1 Jul 2021 13:26:16 -0400
Message-Id: <20210701172617.2257508-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/2] drmtest: Add is_msm_device check
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
Cc: petri.latvala@intel.com, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

Add support for MSM drivers.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
--
 lib/drmtest.c | 5 +++++
 lib/drmtest.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index a8ba6e11..e1f9b115 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -114,6 +114,11 @@ bool is_i915_device(int fd)
 	return __is_device(fd, "i915");
 }
 
+bool is_msm_device(int fd)
+{
+	return __is_device(fd, "msm");
+}
+
 bool is_nouveau_device(int fd)
 {
 	/* Currently all nouveau-specific codepaths require libdrm */
diff --git a/lib/drmtest.h b/lib/drmtest.h
index d393dbf1..7d17a0f9 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -102,6 +102,7 @@ void igt_require_vc4(int fd);
 
 bool is_amdgpu_device(int fd);
 bool is_i915_device(int fd);
+bool is_msm_device(int fd);
 bool is_nouveau_device(int fd);
 bool is_vc4_device(int fd);
 
-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
