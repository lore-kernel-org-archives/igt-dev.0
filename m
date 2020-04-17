Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86E36E932
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 19:49:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64DB5801E5D
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 19:49:37 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Fri, 17 Apr 2020 15:49:26 -0400
Message-Id: <20200417194931.39774-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/5] Add nouveau-crc tests
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

From: Lyude Paul <lyude@redhat.com>

Nouveau has finally gotten CRC support, hooray! Well, it's under review
at least:

https://patchwork.freedesktop.org/series/74804/
(it has a cover letter, but nouveau's mailing list configuration has
blocked the email so I'm waiting for a moderator to fix that)

So, this series adds the relevant tests for it since nvidia's CRC
implementation has some rather interesting design choices that needed to
be worked around.

Changes since v1:
* fix documentation errors Petri pointed out
* Fix documentation for igt_require_fd()
* Fix copyright year in tests/nouveau_crc.c

Lyude Paul (5):
  lib/igt_core: Fix igt_assert_fd() documentation
  lib/igt_core: Add igt_require_fd()
  lib/igt_debugfs: Add igt_debugfs_pipe_dir()
  lib/igt_kms: Hook up connector dithering prop
  tests: Add nouveau-crc tests

 lib/drmtest.c       |  10 ++
 lib/drmtest.h       |   2 +
 lib/igt_core.h      |  16 +-
 lib/igt_debugfs.c   |  29 ++++
 lib/igt_debugfs.h   |   1 +
 lib/igt_kms.c       |   6 +
 lib/igt_kms.h       |   1 +
 tests/meson.build   |   1 +
 tests/nouveau_crc.c | 396 ++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 460 insertions(+), 2 deletions(-)
 create mode 100644 tests/nouveau_crc.c

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
