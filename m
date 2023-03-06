Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9099D10E1FB
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Mar 2023 15:22:10 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  6 Mar 2023 20:51:49 +0530
Message-Id: <20230306152151.24200-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] RFC extend kms_psr2_sf for panel replay
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Extended kms_psr2_sf test to run on sink which supports
panel replay. All debugfs infois assumed and driver
may not expose it as currently referred.

Kunal Joshi (2):
  RFC lib/igt_psr Added library functions for panel replay
  RFC tests/kms_psr2_sf Extended test to validate panel replay

 lib/igt_psr.c            |  62 +++++++++++++++++-
 lib/igt_psr.h            |   5 ++
 tests/i915/kms_psr2_sf.c | 137 ++++++++++++++++++++++++++++++---------
 3 files changed, 171 insertions(+), 33 deletions(-)

-- 
2.25.1
