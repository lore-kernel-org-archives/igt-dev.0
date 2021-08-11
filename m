Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BF1890A6
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Aug 2021 20:28:22 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Wed, 11 Aug 2021 22:28:09 +0200
Message-Id: <20210811202811.2162-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] gem_exec_big -- noreloc support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Turko <andrzej.turko@linux.intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Adapt gem_exec_big to run also on platforms
with disabled relocation support.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Andrzej Turko (2):
  tests/i915/gem_exec_big: Add a path without relocations
  HAX: Run gem_exec_big

 tests/i915/gem_exec_big.c             |  40 ++++++
 tests/intel-ci/fast-feedback.testlist | 175 +-------------------------
 2 files changed, 43 insertions(+), 172 deletions(-)

-- 
2.25.1
