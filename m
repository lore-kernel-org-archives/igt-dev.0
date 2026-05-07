Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25F5CD3442
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 10:39:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AF610E27C;
	Thu,  7 May 2026 10:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRrnnpvN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEF010E27C
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778150351; x=1809686351;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yqcx40DSNhYDmyrM+ON/C5whg820mSSBfGwTGhips9c=;
 b=XRrnnpvNKqea7wXP4oqnkuw9MpRjP07KN9HK3uP2udufiCzaRH/Xt8AT
 PIjnktvJC4Ivs7xdte2QUNjf7PVuTUq2ev5xAPOZuxnwfzmtEXYuPQS0j
 n73yoXztx9JUN9h76H5YpeHBJz9YMiF1ymYlCVBSwWnybWFVHlrT2jYCs
 v6sqEF+6Kv1XTgTvPb1TGeNG95L9wccL8BBUDxOtYiTctuo3LF1S+oddl
 0jhRxEilKfWjKVBiEMea3Vlk+u84g/mdVnSjToOCYyrWb+8wcT7lOc8HI
 mulEwiwMamv3wrqddho0jkbOG6cCvn/jdqhyCgzMavc2tTBQnTxyPODJs g==;
X-CSE-ConnectionGUID: TGA3QmgkTHCBjtr/AGFIjQ==
X-CSE-MsgGUID: vOpTFCCOTlmk2jGlQHfYHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82942238"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="82942238"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 03:39:10 -0700
X-CSE-ConnectionGUID: q4CNHYHuSt+jdyGJvU1V8w==
X-CSE-MsgGUID: GhVbaxJcRXeA3RnQBbuN2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="236538087"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.157])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 03:39:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Karthik B S <karthik.b.s@intel.com>, Zbigniew
 =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v5] lib/drmtest: Create proper error report when
 open driver fails
In-Reply-To: <20260507101705.fgeuwhg25qyuwtcn@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260506160952.202178-1-kamil.konieczny@linux.intel.com>
 <63c00ec34cce023362186981011d3fdb1d64fbe3@intel.com>
 <20260507101705.fgeuwhg25qyuwtcn@kamilkon-DESK.igk.intel.com>
Date: Thu, 07 May 2026 13:39:04 +0300
Message-ID: <c528304d2c245e3d8d58e188270de3758a5fcc37@intel.com>
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

On Thu, 07 May 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> Hi Jani,
> On 2026-05-07 at 12:20:32 +0300, Jani Nikula wrote:
>> On Wed, 06 May 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> w=
rote:
>> > When first try for opening driver fails then opening function is
>> > searching for next available device. When that also fails
>> > reporting is printing last errno which could mislead developer:
>> >
>> > $ build/tests/kms_dp_aux_dev
>> > IGT-Version: 2.3-NO-GIT (x86_64) (Linux: 6.17.0-19-generic x86_64)
>> > Test requirement not met in function drm_open_driver, file ../lib/drmt=
est.c:754:
>> > Test requirement: !(fd<0)
>> > No known gpu found for chipset flags 0x4294965755 (any)
>> > Last errno: 2, No such file or directory
>> > SKIP (0.006s)
>> >
>> > ls /dev/dri
>> > by-path  card1  renderD128
>> >
>> > The real problem here is lack of permissions as there was a card
>> > but program could not open it. Break looking for a card as soon
>> > as an error is different from ENOENT. It will create a proper
>> > error report which will print:
>> >
>> > Last errno: 13, Permission denied
>> >
>> > v3: break only when errno actually happens in open() (Kamil)
>> > v4: removed 'else', removed errno printing (Zbigniew)
>> > v5: use explicit strerror() (Kamil)
>> >
>> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > Cc: Karthik B S <karthik.b.s@intel.com>
>> > Cc: "Zbigniew Kempczy=C5=84ski" <zbigniew.kempczynski@intel.com>
>> > Cc: Jani Nikula <jani.nikula@intel.com>
>> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> > ---
>> >  lib/drmtest.c          | 26 +++++++++++++++++++++-----
>> >  lib/drmtest.h          |  2 +-
>> >  lib/igt_sriov_device.c |  2 +-
>> >  3 files changed, 23 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/lib/drmtest.c b/lib/drmtest.c
>> > index 4a788ea7a..084737edf 100644
>> > --- a/lib/drmtest.c
>> > +++ b/lib/drmtest.c
>> > @@ -323,6 +323,7 @@ static void log_opened_device_path(const char *dev=
ice_path)
>> >   * __drm_open_device:
>> >   * @name: DRM node name
>> >   * @chipset: OR'd flags for chipset to be opened
>> > + * @error: pointer for saving errno when open() fails
>> >   *
>> >   * Open a drm legacy device node with given @name and compatible with=
 given
