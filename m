Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933D910E210
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 08:30:16 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.94.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1nRVEP-003V5B-0q
 for igt-dev@lists.freedesktop.org; Tue, 08 Mar 2022 09:30:09 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Mar 2022 09:30:05 +0100
Message-Id: <20220308083006.834346-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/1] Synchronizes the PCI IDs on i915_pciids for
 DG2
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The list of PCI IDs for DG2 on IGT doesn't match the patch that was
merged on drm-tip. Sync them, in order for IGT to identify the same
PCI IDs as the Linux Kernel for such devices.

Mauro Carvalho Chehab (1):
  lib/i915_pciids.h: Add DG2 PCI IDs

 lib/i915_pciids.h       | 27 +++++++++++++++++++++++++++
 lib/i915_pciids_local.h | 20 --------------------
 lib/intel_device_info.c |  1 -
 3 files changed, 27 insertions(+), 21 deletions(-)
 delete mode 100644 lib/i915_pciids_local.h

-- 
2.35.1
