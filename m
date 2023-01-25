Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF69010E0DF
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 11:03:37 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 12:03:27 +0100
Message-Id: <20230125110329.41260-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Fix softpinned version of
 gem-tiled-fence-blits
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

With HAX to run on all platforms and decrease CI execution time as 
it fix single test only.

Zbigniew Kempczyński (2):
  i915/gem_tiled_fence_blits: Fix softpinned version of the test
  HAX: exercise gem_tiled_fence_blits only

 tests/i915/gem_tiled_fence_blits.c    |  46 +++++--
 tests/intel-ci/fast-feedback.testlist | 176 +-------------------------
 2 files changed, 39 insertions(+), 183 deletions(-)

-- 
2.34.1
