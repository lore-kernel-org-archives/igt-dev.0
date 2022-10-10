Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447AC10E45E
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 07:48:15 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Oct 2022 13:17:40 +0530
Message-Id: <20221010074747.259273-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/7] MPO + pipe color test
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

This series includes tests for degamma, gamma, ctm transformation
for both kms_color as well as kms_color_chamelium. Few changes are
also made in kms_color_helper to support multiplanes with different
formats.

Ananya Sharma (7):
  tests/kms_color_helper.c
  tests/kms_color: Degamma MPO + pipe color test
  tests/kms_color: Gamma MPO + pipe color test
  tests/kms_color: Ctm MPO + pipe color test
  tests/chamelium/kms_color_chamelium: degamma MPO + pipe color test
  tests/chamelium/kms_color_chamelium: gamma MPO + pipe color test
  tests/chamelium/kms_color_chamelium: ctm MPO + pipe color test

 tests/chamelium/kms_color_chamelium.c | 361 +++++++++++++++------
 tests/kms_color.c                     | 437 +++++++++++++++++++-------
 tests/kms_color_helper.c              |  26 +-
 tests/kms_color_helper.h              |  10 +-
 4 files changed, 611 insertions(+), 223 deletions(-)

-- 
2.25.1
