Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E2A113771
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jun 2022 08:57:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kamil.konieczny@linux.intel.com
Date: Thu, 30 Jun 2022 14:25:21 +0530
Message-Id: <20220630085523.291024-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 0/2] tests/kms_color: IGT test cleanup
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

Convert all possible subtests to dynamic and sanitize the system
state before starting/exiting the subtest.

Bhanuprakash Modem (2):
  tests/kms_color: Convert tests to dynamic
  tests/kms_color: Test Cleanup

 tests/kms_color.c        | 622 +++++++++++++++++++++------------------
 tests/kms_color_helper.h |   2 +
 2 files changed, 341 insertions(+), 283 deletions(-)

--
2.35.1
