Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A48BCC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 12:24:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F5210E131;
	Thu, 15 Oct 2026 12:24:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC13610E131
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792066997; x=1823602997;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Hqv9xTulCcKleEgc0dNTD2ETYjfUf6IjJgNNUdTF3k4=;
 b=ZXX4KB/jQhi78yyN6xlHoRzGR3Jw4fHGO7Q3Ma74mxTImtZ9A8beLTWV
 tiBGaYTj5J54a0mD2FBSbYrQijnNvnpADZxENjyNz5M5vxx3A24ZOwyCg
 vVaIo79Hy5dJ4JqT6nG9Go2bgHkbFUQ3dozPAkFARtLzw6dA8lDJaMpN+
 F+yGlSr7ZmWS8FzU4qB6L7BWMaI/ZhDcpAFnhnWJ5grt66fAP7hf2KnR3
 xS65lUD4IykTtlVYiVeQi3UugUqC6fHmMevaFUiJxBxUTgUoeEDdryC4s
 5EQOTjfgogqCQzgsfjcP7D4g2B8sBiX26BEbVFX5jT0GGfKq9CjFYjyPN g==;
X-CSE-ConnectionGUID: N2J3/rC3QHyMxcm4TX6odw==
X-CSE-MsgGUID: 2bHGPuGbQu2lb+IXdF40jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="937035"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="937035"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 05:23:17 -0700
X-CSE-ConnectionGUID: UiGhFbTlR0iLUNySoBfqKA==
X-CSE-MsgGUID: nnrG5xW7T+iYUk6SoEupGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2118606"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 05:23:16 -0700
Date: Thu, 15 Oct 2026 14:22:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org,
	Daniel Charles <daniel.charles@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] lib/igt_aux: Call pw-reserve with execlp()
Message-ID: <20261015122253.ssylo3abb4xaoqqj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 igt-dev@lists.freedesktop.org,
 Daniel Charles <daniel.charles@intel.com>
References: <20261013-stop-pw-reserve-v2-0-58f268cb4f06@intel.com>
 <20261013-stop-pw-reserve-v2-2-58f268cb4f06@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013-stop-pw-reserve-v2-2-58f268cb4f06@intel.com>
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

Hi Gustavo,
On 2026-10-13 at 19:23:36 -0300, Gustavo Sousa wrote:
> The pw-reserve process is being created with system() and that makes
> it a child of the shell spawned by system() rather than the current
> IGT test.
> 
> In that configuration, the pw-reserve process is outliving the shell
> process (i.e. pw_reserve_proc) when the latter is terminated, and that
> makes every call to igt_always_unload_audio_driver() leave an
> unfinished pw-reserve process, which leads to resource leak and makes
> the audio device reserved indefinitely.
> 
> After running a bunch of tests that unbind/remove the xe driver, we
> can see the following in a Ubuntu 24.04 system:
> 
>     $ pgrep -a pw
>     3377 pw-reserve -n Audio0 -r
>     3485 pw-reserve -n Audio0 -r
>     3596 pw-reserve -n Audio0 -r
>     3683 pw-reserve -n Audio0 -r
>     3766 pw-reserve -n Audio0 -r
>     3854 pw-reserve -n Audio0 -r
>     3935 pw-reserve -n Audio0 -r
>     4018 pw-reserve -n Audio0 -r
>     4100 pw-reserve -n Audio0 -r
>     4180 pw-reserve -n Audio0 -r
> 
> If one such test is run as part of a testlist with igt_runner, the
> test will succeed, but igt_runner will either wait forever on the
> test's stdout/stderr or timeout (depending on how igt_runner was
> called), because the pw-reserve process inherits the respective file
> descriptors. Example:
> 
>     $ (sleep 40 && pkill -e pw-reserve &) && sudo ./build/runner/igt_runner -lverbose -o --per-test-timeout 20 -t '^igt@xe_module_load@reload$' build/tests results
>     [3020.365819] [1/1] xe_module_load (reload)
>     [3020.382592] Starting subtest: reload
>     [3030.703752] Subtest reload: SUCCESS (10.321s)
>     [3040.946971] Per-test timeout exceeded. Killing the current test with SIGQUIT.
>     pw-reserve killed (pid 19306)
>                                  [3056.992759] Closing watchdogs
>     Quit
> 
> In the output above, we can see that igt_runner only finishes after we
> kill pw-reserve ourselves.
> 
> Let's fix that by making sure that pw_reserve_proc really represents
> the pw-reserve process: use execlp() to replace the fork child instead
> of calling system().
> 
> Here is the same example above with this fix in place:
> 
>     $ (sleep 40 && pkill -e pw-reserve &) && sudo ./build/runner/igt_runner -lverbose -o --per-test-timeout 20 -t '^igt@xe_module_load@reload$' build/tests results
>     [3137.159710] [1/1] xe_module_load (reload)
>     [3137.184542] Starting subtest: reload
>     [3146.901525] Subtest reload: SUCCESS (9.717s)
>     [3146.905841] Closing watchdogs
>     results: parsing output: 0/ for test: xe_module_load
>     Done.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Applied, thanks!


Regards,
Kamil

> ---
>  lib/igt_aux.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index dbb90756babc..18053db8ff46 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1898,13 +1898,10 @@ static void pipewire_reserve_wait(void)
>  		setenv("HOME", homedir, 1);
>  		setenv("XDG_RUNTIME_DIR",xdg_dir, 1);
>  
> -		/*
> -		 * pw-reserve will run in background. It will only exit when
> -		 * igt_kill_children() is called later on. So, it shouldn't
> -		 * call igt_waitchildren(). Instead, just exit with the return
> -		 * code from pw-reserve.
> -		 */
> -		exit(system("pw-reserve -n Audio0 -r"));
> +		if (execlp("pw-reserve", "pw-reserve", "-n", "Audio0", "-r", NULL)) {
> +			igt_warn("Failed to start pw-reserve: %s\n", strerror(errno));
> +			exit(1);
> +		}
>  	}
>  }
>  
> 
> -- 
> 2.55.0
> 
