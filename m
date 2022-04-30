Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557A810E1BD
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 10:08:31 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 30 Apr 2022 07:13:47 +0530
Message-Id: <20220430014347.94210-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_lease: Terminate lease on bad
 connector id
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

igt_skip_on make resource busy for sub sequence tests.
To avoid this terminate the lease on bad connector id.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 29a774ae8..03538cf8c 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -682,6 +682,10 @@ static void lease_unleased_connector(data_t *data)
 			bad_connector_id = data->master.display.outputs[o].id;
 	}
 
+	/* Terminate lease on bad connector id before skip. */
+	if (bad_connector_id == 0)
+		terminate_lease(&lease);
+
 	/* Give up if there isn't another connector */
 	igt_skip_on(bad_connector_id == 0);
 
-- 
2.25.1
