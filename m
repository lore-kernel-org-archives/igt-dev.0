Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E9310E3C3
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 12:35:19 +0000 (UTC)
From: Nemesa Garg <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Sep 2023 18:02:22 +0530
Message-Id: <20230926123224.514543-1-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/kms_rmfb: Add check for xe driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nemesa Garg <nemesa.garg@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

v2: Add Hax file(Swati)

Nemesa Garg (2):
  tests/kms_rmfb: Add check for xe driver
  HAX: Add rmfb test to ffb

 lib/drmtest.c                            | 2 +-
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1
