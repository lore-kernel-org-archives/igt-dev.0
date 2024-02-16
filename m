Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF73C48BEB
	for <igt-dev@archiver.kernel.org>; Fri, 16 Feb 2024 10:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A192510E54B;
	Fri, 16 Feb 2024 10:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uzv8LyiZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6FD10E54B
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2024 10:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708079045; x=1739615045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3EHer1QqcoWvC1Jt2JXlBjGdz6YqrKMrZtn/EexoUMQ=;
 b=Uzv8LyiZCSZKtgqtFMnGCvxHHCPVnUFhYxTkJETXW3VfUhw9pN5oXyGs
 cIx1GqZq9XgZlOAXXVpkJewhtwWgev87lFenPCcmMEft7+fPKS1GE+Mk7
 4Xdojb31ezNZu93v1AjSZ0Gj9nD/bsUr3TjzjUZ3/nDhcWwX3iTsAHOuY
 FRQzBrCA45QN05CI2fNvSmCNiXGviMDjREvtT41Y0mJNs/0ATvnuqjzUY
 +ikQnfcLrS4WXru74auxrsZBMB9SDBKGR5aOrfpMPe76MJVmqfSJmxGvM
 BMsXcgM3xi+o4G3EM/9iDJ4QuEm8sDu3M4ni/wmjS8u9UsuZ9HGZMsurf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2109748"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2109748"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 02:24:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; d="scan'208";a="34848537"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.3.245])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 02:24:01 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Dominik Karol =?utf-8?B?UGnEhXRrb3dza2k=?=
 <dominik.karol.piatkowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v9 2/7] lib/drmtest: Introduced
 drm_open_driver_another
Date: Fri, 16 Feb 2024 11:23:58 +0100
Message-ID: <2552026.vzjCzTo3RI@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240215161014.60304-3-kamil.konieczny@linux.intel.com>
References: <20240215161014.60304-1-kamil.konieczny@linux.intel.com>
 <20240215161014.60304-3-kamil.konieczny@linux.intel.com>
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

Hi Kamil, Dominik,

On Thursday, 15 February 2024 17:10:09 CET Kamil Konieczny wrote:
> From: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@intel.com>
>=20
> For user convenience, introduce drm_open_driver_another as
> a wrapper for __drm_open_driver_another with successful open
> assert.

Out of several existing variants of *drm_open_driver* functions, those whic=
h=20
names start with "drm_", wrapped around their counterparts which names star=
t=20
with double underscores, used to set up an exit handler that performs=20
necessary cleanups before exit, freeing users from taking care of that.  Do=
n't=20
we want to keep that convention also for drm_open_driver_another() and set =
up=20
the exit handler from inside that wrapper on success?

Thanks,
Janusz

>=20
> v2: rebased (Kamil)
> v6: reword description (Janusz)
>=20
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> ---
>  lib/drmtest.c | 19 +++++++++++++++++++
>  lib/drmtest.h |  1 +
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 52b5a2020..73d9159af 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -563,6 +563,25 @@ int __drm_open_driver_another(int idx, int chipset)
>  	return fd;
>  }
> =20
> +/*
> + * drm_open_driver_another
> + * @idx: index of the device you are opening
> + * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> + *
> + * A wrapper for __drm_open_driver with successful open assert.
> + *
> + * Returns:
> + * An open DRM fd
> + */
> +int drm_open_driver_another(int idx, int chipset)
> +{
> +	int fd =3D __drm_open_driver_another(idx, chipset);
> +
> +	igt_assert_fd(fd);
> +
> +	return fd;
> +}
> +
>  /**
>   * __drm_open_driver:
>   * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 6bc819734..856208c48 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -101,6 +101,7 @@ void __set_forced_driver(const char *name);
> =20
>  int __drm_open_device(const char *name, unsigned int chipset);
>  void drm_load_module(unsigned int chipset);
> +int drm_open_driver_another(int idx, int chipset);
>  int drm_open_driver(int chipset);
>  int drm_open_driver_master(int chipset);
>  int drm_open_driver_render(int chipset);
>=20




