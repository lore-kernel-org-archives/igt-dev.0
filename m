Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A52C10E514
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 11:48:38 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Fri,  6 May 2022 13:48:25 +0200
Message-Id: <20220506114829.2288273-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
References: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/6] lib/igt_kmod: always fill who when
 unloading audio driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

As we'll use this information at core_hotunplug to announce
when an audio module is unloaded, fill it even if return code
is zero.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_aux.c  | 2 +-
 lib/igt_kmod.c | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index f56b5a06f100..0d90ebb5b6ec 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1422,7 +1422,7 @@ static void pulseaudio_unload_module(proc_t *proc_info)
 		homedir = pw->pw_dir;
 		snprintf(xdg_dir, sizeof(xdg_dir), "/run/user/%d", proc_info->euid);
 
-		igt_info("Ask pulseaudio to stop using audio device\n");
+		igt_info("Request pulseaudio to stop using audio device\n");
 
 		setgid(proc_info->egid);
 		setuid(proc_info->euid);
diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 133d19048a9b..d282be70f102 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -400,16 +400,15 @@ int igt_audio_driver_unload(const char **who)
 
 	for (const char **m = sound; *m; m++) {
 		if (igt_kmod_is_loaded(*m)) {
+			if (who)
+				*who = *m;
 			if (igt_lsof_kill_audio_processes())
 				return EACCES;
 
 			kick_snd_hda_intel();
 			ret = igt_kmod_unload(*m, 0);
-			if (ret) {
-				if (who)
-					*who = *m;
+			if (ret)
 				return ret;
-			}
 		}
 	}
 	return 0;
-- 
2.35.1
