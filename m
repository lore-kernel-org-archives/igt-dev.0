Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2157510E0DF
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Mar 2023 19:12:02 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Mar 2023 00:40:46 +0530
Message-Id: <20230306191050.25936-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/4] MPO + pipe color test
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

Ananya Sharma (4):
  tests/kms_color_helper: helper to enable MPO + pipe color test
  tests/kms_color: MPO + pipe color test for degamma
  tests/kms_color: MPO + pipe color test for gamma
  tests/kms_color: MPO + pipe color test for ctm

 tests/chamelium/kms_chamelium_color.c |  23 +-
 tests/kms_color.c                     | 469 ++++++++++++++++++++++----
 tests/kms_color_helper.c              |  26 +-
 tests/kms_color_helper.h              |  10 +-
 4 files changed, 448 insertions(+), 80 deletions(-)

-- 
2.25.1
