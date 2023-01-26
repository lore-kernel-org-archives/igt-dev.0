Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB2C10E2BF
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jan 2023 10:57:20 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Jan 2023 12:53:36 +0200
Message-Id: <20230126105338.419418-2-petri.latvala@intel.com>
In-Reply-To: <20230126105338.419418-1-petri.latvala@intel.com>
References: <20230126105338.419418-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] runner: Don't override more results
 than requested
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

When processing a resultoverride packet, the override is supposed to
apply only to the most recent subtest or dynamic subtest. Properly
clear the override so only those results get overridden.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 596de786..b00bb6ba 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1540,6 +1540,9 @@ static bool comms_handle_subtest_start(const struct runnerpacket *packet,
 		/* Subtest starting message is not in logs with socket comms, inject it manually */
 		comms_inject_subtest_start_log(context, STARTING_SUBTEST, helper.subteststart.name);
 
+		free(context->subtestresult);
+		context->subtestresult = NULL;
+
 		break;
 	default:
 		assert(false); /* unreachable */
@@ -1669,6 +1672,9 @@ static bool comms_handle_dynamic_subtest_start(const struct runnerpacket *packet
 		/* Dynamic subtest starting message is not in logs with socket comms, inject it manually */
 		comms_inject_subtest_start_log(context, STARTING_DYNAMIC_SUBTEST, helper.dynamicsubteststart.name);
 
+		free(context->dynamicsubtestresult);
+		context->dynamicsubtestresult = NULL;
+
 		break;
 	default:
 		assert(false); /* unreachable */
-- 
2.30.2
