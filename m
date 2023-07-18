Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FAB10E312
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jul 2023 11:09:11 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Jul 2023 16:38:49 +0530
Message-Id: <20230718110852.2965553-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/3] vram d3cold threshold test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adding vram_d3cold_threshold subtest.
Also adding support to disbale all crtc to avoid d3 test
failures.

Anshuman Gupta (2):
  tests/xe_pm : Add support to disable all crtc
  test/xe_pm: Add vram_d3cold_threshold subtest

Bhanuprakash Modem (1):
  lib/igt_kms: Add helper with DPMS to turn on and off the displays

 lib/igt_kms.c    | 36 +++++++++++++++++++
 lib/igt_kms.h    |  3 ++
 tests/xe/xe_pm.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 133 insertions(+)

-- 
2.25.1
