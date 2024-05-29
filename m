Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF848C25B7C
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 16:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10ED3113EC1;
	Wed, 29 May 2024 16:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpoBBJxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8DE113EC1
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 16:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716998825; x=1748534825;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pqdG8NOsS7YUpuPeTOBPwB5O7MF5HjrE4y3GA73Ux2Q=;
 b=SpoBBJxKXf08df3niScQWzoaSOfdbizLZv0tfF81D45q2y3pTg2gn1cr
 7JYZUsSzG7VloRYduQ7E+Rl5WSRkxi7H0BsRRPJyAgUig8rlRCFQYynCH
 wcevcngRurRGA5BEIV5GgPyDX8hZ8MZ4nhRTOhxW9cepOH70FxHOU7N6n
 PWjsu/hs4irwY/4yHmt91C0qEul8a+IBziXSxEB69/fLYgvEwQ0Z5RIaU
 P+RkfX/coqdw1+DoHkV+GAaLEYkMKGT8H0zMbqKLUh1CjCjdLi6/i+ZqK
 XghKrs7s0CDvjW06NCx+wYhLbDjTLQdola1Q+BY51n3abWgdjHgFSrUoL w==;
X-CSE-ConnectionGUID: FZteOyayTHumRlbEtaV3sw==
X-CSE-MsgGUID: s1M06kZgT7KiJ1vf8xf4IA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17201847"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="17201847"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 09:07:03 -0700
X-CSE-ConnectionGUID: iXIx4N/GSQepQ86VA77kOg==
X-CSE-MsgGUID: i34mJkO+QY+7tmWbrs4/SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="58658924"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 09:07:02 -0700
Date: Wed, 29 May 2024 18:06:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Manasi Navare <navaremanasi@chromium.org>
Subject: Re: [PATCH i-g-t v2 1/2] lib/igt_chamelium: check
 drmModeGetConnector() return in wait_for_connected_state()
Message-ID: <20240529160646.nv6ovnpgw7ttzilz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Manasi Navare <navaremanasi@chromium.org>
References: <20240528075855.463729-1-luciano.coelho@intel.com>
 <20240528075855.463729-2-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240528075855.463729-2-luciano.coelho@intel.com>
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

Hi Luca,
On 2024-05-28 at 10:58:54 +0300, Luca Coelho wrote:

change now looks ok but why did you ignored my suggestion
about short subject? Please see CONTRIBUTING.md about test
description:
The description should contain the spirit of the test (what is
the general idea behind the test) and *not* the letter (C to English
translation of the test).


The same principle apply to your subject description of change,
it should be short, not 'translation from C code of a change'.
It should also be rather short, up to 75 chars (or maybe even 65)
to keep it all in mailing list discussion.
You coould also look into:
https://patchwork.freedesktop.org/series/134188/

So imho here, instead of:
lib/igt_chamelium: check drmModeGetConnector() return in wait_for_connected_state()

imho better:
lib/igt_chamelium: Fix NULL dereferencing bug in wait_for_connected_state()

or even better:
lib/igt_chamelium: Fix bug in wait_for_connected_state()

or maybe:
lib/igt_chamelium: check drmModeGetConnector() return value before use

You could propose other subject if you find a better description.

Regards,
Kamil

> The drmModeGetConnector() function can return NULL in some cases, so
> we need to check the return value before accessing it.  This is not
> being checked in wait_for_connected_state(), so fix that.
> 
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Manasi Navare <navaremanasi@chromium.org>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  lib/igt_chamelium.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 016d5356630c..620fbbf7d94f 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -524,6 +524,11 @@ static bool wait_for_connected_state(int drm_fd,
>  			drmModeConnector *connector =
>  				drmModeGetConnector(drm_fd, connectors[i]);
>  
> +			if (!connector) {
> +				connected = false;
> +				break;
> +			}
> +
>  			connected = connector->connection == DRM_MODE_CONNECTED;
>  
>  			drmModeFreeConnector(connector);
> -- 
> 2.39.2
> 
