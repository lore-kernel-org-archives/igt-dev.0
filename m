Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BAB10E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:26:01 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:19 +0300
Message-Id: <20220715202520.23677-14-ville.syrjala@linux.intel.com>
In-Reply-To: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 13/14] tools/intel_vbt_decode: Adjust DVO
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
index 10db394b3748..de515aa6fd25 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -971,7 +971,8 @@ static void dump_child_device(struct context *context,
 	}
 
 	printf("\t\tAIM offset: %d\n", child->addin_offset);
-	printf("\t\tDVO Port: 0x%02x (%s)\n", child->dvo_port, dvo_port(child->dvo_port));
+	printf("\t\tDVO Port: %s (0x%02x)\n",
+	       dvo_port(child->dvo_port), child->dvo_port);
 
 	printf("\t\tAIM I2C pin: 0x%02x\n", child->i2c_pin);
 	printf("\t\tAIM Slave address: 0x%02x\n", child->slave_addr);
-- 
2.35.1
