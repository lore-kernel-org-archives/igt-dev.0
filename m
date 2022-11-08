Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAE310E3CC
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 10:07:42 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Nov 2022 12:07:30 +0200
Message-Id: <20221108100733.2378106-3-petri.latvala@intel.com>
In-Reply-To: <20221108100733.2378106-1-petri.latvala@intel.com>
References: <20221108100733.2378106-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/6] runner: Continue using socket comms
 when getting an invalid packet
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

If a packet of invalid size is received, inject a message in the dump,
override result to warn, and continue grabbing packets.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 7fa932ac..c5f03614 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1082,10 +1082,21 @@ static int monitor_output(pid_t child,
 
 				packet = (struct runnerpacket *)buf;
 				if (s < sizeof(*packet) || s != packet->size) {
+					struct runnerpacket *message, *override;
+
 					errf("Socket communication error: Received %zd bytes, expected %zd\n",
 					     s, s >= sizeof(packet->size) ? packet->size : sizeof(*packet));
-					close(socketfd);
-					socketfd = -1;
+					message = runnerpacket_log(STDOUT_FILENO,
+								   "\nrunner: Socket communication error, invalid packet size. "
+								   "Packet is discarded, test result and logs might be incorrect.\n");
+					write_packet_with_canary(outputs[_F_SOCKET], message, false);
+					free(message);
+
+					override = runnerpacket_resultoverride("warn");
+					write_packet_with_canary(outputs[_F_SOCKET], override, settings->sync);
+					free(override);
+
+					/* Continue using socket comms, hope for the best. */
 					goto socket_end;
 				}
 
-- 
2.30.2
