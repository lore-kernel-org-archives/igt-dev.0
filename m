Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D68DCC6B0F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 22:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BF410E15E;
	Tue, 13 Oct 2026 22:25:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C738C10E959
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 22:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791930264; x=1823466264;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=o1Hlk1RV3WHM1VzTLbreJg6MQBfl7qI1oa82ewnbHCw=;
 b=n4PRAyj0sLZYmkhCDG/Kj4N0+tFzkLjkL5tXTq+FBhbgMuZURGUPFUjJ
 94rtsGjhaJrcDwlcqUJqEf7jk5f10L3ImiJMD2yWCLaQ4V8YdnhMtr+aZ
 ffipF6FLRHukAEQq1iZ4NhKT7rUwjoNFAWjprzFg6mVAe2eoMx7IOsfNW
 wH4DUNFY4fjuPi1XPfpFGyC5djLwzEANetapkYTMC7hG3NcwsFSqUA7uZ
 Q3/JhxaFIBA7KCrEolch0VOHK7+fq+fsTQeBHIofIxhHTLdXH93JFVRic
 0B186CrGcWG0koHTIwS8/d+UtrGZjZlvUyPoXpBpGvTSdBqYZJTsvnHym A==;
X-CSE-ConnectionGUID: zzB+8xa5Qc6JO7L9Vc0ikg==
X-CSE-MsgGUID: U+yQCRd1QDCngs3bAlgUtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="566024"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="566024"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 15:24:23 -0700
X-CSE-ConnectionGUID: xasSJaRsTjyGTv4EGJyGXQ==
X-CSE-MsgGUID: CljCwwtSRBaUN7DHR2yPlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1713180"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 15:24:22 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 13 Oct 2026 19:23:36 -0300
Subject: [PATCH i-g-t v2 2/2] lib/igt_aux: Call pw-reserve with execlp()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-stop-pw-reserve-v2-2-58f268cb4f06@intel.com>
References: <20261013-stop-pw-reserve-v2-0-58f268cb4f06@intel.com>
In-Reply-To: <20261013-stop-pw-reserve-v2-0-58f268cb4f06@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

The pw-reserve process is being created with system() and that makes
it a child of the shell spawned by system() rather than the current
IGT test.

In that configuration, the pw-reserve process is outliving the shell
process (i.e. pw_reserve_proc) when the latter is terminated, and that
makes every call to igt_always_unload_audio_driver() leave an
unfinished pw-reserve process, which leads to resource leak and makes
the audio device reserved indefinitely.

After running a bunch of tests that unbind/remove the xe driver, we
can see the following in a Ubuntu 24.04 system:

    $ pgrep -a pw
    3377 pw-reserve -n Audio0 -r
    3485 pw-reserve -n Audio0 -r
    3596 pw-reserve -n Audio0 -r
    3683 pw-reserve -n Audio0 -r
    3766 pw-reserve -n Audio0 -r
    3854 pw-reserve -n Audio0 -r
    3935 pw-reserve -n Audio0 -r
    4018 pw-reserve -n Audio0 -r
    4100 pw-reserve -n Audio0 -r
    4180 pw-reserve -n Audio0 -r

If one such test is run as part of a testlist with igt_runner, the
test will succeed, but igt_runner will either wait forever on the
test's stdout/stderr or timeout (depending on how igt_runner was
called), because the pw-reserve process inherits the respective file
descriptors. Example:

    $ (sleep 40 && pkill -e pw-reserve &) && sudo ./build/runner/igt_runner -lverbose -o --per-test-timeout 20 -t '^igt@xe_module_load@reload$' build/tests results
    [3020.365819] [1/1] xe_module_load (reload)
    [3020.382592] Starting subtest: reload
    [3030.703752] Subtest reload: SUCCESS (10.321s)
    [3040.946971] Per-test timeout exceeded. Killing the current test with SIGQUIT.
    pw-reserve killed (pid 19306)
                                 [3056.992759] Closing watchdogs
    Quit

In the output above, we can see that igt_runner only finishes after we
kill pw-reserve ourselves.

Let's fix that by making sure that pw_reserve_proc really represents
the pw-reserve process: use execlp() to replace the fork child instead
of calling system().

Here is the same example above with this fix in place:

    $ (sleep 40 && pkill -e pw-reserve &) && sudo ./build/runner/igt_runner -lverbose -o --per-test-timeout 20 -t '^igt@xe_module_load@reload$' build/tests results
    [3137.159710] [1/1] xe_module_load (reload)
    [3137.184542] Starting subtest: reload
    [3146.901525] Subtest reload: SUCCESS (9.717s)
    [3146.905841] Closing watchdogs
    results: parsing output: 0/ for test: xe_module_load
    Done.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/igt_aux.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index dbb90756babc..18053db8ff46 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -1898,13 +1898,10 @@ static void pipewire_reserve_wait(void)
 		setenv("HOME", homedir, 1);
 		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
 
-		/*
-		 * pw-reserve will run in background. It will only exit when
-		 * igt_kill_children() is called later on. So, it shouldn't
-		 * call igt_waitchildren(). Instead, just exit with the return
-		 * code from pw-reserve.
-		 */
-		exit(system("pw-reserve -n Audio0 -r"));
+		if (execlp("pw-reserve", "pw-reserve", "-n", "Audio0", "-r", NULL)) {
+			igt_warn("Failed to start pw-reserve: %s\n", strerror(errno));
+			exit(1);
+		}
 	}
 }
 

-- 
2.55.0

