Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BED10E77F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jan 2022 16:37:50 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 20 Jan 2022 21:55:38 +0530
Message-Id: <20220120162540.1850941-1-priyanka.dandamudi@intel.com>
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, John.C.Harrison@intel.com, saurabhg.gupta@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add DG2 platform definition and synchronize PCIIDs with kernel.

Adam Miszczak (1):
  INTEL_DII/NOT_UPSTREAM: synchronize PCI IDs with kernel

Matt Roper (1):
  INTEL_DII: lib/dg2: Add DG2 platform definition

 lib/i915_pciids.h       | 42 +++++++++++++++++++++++++++++++++++++++++
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c |  8 ++++++++
 3 files changed, 52 insertions(+)

-- 
2.25.1
