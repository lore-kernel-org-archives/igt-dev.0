Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EBBC25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 16:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51D410F573;
	Fri, 24 May 2024 16:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4YWQvBu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C0710F579
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716569540; x=1748105540;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mtA0swCoeSxGS556F8YvjNeVqBFee8w8OqdeKMISnWU=;
 b=m4YWQvBucTpoHK7Ho9m2AeVXiL3dGDu1hFuZFQMh4WLaa5ME3YJtpVJu
 lI21u4DOk3P4lClL3UWE4Ryir/6r/7de9JHsxvjOKgn0UmI2iRtdVRqX0
 frqIbryjgH21uJdjgKBvLUxc3fSa5PcPAZElV952Gqg8vJRIKlO7bvZq9
 g/R+ODxmjLjkk4gEv7Fn/UR7xO5YjlMD1q+wlhPUo/0Ds0T3AMjNsrnVI
 FiKR+AZFAgE0yw8M3UyO28olBLVXnWJVBu7atTOSxuG1funcPYxarez91
 dzJ4GKkP9Rm0xn4jaRSl03kRDFG172NYGEH9O58pNUakm3hZySNWXu/zk A==;
X-CSE-ConnectionGUID: Ga2W3WaAQOauE5po7pEmjg==
X-CSE-MsgGUID: vNCblDgcReW+XJBVyAwATg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30463800"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="30463800"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 09:52:19 -0700
X-CSE-ConnectionGUID: ZyZa4hUoQTG7vvW+cL59eQ==
X-CSE-MsgGUID: 1e2vjvG/S7muzRqVA8i8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="33996992"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 09:52:18 -0700
Date: Fri, 24 May 2024 18:52:15 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel: check drmModeGetConnector()
 return value in i915_pm_rpm
Message-ID: <20240524165215.iw7c4kbzspifczcw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Luca Coelho <luciano.coelho@intel.com>
References: <20240523084426.284894-1-luciano.coelho@intel.com>
 <20240523084426.284894-3-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240523084426.284894-3-luciano.coelho@intel.com>
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
On 2024-05-23 at 11:44:26 +0300, Luca Coelho wrote:

one more nit about subject, please keep it short,
instead of:

[PATCH i-g-t 2/2] tests/intel: check drmModeGetConnector() return value in i915_pm_rpm

imho better:

[PATCH i-g-t 2/2] tests/intel/i915_pm_rpm: avoid NULL dereference

Regards,
Kamil

> The drmModeGetConnector() function can return NULL in some cases, so
> we need to check the return value before accessing it.  This is not
> being checked in init_mode_set_data(), so fix that.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10911
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  tests/intel/i915_pm_rpm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index 52e00489da70..10a545f173de 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -515,6 +515,12 @@ static void init_mode_set_data(struct mode_set_data *data)
>  			data->connectors[i] =
>  				drmModeGetConnector(drm_fd,
>  						    data->res->connectors[i]);
> +			if (!data->connectors[i]) {
> +				igt_warn("Could not read connector %u\n",
> +					 data->res->connectors[i]);
> +				continue;
> +			}
> +
>  			data->edids[i] = get_connector_edid(data->connectors[i], i);
>  		}
>  
> -- 
> 2.39.2
> 
