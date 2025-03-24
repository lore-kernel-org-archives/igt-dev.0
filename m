Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D118C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 13:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371D810E307;
	Mon, 24 Mar 2025 13:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDIX2iMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A8C10E307
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742822488; x=1774358488;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jx6vFUm9+aJS+FkcWPWEY1HXzvO1DMXpD6bIhZRKQKs=;
 b=GDIX2iMXzEZVDIdrz7wuWFeVOT350D4JRNt3Qq2q+kNKW5TbBxwh06/k
 zY58x9FjBkipFPiBnjfa2N6wrQSeCdEficqKRoNXamFdOWx0Q9mh4uJnx
 kPQ+ZC2k++KExnb0y/r8k70lEpYBUCVfYkMYQIWRibY7CZB82y/ItbiTE
 1LlBo4EdrQyWqRVV6JsVbKh+4AwoIEjoOb1FK/LK6slIKCHnq6OsAo6LP
 r9k7emgXoHWIUUGIEJnH05W22taidH1P3hDPla6qDQryEE2pJkjXQmAcn
 DGJsGNAQP49Rmw9enNCdGnT9NJOLBxUtmmQ7GI737mGCtJ6bKMutvB9N2 w==;
X-CSE-ConnectionGUID: 6Iiks33XQj+TMuFFkwP77A==
X-CSE-MsgGUID: hF1HBs1lT4SisJFOGHGLAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47681593"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="47681593"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:21:27 -0700
X-CSE-ConnectionGUID: BW8orl7eTUu3SBYXdSXUNA==
X-CSE-MsgGUID: BZ90Y++CQK20zFgk9LltQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124505473"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 06:21:26 -0700
Date: Mon, 24 Mar 2025 14:21:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH i-g-t v4] tests/intel/kms_pm_dc: Add skip logic and
 logging for DC5 psr test
Message-ID: <20250324132111.226557lttkuwvquh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
References: <20250226065202.84015-1-mohammed.thasleem@intel.com>
 <20250321175259.20603-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321175259.20603-1-mohammed.thasleem@intel.com>
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

Hi Mohammed,
On 2025-03-21 at 23:22:59 +0530, Mohammed Thasleem wrote:
> Prior to Gen12, Pipe A is required to run the DC5 transaction,
> ensuring low power operation. In display versions greater than 12,
> either Pipe A or Pipe B can be used for the DC5 transaction,
> providing flexibility in pipe selection
> 
> However, display version 20 specifically requires Pipe A.
> Additionally, for Battlemage and DG2 devices, only Pipe A is
> required due to specific hardware constraints. To enforce these
> conditions, skip logic and logging have been added, ensuring that
> tests are only executed when the appropriate pipes are selected.
> 
> v2: Updated subject title and discription.
>     Add Gen checks for low power pipe selection. (Santosh)
> v3: Add check for bmg and dg2 for Pipe A also other checks for Pipe A
>     and B. (Gustavo)
> v4: Update logic style. (Gustavo)
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 50473321a..4b2464c24 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -145,13 +145,26 @@ static void set_output_on_pipe_b(data_t *data)
>  
>  static void setup_output(data_t *data)
>  {
> +	int disp_ver = intel_display_ver(data->devid);
>  	igt_display_t *display = &data->display;
>  	igt_output_t *output;
> +	bool is_low_power;
>  	enum pipe pipe;
>  
>  	for_each_pipe_with_valid_output(display, pipe, output) {
>  		drmModeConnectorPtr c = output->config.connector;
>  
> +		if (disp_ver >= 13) {
> +			if (disp_ver == 20 || IS_BATTLEMAGE(data->devid) || IS_DG2(data->devid))
> +				is_low_power = (pipe == PIPE_A);
> +			else
> +				is_low_power = (pipe == PIPE_A || pipe == PIPE_B);
> +		} else {
> +			is_low_power = (pipe == PIPE_A);
> +		}
> +
> +		igt_skip_on_f(!is_low_power, "Low power pipe was not selected for the DC5 transaction.\n");

Why do you skip here? Imho it could debug print about low power
and continue, just like below if ... CONNECTOR_eDP, so

		if (!is_low_power) {
			igt_debug("Low power pipe%c was not selected for the DC5 transaction.\n",
				   pipe == PIPE_A ? 'A' : 'B');
			continue;
		}

Btw I hope that there is later on a check that anything was
actually tested.

Regards,
Kamil

> +
>  		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
>  			continue;
>  
> -- 
> 2.43.0
> 
