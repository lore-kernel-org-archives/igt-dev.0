Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354C989A4F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jul 2021 12:18:47 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 19 Jul 2021 17:49:50 +0530
Message-Id: <20210719121953.14449-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] Extend DSC support to HDMI
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

As HDMI also supports DSC, we need to extend the test coverage.

This patch series will remove the connector type check which is
preventing to run on HDMI. Also rename *dp_dsc* to *dsc* since it
is no longer DP specific.

Bhanuprakash Modem (3):
  lib/igt_kms: Rename dp_dsc to dsc
  tests/kms_dsc: Extend support to HDMI
  tests/kms_invalid_dotclock: Update to use renamed DSC api

 lib/igt_kms.c                     | 24 ++++++++---------
 lib/igt_kms.h                     | 12 ++++-----
 tests/{kms_dp_dsc.c => kms_dsc.c} | 43 +++++++++++++++++++------------
 tests/kms_invalid_dotclock.c      |  2 +-
 tests/meson.build                 |  2 +-
 5 files changed, 47 insertions(+), 36 deletions(-)
 rename tests/{kms_dp_dsc.c => kms_dsc.c} (90%)

--
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
