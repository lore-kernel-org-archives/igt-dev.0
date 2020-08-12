Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37906E26F
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2020 09:10:02 +0000 (UTC)
From: Adam Miszczak <adam.miszczak@linux.intel.com>
Date: Wed, 12 Aug 2020 11:05:46 +0200
Message-Id: <20200812090548.4973-1-adam.miszczak@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] lib/i915: Add DG1 platform definition
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Introduce DG1 PCI IDs and related definitions.
PCI IDs synchronized with the drm-tip (copied i915_pciids.h directly).

Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>

Adam Miszczak (2):
  lib: sync i915_pciids.h with kernel
  lib/i915: Add DG1 platform definition

 lib/i915_pciids.h       | 8 +++++---
 lib/intel_chipset.h     | 2 ++
 lib/intel_device_info.c | 8 ++++++++
 3 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
