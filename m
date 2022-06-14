Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512511135EE
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:10 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:39 +0300
Message-Id: <20220614233100.13834-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/23] tools/intel_vbt_decode: Decode more
 DVO ports
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

Decode the DP/HDMI DVO ports up to 'I'.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 2419ee10bca9..aff212a97399 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -379,6 +379,11 @@ static const char *dvo_port_names[] = {
 	[DVO_PORT_HDMIB] = "HDMI-B",
 	[DVO_PORT_HDMIC] = "HDMI-C",
 	[DVO_PORT_HDMID] = "HDMI-D",
+	[DVO_PORT_HDMIE] = "HDMI-E",
+	[DVO_PORT_HDMIF] = "HDMI-F",
+	[DVO_PORT_HDMIG] = "HDMI-G",
+	[DVO_PORT_HDMIH] = "HDMI-H",
+	[DVO_PORT_HDMII] = "HDMI-I",
 	[DVO_PORT_LVDS] = "LVDS",
 	[DVO_PORT_TV] = "TV",
 	[DVO_PORT_CRT] = "CRT",
@@ -387,7 +392,10 @@ static const char *dvo_port_names[] = {
 	[DVO_PORT_DPD] = "DP-D",
 	[DVO_PORT_DPA] = "DP-A",
 	[DVO_PORT_DPE] = "DP-E",
-	[DVO_PORT_HDMIE] = "HDMI-E",
+	[DVO_PORT_DPF] = "DP-F",
+	[DVO_PORT_DPG] = "DP-G",
+	[DVO_PORT_DPH] = "DP-H",
+	[DVO_PORT_DPI] = "DP-I",
 	[DVO_PORT_MIPIA] = "MIPI-A",
 	[DVO_PORT_MIPIB] = "MIPI-B",
 	[DVO_PORT_MIPIC] = "MIPI-C",
-- 
2.35.1
