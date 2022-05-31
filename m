Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF31C10F6F7
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 22:14:54 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, sai.gowtham.ch@intel.com,
 Priyanka.Dandamudi@intel.com
Date: Wed,  1 Jun 2022 03:45:24 +0530
Message-Id: <20220531221526.1192064-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] HAX add test description for gem_tiled_blits
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

Add test description for gem_tiled_blits.

Janga Rahul Kumar (2):
  tests/i915/gem_tiled_blits : Added subtests description
  HAX: don't do full run

 tests/i915/gem_tiled_blits.c          |   3 +
 tests/intel-ci/fast-feedback.testlist | 185 +-------------------------
 2 files changed, 4 insertions(+), 184 deletions(-)

-- 
2.25.1
