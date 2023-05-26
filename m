Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F7010E093
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 06:45:55 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 26 May 2023 12:15:18 +0530
Message-Id: <20230526064520.310041-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/kms_cursor_crc: limit test to one
 pipe for sim
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

To reduce execution time in simulation, lets limit test to
one pipe only.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_cursor_crc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 3a353a03..f837dbc4 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -728,6 +728,10 @@ static bool execution_constraint(enum pipe pipe)
 	    pipe != active_pipes[last_pipe])
 		return true;
 
+	if (!extended && igt_run_in_simulation() &&
+	    pipe != active_pipes[0])
+		return true;
+
 	return false;
 }
 
-- 
2.25.1
