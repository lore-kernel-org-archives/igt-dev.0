Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D5C10E533
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 10:23:21 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Mon, 14 Feb 2022 10:23:11 +0000
Message-ID: <60fd1652892e4bd8908467ca74745d1b@intel.com>
References: <20211025092305.14742-1-anshuman.gupta@intel.com>
 <20211025092305.14742-2-anshuman.gupta@intel.com>
 <877da01zro.wl-ashutosh.dixit@intel.com>
In-Reply-To: <877da01zro.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib: Add silent
 __igt_i915_driver_unload
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Wilson,
 Chris P" <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Saturday, February 12, 2022 9:51 AM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Wilson, Chris P <chris.p.wilson@intel.=
com>;
> Nilawar, Badal <badal.nilawar@intel.com>; janusz.krzysztofik@linux.intel.=
com
> Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib: Add silent __igt_i915_drive=
r_unload
>=20
> On Mon, 25 Oct 2021 02:23:04 -0700, Anshuman Gupta wrote:
> >
> > Add silent __igt_i915_driver_unload(), which will not print any
> > warning in case of passed argument is NULL.
>=20
> I think we need to add a "why" to this commit message and that is "so tha=
t we
> can test scenarios when module unload is expected to fail".
Thanks Ashutosh for review,  I will add reason for doing this.
>=20
> >
> > Cc: Chris Wilson <chris.p.wilson@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  lib/igt_kmod.c | 86
> > ++++++++++++++++++++++++++++++--------------------
> >  lib/igt_kmod.h |  1 +
> >  2 files changed, 52 insertions(+), 35 deletions(-)
> >
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c index
> > 10e983844..ce9bfc07a 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -369,56 +369,72 @@ igt_i915_driver_load(const char *opts)
> >	return IGT_EXIT_SUCCESS;
> >  }
> >
> > -/**
> > - * igt_i915_driver_unload:
> > - *
> > - * Unloads the i915 driver and its dependencies.
> > - *
> > - */
> > -int
> > -igt_i915_driver_unload(void)
> > +int __igt_i915_driver_unload(const char **whom)
>=20
> I prefer s/whom/who/ as in "Who failed to unload?".
I will fix this.
>=20
> >  {
> > +	const char *sound[] =3D {
> > +		"snd_hda_intel",
> > +		"snd_hdmi_lpe_audio",
> > +		NULL,
> > +	};
> > +
> > +	const char *aux[] =3D {
> > +		/* gen5: ips uses symbol_get() so only a soft module
> dependency */
> > +		"intel_ips",
> > +		NULL,
> > +	};
> > +
> >	/* unbind vt */
> >	bind_fbcon(false);
> >
> > -	if (igt_kmod_is_loaded("snd_hda_intel")) {
> > -		igt_terminate_process(SIGTERM, "alsactl");
> > -
> > -		/* unbind snd_hda_intel */
> > -		kick_snd_hda_intel();
> > -
> > -		if (igt_kmod_unload("snd_hda_intel", 0)) {
> > -			igt_warn("Could not unload snd_hda_intel\n");
> > -			igt_kmod_list_loaded();
> > -			igt_lsof("/dev/snd");
> > -			return IGT_EXIT_FAILURE;
> > +	for (const char **m =3D sound; *m; m++) {
> > +		if (igt_kmod_is_loaded(*m)) {
> > +			igt_terminate_process(SIGTERM, "alsactl");
> > +			kick_snd_hda_intel();
> > +			if (igt_kmod_unload(*m, 0)) {
> > +				if (whom)
> > +					*whom =3D *m;
>=20
> This seems like a bug. The sound and aux arrays above should be static
> otherwise these strings go out of scope after the function exits.
AFAIU all string literals (both local and global) are part of .rodata elf s=
ection, which is ultimately=20
a file backed read-execute-private mapping (r-xp)  in process map (/proc/pi=
d/maps).
This should not go out of scope. Please correct me if I am being wrong here=
.
>=20
> > +				return IGT_EXIT_FAILURE;
> > +			}
> >		}
> >	}
> >
> > -	if (igt_kmod_is_loaded("snd_hdmi_lpe_audio")) {
> > -		igt_terminate_process(SIGTERM, "alsactl");
> > -
> > -		if (igt_kmod_unload("snd_hdmi_lpe_audio", 0)) {
> > -			igt_warn("Could not unload snd_hdmi_lpe_audio\n");
> > -			igt_kmod_list_loaded();
> > -			igt_lsof("/dev/snd");
> > -			return IGT_EXIT_FAILURE;
> > -		}
> > +	for (const char **m =3D aux; *m; m++) {
> > +		if (igt_kmod_is_loaded(*m))
> > +			igt_kmod_unload(*m, 0);
>=20
> This issue exists in previous code too but why not return an error here (=
and also
> populate 'whom' or 'who')?
I will return the correct value and set the 'who' here.
>=20
> >	}
> >
> > -	/* gen5: ips uses symbol_get() so only a soft module dependency */
> > -	if (igt_kmod_is_loaded("intel_ips"))
> > -		igt_kmod_unload("intel_ips", 0);
> > -
> >	if (igt_kmod_is_loaded("i915")) {
> >		if (igt_kmod_unload("i915", 0)) {
> > -			igt_warn("Could not unload i915\n");
> > -			igt_kmod_list_loaded();
> > -			igt_lsof("/dev/dri");
> > +			if (whom)
> > +				*whom =3D "i915";
> >			return IGT_EXIT_SKIP;
> >		}
> >	}
> >
> > +	return IGT_EXIT_SUCCESS;
>=20
> The issue exists in previous code but to me it seems highly unusual that =
we are
> using process exit codes as return values from these functions (both load=
 and
> unload).
Not sure about this issue, this series is aimed to fix perf_pmu@module-unlo=
ad
Igt test by using correct library function. May by fixing this process exit=
 code=20
Return values can be sent as separate patch.
>=20
> Note that after we have introduced and populated 'whom' or 'who', we just
> return the value retured from igt_kmod_unload() from here (and similarly =
in
> igt_i915_driver_load()) and let the caller figure out who failed to unloa=
d from
> 'whom' or 'who'. That is we don't need separate return values for other d=
rivers
> vs. i915. Thoughts?
Yeah, we can use same return type either IGT_EXIT_FAILURE/ IGT_EXIT_SKIP or=
  in case of module unload failure.=20
I will add a separate patch in this series to address this.

Thanks,
Anshuman Gupta.

>=20
>=20
> > +}
> > +
> > +/**
> > + * igt_i915_driver_unload:
> > + *
> > + * Unloads the i915 driver and its dependencies.
> > + *
> > + */
> > +int
> > +igt_i915_driver_unload(void)
> > +{
> > +	const char *whom;
> > +	int ret;
> > +
> > +	ret =3D __igt_i915_driver_unload(&whom);
> > +	if (ret) {
> > +		igt_warn("Could not unload %s\n", whom);
> > +		igt_kmod_list_loaded();
> > +		igt_lsof("/dev/dri");
> > +		igt_lsof("/dev/snd");
> > +		return ret;
> > +	}
> > +
> >	if (igt_kmod_is_loaded("intel-gtt"))
> >		igt_kmod_unload("intel-gtt", 0);
> >
> > diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h index
> > 04c87516f..0898122b3 100644
> > --- a/lib/igt_kmod.h
> > +++ b/lib/igt_kmod.h
> > @@ -38,6 +38,7 @@ int igt_kmod_unload(const char *mod_name, unsigned
> > int flags);
> >
> >  int igt_i915_driver_load(const char *opts);  int
> > igt_i915_driver_unload(void);
> > +int __igt_i915_driver_unload(const char **whom);
> >
> >  int igt_amdgpu_driver_load(const char *opts);  int
> > igt_amdgpu_driver_unload(void);
> > --
> > 2.26.2
> >
