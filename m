Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49DD11287A
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 07:17:21 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 sai.gowtham.ch@intel.com, Priyanka.Dandamudi@intel.com,
 janga.rahul.kumar@intel.com
Date: Mon,  6 Jun 2022 12:47:35 +0530
Message-Id: <20220606071737.1701633-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] HAX add test description to
 gem_tiled_fence_blits
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add test description to gem_tiled_fence_blits.

Janga Rahul Kumar (2):
  tests/i915/gem_tiled_fence_blits : Added subtests description
  HAX: don't do full run

 tests/i915/gem_tiled_fence_blits.c    |   6 +
 tests/intel-ci/fast-feedback.testlist | 186 +-------------------------
 2 files changed, 7 insertions(+), 185 deletions(-)

-- 
2.25.1
