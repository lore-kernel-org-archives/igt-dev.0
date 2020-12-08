Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418D36E949
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Dec 2020 05:07:36 +0000 (UTC)
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Date: Tue,  8 Dec 2020 10:18:57 +0530
Message-Id: <20201208044900.19480-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Add FB_DAMAGE_CLIPS prop and new
 test for Selective fetch
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: gwan-gyeong.mun@intel.com, igt-dev@lists.freedesktop.org, jose.souza@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add new test for PSR2 selective fetch

Pankaj Bharadiya (3):
  INTEL_DII: lib/igt_psr: Add function to check PSR2 selective fetch
  INTEL_DII: tests/kms_psr2_su: Add new selective update test
  INTEL_DII: tests: Add new PSR2 selective fetch test

 lib/igt_psr.c          |  10 +
 lib/igt_psr.h          |   1 +
 tests/Makefile.sources |   1 +
 tests/kms_psr2_sf.c    | 649 +++++++++++++++++++++++++++++++++++++++++
 tests/kms_psr2_su.c    |  29 +-
 tests/meson.build      |   1 +
 6 files changed, 688 insertions(+), 3 deletions(-)
 create mode 100644 tests/kms_psr2_sf.c

-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
