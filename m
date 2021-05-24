Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1036E23B
 for <igt-dev@lists.freedesktop.org>; Mon, 24 May 2021 20:52:31 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id ot16so13636062pjb.3
 for <igt-dev@lists.freedesktop.org>; Mon, 24 May 2021 13:52:31 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 24 May 2021 15:52:23 -0500
Message-Id: <20210524205225.872316-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/dmabuf: Add tests for sync_file
 import/export
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
List-ID: <igt-dev@lists.freedesktop.org>

This series adds tests for sync_file import/export as per this kernel
series on dri-devel:

https://patchwork.freedesktop.org/series/90380/
https://lists.freedesktop.org/archives/dri-devel/2021-May/307561.html

The import stuff is labled RFC because that bit of the kernel patches
aren't quite baked yet.

Jason Ekstrand (2):
  tests/dmabuf: Add tests for sync_file export (v3)
  RFC: tests/dmabuf: Add tests for sync_file import (v3)

 tests/dmabuf_sync_file.c | 457 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 458 insertions(+)
 create mode 100644 tests/dmabuf_sync_file.c

-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
