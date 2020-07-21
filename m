Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647586E1B2
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2020 09:13:08 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 21 Jul 2020 12:12:53 +0300
Message-Id: <20200721091254.30072-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] runner: Use exitcode 127 when resume is
 impossible
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

igt_resume is typically used in a scripted loop, with automatic
reboots and retries. It already uses separate exit codes for being
done (0), requiring a reboot and a retry (1) and requiring a retry due
to exceeding its overall time quota (2). Introduce another exit code,
127, for circumstances where execution in the given directory is
impossible and retrying would never terminate. One example case is
a kernel bug causing the filesystem to go enough bonkers to make the
runner settings files disappear.

As a drive-by improvement, also print something when that happens.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/resume.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/runner/resume.c b/runner/resume.c
index d5a20e80..f5d69e21 100644
--- a/runner/resume.c
+++ b/runner/resume.c
@@ -28,11 +28,12 @@ int main(int argc, char **argv)
 
 	if ((dirfd = open(argv[1], O_RDONLY | O_DIRECTORY)) < 0) {
 		fprintf(stderr, "Failure opening %s: %s\n", argv[1], strerror(errno));
-		return 1;
+		return 127;
 	}
 
 	if (!initialize_execute_state_from_resume(dirfd, &state, &settings, &job_list)) {
-		return 1;
+		fprintf(stderr, "Failure reading metadata in %s\n", argv[1]);
+		return 127;
 	}
 
 	if (!execute(&state, &settings, &job_list)) {
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
