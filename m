Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558946E47E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Sep 2021 11:25:55 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Tue, 14 Sep 2021 16:55:59 +0530
Message-Id: <20210914112559.556898-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_color_chamelium: Skip CTM test if
 property is not present
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, Uma Shankar <uma.shankar@intel.com>, Swati Sharma <swati2.sharma@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CRTC property "CTM" is required for all CTM tests.

Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_chamelium.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index bc4356bfa..7173bc69e 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -398,6 +398,8 @@ static void test_pipe_limited_range_ctm(data_t *data,
 	struct chamelium_port *port;
 	char *connected_ports[4];
 
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
+
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
 
-- 
2.32.0
