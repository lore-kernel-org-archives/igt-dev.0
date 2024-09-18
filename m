Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BB0CCD1B7
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 14:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E20F10E26C;
	Wed, 18 Sep 2024 14:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+bYwy9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEF110E26C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 14:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726669984; x=1758205984;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=YLdFrl6sv9QFRys6uEB27EHV92F2Xrg9hXZOSs46a2M=;
 b=K+bYwy9trJ0rUE+jDoOJO9NUtTMZhreRhr6dVaYR+9jGGd1WCnsWzIuO
 UiztGIRrFpFQ2R7BBCBTZi/mwtWMtRWlYWkFeSpN0plq87HiHmoDC6k2T
 xogy1wkjbR8Tg1cPxM4Nafxh7Jk1L1kkfT4JU6A0Cckb+ALGmW2xxFpoY
 UJWdGNd9CffxxDazBtdUbsPxHO+Jbav1y3eW3CU98+VRtgKGnom2/4JuG
 Cw0M3KNLJ/HOUMYWE8crtzXEf1I0hHObKR/Wvr/y4uqLT7AnhqHaZ6DQU
 oPXKkrTYPueJdA3F0QHJvY4wg/fa4/cLOUhKiQC8DFuWKFYnvK8li3T2W g==;
X-CSE-ConnectionGUID: fCd2whobREi4RaAweC7AwA==
X-CSE-MsgGUID: hz7rzhvuS92ehnGM2IoXGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25745335"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25745335"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:33:04 -0700
X-CSE-ConnectionGUID: cOVFV8dQRSi+ki57H697sQ==
X-CSE-MsgGUID: 1zdljH28TF+GK+tB4jBn/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69627162"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 07:33:02 -0700
Date: Wed, 18 Sep 2024 17:33:27 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/6] lib/igt_kms: allow set and reset value to be
 same
Message-ID: <Zurkt5aK8labwwt3@ideak-desk.fi.intel.com>
References: <20240912062839.760661-1-kunal1.joshi@intel.com>
 <20240912062839.760661-4-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912062839.760661-4-kunal1.joshi@intel.com>
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

On Thu, Sep 12, 2024 at 11:58:36AM +0530, Kunal Joshi wrote:
> allow set and reset value to be same, let the caller handle
> this scenario instead.
> 
> example scenario where this is required.
> i915_dp_force_link_rate should be auto before starting test
> should be auto at exit
> 
> v2: handle the scenario at caller side
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 863eb5331..a7f8d0f83 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1557,7 +1557,8 @@ static void connector_attr_free(struct igt_connector_attr *c)
>  static bool connector_attr_set(int idx, drmModeConnector *connector,
>  			       int dir, igt_connector_attr_set set,
>  			       const char *attr, const char *value,
> -			       const char *reset_value)
> +			       const char *reset_value,
> +			       bool allow_set_equals_reset)

force_reset would describe better what the flag does.

>  {
>  	struct igt_connector_attr *c;
>  
> @@ -1573,7 +1574,7 @@ static bool connector_attr_set(int idx, drmModeConnector *connector,
>  		return false;
>  	}
>  
> -	if (!strcmp(c->value, c->reset_value))
> +	if (!allow_set_equals_reset && !strcmp(c->value, c->reset_value))
>  		connector_attr_free(c);
>  
>  	return true;
> @@ -1582,7 +1583,8 @@ static bool connector_attr_set(int idx, drmModeConnector *connector,
>  static bool connector_attr_set_sysfs(int drm_fd,
>  				     drmModeConnector *connector,
>  				     const char *attr, const char *value,
> -				     const char *reset_value)
> +				     const char *reset_value,
> +				     bool allow_set_equals_reset)
>  {
>  	char name[80];
>  	int idx, dir;
> @@ -1600,7 +1602,8 @@ static bool connector_attr_set_sysfs(int drm_fd,
>  		return false;
>  
>  	if (!connector_attr_set(idx, connector, dir,
> -				igt_sysfs_set, attr, value, reset_value))
> +				igt_sysfs_set, attr, value, reset_value,
> +				allow_set_equals_reset))
>  		return false;
>  
>  	igt_debug("Connector %s/%s is now %s\n", name, attr, value);
> @@ -1611,7 +1614,8 @@ static bool connector_attr_set_sysfs(int drm_fd,
>  static bool connector_attr_set_debugfs(int drm_fd,
>  				       drmModeConnector *connector,
>  				       const char *attr, const char *value,
> -				       const char *reset_value)
> +				       const char *reset_value,
> +				       bool allow_set_equals_reset)
>  {
>  	char name[80];
>  	int idx, dir;
> @@ -1630,7 +1634,7 @@ static bool connector_attr_set_debugfs(int drm_fd,
>  
>  	if (!connector_attr_set(idx, connector, dir,
>  				igt_sysfs_set, attr,
> -				value, reset_value))
> +				value, reset_value, allow_set_equals_reset))
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
