Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36967C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 16:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B913C10E0B5;
	Thu, 22 Aug 2024 16:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZkvncLY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA26610E0B5
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 16:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724345193; x=1755881193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OR0SZ2+aJSnmuAYOyiiaxwEhHgK67sQZaXVqIsrlDew=;
 b=aZkvncLYnaAN/vnX++4EOfw6zPafP8AETyPLjt8r8JNU2xRLqPrIaoL7
 yDw+AhCKuCIxPKfUGVUbAO7iwHQUUXrtTyvztwcEfRAv/HTkvGjmk12aS
 WgBhNtpGajwbDp0yr7hF1xyPAMjcOQC9iw/MZ/7T3FajVIJODPI6UEMV6
 dYbnfTNqaW//0BX9Sz4vD6wol/SrVRRCAS23ilDGCUYzg2kOq2K1DD18Z
 MEpr0+fbLSK1nrjmC7l+ehV1hYE8T5jEVeGvguyz7TNhTtYR3i8qfPhMl
 ElVJWDoZ1x0nY61KCX5wnV35+r6V2bPv3kmMBrBecMoO7L6DwzFMRdcWS Q==;
X-CSE-ConnectionGUID: ia1x9wWpRVCBcyeX9llxww==
X-CSE-MsgGUID: VKRS2DQNST2h/McQ1S2p4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22645912"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22645912"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 09:46:32 -0700
X-CSE-ConnectionGUID: h6H27CFrRXS0BnE7uSk1/w==
X-CSE-MsgGUID: guA+iZBVQR2PtX4aaMyi4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="62050313"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 09:46:31 -0700
Date: Thu, 22 Aug 2024 18:46:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] tests/core_setmaster: Handle the test even if cards are
 non-continuous
Message-ID: <20240822164627.byk7ffdpjwpwb5tw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <20240812052443.12856-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240812052443.12856-1-krishnaiah.bommu@intel.com>
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
On 2024-08-12 at 10:54:43 +0530, Bommu Krishnaiah wrote:
> Although most of userspace assumes drm cards to be populated continously,
> 

Remove blank line.

> this assumption may not be always true. After hot unpluging and
> repluging of card
> 

Remove blank.

> the card may be non-continous.  To address such scenarios where the
> cards can be non-continous
> 

Remove blank.

> modify the tweak_perm function to loop all possible
> cardnumbers(card0-card255) to confirm are they populated or not.
-----^
s/cardnumbers/card numbers/

imho test is checking only first card so looping all is not optimal.

> 
> Problem Description:
> The test fails after running the `core_hotunplug@hot*` subtest, where
> card0 is missing.

imho this could be discussed if that is ok or driver error,
imho valid case would be to have multi-card and unpluging first.

> This leads to a failure in the subsequent `master-drop-set-user` test.
> 
> Command sequence for reproducing the issue:
> - Check available cards: `ls /dev/dri/`
> 	- Output: by-path  card0  renderD128
> - Run the test: `# ./core_hotunplug --r hotrebind-lateclose`
> - Check again: ‘ls /dev/dri/’
> 	- Output after failure: by-path  card1  renderD129

s/failure/core_hotunplug failure/

> - Run the test: `# ./core_setmaster --r master-drop-set-user`
> 
> This failures on both XE and i915 for above sequence.
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_setmaster.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 9c2083f66..a2758e2f2 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -116,9 +116,10 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
>  	for (i = 0; i < max_perm; i++) {
>  		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
>  
> -		/* Existing userspace assumes there's no gaps, do the same. */
> +		/* Userspace cannot always have continuous card0...N due to
> +		 * dynamic unloading or removal of cards */
>  		if (stat(path, &st) != 0)
> -			break;
> +			continue;

imho this is ok but you should also break after first save/restore
just before end of for loop, so no need for setting all perms when
you will test only first one.

Also imho you should fill info in saved_perm about which card was
found and use it instead of calling __drm_open_driver().

Regards,
Kamil

>  
>  		if (save) {
>  			/* Save and toggle */
> -- 
> 2.25.1
> 
