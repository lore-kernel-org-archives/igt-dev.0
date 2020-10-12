Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47DB6E05F
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2020 12:39:04 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 12 Oct 2020 14:38:57 +0200
Message-Id: <20201012123900.485289-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] Fix igt tests to cope with ww changes.
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

Some of the api related to userptr is being limited soon,
we will remove unsynchronised userptr, and remove support for pread,
pwrite, grabbing remote pages on forking, set_domain() etc,
so fix tests to deal with this.

Maarten Lankhorst (3):
  tests/gem_userptr_blits: Rework userptr tests to copy with changes
  tests/gem_exec_reloc: Cap max amount of active relocations in
    basic-many-active.
  tests: Do not use pread on userptr in gem_exec_parallel.

 tests/i915/gem_exec_parallel.c | 15 ++++--
 tests/i915/gem_exec_reloc.c    |  4 +-
 tests/i915/gem_userptr_blits.c | 94 +++++++++++++++++++---------------
 3 files changed, 66 insertions(+), 47 deletions(-)

-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
