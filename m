Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5AA10E18F
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Dec 2021 05:55:05 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 21 Dec 2021 11:19:28 +0530
Message-Id: <20211221054930.4128285-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/2] Intel: Add ADL-N platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Kernel now have support for ADL-N, this series
is adding ADL-N device ids and other defines to
enable ADL-N.

Aligns with kernel commit :
7e28d0b26759 ("drm/i915/adl-n: Enable ADL-N platform")

Tejas Upadhyay (2):
  lib: sync i915_pciids.h with kernel
  lib/adl_n: Add Alder Lake N platform definition

 lib/i915_pciids.h       | 6 ++++++
 lib/intel_chipset.h     | 2 ++
 lib/intel_device_info.c | 8 ++++++++
 3 files changed, 16 insertions(+)

-- 
2.31.1
