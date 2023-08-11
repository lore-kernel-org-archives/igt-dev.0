Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C042810E691
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 11:10:41 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Aug 2023 16:40:24 +0530
Message-Id: <20230811111026.1327273-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Add vram_d3cold_threshold test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

v2 has major changes in "test/xe_pm: Add vram_d3cold_threshold subtest"

Tests was expecting card to enter to d3cold after freeing up the Xe Bo.
But it wasn't entering because gem_close() doesn't wake device from d3hot.
Therefore test requires to use forcewake debugfs handle to wake device from d3hot and
let XeKMD to compute d3cold.allow based upon used vram and
vram_d3cold_threshold.
Due to above major change in test, i removed the existing RB.

Anshuamn Gupta (1):
  lib/igt_pm: Remove pci_system_{init, cleanup}

Anshuman Gupta (1):
  test/xe_pm: Add vram_d3cold_threshold subtest

 lib/igt_pm.c     |   5 --
 tests/xe/xe_pm.c | 128 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+), 5 deletions(-)

-- 
2.25.1
