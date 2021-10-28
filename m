Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4646E949
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 10:18:56 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Thu, 28 Oct 2021 12:18:19 +0200
Message-Id: <20211028101819.17967-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20211028101819.17967-1-kamil.konieczny@linux.intel.com>
References: <20211028101819.17967-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/igt_command_line.sh: Check for
 duplicate subtest names
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Petri Latvala <petri.latvala@intel.com>

A test having multiple subtests with the same name is always an error
and a couple of such cases had already crept in. Keep them out.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/igt_command_line.sh | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/igt_command_line.sh b/tests/igt_command_line.sh
index 5356877c..fb8f2e2a 100755
--- a/tests/igt_command_line.sh
+++ b/tests/igt_command_line.sh
@@ -92,6 +92,17 @@ check_test ()
 		echo "    test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!"
 		fail $test
 	fi
+
+	# check for duplicate subtests
+	echo "  Checking subtest uniqueness..."
+	if [ $RET -eq 0 ]; then
+	    DUPLICATES="`./$test --list-subtests | sort | uniq -d`"
+	    if [ -n "$DUPLICATES" ]; then
+		echo "    test has duplicate subtest names!"
+		echo $DUPLICATES
+		fail $test
+	    fi
+	fi
 }
 
 TESTLISTFILE="$tests_dir/test-list.txt"
-- 
2.30.2
