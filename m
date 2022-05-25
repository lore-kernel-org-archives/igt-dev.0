Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF4110E666
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 16:12:41 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id l84so8238606oif.10
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 09:12:41 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 May 2022 11:12:35 -0500
Message-Id: <20220525161237.2213204-1-jason.ekstrand@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] tests/dmabuf: Add tests for sync_file
 import/export (v5)
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This series adds tests for sync_file import/export as per this kernel
series on dri-devel:

https://patchwork.freedesktop.org/series/103602/
https://lists.freedesktop.org/archives/dri-devel/2022-May/354339.html

Jason Ekstrand (2):
  tests/dmabuf: Add tests for sync_file export (v5)
  tests/dmabuf: Add tests for sync_file import (v5)

 tests/dmabuf_sync_file.c | 529 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 530 insertions(+)
 create mode 100644 tests/dmabuf_sync_file.c

-- 
2.36.1
