Return-Path: <dri-devel-bounces@lists.freedesktop.org>
From: Neil Roberts <nroberts@igalia.com>
Subject: [PATCH i-g-t 0/2] panfrost: Test accessing a purged buffer via mmap
Date: Fri,  5 Mar 2021 12:12:44 +0100
Message-Id: <20210305111246.1381965-1-nroberts@igalia.com>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This adds a test for Panfrost to make sure that accessing a buffer
that has been madvised and then purged causes a bus fault. It is
intended to test the fix provided by this series:

https://patchwork.freedesktop.org/series/87324/

The series has now been merged into drm-misc-fixes (thanks!)

In order to trigger the purge, the test just tries to allocate a bunch
of buffers until one of them causes the original buffer to be purged.
During the review of the kernel patch series, Daniel Vetter suggested
it would be better to use debugfs or vm_drop_caches file from proc.
However, I noticed that there are other tests that use the same method
as in this series (eg, igt_vc4_trigger_purge). Seeing as there is
already a precedent for IGT tests to do this, I wonder if we could
leave that as a later change for someone who is more active in
Panfrost development.

Neil Roberts (2):
  lib/panfrost: Add a utility to madvise a buffer
  tests/panfrost: Add a test for accessing a purged buffer

 lib/igt_panfrost.c        |  12 ++++
 lib/igt_panfrost.h        |   1 +
 tests/meson.build         |   1 +
 tests/panfrost_purgemap.c | 146 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 tests/panfrost_purgemap.c

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
