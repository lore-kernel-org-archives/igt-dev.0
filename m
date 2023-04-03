Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8C810E3B7
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 10:34:13 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  3 Apr 2023 12:33:57 +0200
Message-Id: <20230403103359.165928-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add missing change in xe_create
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

During the review I merged this in another branch so it wasn't pushed
properly to master branch.

Also add this subtest to BAT run. Expect the failure on vram as this
is not addressed in the kernel yet.

Zbigniew Kempczyński (2):
  xe/xe_create: Use system configuration page size
  intel-ci/xe-fast-feedback: Add xe_create@create-invalid-size subtest
    to BAT

 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 tests/xe/xe_create.c                     | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1
