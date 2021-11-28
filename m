Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5F36EB92
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Nov 2021 07:18:21 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Sun, 28 Nov 2021 12:38:21 +0530
Message-Id: <20211128070823.1396652-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Helper function and engine reset test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Refactor common store code into helper function and
test per engine reset vs full GPU reset.

John Harrison (2):
  lib: Refactor common store code into helper function
  tests/i915/i915_hangman: Explicitly test per engine reset vs full GPU
    reset

 lib/igt_dummyload.c       |  80 +++++++++++++++++++----
 lib/igt_dummyload.h       |   4 ++
 lib/igt_gt.c              |  12 ++--
 lib/igt_gt.h              |   2 +-
 lib/igt_store.c           | 103 ++++++++++++++++++++++++++++++
 lib/igt_store.h           |  30 +++++++++
 lib/meson.build           |   1 +
 tests/i915/i915_hangman.c | 129 ++++++++++++++++++++++++++++++++++++--
 8 files changed, 337 insertions(+), 24 deletions(-)
 create mode 100644 lib/igt_store.c
 create mode 100644 lib/igt_store.h

-- 
2.25.1
