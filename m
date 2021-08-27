Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A1A6E98D
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Aug 2021 14:58:00 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Fri, 27 Aug 2021 17:57:50 +0300
Message-Id: <20210827145756.3342904-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] lib/igt_fb: Remove stride,
 offset restrictions on CCS FBs
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

Remove the power-of-two stride and 2 MB surface offset restriction on
ADL-P CCS FBs. Also fix/improve a few things in kms_ccs I noticed while
testing. The last for-ci only patch makes the removal of restriction
conditional on the required kernel FB remapping support.

Tested on SKL, TGL, ADL-P.

Imre Deak (6):
  tests/kms_ccs: Make sure to free GEM and FB objects
  tests/kms_ccs: Use test pattern when possible
  tests/kms_ccs: Fix small aux stride subtest
  tests/kms_ccs: Test bad params for all CCS planes
  lib/igt_fb: Add support for remapping CCS FBs
  for-ci: Check for ccs remap support

 lib/igt_fb.c            |  85 ++++++++++++++---
 lib/intel_aux_pgtable.c |  66 ++++++++++++--
 tests/kms_ccs.c         | 197 ++++++++++++++++++++++++++--------------
 3 files changed, 257 insertions(+), 91 deletions(-)

-- 
2.27.0
