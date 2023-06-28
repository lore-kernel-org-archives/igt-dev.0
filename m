Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED2D10E0F3
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 11:27:06 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 16:56:19 +0530
Message-Id: <20230628112621.4084988-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] vram d3cold threshold test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adding vram_d3cold_threshold subtest.
Also adding support to disbale all crtc to avoid d3 test
failures.

Anshuman Gupta (2):
  tests/xe_pm : Add support to disable all crtc
  test/xe_pm: Add vram_d3cold_threshold subtest

 tests/xe/xe_pm.c | 100 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

-- 
2.25.1
