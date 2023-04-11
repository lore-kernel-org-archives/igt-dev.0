Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDF210E5B5
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 16:16:18 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Apr 2023 19:15:52 +0300
Message-Id: <20230411161555.10001-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
References: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 7/9] tests/kms_color: Dump the CTM
 before/after color values
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Include the before/after color values in the debug output
to help with diagnosing failures.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 35083122dfbf..1ec097953c9d 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -511,6 +511,14 @@ static bool test_pipe_ctm(data_t *data,
 		set_gamma(data, primary->pipe, gamma_linear);
 	}
 
+	igt_debug("color before[0] %f,%f,%f\n", before[0].r, before[0].g, before[0].b);
+	igt_debug("color before[1] %f,%f,%f\n", before[1].r, before[1].g, before[1].b);
+	igt_debug("color before[2] %f,%f,%f\n", before[2].r, before[2].g, before[2].b);
+
+	igt_debug("color after[0] %f,%f,%f\n", after[0].r, after[0].g, after[0].b);
+	igt_debug("color after[1] %f,%f,%f\n", after[1].r, after[1].g, after[1].b);
+	igt_debug("color after[2] %f,%f,%f\n", after[2].r, after[2].g, after[2].b);
+
 	disable_ctm(primary->pipe);
 	igt_display_commit(&data->display);
 
-- 
2.39.2
