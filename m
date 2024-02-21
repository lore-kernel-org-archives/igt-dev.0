Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8318CC48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 10:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259ED10E569;
	Wed, 21 Feb 2024 10:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEbs+St/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC6910E569
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 10:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708512453; x=1740048453;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nREOYnQRpLgiwCo/7LxpFgl6DAOXiZDMAwcUVgUJWNs=;
 b=WEbs+St/IR4rUkKISHflaiEv5VZslauxLxrWj+MTlbXQh5571bSGWUIc
 JuJjzmkCwVfCl46OVEkP3MKURPk1ipWl9Yg3FZ2vCImbHMTpZVHokXUKn
 sVBJcBdbFO3YGMyBL7ig0PBdVhWQYqM/IeRrZh0bKOihWRnziu/5hLZRJ
 pPWS4Qibq+HUCAZyI1EkXt9i/RlfeztX+h9KEV+TKsvX/RSJIrfnxd7P9
 tPMvI8pmi8Ix/7Hac8geBRNH0eqwqIL8zw9GixdPIf11QEOleEyPhEIG6
 F4+65tdNDAZmJnx2soGwHDc/myVZ9Zw5KeHiqck1TWofHYjjoyrwl4qXf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="14087056"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="14087056"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 02:47:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5257269"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:47:31 -0800
Date: Wed, 21 Feb 2024 11:47:12 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: aditya.chauhan@intel.com
Subject: Re: [PATCH i-g-t] tests/intel-ci: Add debugfs subtest to i915 BAT
 testlist
Message-ID: <20240221104712.2vwb7nviacebhdmn@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, aditya.chauhan@intel.com
References: <20240221104106.32576-1-aditya.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240221104106.32576-1-aditya.chauhan@intel.com>
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

Hi Aditya,

On 2024-02-21 at 16:11:06 +0530, aditya.chauhan@intel.com wrote:
> From: Aditya Chauhan <aditya.chauhan@intel.com>
> 
> Add debugfs_test@sysfs subtest to i915 fast feedback testlist to improve
> validation if any changes are added in sysfs node
> 
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel-ci/fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 662e49cc3..be0965110 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -5,6 +5,7 @@ igt@i915_module_load@load
>  igt@core_auth@basic-auth
>  igt@debugfs_test@read_all_entries
>  igt@debugfs_test@basic-hwmon
> +igt@debugfs_test@sysfs

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  igt@fbdev@eof
>  igt@fbdev@info
>  igt@fbdev@nullptr
> -- 
> 2.39.0
> 
