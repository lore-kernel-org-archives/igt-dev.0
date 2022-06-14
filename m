Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3C81135F5
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:12 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:40 +0300
Message-Id: <20220614233100.13834-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 03/23] tools/intel_vbt_decode: Decode mode
 HDMI data rates
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

Decode new HDMI data rates.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index aff212a97399..c626f0e94659 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -430,6 +430,9 @@ static void dump_hmdi_max_data_rate(uint8_t hdmi_max_data_rate)
 		[HDMI_MAX_DATA_RATE_PLATFORM] = 0,
 		[HDMI_MAX_DATA_RATE_297] = 297,
 		[HDMI_MAX_DATA_RATE_165] = 165,
+		[HDMI_MAX_DATA_RATE_594] = 594,
+		[HDMI_MAX_DATA_RATE_340] = 340,
+		[HDMI_MAX_DATA_RATE_300] = 300,
 	};
 
 	if (hdmi_max_data_rate >= ARRAY_SIZE(max_data_rate))
-- 
2.35.1
