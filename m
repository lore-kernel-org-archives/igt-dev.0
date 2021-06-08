Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FEB6EAD3
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jun 2021 07:34:32 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Tue,  8 Jun 2021 12:55:16 +0530
Message-Id: <1623137118-16598-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/2] Disable gamma in degamma subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com, charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This patch series disables gamma in degamma subtest which is missing.
It compares CRC between (linear degamma + solid colors) and (max
degamma + gradient colors). Patch also cleans up degamma before
exiting degamma test and cleans up gamma before exiting gamma
test. Changes are done for both kms_color and kms_color_chamelium.

Vidya Srinivas (2):
  tests/kms_color: Disable gamma in degamma tests
  tests/kms_color_chamelium: Disable gamma in degamma tests

 tests/kms_color.c           | 14 +++++++-------
 tests/kms_color_chamelium.c | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
