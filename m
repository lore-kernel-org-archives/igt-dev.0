Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2905818BB5D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 05:33:12 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Jul 2022 08:31:44 +0300
Message-Id: <20220726053144.703746-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] runner: sync writes to aborted.txt
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

We have a couple of cases of aborted.txt existing but empty, try to
hunt down the cause.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 runner/executor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/runner/executor.c b/runner/executor.c
index 6e6ca9cc..a104e52d 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1668,6 +1668,7 @@ static void write_abort_file(int resdirfd,
 		dprintf(abortfd, "Previous test: %s\n", testbefore);
 		dprintf(abortfd, "Next test: %s\n\n", testafter);
 		write(abortfd, reason, strlen(reason));
+		fdatasync(abortfd);
 		close(abortfd);
 	}
 }
-- 
2.30.2
