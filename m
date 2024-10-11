Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A743D0EE19
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 17:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0789310EBBB;
	Fri, 11 Oct 2024 17:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcRSNCJb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B603710EBBD
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 17:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728667846; x=1760203846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RaX/RVRKoXxO7JKaEtqOtNJdeLRSsAHyOQAeCnKT8Yo=;
 b=IcRSNCJbnQZYoGDjBTFkju+wmkak9BatMB+erf6efkAtIRdNZjXL0lxr
 AylWzdqcrQVM/S8eGEfbUWpzoEAMh2K5rmgHM9e9zERvrF3BLvBC6pAYf
 xTNQhRUumfig9JjybD1Vgw1LslsUpf19kV9YPqmke2ACMOP2zXmmTPKzb
 X6Azf66JBx+Tqm/I1vzu4oUYuwulXBuK78RtVZ2So5bHsQqZfA5AXzT1C
 Tgfa7NcF+HMhVLRwrGWIJDe0rPAwQO5C2vwJahVpzaRVTTt75TTEsm0h4
 Mb6Muuo8wHm6NyIcZMIh82L/Zw1JQMebbQDDl+OG8ccTPhkzNF95G/P0d w==;
X-CSE-ConnectionGUID: V8WQdx3PRcuGdoI8E+0CUw==
X-CSE-MsgGUID: kUosAlggRte5p+mJ9ByTJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28183942"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="28183942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 10:30:45 -0700
X-CSE-ConnectionGUID: NlGxeFAdSTuo95+b8VM0/Q==
X-CSE-MsgGUID: Yk+vHzJrSSy9zJAUSsHyLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="76866053"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 10:30:45 -0700
Date: Fri, 11 Oct 2024 19:30:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t 3/5] lib/igt_power: Add power_supply/BAT based
 measurement
Message-ID: <20241011173042.4b3p6vwzb2nb5ykn@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
References: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
 <20240916201841.29592-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240916201841.29592-4-ville.syrjala@linux.intel.com>
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

