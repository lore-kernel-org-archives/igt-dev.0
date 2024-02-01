Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EECC47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 11:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54B510E372;
	Thu,  1 Feb 2024 11:12:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8302C10E372
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706785922; x=1738321922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hr/Q9SkQzwEMRIUO0u13R/KDr1vDZ+MiUNc/SJ3daBQ=;
 b=hM8Vg4L3n3EhNa7VZjnI1JBO0L0/80wtYJQITdRSEvg+X2HbGD6a6u0s
 51kBC97oSQI137czhwp+i2bDB3avn5kWZZHqhklnUdg0okjbNxhZ45TBW
 F4ZqFgMOEJDxqNbFLMRqz0RRWVdvWmQ2syr7none3pkQDTyW0OKlWEcFy
 OIR68rFgWQGYmCUfiuOIYuv7VyFDjTmzkPax2ouM8ekb3SzT22ISjXYgy
 YT/nYBJBNKLp9e+8Lvvr5580EHxWrNf+6fFFXtQOFt4NenxIi417CQSh6
 26L5U5ef4UhazTRqHWftycdz0oYFcv2cJ24KdxBlulHVJJ9zZrMqqqPkM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="22370757"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="22370757"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:12:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="77976"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.1.219])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:11:59 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 1/8] lib/igt_device_scan: Introduce filtering out
 non-PCI devices
Date: Thu, 01 Feb 2024 12:11:56 +0100
Message-ID: <3890547.fW5hKsROvD@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240130170722.44828-2-kamil.konieczny@linux.intel.com>
References: <20240130170722.44828-1-kamil.konieczny@linux.intel.com>
 <20240130170722.44828-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Kamil, Dominik,

On Tuesday, 30 January 2024 18:07:15 CET Kamil Konieczny wrote:
> From: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@intel.com>
>=20
> Introduced igt_device_filter_pci function that filters out non-PCI
> devices from IGT devices.

=46or me, an important "why" part of commit description is missing.

Thanks,
Janusz

>=20
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_device_scan.c | 21 +++++++++++++++++++++
>  lib/igt_device_scan.h |  2 ++
>  2 files changed, 23 insertions(+)
>=20
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index fbf3fa482..37ebe1964 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1908,6 +1908,27 @@ const char *igt_device_filter_get(int num)
>  	return NULL;
>  }
> =20
> +/**
> + * igt_device_filter_pci
> + *
> + * Filter devices to PCI only.
> + *
> + * Returns PCI devices count.
> + */
> +int igt_device_filter_pci(void)
> +{
> +	int count =3D 0;
> +	struct igt_device *dev, *tmp;
> +
> +	igt_list_for_each_entry_safe(dev, tmp, &igt_devs.filtered, link)
> +		if (strcmp(dev->subsystem, "pci") !=3D 0)
> +			igt_list_del(&dev->link);
> +		else
> +			count++;
> +
> +	return count;
> +}
> +
>  static bool igt_device_filter_apply(const char *fstr)
>  {
>  	struct igt_device *dev, *tmp;
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index 48690e236..908733745 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -81,6 +81,8 @@ int igt_device_filter_add(const char *filter);
>  void igt_device_filter_free_all(void);
>  const char *igt_device_filter_get(int num);
> =20
> +int igt_device_filter_pci(void);
> +
>  /* Use filter to match the device and fill card structure */
>  bool igt_device_card_match(const char *filter, struct igt_device_card *c=
ard);
>  bool igt_device_card_match_pci(const char *filter,
>=20




