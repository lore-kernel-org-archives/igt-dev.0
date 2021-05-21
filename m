Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9546E461
 for <igt-dev@lists.freedesktop.org>; Fri, 21 May 2021 19:06:49 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 6so14961492pgk.5
 for <igt-dev@lists.freedesktop.org>; Fri, 21 May 2021 12:06:49 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 21 May 2021 14:06:39 -0500
Message-Id: <20210521190641.623110-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] Add tests for sync_file import/export
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

This little series adds tests for sync_file import/export as per this
patch series on dri-devel:

https://patchwork.freedesktop.org/series/90380/
https://lists.freedesktop.org/archives/dri-devel/2021-May/307561.html

Jason Ekstrand (2):
  tests/dmabuf: Add tests for sync_file export (v2)
  tests/dmabuf: Add tests for sync_file import

 tests/dmabuf_sync_file.c | 364 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 365 insertions(+)
 create mode 100644 tests/dmabuf_sync_file.c

-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
