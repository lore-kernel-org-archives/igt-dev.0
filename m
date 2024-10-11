Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7FACFD2E4
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 08:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81EB10E05B;
	Fri, 11 Oct 2024 08:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eA17M3n/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F4910E05B
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728635776; x=1760171776;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qY9CnSG5MRFdGxjUO3MKDkMYYOF1YaSjTiOiBR2GhPY=;
 b=eA17M3n/0EAL0n/YeMfTYrxQ3vNZHlm2hP/8KCwWWFj0TYMxupIhkUCK
 DtG0stb3qluMdgIPuyDBomfbWGpihn2ybscxLYVf9NybjeFWFLqzf0uIZ
 ttVBMra0OMqw4JSWUUCnlAgxYQMoYZuNn/jt9EH4BJp4gGXfBc+L2T8em
 pPVl/Dezw0PQZv0j0lUKecabYMiNLyS4szT2OES+WMvJGDOJVaz6I8lE0
 OBMqI0dxqU76uF++yWMN9XXqoJuJrphhqRMxv51LzmLHhvWdp3UwXRYps
 NE9cmY9fJQMHN6Qau8QRu3vZNf1q4I9h/28H27dS3OrwLF3PBgeQ2K6u4 A==;
X-CSE-ConnectionGUID: fczBeh7QToqoltXFZWpEgg==
X-CSE-MsgGUID: X9Og/5DnSmWgfNvxIthwnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="50570674"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="50570674"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 01:36:16 -0700
X-CSE-ConnectionGUID: APYYeaYARMeeSu+vAvnABA==
X-CSE-MsgGUID: tCJjrhGFTTWImwuOZIztHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76495784"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 01:36:15 -0700
Date: Fri, 11 Oct 2024 10:36:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>, lucas.demarchi@intel.com
Subject: Re: [PATCH i-g-t 2/3] lib/igt_sysfs: Add igt_sysfs_{get,set}_s32
Message-ID: <20241011083612.rxr72alhaonj5lza@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 lucas.demarchi@intel.com
References: <20241009123141.86800-1-francois.dugast@intel.com>
 <20241009123141.86800-3-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241009123141.86800-3-francois.dugast@intel.com>
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

Hi Francois,
On 2024-10-09 at 14:28:48 +0200, Francois Dugast wrote:
> Add this family of functions to read and write signed values in sysfs.

imho better:

Add functions to read and write 32-bit signed values in sysfs.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  lib/igt_sysfs.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_sysfs.h |  5 ++++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index b7746a1ec..56279d958 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -873,6 +873,77 @@ void igt_sysfs_set_u32(int dir, const char *attr, uint32_t value)
>  		     "Failed to write %u to %s attribute (%s)\n", value, attr, strerror(errno));
>  }
>  
> +/**
> + * __igt_sysfs_get_s32:
> + * @dir: directory corresponding to attribute
> + * @attr: name of the sysfs node to read
> + * @value: pointer for storing read value
> + *
> + * Convenience wrapper to read a signed 32bit integer from a sysfs file.
> + *
> + * Returns:
> + * True if value successfully read, false otherwise.
> + */
> +bool __igt_sysfs_get_s32(int dir, const char *attr, int32_t *value)
> +{
> +	if (igt_debug_on(igt_sysfs_scanf(dir, attr, "%d", value) != 1))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * igt_sysfs_get_s32:
> + * @dir: directory corresponding to attribute
> + * @attr: name of the sysfs node to read
> + *
> + * Convenience wrapper to read a signed 32bit integer from a sysfs file.
> + * It asserts on failure.
> + *
> + * Returns:
> + * Read value.
> + */
> +int32_t igt_sysfs_get_s32(int dir, const char *attr)
> +{
> +	int32_t value;
> +
> +	igt_assert_f(__igt_sysfs_get_s32(dir, attr, &value),
> +		     "Failed to read %s attribute (%s)\n", attr, strerror(errno));
> +
> +	return value;
> +}
> +
> +/**
> + * __igt_sysfs_set_s32:
> + * @dir: directory corresponding to attribute
> + * @attr: name of the sysfs node to write
> + * @value: value to set
> + *
> + * Convenience wrapper to write a signed 32bit integer to a sysfs file.
> + *
> + * Returns:
> + * True if successfully written, false otherwise.
> + */
> +bool __igt_sysfs_set_s32(int dir, const char *attr, int32_t value)
> +{
> +	return igt_sysfs_printf(dir, attr, "%d", value) > 0;
> +}
> +
> +/**
> + * igt_sysfs_set_s32:
> + * @dir: directory corresponding to attribute
> + * @attr: name of the sysfs node to write
> + * @value: value to set
> + *
> + * Convenience wrapper to write a signed 32bit integer to a sysfs file.
> + * It asserts on failure.
> + */
> +void igt_sysfs_set_s32(int dir, const char *attr, int32_t value)
> +{
> +	igt_assert_f(__igt_sysfs_set_s32(dir, attr, value),
> +		     "Failed to write %d to %s attribute (%s)\n", value, attr, strerror(errno));
> +}
> +
>  /**
>   * __igt_sysfs_get_u64:
>   * @dir: directory corresponding to attribute
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 0ee253826..1bf026bed 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -125,6 +125,11 @@ uint32_t igt_sysfs_get_u32(int dir, const char *attr);
>  bool __igt_sysfs_set_u32(int dir, const char *attr, uint32_t value);
>  void igt_sysfs_set_u32(int dir, const char *attr, uint32_t value);
>  
> +bool __igt_sysfs_get_s32(int dir, const char *attr, int32_t *value);
> +int32_t igt_sysfs_get_s32(int dir, const char *attr);
> +bool __igt_sysfs_set_s32(int dir, const char *attr, int32_t value);
> +void igt_sysfs_set_s32(int dir, const char *attr, int32_t value);
> +
>  bool __igt_sysfs_get_u64(int dir, const char *attr, uint64_t *value);
>  uint64_t igt_sysfs_get_u64(int dir, const char *attr);
>  bool __igt_sysfs_set_u64(int dir, const char *attr, uint64_t value);
> -- 
> 2.43.0
> 
