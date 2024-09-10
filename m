Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCFAECE58A
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 16:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7957D10E885;
	Tue, 10 Sep 2024 16:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDqt81Z9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16BD10E885
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725985797; x=1757521797;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JqdLUQFVyDa7sJ6mzY8goOL4/W1kBgrMWn0kRZZvKZ8=;
 b=UDqt81Z9cAOZTF+R+CNCBnwMRfoVyHkGWyXcdpOEQLFe8XbPDHaqSvJC
 ieyesm8n4eccWA3MRKi25NVt+2ORLU0HCjAu2wxDAJHCNm8wm5aUgmK2s
 07FRCH0bODCC0cJ857+fg9XLgibmTtbeH/e7eKzyJMrAm475L+YoIE3hI
 MvO4NsDJv6t5KDQZOaNG2LgoWe4gNxwOw0/wezhVNXFXV6DgAdDKlsGfN
 V6ijIoSbbi7su6C4P9ZPx7+Xe0GDtxnCXHR6g8CYGOxctbMHwY1eLNXPN
 dDnuZxaBxqun99hS7aYkuSIi5LaCXPR1ARJi/TqPrA1PWQJ9/miXljCEj g==;
X-CSE-ConnectionGUID: 6JzKBapHQLWaBv1V/h0KYw==
X-CSE-MsgGUID: SMqV26XmRgCdmTvhPvH9dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35414427"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="35414427"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 09:29:57 -0700
X-CSE-ConnectionGUID: 878FTmhETe+fhDXU5s7aSQ==
X-CSE-MsgGUID: ubrlUADaT/K2GUR+NQugsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67103893"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 09:29:55 -0700
Date: Tue, 10 Sep 2024 18:29:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH v2] tests/core_setmaster: Handle the test even if cards
 are non-continuous
Message-ID: <20240910162952.bbpfoum4m6z4rpad@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
References: <20240910053747.14305-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910053747.14305-1-krishnaiah.bommu@intel.com>
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
On 2024-09-10 at 11:07:47 +0530, Bommu Krishnaiah wrote:
> Although most of user space assumes drm cards to be populated continuously,
> this assumption may not be always true. After hot unpluging and repluging
> of card, the card may be non-continuous. To address such scenarios where
> the cards can be non-continuous Modify the tweak_perm function to loop all
> possible card numbers(card0-card255) and break after first card found.
> 
> Problem Description:
> The test fails after running the `core_hotunplug@hot*` subtest, where
> Card0 is populated as card1, This leads to a failure in the subsequent
> `master-drop-set-user` test.
> 
> Command sequence for reproducing the issue:
> - Check available cards: `ls /dev/dri/`
>         - Output: by-path  card0  renderD128
> - Run the test: `# ./core_hotunplug --r hotrebind-lateclose`
> - Check again: ‘ls /dev/dri/’
>         - Output after core_hotunplug : by-path  card1  renderD129
> - Run the test: `# ./core_setmaster --r master-drop-set-user`
>         - Output: gta@ core_setmaster@master-drop-set-user failure
> 
> This failures on both XE and i915 for above sequence.
> 
> v2: Break the loop after first card found and check return value of chmod.
> 
> Signed-off-by: Bommu Krishnaiah krishnaiah.bommu@intel.com
> Cc: Emil Velikov emil.l.velikov@gmail.com
> Cc: Himal Prasad Ghimiray himal.prasad.ghimiray@intel.com
> Cc: Kamil Konieczny kamil.konieczny@linux.intel.com
> ---
>  tests/core_setmaster.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 9c2083f66..bfcfb5d25 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -107,18 +107,20 @@ static void check_drop_set(void)
>  	drm_close_driver(master);
>  }
>  
> -static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
> +static int tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
>  {
>  	char path[256];
>  	struct stat st;
> -	unsigned i;
> +	int i;
>  
>  	for (i = 0; i < max_perm; i++) {
> +		int ret = 0;
> +
>  		snprintf(path, sizeof(path), "/dev/dri/card%u", i);
>  
>  		/* Existing userspace assumes there's no gaps, do the same. */

Please update comment or refactor whole test:

use pair of __drm_open_driver/__drm_close_driver,

imho something like:
in first fixup open fd and get its path, this will allow to
eliminate loop,
then after succesfully changing permissions set also at_exit() proc
for restoring priviliges if test fails.

if changing permissions fails just fail with igt_assert()

Regards,
Kamil

>  		if (stat(path, &st) != 0)
> -			break;
> +			continue;
>  
>  		if (save) {
>  			/* Save and toggle */
> @@ -136,7 +138,12 @@ static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
>  		 * - __drm_open_driver() can open another device, aka the
>  		 * failure may be irrelevant.
>  		 */
> -		chmod(path, st.st_mode);
> +		ret = chmod(path, st.st_mode);
> +		if (ret)
> +			return ret;
> +
> +		if (save)
> +			return i;
>  	}
>  	return i;
>  }
> @@ -161,7 +168,7 @@ igt_main
>  
>  	igt_subtest_group {
>  		uint8_t saved_perm[255];
> -		unsigned num;
> +		int num;
>  
>  		/* Upon dropping root we end up as random user, which
>  		 * a) is not in the video group, and
> -- 
> 2.25.1
> 
