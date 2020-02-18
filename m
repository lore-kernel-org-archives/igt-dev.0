Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105A06E073
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 16:16:14 +0000 (UTC)
From: Sreedhar Telukuntla <sreedhar.telukuntla@intel.com>
Date: Tue, 18 Feb 2020 05:47:08 +0530
Message-Id: <20200218001710.16537-1-sreedhar.telukuntla@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] Introduce new apis for coherent mmap
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

This patch introduces two new coherent mmap functions for tests.

gem_mmap__device_coherent_domain api maps buffer object and returns
the memory domain to be used by the caller for subsequent set_domain
call for cpu access.

gem_mmap__device_coherent_sync api maps buffer object and also does
set_domain to make the memory ready for cpu access.

gem_ctx_shared tests were modified to use the new functions 

Sreedhar Telukuntla (2):
  lib/i915/gem_mman: Add coherent mmap api support with set domain
  tests/i915/gem_ctx_shared: Use gem_mmap__device_coherent_sync api

 lib/i915/gem_mman.c         | 76 +++++++++++++++++++++++++++++++++++--
 lib/i915/gem_mman.h         |  6 ++-
 tests/i915/gem_ctx_shared.c | 23 +++--------
 3 files changed, 83 insertions(+), 22 deletions(-)

-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
