Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4C610F661
 for <igt-dev@lists.freedesktop.org>; Fri, 13 May 2022 04:40:28 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 May 2022 09:38:30 +0530
Message-Id: <20220513040830.30939-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_invalid_mode: Skip clock-too-high
 subtest on DSC panel
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

Max clock limit calculation isn't valid with DSC.
Skip the test on DSC panels.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_invalid_mode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index bb92a94e..cf011a17 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -73,6 +73,8 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
 	int max_dotclock = data->max_dotclock;
 
 	igt_require(max_dotclock != 0);
+	igt_require(!igt_is_dsc_supported(data->drm_fd,
+					  data->output->config.connector));
 
 	/*
 	 * FIXME When we have a fixed mode, the kernel will ignore
-- 
2.22.0
