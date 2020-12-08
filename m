Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34E06E953
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Dec 2020 17:19:47 +0000 (UTC)
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Date: Tue,  8 Dec 2020 22:31:06 +0530
Message-Id: <20201208170109.23073-1-pankaj.laxminarayan.bharadiya@intel.com>
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
 tests/kms_psr2_sf.c    | 649 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   1 +
 7 files changed, 666 insertions(+)
 create mode 100644 tests/kms_psr2_sf.c

-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
