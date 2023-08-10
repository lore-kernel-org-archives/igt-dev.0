Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CCD10E501
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 11:12:38 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.17.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CCC65580CD0
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 04:12:37 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qU3al-0041ln-30
 for igt-dev@lists.freedesktop.org; Thu, 10 Aug 2023 13:12:35 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 13:12:01 +0200
Message-ID: <20230810111234.960098-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/3] xe_live_ktest: remove xe_pci and
 xe_rtp tests from IGT testlist
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Rmove device-independent tests from xe_live_ktest.

Mauro Carvalho Chehab (3):
  xe_live_ktest: remove xe_pci and xe_rtp tests from IGT testlist
  xe-fast-feedback.testlist: drop device-independent kunit tests
  xe_live_ktest.c: drop the now removed tests

 tests/intel-ci/xe-fast-feedback.testlist |  3 ---
 tests/xe/xe_live_ktest.c                 | 11 -----------
 2 files changed, 14 deletions(-)

-- 
2.41.0
