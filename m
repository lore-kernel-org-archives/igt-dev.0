Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1774110E774
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 17:02:03 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 18:01:54 +0100
Message-Id: <20231206170156.23120-1-marcin.bernatowicz@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v6 i-g-t 0/2] add create-big-vram subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: adam.miszczak@intel.com, matthew.auld@intel.com,
 jakub1.kolakowski@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Validate the creation of significant Buffer Object (BO) within VRAM,
considering the entire available CPU-visible VRAM size.

Marcin Bernatowicz (2):
  lib/xe/xe_query: xe_visible_available_vram_size helper
  tests/intel/xe_create: create-big-vram subtest

 lib/xe/xe_query.c          | 58 ++++++++++++++++++-------
 lib/xe/xe_query.h          |  3 +-
 tests/intel/xe_create.c    | 86 +++++++++++++++++++++++++++++++++++++-
 tests/intel/xe_evict_ccs.c |  2 +-
 4 files changed, 132 insertions(+), 17 deletions(-)

-- 
2.31.1
