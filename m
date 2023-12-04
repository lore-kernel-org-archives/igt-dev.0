Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E341210E050
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 12:24:09 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Mon,  4 Dec 2023 17:58:21 +0530
Message-Id: <20231204122825.3689117-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/4] Extend compute square test to Xe2
 platform
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Extend compute sqaure test to run on LNL.

v2: Reuse address variables. (Zbigniew)

Janga Rahul Kumar (4):
  lib/intel_compute: Rename compute state addresses
  lib/intel_compute_square_kernels: Add xe2lpg compute sqaure kernel
  lib/intel_compute: Add XE2 compute implementation
  tests/xe_compute: Update documentation regarding test requirements

 lib/intel_compute.c                | 235 +++++++++++++++++++++++++++--
 lib/intel_compute_square_kernels.c |  36 +++++
 tests/intel/xe_compute.c           |   2 +-
 3 files changed, 258 insertions(+), 15 deletions(-)

-- 
2.25.1
