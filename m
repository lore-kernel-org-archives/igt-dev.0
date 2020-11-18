Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B0589D1D
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2020 08:34:10 +0000 (UTC)
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Date: Wed, 18 Nov 2020 13:44:46 +0530
Message-Id: <20201118081449.10523-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] Add FB_DAMAGE_CLIPS prop and new test
 for Selective fetch
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

Add new test for selective fetch

Pankaj Bharadiya (3):
  lib/kms: Add fb damage clip plane property
  lib/igt_psr: Add function to check PSR2 selective fetch
  tests: Add new PSR2 selective fetch test

 lib/igt_kms.c          |   3 +
 lib/igt_kms.h          |   1 +
 lib/igt_psr.c          |  10 +
 lib/igt_psr.h          |   1 +
 tests/Makefile.sources |   1 +
 tests/kms_psr2_sf.c    | 717 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   1 +
 7 files changed, 734 insertions(+)
 create mode 100644 tests/kms_psr2_sf.c

-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
