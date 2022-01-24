Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ED710E820
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jan 2022 14:53:37 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon, 24 Jan 2022 20:11:23 +0530
Message-Id: <20220124144125.1900320-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] DG2 platform definition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, John.C.Harrison@intel.com, adam.miszczak@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added DG2 platform definition with PCI IDS.

Matt Roper (1):
  lib/dg2: Add DG2 platform definition

Priyanka Dandamudi (1):
  lib/i915_pciids: PCI IDS for DG2

 lib/i915_pciids.h       | 19 +++++++++++++++++++
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c |  8 ++++++++
 3 files changed, 29 insertions(+)

-- 
2.25.1
