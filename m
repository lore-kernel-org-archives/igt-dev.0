Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A22CCA5FFC
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 14:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD9810F616;
	Wed,  7 Oct 2026 14:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eV3KBt0y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6381410E29C
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791382653; x=1822918653;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=o1Hlk1RV3WHM1VzTLbreJg6MQBfl7qI1oa82ewnbHCw=;
 b=eV3KBt0yg+GIY4mnPUVmMSjqmVohTyXq41KbURrOmrBsmmqlxaxkkua1
 H4qMs6wO3qOTOpugnAq065Xf3sBVdnkzpSRdfchbO3vh9rxO0lcRqMKIu
 DzVDDZNNZFumDXyrRXC2YhxE7S+JBT5iTthFngwDqGt1WwFHSFUwNzKzs
 7WjsXM3noYgJev0EzVGXk/gHmw3IUsu3JAKz9vNBpWGXOFMMUbW7sbzO9
 RfV9CuorLlROstF25daHGscI23HuJg65My/VYpOHmeZaGLNgPSkm0dxRf
 ENBoSXnv9g42jumj+TmpzRmy6HOo+2V3136o0EQIWyXs/lkG5epby5ctE Q==;
X-CSE-ConnectionGUID: luOroR2tREy3Poqkpj5aGw==
X-CSE-MsgGUID: cfsGizvPT/m10zqpjkyFqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="32050"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="32050"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 07:17:33 -0700
X-CSE-ConnectionGUID: eHfXlz9FS+eySCAqJhcdcQ==
X-CSE-MsgGUID: wdmrZ1x5QZKEG58bdRj+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="275233296"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 07:17:32 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 07 Oct 2026 11:16:27 -0300
Subject: [PATCH i-g-t 2/2] lib/igt_aux: Call pw-reserve with execlp()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-stop-pw-reserve-v1-2-abbd3b879612@intel.com>
References: <20261007-stop-pw-reserve-v1-0-abbd3b879612@intel.com>
In-Reply-To: <20261007-stop-pw-reserve-v1-0-abbd3b879612@intel.com>
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

