Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C5210E202
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 12:33:44 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 14 Feb 2022 13:33:36 +0100
Message-Id: <20220214123338.39884-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] DG2 enable (locally)
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Unblock code which requires DG2 pciids and definitions.

Cc: Petri Latvala <petri.latvala@intel.com>

Zbigniew Kempczyński (2):
  lib/intel_device_info: Introduce i915_pciids_local.h and add DG2
    definition
  lib/intel_chipset: Add flatccs flag for DG2

 lib/i915_pciids_local.h | 20 ++++++++++++++++++++
 lib/intel_chipset.h     |  5 +++++
 lib/intel_device_info.c | 10 ++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 lib/i915_pciids_local.h

-- 
2.32.0
