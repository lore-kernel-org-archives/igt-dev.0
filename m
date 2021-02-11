Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6716ED7D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Feb 2021 09:08:41 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Thu, 11 Feb 2021 14:29:54 +0530
Message-Id: <20210211085956.241188-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t 0/2] lib/adl_s: Add Alder Lake S platform
 definition and PCIids
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
Cc: anusha.srivatsa@intel.com, lucas.demarchi@intel.com, hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Adding Alder lake platform definitions and PCI ids.
Taken from kernel commit:
0883d63b19bb drm/i915/adl_s: Add ADL-S platform info and PCI ids

Tejas Upadhyay (2):
  lib/adl_s: Add ADL-S PCIids
  lib/adl_s: Add Alder Lake S platform definition

 lib/i915_pciids.h       | 11 +++++++++++
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c |  8 ++++++++
 3 files changed, 21 insertions(+)

-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
