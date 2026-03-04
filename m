Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E92EF8FE5
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 13:56:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B038610EA3B;
	Wed,  4 Mar 2026 13:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2za9EYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D141010EA3B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772632567; x=1804168567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4gqNNfcJcWqRNIl6wvA55Sm9iXlfnlcxQ5PRQDHA8mE=;
 b=U2za9EYjBhVF16EhC5GObf3IK2OzK62rzwVw2VfszJ5SDYunmJF6rlMg
 SpUJgd023ess1qAceWSwVhrfMC1m6cjGa7y2byTP5Z4b+IvKh9wiRCg2u
 TLBVH45A4BHrV/iAKQ1f18O/3iUXd8M/E0P2V8Oi0m5LqI3VWbgbZ3IPK
 lwPGPiWXGK6LZaIHqn7LPFjKUTVSEw6EeH0AVF20fR5b9T+jAMWg5mLxf
 HqWASuXcg52un3ZKzUXGLg4HO2pAC84gOQD0zyglQbMJC2QLkgB2Xuy5v
 eqAVRFaPXo07P5YoJ6AYmZCoJHJj5u40iuxA8X9pjLH6JcqQGsyupVXNx A==;
X-CSE-ConnectionGUID: ASoy94x6TnqNjmoPB2Rl2w==
X-CSE-MsgGUID: 8anqk3j2SYGRj3/fz7vdyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91082387"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="91082387"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:56:04 -0800
X-CSE-ConnectionGUID: s2kgLKgPQQ6tdOOWNavdyw==
X-CSE-MsgGUID: Gn2zrassSB2Vx4HKkCzyHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="215712885"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:56:03 -0800
Date: Wed, 4 Mar 2026 14:56:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org, stuart.summers@intel.com,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [i-g-t] tests/core_hotunplug: Open render capable DRM device
Message-ID: <20260304135601.iwue6vspcb5oxbo5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 igt-dev@lists.freedesktop.org, stuart.summers@intel.com,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <9e4d3126426686f9fde73011753ca1e85a32dd0d.1772578021.git.jagmeet.randhawa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e4d3126426686f9fde73011753ca1e85a32dd0d.1772578021.git.jagmeet.randhawa@intel.com>
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

Hi Jagmeet,
On 2026-03-04 at 06:53:32 +0800, Jagmeet Randhawa wrote:
> The test may select simpledrm when opening DRIVER_ANY,
> which does not expose a render node. This causes the
> later render open to fail.
> 
> Open a render capable device initially using
> __drm_open_driver_render(DRIVER_ANY) to avoid
> selecting simpledrm.

This is strange, as this test assumes card open and then tries
uses render for verification so I am not sure if you could
start with render. Adding Janusz to Cc.

Could you also add links to issues on GitLab, if there are any?

Other idea to solve this would be to add simpledrm to known
drivers and a blocked ones, like VGEM.

Regards,
Kamil

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

> 
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  tests/core_hotunplug.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 7c9dae1bf..3a612fce2 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -696,8 +696,8 @@ int igt_main()
>  		int fd_drm;
>  		char driver[32] = {};
>  
> -		fd_drm = __drm_open_driver(DRIVER_ANY);
> -		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
> +		fd_drm = __drm_open_driver_render(DRIVER_ANY);
> +		igt_skip_on_f(fd_drm < 0, "No known DRM render device found\n");
>  
>  		priv.chipset = drm_get_chipset(fd_drm);
>  		/* Make sure it opens the same driver */
> -- 
> 2.52.0
> 
