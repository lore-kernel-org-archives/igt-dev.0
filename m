Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE19910E471
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 12:34:56 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Oct 2022 18:04:39 +0530
Message-Id: <20221012123446.30393-1-ananya.sharma@intel.com>
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
  tests/chamelium/kms_color_chamelium: degamma for MPO + pipe color test
  tests/chamelium/kms_color_chamelium: gamma for MPO + pipe color test
  tests/chamelium/kms_color_chamelium: ctm for MPO + pipe color test

 tests/chamelium/kms_color_chamelium.c | 368 ++++++++++++++++------
 tests/kms_color.c                     | 437 +++++++++++++++++++-------
 tests/kms_color_helper.c              |  26 +-
 tests/kms_color_helper.h              |  10 +-
 4 files changed, 617 insertions(+), 224 deletions(-)

-- 
2.25.1
