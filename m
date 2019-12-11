Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4636EA31
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:43 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:12 -0800
Message-Id: <20191211005235.67897-7-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 06/29] tools/intel_gpu_top: Use POSIX signal
 handler type definition
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
List-ID: <igt-dev@lists.freedesktop.org>

The type sighandler_t is a GNU extension which isn't available on
FreeBSD, where it instead follows the POSIX specification of a raw
function pointer type.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 tools/intel_gpu_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index cc8db7c5..2ea484cf 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1299,7 +1299,7 @@ int main(int argc, char **argv)
 	}
 
 	if (output_mode != INTERACTIVE) {
-		sighandler_t sig = signal(SIGINT, sigint_handler);
+		void (* sig)(int) = signal(SIGINT, sigint_handler);
 
 		if (sig == SIG_ERR)
 			fprintf(stderr, "Failed to install signal handler!\n");
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
