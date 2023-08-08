Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F5010E158
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 11:59:58 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 17:29:11 +0530
Message-Id: <20230808115913.1064831-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add vram_d3cold_threshold test
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

This is a spin off from the below series, 
https://patchwork.freedesktop.org/series/119914/#rev3

Anshuamn Gupta (1):
  lib/igt_pm: Remove pci_system_{init, cleanup}

Anshuman Gupta (1):
  test/xe_pm: Add vram_d3cold_threshold subtest

 lib/igt_pm.c     |   5 --
 tests/xe/xe_pm.c | 121 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 5 deletions(-)

-- 
2.25.1
