Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A70BCD11BF
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 19:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A95C10FF29;
	Wed, 20 Mar 2024 19:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZ1zF5DX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E713410FF29
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 19:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710964077; x=1742500077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5UkRiWuaQIuv/ZgEcQhkk1km6OFR5AzoESnBDtNEATc=;
 b=SZ1zF5DXOKtFsJ5QbT9AMok/3DjhxaFyN4EQ76w1swj+vmSsYXRRsgEp
 BVSmX0sWCajtzU6/YICCh8uPaVL4DA/4c926IWh1ATQ9xWL8gzqPEgPXG
 3VNctFmAtno8rG6bESSQZfwTX6hlp8UbHk29PduEcbK8isxNj86kE+ymD
 9ideA1ZN8gIrd5qTPPu2DW703MrQfGVzHC9z9g5jxlkYKs6TfcFlBBJvj
 jxKQ6T5JVZ8RdItOO7p1EDD5u+yq/YQn3CXL08yacnwsgfcrD/A/d6uIv
 JXf6EFb+v+fys4kUJ9WdxzSVsvdtPBD9DUc8quKawP9vLJ5YS7jSICuBd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6525232"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="6525232"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:47:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="18898174"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.7.80])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 12:47:55 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Dominik Karol =?utf-8?B?UGnEhXRrb3dza2k=?=
 <dominik.karol.piatkowski@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v14 1/5] lib/igt_device_scan: Introduce filtering out
 non-PCI devices
Date: Wed, 20 Mar 2024 20:47:52 +0100
Message-ID: <2447445.rnzLaay6km@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240320155659.33518-2-kamil.konieczny@linux.intel.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
 <20240320155659.33518-2-kamil.konieczny@linux.intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wednesday, 20 March 2024 16:56:55 CET Kamil Konieczny wrote:
> From: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@intel.com>
>=20
> Introduced igt_device_filter_pci function that filters out non-PCI
> devices from IGT devices. This will help with checking multi-GPU
> tests after they skip due to detected only one GPU, in that case
> one can verify it after printing what GPUs are really on PCI bus.
> Such errors can happen when using wrong env IGT_DEVICE filter.
>=20
> v6: extending description
> v9: fix memory leak in loop (Zbigniew)
>=20
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_device_scan.c | 23 +++++++++++++++++++++++
>  lib/igt_device_scan.h |  2 ++
>  2 files changed, 25 insertions(+)
>=20
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index fbf3fa482..9a2da3d62 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -1908,6 +1908,29 @@ const char *igt_device_filter_get(int num)
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

NIT: Code style: Taking into account the general IGT rule of following kern=
el=20
rules where applicable, don't we want to use reverse Christmas tree orderin=
g=20
of local variable declarations, which is recognized as making the code easi=
er=20
to read, if there are no reasons to order them in a different way?

Anyway,
Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> +
> +	igt_list_for_each_entry_safe(dev, tmp, &igt_devs.filtered, link)
> +		if (strcmp(dev->subsystem, "pci") !=3D 0) {
> +			igt_list_del(&dev->link);
> +			free(dev);
> +		} else {
> +			count++;
> +		}
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




