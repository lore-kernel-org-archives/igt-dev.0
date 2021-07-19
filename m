Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4776E0C9
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jul 2021 09:50:03 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Mon, 19 Jul 2021 15:08:34 +0530
Message-Id: <20210719093838.1842-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 0/4] VDSC ADLP related patches
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

v4: Rebase on tip

Test-with: <20210708102549.27821-1-vandita.kulkarni@intel.com>

Ankit Nautiyal (3):
  lib: Add helper functions to read/write dsc debugfs
  tests/kms_dp_dsc: Use helper functions to read/write dsc debugfs
  tests/kms_invalid_dotclock: Modify the test for bigjoiner

Patnana Venkata Sai (1):
  tests/kms_dp_dsc: Add a subtest to force DSC output BPP

 lib/igt_kms.c                | 135 ++++++++++++++++++
 lib/igt_kms.h                |   9 ++
 tests/kms_dp_dsc.c           | 265 +++++++++++++++++------------------
 tests/kms_invalid_dotclock.c |  34 ++++-
 4 files changed, 307 insertions(+), 136 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
