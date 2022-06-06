Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA617112A6D
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 08:47:18 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 sai.gowtham.ch@intel.com, Priyanka.Dandamudi@intel.com
Date: Mon,  6 Jun 2022 14:17:35 +0530
Message-Id: <20220606084737.1707988-1-janga.rahul.kumar@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add test description to gem_render_tiled_blits.

Janga Rahul Kumar (2):
  tests/i915/gem_render_tiled_blits : Added subtests description
  HAX: don't do full run

 tests/i915/gem_render_tiled_blits.c   |  12 +-
 tests/intel-ci/fast-feedback.testlist | 186 +-------------------------
 2 files changed, 12 insertions(+), 186 deletions(-)

-- 
2.25.1
