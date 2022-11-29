Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FB510E255
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 08:47:51 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Nov 2022 10:47:10 +0200
Message-Id: <20221129084710.1151876-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tools/intel_vbt_decode: decode VBT MIPI
 sequence v4 native flag
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jani.nikula@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

MIPI sequence v4 has a flag for native/non-native GPIO.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_decode.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index a63bfdda142a..94a910b5c107 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2049,8 +2049,12 @@ static const uint8_t *mipi_dump_gpio(const uint8_t *data, uint8_t seq_version)
 		number = *data++;
 		flags = *data++;
 
-		printf("\t\t\tGPIO index %u, number %u, set %d (0x%02x)\n",
-		       index, number, flags & 1, flags);
+		if (seq_version >= 4)
+			printf("\t\t\tGPIO index %u, number %u, native %d, set %d (0x%02x)\n",
+			       index, number, !(flags & 2), flags & 1, flags);
+		else
+			printf("\t\t\tGPIO index %u, number %u, set %d (0x%02x)\n",
+			       index, number, flags & 1, flags);
 	} else {
 		index = *data++;
 		flags = *data++;
-- 
2.34.1
