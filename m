Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029506E51D
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 04:49:59 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 19 Aug 2021 06:49:38 +0200
Message-Id: <20210819044941.7699-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Adopt to use allocator
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Next series which should decrease coverage gap on discrete.
Hax is only to avoid unnecessary fail on TGL and not bother our
CI team.

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Ch Sai Gowtham (1):
  tests/gem_shrink: Add allocator support

Zbigniew Kempczyński (2):
  tests/gem_ctx_shared: Adopt to use allocator
  HAX: remove gttfill for tgl ci

 tests/i915/gem_ctx_shared.c           | 164 ++++++++++++++++++++------
 tests/i915/gem_shrink.c               |   6 +-
 tests/intel-ci/fast-feedback.testlist |   1 -
 3 files changed, 134 insertions(+), 37 deletions(-)

-- 
2.26.0
