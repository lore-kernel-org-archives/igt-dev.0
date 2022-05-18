Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D783910E4BD
 for <igt-dev@lists.freedesktop.org>; Wed, 18 May 2022 11:55:18 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 May 2022 14:55:02 +0300
Message-Id: <20220518115505.207813-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Testcases for selective fetch area
 calculation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Mark Pearson <markpearson@lenovo.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patch set is introducing couple of new testcases to stress PSR2
selective fetch are calculation:

1. Updating plane is partially or fully out of visible area
2. Updating plane is using only part of framebuffer.

v2: Fix build error and warning in first patch

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Mark Pearson <markpearson@lenovo.com>
Cc: Petri Latvala <petri.latvala@intel.com>

Jouni Högander (3):
  tests/kms_psr2_sf: Move continuous testcase preparation for new tests
  tests/kms_psr2_sf: Add new move continuous testcases
  tests/i915/kms_psr2_sf: add sel fetch/big fb test

 tests/i915/kms_psr2_sf.c | 341 ++++++++++++++++++++++++++++++---------
 1 file changed, 267 insertions(+), 74 deletions(-)

-- 
2.25.1
