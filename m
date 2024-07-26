Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3ADC3DA49
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 17:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29DE10E249;
	Fri, 26 Jul 2024 17:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TguGqNbW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF1810E9A9
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 17:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722013260; x=1753549260;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8YHBM+PYRo3byqtv0sAYVUX6usJb6tU0G/3jUVNNmFY=;
 b=TguGqNbWrOzfzM+rrXNX9bd50cO60E5L7AGRUsUiHOlScuryJY4K1jQQ
 Rqn5Pv0nHagf9Df6SHdij8L2FppB2ABGbcIoH6m56VOa5mR+AFef5PXhK
 BYcE9EzxbSNARtNkcpdH1VSFDP0Vsdzwt3Xx1o+eP1Cvll31YahGInkxl
 LNwOkcWocvFMQGfRwlpNFge8kINxBQ20GfaWO9tIL+JACKS1rJuZoIYdB
 PAzf0j8OpVYABvN6d/HVJbDYBJxmccQg+C9+4/nPZ/bjMAu/5rvyEHxOo
 coeW7GelMZ9JbJpfH9zrh8XXC6q/7LRdY3nr43q6hClPLWgwN5e/5WAKy A==;
X-CSE-ConnectionGUID: i8CXtD3SQ4Gc3cgIlRxRJA==
X-CSE-MsgGUID: NQBzL6jDSbekzTSS5bT3Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19615471"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19615471"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 10:00:55 -0700
X-CSE-ConnectionGUID: Qmy6H6UtRsCtNiL4AxPB+A==
X-CSE-MsgGUID: QHN/imAJToS2rS0ifVeDXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53405131"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 10:00:53 -0700
Date: Fri, 26 Jul 2024 19:00:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 i-g-t v2] tests/core_setmaster: Change break to
 continue in tweak_perm function
Message-ID: <20240726170037.xbv4uote67a7kube@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20240726102618.22111-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240726102618.22111-1-krishnaiah.bommu@intel.com>
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
On 2024-07-26 at 15:56:18 +0530, Bommu Krishnaiah wrote:

I have few nits, first about subject:
[PATCH v2 i-g-t v2] tests/core_setmaster: Change break to continue in tweak_perm function

please do not write in subject word-for-word C code,
see links in CONTRUBUTE.md on how to describe changes, so

s/Change break to continue in tweak_perm function/...one line description.../

> Existing userspace assumes there's no gaps card’s, but I see cards

Maybe explain why this cannot be always true?

> are not continues, after running “gta@core_hotunplug I am not seeing card0,
> hence test is failing.
>

s/“gta@core_hotunplug/core_hotunplug@hotrebind-lateclose/

> Failure sequence:
> 

Put command here: ls /dev/dri

> card0  renderD128  version
> 

same here, put command to get this result:
sudo ... write here command to run a test below

> Subtest master-drop-set-user: SUCCESS (0.061s)
> 

Same here.

> card0  renderD128  version

Same here.

> 
> Subtest hotrebind-lateclose: SUCCESS (2.791s)
> 
> ls /sys/class/drm/
> card1  renderD129  version
> 
> root@DUT4419LNL:/usr/local/libexec/igt-gpu-tools# ./core_setmaster --r master-drop-set-user

s!root@DUT4419LNL:/usr/local/libexec/igt-gpu-tools!!

> Subtest master-drop-set-user: FAIL (0.017s)
> 
> Failure on XE

Move this to begin, where you describe problem.
Does this also happen for i915?
If not maybe this is a regression in Xe?

I do see why userspace cannot have continous card0...N
and that is you could dynamically unload/remove a card
but please write that in comment in a test.

Regards,
Kamil

> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  tests/core_setmaster.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 9c2083f66..60ae06331 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -116,9 +116,8 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
>  	for (i = 0; i < max_perm; i++) {
>  		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
>  
> -		/* Existing userspace assumes there's no gaps, do the same. */
>  		if (stat(path, &st) != 0)
> -			break;
> +			continue;
>  
>  		if (save) {
>  			/* Save and toggle */
> -- 
> 2.25.1
> 
