Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7629898AA
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Sep 2021 18:17:40 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon,  6 Sep 2021 21:17:30 +0300
Message-Id: <20210906181736.3914421-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 0/6] lib/igt_fb: Remove stride,
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is v2 of [1], addressing the review comments from Juha-Pekka and
adding to patch 5 the removal of stride,offset restrictions which was
only part of the last patch in v1.

[1] https://patchwork.freedesktop.org/series/94107/

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Imre Deak (6):
  tests/kms_ccs: Make sure to free GEM and FB objects
  tests/kms_ccs: Use test pattern when possible
  tests/kms_ccs: Fix small aux stride subtest
  tests/kms_ccs: Test bad params for all CCS planes
  lib/igt_fb: Add support for remapping CCS FBs
  for-ci: Check for ccs remap support

 lib/igt_fb.c            | 104 ++++++++++++++++-----
 lib/intel_aux_pgtable.c |  66 +++++++++++--
 tests/kms_ccs.c         | 202 ++++++++++++++++++++++++++--------------
 3 files changed, 267 insertions(+), 105 deletions(-)

-- 
2.27.0
