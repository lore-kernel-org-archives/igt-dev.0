Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C8810E29E
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 17:34:14 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 14 Sep 2023 10:23:31 -0700
Message-Id: <20230914172332.2322524-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/1] lib/intel_allocator: Query exact gtt
 size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com, jonathan.cavitt@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Use the gem_context_get_param functionality to query the exact gtt size
for each vm in the intel_allocator.  This replaces the fixed declaration
using the GEN8_GTT_ADDRESS_WIDTH.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>

Jonathan Cavitt (1):
  lib/intel_allocator: Query exact gtt size

 lib/intel_allocator.h        | 11 +++++++++++
 lib/intel_allocator_simple.c | 10 +++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.25.1
