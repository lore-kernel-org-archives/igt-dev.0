Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D52889A4A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 13:20:37 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Mon,  9 Aug 2021 15:20:24 +0200
Message-Id: <20210809132026.8692-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Keep tests working without relocations
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

Avoid using relocations on generations
which do not support it.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Andrzej Turko (2):
  tests/i915/gem_streaming_writes: Support gens without relocations
  HAX: Add the tests to fast feedback

 tests/i915/gem_streaming_writes.c     | 109 ++++++++-------
 tests/intel-ci/fast-feedback.testlist | 185 ++------------------------
 2 files changed, 75 insertions(+), 219 deletions(-)

-- 
2.25.1
