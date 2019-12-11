Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78ACD89FE6
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 01:01:09 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:19 -0800
Message-Id: <20191211005235.67897-14-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 13/29] lib/igt_core: skip oom_adjustments on
 non-Linux platforms
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

oom_adjustments are available only on Linux. Omit the body of
oom_adjust_for_doom on other platforms and just accept whatever
default out-of-memory handling we get.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/igt_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 09d8c159..8df89905 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -672,6 +672,7 @@ static void print_usage(const char *help_str, bool output_on_stderr)
 
 static void oom_adjust_for_doom(void)
 {
+#if defined(__linux__)
 	int fd;
 	const char always_kill[] = "1000";
 
@@ -679,7 +680,7 @@ static void oom_adjust_for_doom(void)
 	igt_assert(fd != -1);
 	igt_assert(write(fd, always_kill, sizeof(always_kill)) == sizeof(always_kill));
 	close(fd);
-
+#endif
 }
 
 /**
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
