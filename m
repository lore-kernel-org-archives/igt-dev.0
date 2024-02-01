Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F181FC47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 11:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A178210E9DE;
	Thu,  1 Feb 2024 11:23:41 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 11:23:40 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF8310EAC3
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 11:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706786621; x=1738322621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e6Jn/yGmc5xGnidsd3p7vFWGsR8DRa94FH31vMVkIhU=;
 b=ccAb6sOySPZI9XQBifSadN1rgZTGVv7R5Ohgp20LIovJNmkSnZmkyLHV
 J8tMF1tXL4OcLyAMf4kJ/4z3tQ7K8K4SpiJG0M8vhE5H5/k/wHHQO0jRf
 A15UfV6zpxQAJ1n2rm41VSMwwv9DGClC7+ulQltZuhX7jdcvE8UweXdRO
 mqcOkxv6rQGK73OIP+fbS7GEOeanXx5akNfkwNztT8OnTwfoNSQX0XdHR
 sH6rwE26t9ZJFoc7tsmLZ0Y++usfTDjpTk/gOHJmRugEReNdo7n1B8OsK
 kKhF19QH427lHeTj2lENfBmAEWWIeU1y3ZJCM3113LwicQDbWZ9tGO5PG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="53546"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="53546"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4396833"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.1.219])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:16:31 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v5 2/8] lib/drmtest: Introduced
 drm_open_driver_another
Date: Thu, 01 Feb 2024 12:16:28 +0100
Message-ID: <1754999.vCJZsxu672@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240130170722.44828-3-kamil.konieczny@linux.intel.com>
References: <20240130170722.44828-1-kamil.konieczny@linux.intel.com>
 <20240130170722.44828-3-kamil.konieczny@linux.intel.com>
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

On Tuesday, 30 January 2024 18:07:16 CET Kamil Konieczny wrote:
> From: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@intel.com>
>=20
> Introduced drm_open_driver_another as a wrapper for
> __drm_open_driver_another with successful open assert.

The missing "why" part of commit description could be as simple as "For use=
r=20
convenience, introduce ...".

Thanks,
Janusz

>=20
> v2: rebased (Kamil)
>=20
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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




