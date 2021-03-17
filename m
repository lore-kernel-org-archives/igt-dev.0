Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C536E85B
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 22:50:13 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 17 Mar 2021 18:49:45 -0400
Message-Id: <20210317224949.448284-4-lyude@redhat.com>
In-Reply-To: <20210317224949.448284-1-lyude@redhat.com>
References: <20210317224949.448284-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/7] lib/drmtest: Remove i915 refs in
 do_ioctl*() docs
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
To: nouveau@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: Martin Peres <martin.peres@free.fr>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

These aren't i915 specific, looks like some historical junk.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>
---
 lib/drmtest.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/drmtest.h b/lib/drmtest.h
index c4b15a26..b933f76a 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -117,7 +117,7 @@ bool is_vc4_device(int fd);
 
 /**
  * do_ioctl:
- * @fd: open i915 drm file descriptor
+ * @fd: open drm file descriptor
  * @ioc: ioctl op definition from drm headers
  * @ioc_data: data pointer for the ioctl operation
  *
@@ -131,7 +131,7 @@ bool is_vc4_device(int fd);
 
 /**
  * do_ioctl_err:
- * @fd: open i915 drm file descriptor
+ * @fd: open drm file descriptor
  * @ioc: ioctl op definition from drm headers
  * @ioc_data: data pointer for the ioctl operation
  * @err: value to expect in errno
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
