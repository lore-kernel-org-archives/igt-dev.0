Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC59E6E210
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 15:42:48 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Wed,  1 Sep 2021 21:18:44 +0530
Message-Id: <20210901154846.3323879-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] i915/gem_render_copy: Add support for
 local memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: zbigniew.kempczynski@intel.com, thomas.hellstrom@linux.intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, apoorva1.singh@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

- Add intel_buf_init_in_region in lib/intel_bufops which
  allows memory region to be specified for new BO being created.
  Same as intel_buf_init with the additional region argument.

- Add support for local memory region in gem_render_copy

Apoorva Singh (2):
  lib/intel_bufops: Add intel_buf_init_in_region
  i915/gem_render_copy: Add support for local memory

 lib/intel_bufops.c           | 28 ++++++++++++++---
 lib/intel_bufops.h           |  5 +++
 tests/i915/gem_render_copy.c | 61 +++++++++++++++++++++++++-----------
 3 files changed, 70 insertions(+), 24 deletions(-)

-- 
2.25.1
