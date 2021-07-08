Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51F36E944
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 17:00:10 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  8 Jul 2021 22:18:58 +0530
Message-Id: <20210708164902.18250-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/4] VDSC ADLP related patches
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

Test-with: <20210708102549.27821-1-vandita.kulkarni@intel.com>

Ankit Nautiyal (3):
  lib: Add helper functions to read/write dsc debugfs
  tests/kms_dp_dsc: Use helper functions to read/write dsc debugfs
  tests/kms_invalid_dotclock: Modify the test for bigjoiner

Patnana Venkata Sai (1):
  tests/kms_dp_dsc: Add a subtest to force DSC output BPP

 lib/igt_kms.c                | 135 ++++++++++++++++++
 lib/igt_kms.h                |   9 ++
 tests/kms_dp_dsc.c           | 262 +++++++++++++++++------------------
 tests/kms_invalid_dotclock.c |  34 ++++-
 4 files changed, 303 insertions(+), 137 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
