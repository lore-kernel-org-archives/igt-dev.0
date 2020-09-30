Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DF36E7D2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2020 17:32:01 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 30 Sep 2020 13:31:45 -0400
Message-Id: <20200930173150.431995-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 0/5] Add nouveau-crc tests
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
Cc: nouveau@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Nouveau has finally gotten CRC support, and at this point that support
has made its way upstream. Hooray!

So, let's start adding some relevant tests for it since nvidia's CRC
implementation has some rather interesting design choices that needed to
be worked around.

Lyude Paul (5):
  lib/igt_core: Fix igt_assert_fd() documentation
  lib/igt_core: Add igt_require_fd()
  lib/igt_debugfs: Add igt_debugfs_pipe_dir()
  lib/igt_kms: Hook up connector dithering prop
  tests: Add nouveau-crc tests

 .gitlab-ci.yml      |   2 +-
 lib/drmtest.c       |  10 ++
 lib/drmtest.h       |   2 +
 lib/igt_core.h      |  16 +-
 lib/igt_debugfs.c   |  21 +++
 lib/igt_debugfs.h   |   1 +
 lib/igt_kms.c       |   5 +
 lib/igt_kms.h       |   1 +
 tests/meson.build   |   1 +
 tests/nouveau_crc.c | 414 ++++++++++++++++++++++++++++++++++++++++++++
 10 files changed, 470 insertions(+), 3 deletions(-)
 create mode 100644 tests/nouveau_crc.c

-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
