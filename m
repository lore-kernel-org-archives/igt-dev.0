Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F14810ECB5
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 17:04:51 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso7821396fac.2
 for <igt-dev@lists.freedesktop.org>; Fri, 06 May 2022 10:04:51 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 12:04:45 -0500
Message-Id: <20220506170447.1437849-1-jason.ekstrand@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] tests/dmabuf: Add tests for sync_file
 import/export
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
  tests/dmabuf: Add tests for sync_file export (v4)
  tests/dmabuf: Add tests for sync_file import (v4)

 tests/dmabuf_sync_file.c | 513 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 514 insertions(+)
 create mode 100644 tests/dmabuf_sync_file.c

-- 
2.36.0
