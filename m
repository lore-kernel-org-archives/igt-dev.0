Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB7510E696
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 15:29:58 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu, 31 Aug 2023 20:51:58 +0530
Message-Id: <20230831152200.1192557-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/2] Ignore uncompiled tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, mauro.chehab@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Ignore if testlist file isn't found during the testplan
testlist generation.

Bhanuprakash Modem (2):
  scripts/test_list: Ignore uncompiled tests
  testplan/kms: Make documentation is mandatory for all kms subtests

 docs/testplan/meson.build | 4 ++--
 scripts/test_list.py      | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

--
2.40.0