Hi Ville,
On 2024-09-16 at 23:18:39 +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Allow measuring total system power via the power_supply class
> stuff in sysfs (typically the information there comes from ACPI).
> 
> There are two types of batteries:
> - reports remaining capacity in uWh (energy_now)
> - reports remaining capacity in uAh (charge_now)
> 
> The first type is easier since we just have to convert to
> uJ. The second type is less convenient since we also need
> the voltage to determine energy. For that we just multiply
> with voltage_now (in uV) when sampling charge_now. Obviously
> this isn't entirely correct (should integrate instead), but
> I think it's close enough to be useful.
> 
> Also one should keep in mind that the battery reports remaining
> energy, not consumed energy. So we have to flip stuff around when
> calculating things. Another alternative would be flip already
> when measuring (eg. {charge,energy}_full_design - {charge,energy}_now),
> but that seems more of a hassle really.
> 
> TODO: maybe confirm that the AC adapter is unplugged and the
> battery is actually reporting to discharge before we start?
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_power.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_power.h |  5 ++++-
>  2 files changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_power.c b/lib/igt_power.c
> index e891da87acf3..a3e8ee588365 100644
> --- a/lib/igt_power.c
> +++ b/lib/igt_power.c
> @@ -85,6 +85,21 @@ static inline void rapl_close(struct rapl *r)
>  	r->fd = -1;
>  }
>  
> +static uint64_t bat_get_energy(int fd)
> +{
> +	if (igt_sysfs_has_attr(fd, "energy_now")) {
> +		/* uWh -> uJ */
> +		return 3600 *
> +			igt_sysfs_get_u64(fd, "energy_now");
> +	} else {
> +		/* uAh * uV -> uJ */
> +		return 3600 *
> +			igt_sysfs_get_u64(fd, "charge_now") *
> +			igt_sysfs_get_u64(fd, "voltage_now") /
> +			1000000;
> +	}
> +}
> +
>  /**
>   * igt_power_open:
>   * @fd : device fd
> @@ -103,6 +118,7 @@ int igt_power_open(int fd, struct igt_power *p, const char *domain)
>  	int i;
>  
>  	p->hwmon_fd = -1;
> +	p->bat_fd = -1;
>  	p->rapl.fd = -1;
>  
>  	if (fd >= 0 && is_intel_dgfx(fd)) {
> @@ -140,6 +156,8 @@ void igt_power_get_energy(struct igt_power *power, struct power_sample *s)
>  	if (power->hwmon_fd >= 0) {
>  		if (igt_sysfs_has_attr(power->hwmon_fd, "energy1_input"))
>  			s->energy = igt_sysfs_get_u64(power->hwmon_fd, "energy1_input");
> +	} else if (power->bat_fd >= 0) {
> +		s->energy = bat_get_energy(power->bat_fd);
>  	} else if (power->rapl.fd >= 0) {
>  		rapl_read(&power->rapl, s);
>  	}
> @@ -160,6 +178,8 @@ double igt_power_get_mJ(const struct igt_power *power,
>  {
>  	if (power->hwmon_fd >= 0)
>  		return (p1->energy - p0->energy) * 1e-3;
> +	else if (power->bat_fd >= 0)
> +		return (p0->energy - p1->energy) * 1e-3; /* battery measures remaining energy */
>  	else if (power->rapl.fd >= 0)
>  		return ((p1->energy - p0->energy) *  power->rapl.scale) * 1e3;
>  
> @@ -207,7 +227,47 @@ void igt_power_close(struct igt_power *power)
>  	if (power->hwmon_fd >= 0) {
>  		close(power->hwmon_fd);
>  		power->hwmon_fd = -1;
> +	} else if (power->bat_fd >= 0) {
> +		close(power->bat_fd);
> +		power->bat_fd = -1;
>  	} else if (power->rapl.fd >= 0) {
>  		rapl_close(&power->rapl);
>  	}
>  }
> +
> +/**
> + * igt_power_bat_open:
> + * @igt_power : power struct
> + * @index: battery index
> + *
> + * opens the power_supply fd based on battery index
> + *
> + * Returns
> + * 0 on success, errno otherwise

imho -1 in case of error?

> + */
> +int igt_power_bat_open(struct igt_power *p, int index)
> +{
> +	char path[64];
> +	int fd;
> +
> +	p->hwmon_fd = -1;
> +	p->bat_fd = -1;
> +	p->rapl.fd = -1;
> +
> +	snprintf(path, sizeof(path), "/sys/class/power_supply/BAT%d", index);
> +
> +	fd = open(path, O_RDONLY | O_DIRECTORY);
> +	if (fd < 0)
> +		return fd;
> +
> +	if (!igt_sysfs_has_attr(fd, "energy_now") &&
> +	    !(igt_sysfs_has_attr(fd, "charge_now") &&
> +	      igt_sysfs_has_attr(fd, "voltage_now"))) {
> +		close(fd);

Add newline before return.

With this fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +		return -1;
> +	}
> +
> +	p->bat_fd = fd;
> +
> +	return 0;
> +}
> diff --git a/lib/igt_power.h b/lib/igt_power.h
> index 68a05300eec2..853b0fae815a 100644
> --- a/lib/igt_power.h
> +++ b/lib/igt_power.h
> @@ -42,14 +42,17 @@ struct power_sample {
>  struct igt_power {
>  	struct rapl rapl;
>  	int hwmon_fd;
> +	int bat_fd;
>  };
>  
>  int igt_power_open(int i915, struct igt_power *p, const char *domain);
>  void igt_power_close(struct igt_power *p);
>  
> +int igt_power_bat_open(struct igt_power *p, int index);
> +
>  static inline bool igt_power_valid(struct igt_power *p)
>  {
> -	return (p->rapl.fd >= 0) || (p->hwmon_fd >= 0);
> +	return p->rapl.fd >= 0 || p->hwmon_fd >= 0 || p->bat_fd >= 0;
>  }
>  
>  void igt_power_get_energy(struct igt_power *p, struct power_sample *s);
> -- 
> 2.44.2
> 
