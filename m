Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94024C021B1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 12:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5276A10E95D;
	Thu, 20 Feb 2025 12:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UyTux7H1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0BB10E95D
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 12:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740054826; x=1771590826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z+wgqLJCqcyU71qfGpF6YG7/D4wQOd55T35EwuRMweA=;
 b=UyTux7H1ec741+xGeKeHl8+9OpA+ASoqtzeqKRgW4N3BVY4uohpuWcT9
 Xxo+Ot0qsQHbZhcYCLAGYHD20I6Bn0YrEdQEkv2WR1GS4MoWn6LZ4ULz9
 vZgzdtmu9BebQveX6E3wZPZ71uyLC4LMSbkloC6g4hJwF+19ORGt5Mv5I
 s8SBrbGyp+4Up03dDDxsSO0TJc7FXee//IIdAW0e28Zjwqtf3uoDxWsf0
 A3z84oWzOw2HBoHrf5M5wJnvK9sEv6nlK4B83Nq4izpsmSqmphFFhBqJH
 e11e2p+D8uDVTopJBaFTc0owh5bkieH56LN8Oa9atekKMAHi58KdfxI5S g==;
X-CSE-ConnectionGUID: EE20265PSlGCPttxYrvsMw==
X-CSE-MsgGUID: gBzgzuBhTXepZ7iftoFNpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40951118"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40951118"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 04:33:46 -0800
X-CSE-ConnectionGUID: ARAGYI50Qhyl0MJMQfVJ+A==
X-CSE-MsgGUID: V+ysFtbUQzymsQAPf8gE1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="120135629"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 04:33:44 -0800
Date: Thu, 20 Feb 2025 13:33:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Mateusz Grabski <mateusz.grabski@intel.com>,
 Konrad Brodzik <konrad.b.brodzik@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t 1/1] runner: Bump network ping deadline to 40 seconds
Message-ID: <20250220122733.u2h2wt25ny4i7zkx@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Mateusz Grabski <mateusz.grabski@intel.com>,
 Konrad Brodzik <konrad.b.brodzik@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
References: <20250214190416.145374-1-kamil.konieczny@linux.intel.com>
 <20250214190416.145374-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250214190416.145374-2-kamil.konieczny@linux.intel.com>
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

Hi igt-dev,
On 2025-02-14 at 20:04:12 +0100, Kamil Konieczny wrote:
> From: Peter Senna Tschudin <peter.senna@linux.intel.com>
> 
> Commit ddfde25f16ba ("runner: Add support for aborting on
> network failure") introduced a 20 second deadline for the DUTs
> network to recover after a suspend/resume cycle. If the network
> isn't back up within that time, igt_runner aborts the test run
> to save logs and prevent potential log loss from an imminent
> power cycle.
> 
> External monitoring machine checks DUTs health and if it cannot
> reach it over network for 60 seconds it will reboot DUT.
> 
> Although our CI system can be configured with a longer wait
> time, extending it further would unnecessarily prolong tests in
> cases of DUT hangs.
> 
> Bump the deadline to 40 seconds to prevent a premature igt_runner
> abort.

Applied,

Regards,
Kamil

> 
> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Mateusz Grabski <mateusz.grabski@intel.com>
> Cc: Konrad Brodzik <konrad.b.brodzik@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Acked-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  runner/executor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/runner/executor.c b/runner/executor.c
> index 999e7f719..2abb18732 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -218,11 +218,11 @@ static bool load_ping_config_from_env(void)
>  
>  /*
>   * On some hosts, getting network back up after suspend takes
> - * upwards of 10 seconds. 20 seconds should be enough to see
> + * upwards of 10 seconds. 40 seconds should be enough to see
>   * if network comes back at all, and hopefully not too long to
>   * make external monitoring freak out.
>   */
> -#define PING_ABORT_DEADLINE 20
> +#define PING_ABORT_DEADLINE 40
>  
>  static bool can_ping(void)
>  {
> -- 
> 2.48.1
> 
