Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEE310E505
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jul 2023 05:03:26 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Fri, 7 Jul 2023 05:03:22 +0000
Message-ID: <MW4PR11MB70565AD76AF27F49F97BBA1BB32DA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230706104500.595707-1-himal.prasad.ghimiray@intel.com>
 <20230706104500.595707-4-himal.prasad.ghimiray@intel.com>
 <87cz14cz6k.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87cz14cz6k.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v7 3/4] tests/xe/xe_guc_pc: Change the
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
> Sent: 07 July 2023 06:31
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Gupta,
> Anshuman <anshuman.gupta@intel.com>
> Subject: Re: [PATCH i-g-t v7 3/4] tests/xe/xe_guc_pc: Change the sysfs pa=
ths
>=20
> On Thu, 06 Jul 2023 03:44:59 -0700, Himal Prasad Ghimiray wrote:
> >
> > diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c index
> > 827693eb4..d70b08d1e 100644
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
> > +			    gt_path, freq_name) < sizeof(path));
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
>=20
> After the changes mentioned in Patch 2 the function prototypes will chang=
e
> as mentioned in Patch 2 comments.
>=20
> So we will now call xe_sysfs_gt_open() here and rename path[] to attr[] a=
nd
> then we can do igt_sysfs_scanf/igt_sysfs_printf.

Will address in new patch.
