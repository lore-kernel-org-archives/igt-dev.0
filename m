Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F76910E0C2
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 11:33:32 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:02:45 +0530
Message-Id: <20230627113250.669971-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Misc. dsc updates
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

Misc. dsc changes are incorporated in this series.

Swati Sharma (5):
  tests/i915/kms_dsc: add new test flag
  tests/i915/kms_dsc: use uint32_t test flag
  tests/i915/kms_dsc: use #define for default bpc
  tests/i915/kms_dsc: add get_status()
  tests/i915/kms_dsc: add subtest

 tests/i915/kms_dsc.c | 78 ++++++++++++++++++++++++++++++--------------
 1 file changed, 54 insertions(+), 24 deletions(-)

-- 
2.25.1
