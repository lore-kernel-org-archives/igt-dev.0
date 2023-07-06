Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF8A10E3D4
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 03:20:47 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Thu, 6 Jul 2023 03:20:37 +0000
Message-ID: <MW4PR11MB705622CF81DC2DA73B1E09EEB32CA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230705085259.533791-1-himal.prasad.ghimiray@intel.com>
 <20230705085259.533791-4-himal.prasad.ghimiray@intel.com>
 <87sfa1dhka.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87sfa1dhka.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5 3/4] tests/xe/xe_guc_pc: Change the
 sysfs paths
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: 06 July 2023 05:42
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Gupta,
> Anshuman <anshuman.gupta@intel.com>
> Subject: Re: [PATCH i-g-t v5 3/4] tests/xe/xe_guc_pc: Change the sysfs pa=
ths
>=20
> On Wed, 05 Jul 2023 01:52:58 -0700, Himal Prasad Ghimiray wrote:
> >
> > diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c index
> > 827693eb4..046791d51 100644
> > --- a/tests/xe/xe_guc_pc.c
> > +++ b/tests/xe/xe_guc_pc.c
> > @@ -137,8 +137,13 @@ static int set_freq(int sysfs, int gt_id, const
> >char *freq_name, uint32_t freq)
> >  {
> >	int ret =3D -EAGAIN;
> >	char path[32];
> > +	char *gt_path;
> > +
> > +	gt_path =3D xe_gt_sysfs_path(sysfs, gt_id);
> > +	igt_assert(snprintf(path, sizeof(path), "%s/freq_%s",
> > +			    xe_gt_sysfs_path(sysfs, gt_id), freq_name) <
> sizeof(path));
>=20
> No need to do this, delete path[], gt_path can directly be passed
> igt_sysfs_printf/scanf?

Here we are appending the sysfs entry name to the gt_path. Why it is not ne=
eded ?

>=20
> > +	free(gt_path);
> >
> > -	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
> >	while (ret =3D=3D -EAGAIN)
> >		ret =3D igt_sysfs_printf(sysfs, path, "%u", freq);
> >	return ret;
> > @@ -149,7 +154,12 @@ static uint32_t get_freq(int sysfs, int gt_id, con=
st
> char *freq_name)
> >	uint32_t freq;
> >	int err =3D -EAGAIN;
> >	char path[32];
> > -	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
> > +	char *gt_path;
> > +
> > +	gt_path =3D xe_gt_sysfs_path(sysfs, gt_id);
> > +	igt_assert(snprintf(path, sizeof(path), "%s/freq_%s",
> > +			    gt_path, freq_name) < sizeof(path));
> > +	free(gt_path);
> >	while (err =3D=3D -EAGAIN)
> >		err =3D igt_sysfs_scanf(sysfs, path, "%u", &freq);
> >	return freq;
> > --
> > 2.25.1
> >
