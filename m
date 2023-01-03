Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE1E10E052
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 13:34:28 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Jan 2023 15:30:49 +0200
Message-Id: <20230103133049.30169-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] chamelium: Ignore errors when fetching
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

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/igt_chamelium.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 79920de1..6506330e 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -2477,7 +2477,7 @@ static bool chamelium_read_port_mappings(struct chamelium *chamelium,
 		}
 
 		port->adapter_allowed = g_key_file_get_boolean(igt_key_file, group,
-		                                               "AdapterAllowed", &error);
+		                                               "AdapterAllowed", NULL);
 
 		for (j = 0;
 		     j < res->count_connectors && !port->connector_id;
-- 
2.30.2
