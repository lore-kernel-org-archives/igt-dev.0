Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3564D10E704
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 07:56:58 +0000 (UTC)
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
To: 
Date: Wed,  8 Nov 2023 11:57:04 -0800
Message-Id: <cover.1699473138.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] This patch series enables the
 compression feature for XE2 Lunarlake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com, "Jahagirdar,
 Akshata" <akshata.jahagirdar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

*** BLURB HERE ***

Jahagirdar, Akshata (2):
  XE2: LNL: adding Blt command support for Lunarlake
  XE2: xe_ccs IGT changes to enable  xe2 igfx compression

 lib/intel_blt.c         | 18 ++++++++++--------
 lib/intel_blt.h         |  3 ++-
 lib/intel_chipset.h     |  1 +
 lib/intel_cmds_info.c   | 24 ++++++++++++++++++++++++
 lib/intel_cmds_info.h   |  1 +
 lib/intel_device_info.c |  2 +-
 lib/intel_pat.c         | 12 +++++++++++-
 lib/intel_pat.h         |  1 +
 tests/intel/gem_ccs.c   |  2 +-
 tests/intel/xe_ccs.c    | 37 ++++++++++++++++++-------------------
 10 files changed, 70 insertions(+), 31 deletions(-)

-- 
2.34.1
