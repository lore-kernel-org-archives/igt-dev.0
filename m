Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC9210E405
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Sep 2022 13:03:58 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 16 Sep 2022 18:28:12 +0530
Message-Id: <20220916125819.516618-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/7] MPO + pipe color test
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

This series includes tests for degamma, gamma, ctm transformation for
both kms_color as well as kms_color_chamelium.

Ananya Sharma (7):
  tests/kms_color_helper.c
  tests/kms_color: MPO + pipe color test for degamma
  tests/kms_color: MPO + pipe color test for gamma.
  tests/kms_color: MPO + pipe color test for ctm.
  tests/chamelium/kms_color_chamelium: MPO + pipe color test for degamma
  tests/chamelium/kms_color_chamelium: MPO + pipe color test for gamma
  tests/chamelium/kms_color_chamelium: MPO + pipe color test for ctm

 tests/chamelium/kms_color_chamelium.c | 327 +++++++++++++++------
 tests/kms_color.c                     | 407 ++++++++++++++++++--------
 tests/kms_color_helper.c              |  27 +-
 tests/kms_color_helper.h              |   8 +-
 4 files changed, 543 insertions(+), 226 deletions(-)

-- 
2.25.1
