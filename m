Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3124D10E65B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:31:09 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:29:41 +0300
Message-Id: <20220906122944.8838-15-ville.syrjala@linux.intel.com>
In-Reply-To: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
References: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 14/17] tools/intel_vbt_decode: Adjust DVO
 port printing
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

Dump the DVO port using the more standard form:
"DVO Port: <decoded name> (<raw value>)".

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index f9b2bf0af272..9e14d5a570a7 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -972,7 +972,8 @@ static void dump_child_device(struct context *context,
 	}
 
 	printf("\t\tAIM offset: %d\n", child->addin_offset);
-	printf("\t\tDVO Port: 0x%02x (%s)\n", child->dvo_port, dvo_port(child->dvo_port));
+	printf("\t\tDVO Port: %s (0x%02x)\n",
+	       dvo_port(child->dvo_port), child->dvo_port);
 
 	printf("\t\tAIM I2C pin: 0x%02x\n", child->i2c_pin);
 	printf("\t\tAIM Slave address: 0x%02x\n", child->slave_addr);
-- 
2.35.1
