Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F12C11360C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:39 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:49 +0300
Message-Id: <20220614233100.13834-13-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 12/23] tools/intel_vbt_decode: Parse the new
 eDP max link rate
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

VBT version 244 onwards have a new eDP max link rate field.
Parse it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index deaae9130b65..cc9dd929db66 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1115,6 +1115,13 @@ static void dump_edp(struct context *context,
 			printf("\t\teDP fast link training data rate: %g Gbps (0x%02x)\n",
 			       rate / 5000.0f, rate);
 		}
+
+		if (context->bdb->version >= 244) {
+			u16 rate = edp->edp_max_port_link_rate[i];
+
+			printf("\t\teDP max port link rate: %g Gbps (0x%02x)\n",
+			       rate / 5000.0f, rate);
+		}
 	}
 }
 
-- 
2.35.1
