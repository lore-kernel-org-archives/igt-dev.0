Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6786110E1DE
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 13:13:52 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 15:10:19 +0200
Message-Id: <20230104131019.47645-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] chamelium: Handle errors when fetching
 AdapterAllowed
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Not setting AdapterAllowed in .igtrc should be considered a valid
configuration. The default value of 'false' from
g_key_file_get_boolean when the field is missing is exactly what we
want to use, and storing the missing field error in the 'error'
variable leads to an error such as

(kms_chamelium:1713) igt_chamelium-WARNING: Failed to read chamelium port ID for DP-3: Key file does not have key “AdapterAllowed” in group “Chamelium:HDMI-A-2”

v2: Check if the field exists first to get syntax validation
    happening, handle the error accordingly by bailing out (Ryszard)

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/igt_chamelium.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 79920de1..a235f3c8 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2476,8 +2476,15 @@ static bool chamelium_read_port_mappings(struct chamelium *chamelium,
 			goto out;
 		}
 
-		port->adapter_allowed = g_key_file_get_boolean(igt_key_file, group,
-		                                               "AdapterAllowed", &error);
+		if (g_key_file_has_key(igt_key_file, group, "AdapterAllowed", NULL)) {
+			port->adapter_allowed = g_key_file_get_boolean(igt_key_file, group,
+								       "AdapterAllowed", &error);
+			if (error) {
+				igt_warn("Unable to read AdapterAllowed: %s\n", error->message);
+				ret = false;
+				goto out;
+			}
+		}
 
 		for (j = 0;
 		     j < res->count_connectors && !port->connector_id;
-- 
2.30.2
