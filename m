Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BA510E08C
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 13:12:37 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Nov 2023 18:32:33 +0530
Message-Id: <20231115130237.1522518-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 0/4] Fix the usage of Rendercopy in KMS tests
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

Fix the usage of Rendercopy in KMS tests:
- Use blitter as a default method instead of render
- Fallback to use blitter if rendercopy support isn't present
- Restructure dynamic subtests for kms_dirtyfb

Bhanuprakash Modem (4):
  tests/intel/kms_fbt: Use blitter as a default draw method
  tests/intel/kms_fbt: Fill fb region with requested draw method
  tests/intel/kms_dirtyfb: Use blitter if rendercopy isn't present
  tests/intel/kms_dirtyfb: Restructure dynamic subtests

 tests/intel/kms_dirtyfb.c              | 91 +++++++++++++++++---------
 tests/intel/kms_frontbuffer_tracking.c | 43 ++++++------
 2 files changed, 84 insertions(+), 50 deletions(-)

--
2.40.0
