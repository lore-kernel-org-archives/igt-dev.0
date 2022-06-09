Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAFC11AD7C
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jun 2022 17:05:25 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 9 Jun 2022 10:05:14 -0700
Message-ID: <20220609170514.138-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2] lib/igt_debugfs: Add IGT_CRC_SOURCE
 environmental variable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: quic_aravindh@quicinc.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adds support for the IGT_CRC_SOURCE environmental variable to make it
easier for drivers to run tests using custom CRC sources.

Example usage:
	`IGT_CRC_SOURCE=intf ./kms_pipe_crc_basic`

If the IGT_CRC_SOURCE isn't set, use the original source that was passed
in as a parameter to pipe_crc_new().

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 lib/igt_debugfs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 7e7ccf22c455..f9404acc3942 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -719,9 +719,15 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
 	igt_pipe_crc_t *pipe_crc;
 	char buf[128];
 	int debugfs;
+	char *env_source;
 
 	igt_assert(source);
 
+	env_source = getenv("IGT_CRC_SOURCE");
+
+	if (!env_source)
+		env_source = source;
+
 	debugfs = igt_debugfs_dir(fd);
 	igt_assert(debugfs != -1);
 
@@ -736,7 +742,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
 	pipe_crc->fd = fd;
 	pipe_crc->dir = debugfs;
 	pipe_crc->pipe = pipe;
-	pipe_crc->source = strdup(source);
+	pipe_crc->source = strdup(env_source);
 	igt_assert(pipe_crc->source);
 	pipe_crc->flags = flags;
 
-- 
2.31.0
