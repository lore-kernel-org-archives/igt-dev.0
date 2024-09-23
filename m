Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D280ECF9C6E
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 11:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B0F10E241;
	Mon, 23 Sep 2024 11:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZgTTATPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE7410E241
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727092147; x=1758628147;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=gu2zVABQAAOfGEioVnfVzGHDxE3BGes0iwRDr4eqTb8=;
 b=ZgTTATPTK2Q2YbsUOFuitbXLxZWxxOhG0WL6TWckxrUvrMkY+dIfjlCf
 Lzgj0VH9xCUvY6GVgFzVgOHfJLkY/b1H3yFGE01WkzmmMx77Zb7iOV48P
 D1UCXb6u4Iv8NpZygre/qAtb264n25vWNcz6UtdLLUOk6O+lu3RuzbbnD
 Dejw9LRUkeHiq5DKXhbr4CR4rvIWiQxEjk8aleV5dc160kzt6dCee4ywe
 WEZ+rXhfzG9dqRk71JYwb6RHP3etWclmvInP7KYY5KH8ODke95PT0sFZ2
 c8Mp8GBLfQBkokz/rxRs7MoZ+bhuy3JQiha3vZ0TAyFG4rUccMtrbt8s7 Q==;
X-CSE-ConnectionGUID: uDHI3OacSoSFbAXaP/Kq9A==
X-CSE-MsgGUID: zzM/LbhsQJ+4qk12yS5GTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="28929922"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="28929922"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 04:49:06 -0700
X-CSE-ConnectionGUID: L39WAzcWQPaAHmNgAG6bXQ==
X-CSE-MsgGUID: aC63d7XiT7ir6UDZ4Say+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="71075533"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 04:49:05 -0700
Date: Mon, 23 Sep 2024 14:49:31 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/7] lib/igt_kms: allow set and reset value to be
 same
Message-ID: <ZvFVy3O_uteVS0RO@ideak-desk.fi.intel.com>
References: <20240922212549.1361889-1-kunal1.joshi@intel.com>
 <20240922212549.1361889-4-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922212549.1361889-4-kunal1.joshi@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Sep 23, 2024 at 02:55:45AM +0530, Kunal Joshi wrote:
> allow set and reset value to be same, let the caller handle
> this scenario instead.
> 
> example scenario where this is required.
> i915_dp_force_link_rate should be auto before starting test
> should be auto at exit
> 
> v2: handle the scenario at caller side
> 
> v3: rename allow_set_equals_reset -> force_reset (Imre)
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  lib/igt_kms.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 53c6db7f3..011f3768a 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1557,7 +1557,8 @@ static void connector_attr_free(struct igt_connector_attr *c)
>  static bool connector_attr_set(int idx, drmModeConnector *connector,
>  			       int dir, igt_connector_attr_set set,
>  			       const char *attr, const char *value,
> -			       const char *reset_value)
> +			       const char *reset_value,
> +			       bool force_reset)
>  {
>  	struct igt_connector_attr *c;
>  
> @@ -1573,7 +1574,7 @@ static bool connector_attr_set(int idx, drmModeConnector *connector,
>  		return false;
>  	}
>  
> -	if (!strcmp(c->value, c->reset_value))
> +	if (!force_reset && !strcmp(c->value, c->reset_value))
>  		connector_attr_free(c);
>  
>  	return true;
> @@ -1582,7 +1583,8 @@ static bool connector_attr_set(int idx, drmModeConnector *connector,
>  static bool connector_attr_set_sysfs(int drm_fd,
>  				     drmModeConnector *connector,
>  				     const char *attr, const char *value,
> -				     const char *reset_value)
> +				     const char *reset_value,
> +				     bool force_reset)
>  {
>  	char name[80];
>  	int idx, dir;
> @@ -1600,7 +1602,8 @@ static bool connector_attr_set_sysfs(int drm_fd,
>  		return false;
>  
>  	if (!connector_attr_set(idx, connector, dir,
> -				igt_sysfs_set, attr, value, reset_value))
> +				igt_sysfs_set, attr, value, reset_value,
> +				force_reset))
>  		return false;
>  
>  	igt_debug("Connector %s/%s is now %s\n", name, attr, value);
> @@ -1611,7 +1614,8 @@ static bool connector_attr_set_sysfs(int drm_fd,
>  static bool connector_attr_set_debugfs(int drm_fd,
>  				       drmModeConnector *connector,
>  				       const char *attr, const char *value,
> -				       const char *reset_value)
> +				       const char *reset_value,
> +				       bool force_reset)
>  {
>  	char name[80];
>  	int idx, dir;
> @@ -1630,7 +1634,7 @@ static bool connector_attr_set_debugfs(int drm_fd,
>  
>  	if (!connector_attr_set(idx, connector, dir,
>  				igt_sysfs_set, attr,
> -				value, reset_value))
> +				value, reset_value, force_reset))
>  		return false;
>  
>  	igt_info("Connector %s/%s is now %s\n", name, attr, value);
> @@ -1662,7 +1666,8 @@ static bool force_connector(int drm_fd,
>  			    const char *value)
>  {
>  	return connector_attr_set_sysfs(drm_fd, connector,
> -					"status", value, "detect");
> +					"status", value, "detect",
> +					false);
>  }
>  
>  /**
> @@ -1727,7 +1732,7 @@ static bool force_connector_bigjoiner(int drm_fd,
>  {
>  	return connector_attr_set_debugfs(drm_fd, connector,
>  					  "i915_bigjoiner_force_enable",
> -					  value, "0");
> +					  value, "0", false);
>  }
>  
>  /**
> -- 
> 2.43.0
> 
