Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A33FE77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 17:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4053510E99C;
	Mon,  6 Jan 2025 17:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="novgOO2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E45110E99C
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 17:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736184048; x=1767720048;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6bjuV+L6I9lWp3XW8cJOBUxh06XDFyYmtimYs4ckTHg=;
 b=novgOO2GLW1ccJmNxwhsHhlbIoBVrAVozF0VEDShtCMWr6M+Yd+Z979L
 YTZo/Ot5c14/GWCIbHrnCPlWsMeVO19a8BxWE00wewajo6SsVysYnNYkZ
 oFN75PgSxFn3vHGRdvcnWmhYG4xwJWaGR9Rdp3oau6ovTBxTkDqCpoKXC
 DfY7+9Suu3RiJHKIPtRNDgrl0bGNkFQjewBBM2QY7Zeelb5bcx8Co48JF
 MYxThQeb6Zu6fnkAfOKnnMX4pTJXSZm4OLBejCa19I+yVe716/+MMT8JB
 dDpkGss5HTcwsiEk5U9rHO/qQKR1Szu8Oi0kbbpJIVZ3N1jkJtwFDBiIb A==;
X-CSE-ConnectionGUID: mkoF31kiR+CBLGtgr/s7Mg==
X-CSE-MsgGUID: x+tLCfHtSomG+9dxtEN8pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36494989"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="36494989"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 09:20:48 -0800
X-CSE-ConnectionGUID: 01LOcapMTxK2JzeA4MnFTA==
X-CSE-MsgGUID: 3C0VMc+aSJ6wfN51R5/1JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133413742"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 09:20:47 -0800
Date: Mon, 6 Jan 2025 11:20:42 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com, 
 alex.zuo@intel.com, zbigniew.kempczynski@intel.com, pravalika.gurram@intel.com,
 daniel.stenka@intel.com
Subject: Re: [PATCH] tests/intel/xe_drm_fdinfo: Do not end NULL xe_cork
Message-ID: <grhezcm6z7eph2vnwyigerhldgccitqyxmdvx4a7mryw3p5qp6@4y2hbdujaj43>
References: <20250102162540.81162-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250102162540.81162-1-jonathan.cavitt@intel.com>
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

On Thu, Jan 02, 2025 at 04:25:40PM +0000, Jonathan Cavitt wrote:
>An earlier commit prevented the execution of the xe_cork_destroy
>function when the xe_cork is not initialized via xe_cork_create in
>xe_drm_fdinfo.  This must also be done with the xe_cork_sync_end
>function in some places.
>
>Fixes: 2feb1d67 ("lib/xe/xe_spin: move the spinner related functions to lib")
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3869
>CC: Pravalika Gurram <pravalika.gurram@intel.com>
>CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>CC: Daniel Stenka <daniel.stenka@intel.com>
>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and pushed, thanks.

Lucas De Marchi
