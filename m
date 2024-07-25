Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85195C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 16:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E75B10E22E;
	Thu, 25 Jul 2024 16:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/px295N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E900C10E22E
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721924248; x=1753460248;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XMc86vB2lqpz4XJvmVr9YFDFQufkDM6/pXZbZ+pLots=;
 b=e/px295NDtaSHy3En2W/AyroUY5a1Z6iVXtG1BasF5pDvTaKMTSjX7g/
 l8boy27df0RqpNHHRAr0sneYvj5XO3+kVJpXKRYn3NiN1cSvjqXZooJqb
 VSJsgRGs7dpxRh/9jnH0Qq3vt2KOfswLcIKFOpPJyMWeYxMibFLRXo1Il
 ynkqWvhfgg3AMsxm8OXyYyCb5dfKbPR/g0OVdj7uQISd5b4o2vdmZ5fMD
 jLy3SunLxZrdT/t5pek2trle/24WaPfW629D/gyt3+Vu9hN9GMuMrD+1D
 fm5kdb0kARaMhjE6BkTMUacJGAavUKQmT9htlMgXfE1mYAmQE1D5q8KOM w==;
X-CSE-ConnectionGUID: 9pS9LYsrRISNhRNAGxpgvw==
X-CSE-MsgGUID: njcKKSfPTViPuOT+7NFI8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19830614"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="19830614"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 09:17:27 -0700
X-CSE-ConnectionGUID: yDgG7r7GRyC5xuuaUSWaSA==
X-CSE-MsgGUID: VSHy+XYNTmChZZ7hz0nzJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="76198152"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 09:17:27 -0700
Date: Thu, 25 Jul 2024 18:17:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org, Emil Velikov <emil.l.velikov@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH i-g-t] tests/core_setmaster: Change break to continue in
 tweak_perm function
Message-ID: <20240725161723.fxtreg35ygq7z6td@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 igt-dev@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20240725054311.1420162-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240725054311.1420162-1-krishnaiah.bommu@intel.com>
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

Hi Bommu,
On 2024-07-25 at 11:13:11 +0530, Bommu Krishnaiah wrote:
> Existing userspace assumes there's no gaps card’s, but I see cards
> are not continues, after running “gta@core_hotunplug I am not seeing card0,
> hence test is failing.
> 
> Test result before this changes:
> root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools#

Drop this line.

> root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools# cat /sys/class/drm/
s/cat/ls/ and also make it shorter:
s!root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools!!

so resulting line will be:

# ls /sys/class/drm/

> card0/      renderD128/ version
> root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools# ./core_setmaster --r master-drop-set-user

Write only a sequence to replicate a bug, like:

# ./core_setmaster --r master-drop-set-user
 Subtest master-drop-set-user: SUCCESS (0.066s)
# ./core_hotunplug --r hotrebind-lateclose
 Subtest hotrebind-lateclose: SUCCESS (2.721s)
# ls /sys/class/drm/
 card1/      renderD129/ version
# ./core_setmaster --r master-drop-set-user

and here cite an error report. Also write which driver
it was (i915 or Xe).

Regards,
Kamil

> IGT-Version: 1.28-NO-GIT (x86_64) (Linux: 6.10.0-rc7-xe x86_64)
> Using IGT_SRANDOM=1721882790 for randomisation
> Starting subtest: master-drop-set-user
> Opened device: /dev/dri/card0
> Subtest master-drop-set-user: SUCCESS (0.066s)
> root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools#
> root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools# ./core_hotunplug --r hotrebind-lateclose
> IGT-Version: 1.28-NO-GIT (x86_64) (Linux: 6.10.0-rc7-xe x86_64)
> Using IGT_SRANDOM=1721882819 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: hotrebind-lateclose
> Opened device: /dev/dri/renderD128
> Unloaded audio driver snd_hda_intel
> Realoading snd_hda_intel
> Opened device: /dev/dri/card1
> Opened device: /dev/dri/renderD129
> Subtest hotrebind-lateclose: SUCCESS (2.721s)
> root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools#
> root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools#
> root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools#
> root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools# cat /sys/class/drm/
> card1/      renderD129/ version
> root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools# ./core_setmaster --r master-drop-set-user
> IGT-Version: 1.28-NO-GIT (x86_64) (Linux: 6.10.0-rc7-xe x86_64)
> Using IGT_SRANDOM=1721882840 for randomisation
> Starting subtest: master-drop-set-user
> (core_setmaster:4366) CRITICAL: Test assertion failure function check_drop_set, file ../tests/core_setmaster.c:85:
> (core_setmaster:4366) CRITICAL: Failed assertion: master != -1
> (core_setmaster:4366) CRITICAL: Last errno: 2, No such file or directory
> (core_setmaster:4366) CRITICAL: error: -1 == -1
> Stack trace:
>   #0 [__igt_fail_assert+0x10a]
>   #1 [check_drop_set+0x70]
>   #2 [__igt_unique____real_main145+0x355]
>   #3 [main+0x2d]
>   #4 [__libc_init_first+0x90]
>   #5 [__libc_start_main+0x80]
>   #6 [_start+0x2e]
> child 0 failed with exit status 98
> Subtest master-drop-set-user failed.
> No log.
> Subtest master-drop-set-user: FAIL (0.019s)

Fail log could stay.

> root@DUT1523LNL:/usr/local/libexec/igt-gpu-tools#
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  tests/core_setmaster.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 9c2083f66..c02eaf671 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -116,9 +116,9 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
>  	for (i = 0; i < max_perm; i++) {
>  		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
>  
> -		/* Existing userspace assumes there's no gaps, do the same. */
> +		/* Existing userspace assumes there is a gaps, hence continues. */

Is it really true? Could you point to some discussion on
lore.kernel.org? Or some other mailing list/forum?

Regards,
Kamil

>  		if (stat(path, &st) != 0)
> -			break;
> +			continue;
>  
>  		if (save) {
>  			/* Save and toggle */
> -- 
> 2.25.1
> 
