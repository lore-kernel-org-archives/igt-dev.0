Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033DA6E85A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2020 12:58:43 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 25 Mar 2020 12:58:23 +0000
Message-Id: <20200325125823.240720-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200325123318.240545-1-chris@chris-wilson.co.uk>
References: <20200325123318.240545-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] runner: Only show the kmsg overflow
 message once
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

Instead of repeating every single time we overflow the read from kmsg,
just once per test is enough warning.

v2: Just suppress the multiple s/underflow/overflow/ messages. Having a
buffer smaller than a single kmsg packet is unlikely.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 runner/executor.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index a56cb5d66..d72a59376 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -549,6 +549,7 @@ static int dump_dmesg(int kmsgfd, int outfd)
 	int comparefd;
 	unsigned flags;
 	unsigned long long seq, cmpseq, usec;
+	bool underflow_once = false;
 	char cont;
 	char buf[2048];
 	ssize_t r;
@@ -586,7 +587,10 @@ static int dump_dmesg(int kmsgfd, int outfd)
 		r = read(kmsgfd, buf, sizeof(buf));
 		if (r < 0) {
 			if (errno == EPIPE) {
-				errf("Warning: kernel log ringbuffer underflow, some records lost.\n");
+				if (!underflow_once) {
+					errf("Warning: kernel log ringbuffer underflow, some records lost.\n");
+					underflow_once = true;
+				}
 				continue;
 			} else if (errno == EINVAL) {
 				errf("Warning: Buffer too small for kernel log record, record lost.\n");
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
