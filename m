Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5993A10E097
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Nov 2022 11:56:34 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Nov 2022 12:56:36 +0100
Message-Id: <cover.1667994832.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] misplaced-blitter - for CI only
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

Please don't review.

Karolina Drobnik (2):
  tests/api_intel_bb: Check for blitter support in misplaced-blitter
  HAX: Test misplaced_blitter only

 tests/i915/api_intel_bb.c             |   1 +
 tests/intel-ci/fast-feedback.testlist | 179 +-------------------------
 2 files changed, 3 insertions(+), 177 deletions(-)

--
2.25.1
