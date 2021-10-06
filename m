Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773C36EDBC
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 16:20:13 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed,  6 Oct 2021 12:14:44 -0400
Message-Id: <20211006161444.904476-9-rodrigo.vivi@intel.com>
In-Reply-To: <20211006161444.904476-1-rodrigo.vivi@intel.com>
References: <20211006161444.904476-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 8/8] README.md: Accept the i915_drm.h
 standalone update.
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

Looking to our git log we can see that the most common case
is the update of the single i915_drm.h file.

There are some advantages of doing this standalone update:

1. Make reviews easier without the noise of other headers.
2. Avoid the developer to have to touch other areas that are
   not immediately related to targeted work.

Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 README.md | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/README.md b/README.md
index 62bef46d..66f2bc0f 100644
--- a/README.md
+++ b/README.md
@@ -159,6 +159,20 @@ These should be updated all together by:
 Then, commit with a note of which exact commit from airlied's branch
 was used to generate them.
 
+### `include/drm-uapi/i915_drm.h`
+
+Imported i915_drm.h uapi headers from airlied's drm-next branch.
+
+In some cases updating a single uapi file is needed as our history
+shows. So in this case, it should be done by:
+
+    # From the kernel dir with a drm/drm-next commit checked out:
+    $ make INSTALL_HDR_PATH=<dest-dir> headers_install
+    $ cp <dest-dir>/include/drm/i915_drm.h <igt-dir>/include/drm-uapi/
+
+Then, commit with a note of which exact commit from airlied's branch
+was used to generate it.
+
 ### `include/linux-uapi/sync_file.h`
 
 Imported non-DRM uapi headers from airlied's drm-next branch.
-- 
2.31.1