>> >   * @chipset flag.
>> > @@ -334,8 +335,10 @@ static void log_opened_device_path(const char *de=
vice_path)
>> >   * name, even when driver was excluded by ANY or is not listed in kno=
wn drivers.
>> >   *
>> >   * Returns: DRM file descriptor or -1 on error
>> > + *
>> > + * When open() succeeds, sets @error to zero otherwise to errno
>> >   */
>> > -int __drm_open_device(const char *name, unsigned int chipset)
>> > +int __drm_open_device(const char *name, unsigned int chipset, int *er=
ror)
>>=20
>> Why can't you just return -errno? I think this is unnecessarily
>> complicated.
>
> This function returns -1 also in other cases, when open succeeds
> but chipset or IGT_FORCE_DRIVER was not matched.=20
>
> It could be negative number meaning an error when it will use
> few more internal error codes like:
>
> -190  chipset not matched
> -191  forced driver not matched
> -errno -1...-133 for open() failed
>
> There are few places where there are checks for -1, they
> will need a change. When using that solution we could not call
> strerror(errnum), or should we create igterror(errnum)?

Do we need to differentiate on where the error originated really? Just
return sensible errno codes on all issues?

BR,
Jani.

>
> Regards,
> Kamil
>
>>=20
>> BR,
>> Jani.
>>=20
>> >  {
>> >  	const char *forced;
>> >  	char dev_name[16] =3D "";
>> > @@ -343,8 +346,15 @@ int __drm_open_device(const char *name, unsigned =
int chipset)
>> >  	int fd;
>> >=20=20
>> >  	fd =3D open(name, O_RDWR);
>> > -	if (fd =3D=3D -1)
>> > +	if (fd =3D=3D -1) {
>> > +		if (error)
>> > +			*error =3D errno;
>> > +
>> >  		return -1;
>> > +	}
>> > +
>> > +	if (error)
>> > +		*error =3D 0;
>> >=20=20
>> >  	if (__get_drm_device_name(fd, dev_name, sizeof(dev_name) - 1) =3D=3D=
 -1)
>> >  		goto err;
>> > @@ -426,6 +436,7 @@ static bool _is_already_opened(const char *path, i=
nt as_idx)
>> >  static int __search_and_open(const char *base, int offset, unsigned i=
nt chipset, int as_idx)
>> >  {
>> >  	const char *forced;
>> > +	int err;
>> >=20=20
>> >  	forced =3D forced_driver();
>> >  	if (forced)
>> > @@ -440,9 +451,14 @@ static int __search_and_open(const char *base, in=
t offset, unsigned int chipset,
>> >  		if (_is_already_opened(name, as_idx))
>> >  			continue;
>> >=20=20
>> > -		fd =3D __drm_open_device(name, chipset);
>> > +		fd =3D __drm_open_device(name, chipset, &err);
>> >  		if (fd !=3D -1)
>> >  			return fd;
>> > +
>> > +		if (err) {
>> > +			igt_debug("Error at open %s %s\n", name, strerror(err));
>> > +			break;
>> > +		}
>> >  	}
>> >=20=20
>> >  	return -1;
>> > @@ -500,13 +516,13 @@ static int __open_driver_exact(const char *name,=
 unsigned int chipset)
>> >  {
>> >  	int fd;
>> >=20=20
>> > -	fd =3D __drm_open_device(name, chipset);
>> > +	fd =3D __drm_open_device(name, chipset, NULL);
>> >  	if (fd !=3D -1)
>> >  		return fd;
>> >=20=20
>> >  	drm_load_module(chipset);
>> >=20=20
>> > -	return __drm_open_device(name, chipset);
>> > +	return __drm_open_device(name, chipset, NULL);
>> >  }
>> >=20=20
>> >  /*
>> > diff --git a/lib/drmtest.h b/lib/drmtest.h
>> > index 37874d729..126feffda 100644
>> > --- a/lib/drmtest.h
>> > +++ b/lib/drmtest.h
>> > @@ -117,7 +117,7 @@ unsigned int drm_get_chipset(int fd);
>> >   */
>> >  #define IS_ALIGNED(v, a)	(((v) & ((typeof(v))(a) - 1)) =3D=3D 0)
>> >=20=20
>> > -int __drm_open_device(const char *name, unsigned int chipset);
>> > +int __drm_open_device(const char *name, unsigned int chipset, int *er=
ror);
>> >  void drm_load_module(unsigned int chipset);
>> >  int drm_open_driver_another(int idx, int chipset);
>> >  int drm_open_driver(int chipset);
>> > diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
>> > index 1f4c3ac04..21d23298b 100644
>> > --- a/lib/igt_sriov_device.c
>> > +++ b/lib/igt_sriov_device.c
>> > @@ -284,7 +284,7 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned =
int vf_num)
>> >  	if (!found)
>> >  		return -1;
>> >=20=20
>> > -	fd =3D __drm_open_device(dev_name, DRIVER_ANY);
>> > +	fd =3D __drm_open_device(dev_name, DRIVER_ANY, NULL);
>> >  	if (fd >=3D 0 && is_xe_device(fd))
>> >  		xe_device_get(fd);
>>=20
>> --=20
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
