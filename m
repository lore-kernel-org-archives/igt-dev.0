Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A61C6E1F6
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2020 04:53:00 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu,  2 Jul 2020 10:23:07 +0530
Message-Id: <20200702045307.19202-10-mohammed.khajapasha@intel.com>
In-Reply-To: <20200702045307.19202-1-mohammed.khajapasha@intel.com>
References: <20200702045307.19202-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 9/9] i915/gem_eio: Set modeset for enable
 pipes
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
To: arkadiusz.hiler@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Set modeset for enable pipes only in kms test

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/i915/gem_eio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index cfc3f668..c5ef61bd 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -851,6 +851,8 @@ static void display_helper(igt_display_t *dpy, int *done)
 		int pipe;
 
 		pipe = rand() % dpy->n_pipes;
+		if (!dpy->pipes[pipe].enabled)
+			continue;
 		output = igt_get_single_output_for_pipe(dpy, pipe);
 		if (!output)
 			continue;
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
