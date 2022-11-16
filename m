Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D7A10E036
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Nov 2022 11:11:37 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Nov 2022 13:11:40 +0200
Message-Id: <20221116111140.2516606-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] runner: Don't read journal at all if socket
 comms are used
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

When socket communications are used, the journal is left empty. When
processing results, reading an empty journal will add a test result
for the requested test, which can be incorrect when using testlists
with wildcards.

Testlists with wildcards were not the intended use of testlists but
they are used and thus this is considered a fix for a regression.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Nicholas Choi <Nicholas.Choi@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 05c4234e..596de786 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -2119,12 +2119,6 @@ static bool parse_test_directory(int dirfd,
 		return false;
 	}
 
-	/*
-	 * fill_from_journal fills the subtests struct and adds
-	 * timeout results where applicable.
-	 */
-	fill_from_journal(fds[_F_JOURNAL], entry, &subtests, results);
-
 	/*
 	 * Get test output from socket comms if it exists, otherwise
 	 * parse stdout/stderr
@@ -2137,6 +2131,12 @@ static bool parse_test_directory(int dirfd,
 	}
 
 	if (commsparsed == COMMSPARSE_EMPTY) {
+		/*
+		 * fill_from_journal fills the subtests struct and
+		 * adds timeout results where applicable.
+		 */
+		fill_from_journal(fds[_F_JOURNAL], entry, &subtests, results);
+
 		if (!fill_from_output(fds[_F_OUT], entry->binary, "out", &subtests, results->tests) ||
 		    !fill_from_output(fds[_F_ERR], entry->binary, "err", &subtests, results->tests)) {
 			fprintf(stderr, "Error parsing output files (out.txt, err.txt)\n");
-- 
2.30.2
