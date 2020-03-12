Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB696E0E3
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 09:59:51 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 12 Mar 2020 11:59:43 +0200
Message-Id: <20200312095944.7477-2-petri.latvala@intel.com>
In-Reply-To: <20200312095944.7477-1-petri.latvala@intel.com>
References: <20200312095944.7477-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] runner: Dump the rest of dmesg also
 when child refuses to die
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

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 runner/executor.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/runner/executor.c b/runner/executor.c
index 28b8a443..790f99db 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1054,6 +1054,10 @@ static int monitor_output(pid_t child,
 						     "but we didn't get informed of its demise...\n");
 				}
 
+				dump_dmesg(kmsgfd, outputs[_F_DMESG]);
+				if (settings->sync)
+					fdatasync(outputs[_F_DMESG]);
+
 				close_watchdogs(settings);
 				free(outbuf);
 				close(outfd);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
