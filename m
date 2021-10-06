Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8136EDC2
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 16:20:13 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed,  6 Oct 2021 12:14:42 -0400
Message-Id: <20211006161444.904476-7-rodrigo.vivi@intel.com>
In-Reply-To: <20211006161444.904476-1-rodrigo.vivi@intel.com>
References: <20211006161444.904476-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/8] README.md: Detail the drm-uapi headers
 sync.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Let's detail a bit more on how to properly get the headers
properly in a cleaner way. This might help to avoid small
mistakes when syncing uapi headers.

Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 README.md | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index 6d9e40f3..d71a2fa7 100644
--- a/README.md
+++ b/README.md
@@ -149,7 +149,13 @@ overall structure or indexes you need to reflect the change in
 
 Imported DRM uapi headers from airlied's drm-next branch.
 
-These should be updated all together by executing `make headers_install` from
-that branch of the kernel and then copying the resulting
-`./usr/include/drm/*.h` in and committing with a note of which exact commit
-from airlied's branch was used to generate them.
+These should be updated all together by:
+
+    # From the kernel dir with a drm/drm-next commit checked out:
+    $ make INSTALL_HDR_PATH=<dest-dir> headers_install
+    $ rm -f <igt-dir>/include/drm-uapi/*
+    $ cp <dest-dir>/include/linux/sync_file.h <igt-dir>/include/drm-uapi/
+    $ cp <dest-dir>/include/drm/* <igt-dir>/include/drm-uapi/
+
+Then, commit with a note of which exact commit from airlied's branch
+was used to generate them.
-- 
2.31.1
