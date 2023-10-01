Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFE710E1F0
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Oct 2023 10:22:24 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  1 Oct 2023 16:00:04 +0530
Message-Id: <20231001103006.431894-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add test for hotplug validation in
 simulation
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

Test to validate hotplug in simulation environment we
have scratch pad register 0x4f080 from which we can
trigger uevents such as HPD, VBLANK..etc, Idea is to
have port mapping placed in igtrcthrough which test
can write to 0x4f080 and check if we get hotplug

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Kunal Joshi (2):
  tests/kms_simulation_hpd: New test for hotplug validation
  tests/meson: added test to meson.build

 tests/intel/kms_simulation_hpd.c | 534 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 535 insertions(+)
 create mode 100644 tests/intel/kms_simulation_hpd.c

-- 
2.25.1
