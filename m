Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289636EBE4
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 10:56:59 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 10 Feb 2020 12:56:53 +0200
Message-Id: <20200210105653.20323-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Print an error message if resume
 fails to load data
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
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

If metadata.txt or other vital data files are missing from a
results-directory, igt_resume silently exited. Print an error message
to the user so it's somewhat clear why we didn't resume the
execution.

Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/69
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/resume.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/runner/resume.c b/runner/resume.c
index d5a20e80..08129ffb 100644
--- a/runner/resume.c
+++ b/runner/resume.c
@@ -32,10 +32,12 @@ int main(int argc, char **argv)
 	}
 
 	if (!initialize_execute_state_from_resume(dirfd, &state, &settings, &job_list)) {
+		fprintf(stderr, "Failure reading data from %s\n", argv[1]);
 		return 1;
 	}
 
 	if (!execute(&state, &settings, &job_list)) {
+		fprintf(stderr, "Executing tests failed, stopping.\n");
 		exitcode = 1;
 	}
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
