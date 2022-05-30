Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D55D10F14F
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 06:39:36 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Date: Mon, 30 May 2022 12:10:10 +0530
Message-Id: <20220530064012.1027500-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] HAX add test description for
 gem_render_tiled_blits
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>

Add test description to gem_render_tiled_blits

Kumar, Janga Rahul (2):
  tests/i915/gem_render_tiled_blits : Added subtests description
  HAX: don't do full run

 tests/i915/gem_render_tiled_blits.c   |  11 +-
 tests/intel-ci/fast-feedback.testlist | 185 +-------------------------
 2 files changed, 11 insertions(+), 185 deletions(-)

-- 
2.25.1
