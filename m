Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5868089DBD
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2020 14:21:51 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 9 Jun 2020 17:21:37 +0300
Message-ID: <20200609142137.203218-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner/resultgen: Explain why json creation
 might have failed
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Sometimes creating the string representation fails. This usually happens
when we have a huge logs (e.g.: something was spamming the dmesg) or the
result generation was run on a very low-end system (e.g. embedded board
with 256 megs of RAM).

Sadly json-c call returns us NULL and provides no explanation
whatsoever. Let's fix a NULL pointer dereference in such cases and print
a mesage that should help people make sense out of what have just
happened.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/resultgen.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index add4aad5..e2e162b0 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1661,6 +1661,19 @@ bool generate_results(int dirfd)
 	}
 
 	json_string = json_object_to_json_string_ext(obj, JSON_C_TO_STRING_PRETTY);
+
+	if (json_string == NULL) {
+		fprintf(stderr, "resultgen: Failed to create json representation of the results.\n");
+		fprintf(stderr, "           This usually means that the results are too big\n");
+		fprintf(stderr, "           to fit in the memory as the text representation\n");
+		fprintf(stderr, "           is being created.\n\n");
+		fprintf(stderr, "           Either something was spamming the logs or your\n");
+		fprintf(stderr, "           system is very low on free mem.\n");
+
+		close(resultsfd);
+		return false;
+	}
+
 	write(resultsfd, json_string, strlen(json_string));
 	close(resultsfd);
 	return true;
-- 
2.25.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
