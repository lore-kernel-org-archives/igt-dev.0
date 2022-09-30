Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B9910EB53
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 05:38:00 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Sep 2022 11:02:27 +0530
Message-Id: <20220930053229.9755-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] tests/kms_writeback: Test cleanup
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

*** BLURB HERE ***

Nidhi Gupta (1):
  tests/kms_writeback: Test cleanup

Zbigniew Kempczyński (1):
  lib/intel_memory_region: Remove function which returns batch size in
    regions

 lib/i915/intel_memory_region.c | 14 ---------
 lib/i915/intel_memory_region.h |  1 -
 tests/kms_writeback.c          | 52 ++++++++++------------------------
 3 files changed, 15 insertions(+), 52 deletions(-)

-- 
2.36.0
