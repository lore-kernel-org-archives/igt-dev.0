Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12953CD3442
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 09:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC44D10E56E;
	Thu,  7 May 2026 09:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mvkl74o7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093D110E56E
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 09:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778145637; x=1809681637;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=jK2HXWhIkXdk3zr7XvPXTcfNoyAmhOvmuS/XOTcTf4M=;
 b=mvkl74o7HYq01Cxr2Bjz0iSXDuRr0l0ZjcGOdASthFxBPbvJMw5OJY/G
 4pcsBRL9vBLHQN7BpukZWRc5tru8DLyAdDj7jirsDd49vzaPuCu+iVmvX
 1EwGj6YFJoWECKtAMZTRpnR0yHSlaqyJkjl+PIJJ/oOAQqbzth5M2+TXw
 GtlipWHHgkfCXrOvrC9dD8z6bqNMCHAJq35zwX49Anh3o4NxSTpv3YSy8
 svE3Ga72bCZpMQbFnIl6vCpQZVyhamidjFsK2TTVyebmUHfyXUjeh58HI
 NGgL8Os98InP9VidbUbYZx3QkuGdq/GwbbW+PBpqpIxTevi8A/IftCKZh Q==;
X-CSE-ConnectionGUID: JYpa10yrRAOI9cH3NsM3SA==
X-CSE-MsgGUID: A4e/+96sRfWq4CZkobJESA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82936357"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="82936357"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 02:20:36 -0700
X-CSE-ConnectionGUID: Mx3fAHl3RUCjGB7PJuAi5g==
X-CSE-MsgGUID: 9NnIGLW4QOihjB0JmD1gig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="241395571"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.150])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 02:20:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Karthik B S <karthik.b.s@intel.com>, Zbigniew
 =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v5] lib/drmtest: Create proper error report when
 open driver fails
In-Reply-To: <20260506160952.202178-1-kamil.konieczny@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260506160952.202178-1-kamil.konieczny@linux.intel.com>
Date: Thu, 07 May 2026 12:20:32 +0300
Message-ID: <63c00ec34cce023362186981011d3fdb1d64fbe3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 06 May 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> When first try for opening driver fails then opening function is
> searching for next available device. When that also fails
> reporting is printing last errno which could mislead developer:
>
> $ build/tests/kms_dp_aux_dev
> IGT-Version: 2.3-NO-GIT (x86_64) (Linux: 6.17.0-19-generic x86_64)
> Test requirement not met in function drm_open_driver, file ../lib/drmtest=
.c:754:
> Test requirement: !(fd<0)
> No known gpu found for chipset flags 0x4294965755 (any)
> Last errno: 2, No such file or directory
> SKIP (0.006s)
>
> ls /dev/dri
> by-path  card1  renderD128
>
> The real problem here is lack of permissions as there was a card
> but program could not open it. Break looking for a card as soon
> as an error is different from ENOENT. It will create a proper
> error report which will print:
>
> Last errno: 13, Permission denied
>
> v3: break only when errno actually happens in open() (Kamil)
> v4: removed 'else', removed errno printing (Zbigniew)
> v5: use explicit strerror() (Kamil)
>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c          | 26 +++++++++++++++++++++-----
>  lib/drmtest.h          |  2 +-
>  lib/igt_sriov_device.c |  2 +-
>  3 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 4a788ea7a..084737edf 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -323,6 +323,7 @@ static void log_opened_device_path(const char *device=
_path)
>   * __drm_open_device:
>   * @name: DRM node name
>   * @chipset: OR'd flags for chipset to be opened
> + * @error: pointer for saving errno when open() fails
>   *
>   * Open a drm legacy device node with given @name and compatible with gi=
ven
>   * @chipset flag.
> @@ -334,8 +335,10 @@ static void log_opened_device_path(const char *devic=
e_path)
>   * name, even when driver was excluded by ANY or is not listed in known =
drivers.
>   *
>   * Returns: DRM file descriptor or -1 on error
> + *
> + * When open() succeeds, sets @error to zero otherwise to errno
>   */
> -int __drm_open_device(const char *name, unsigned int chipset)
> +int __drm_open_device(const char *name, unsigned int chipset, int *error)

Why can't you just return -errno? I think this is unnecessarily
complicated.

BR,
Jani.

>  {
>  	const char *forced;
>  	char dev_name[16] =3D "";
> @@ -343,8 +346,15 @@ int __drm_open_device(const char *name, unsigned int=
 chipset)
>  	int fd;
>=20=20
>  	fd =3D open(name, O_RDWR);
> -	if (fd =3D=3D -1)
> +	if (fd =3D=3D -1) {
> +		if (error)
> +			*error =3D errno;
> +
>  		return -1;
> +	}
> +
> +	if (error)
> +		*error =3D 0;
>=20=20
>  	if (__get_drm_device_name(fd, dev_name, sizeof(dev_name) - 1) =3D=3D -1)
>  		goto err;
> @@ -426,6 +436,7 @@ static bool _is_already_opened(const char *path, int =
as_idx)
>  static int __search_and_open(const char *base, int offset, unsigned int =
chipset, int as_idx)
>  {
>  	const char *forced;
> +	int err;
>=20=20
>  	forced =3D forced_driver();
>  	if (forced)
> @@ -440,9 +451,14 @@ static int __search_and_open(const char *base, int o=
ffset, unsigned int chipset,
>  		if (_is_already_opened(name, as_idx))
>  			continue;
>=20=20
> -		fd =3D __drm_open_device(name, chipset);
> +		fd =3D __drm_open_device(name, chipset, &err);
>  		if (fd !=3D -1)
>  			return fd;
> +
> +		if (err) {
> +			igt_debug("Error at open %s %s\n", name, strerror(err));
> +			break;
> +		}
>  	}
>=20=20
>  	return -1;
> @@ -500,13 +516,13 @@ static int __open_driver_exact(const char *name, un=
signed int chipset)
>  {
>  	int fd;
>=20=20
> -	fd =3D __drm_open_device(name, chipset);
> +	fd =3D __drm_open_device(name, chipset, NULL);
>  	if (fd !=3D -1)
>  		return fd;
>=20=20
>  	drm_load_module(chipset);
>=20=20
> -	return __drm_open_device(name, chipset);
> +	return __drm_open_device(name, chipset, NULL);
>  }
>=20=20
>  /*
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 37874d729..126feffda 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -117,7 +117,7 @@ unsigned int drm_get_chipset(int fd);
>   */
>  #define IS_ALIGNED(v, a)	(((v) & ((typeof(v))(a) - 1)) =3D=3D 0)
>=20=20
> -int __drm_open_device(const char *name, unsigned int chipset);
> +int __drm_open_device(const char *name, unsigned int chipset, int *error=
);
>  void drm_load_module(unsigned int chipset);
>  int drm_open_driver_another(int idx, int chipset);
>  int drm_open_driver(int chipset);
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index 1f4c3ac04..21d23298b 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -284,7 +284,7 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int=
 vf_num)
>  	if (!found)
>  		return -1;
>=20=20
> -	fd =3D __drm_open_device(dev_name, DRIVER_ANY);
> +	fd =3D __drm_open_device(dev_name, DRIVER_ANY, NULL);
>  	if (fd >=3D 0 && is_xe_device(fd))
>  		xe_device_get(fd);

--=20
Jani Nikula, Intel
