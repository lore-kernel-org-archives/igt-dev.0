Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9121210E996
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 20:13:13 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t 0/2] benchmarks/gem_wsim: support gens without
 relocations and mmap fix
Date: Thu, 14 Dec 2023 21:13:00 +0100
Message-Id: <20231214201302.29844-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patch series introduces two key enhancements to the gem_wsim benchmark tool.

The first commit improves support for generations that do not use relocations.
The approach present in 'lib/igt_dummyload' has been adopted,
leveraging the 'intel_allocator' to compute offsets on these generations.
This change also introduces a shared 'struct vm' for both i915 and Xe,
which includes a 'vm_id' used by the 'intel_allocator' for address assignment.
This enhances the compatibility of 'gem_wsim' with newer platforms running i915.

The second commit addresses an issue with the 'gem_mmap__wc' function,
which was found to be incompatible with discrete graphics cards.
The mapping approach from 'lib/igt_dummyload' has been adopted.

Marcin Bernatowicz (2):
  benchmarks/gem_wsim: Support gens without relocations
  benchmarks/gem_wsim: Fix mmap for discrete graphics cards

 benchmarks/gem_wsim.c | 107 ++++++++++++++++++++++++++++++++----------
 1 file changed, 81 insertions(+), 26 deletions(-)

-- 
2.31.1
