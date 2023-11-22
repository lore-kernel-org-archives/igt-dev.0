Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E1C10E115
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Nov 2023 06:25:04 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 22 Nov 2023 06:24:57 +0000
Message-ID: <CY5PR11MB6211042830475F61E2EE983595BAA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231120143635.105731-1-karthik.poosa@intel.com>
In-Reply-To: <20231120143635.105731-1-karthik.poosa@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel: Add changes to use new
 sysfs frequency entries by xe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Monday, November 20, 2023 8:07 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>; Gupta, Anshum=
an
> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
> Poosa, Karthik <karthik.poosa@intel.com>
> Subject: [PATCH i-g-t] tests/intel: Add changes to use new sysfs frequenc=
y entries
> by xe
>=20
> Updated xe set_freq and get_freq definitions to use new sysfs entries.
> The new entries will be under sub-directory freq.
> Names of the entries have also changed. They will be suffixed with _freq =
i.e
> /device/tile<n>/gt<n>/freq/*_freq instead of prefix.
>=20
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
[Gupta, Anshuman] LGTM.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel/xe_guc_pc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c index
> fa2f20cca..bb6344449 100644
> --- a/tests/intel/xe_guc_pc.c
> +++ b/tests/intel/xe_guc_pc.c
> @@ -141,7 +141,7 @@ static int set_freq(int fd, int gt_id, const char *fr=
eq_name,
> uint32_t freq)
>  	char freq_attr[16];
>  	int gt_fd;
>=20
> -	snprintf(freq_attr, sizeof(freq_attr), "freq_%s", freq_name);
> +	snprintf(freq_attr, sizeof(freq_attr), "freq/%s_freq", freq_name);
>  	gt_fd =3D xe_sysfs_gt_open(fd, gt_id);
>  	igt_assert(gt_fd >=3D 0);
>=20
> @@ -159,7 +159,7 @@ static uint32_t get_freq(int fd, int gt_id, const cha=
r
> *freq_name)
>  	char freq_attr[16];
>  	int gt_fd;
>=20
> -	snprintf(freq_attr, sizeof(freq_attr), "freq_%s", freq_name);
> +	snprintf(freq_attr, sizeof(freq_attr), "freq/%s_freq", freq_name);
>  	gt_fd =3D xe_sysfs_gt_open(fd, gt_id);
>  	igt_assert(gt_fd >=3D 0);
>=20
> --
> 2.25.1
