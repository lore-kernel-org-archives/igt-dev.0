Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151B989B0C
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2020 18:34:19 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed,  3 Jun 2020 21:34:17 +0300
Message-Id: <20200603183417.14626-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: Force reprobe after
 replugging the connector
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

After replugging a connector and the kernel reports the connector as
connected the cached modes returned by drmModeGetConnectorCurrent() (the
kernel's cached list of modes) may be stale. The modes will be only
updated by a full reprobe. Ensure this by setting output->force_reprobe
which will result in calling drmModeGetConnector().

This fixes sporadic test failures due to seeing no modes unexpectedly.
So far things happened to work, because some in-kernel user of the
output - like fbdev - does a full reprobe sometime after the hotplug
event.

Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_chamelium.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index dc1b8d1e3..7d3e06433 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -126,6 +126,7 @@ reprobe_connector(data_t *data, struct chamelium_port *port)
 
 	/* let's make sure that igt_display is up to date too */
 	output = igt_output_from_connector(&data->display, connector);
+	output->force_reprobe = true;
 	igt_output_refresh(output);
 
 	drmModeFreeConnector(connector);
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
