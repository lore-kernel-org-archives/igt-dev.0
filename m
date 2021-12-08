Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E1F6FFBD
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 12:42:47 +0000 (UTC)
From: "Katragadda, MastanX" <mastanx.katragadda@intel.com>
Date: Wed, 8 Dec 2021 12:42:40 +0000
Message-ID: <BN9PR11MB5290C6C3FB4E162C26E9C389976F9@BN9PR11MB5290.namprd11.prod.outlook.com>
References: <20211208105446.1410270-1-mastanx.katragadda@intel.com>
 <YbCXtrjiSHq9sDTW@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YbCXtrjiSHq9sDTW@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t] intel-ci: balcklist
 gem_exec_alignment@pi-shared
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Wilson, Chris P" <chris.p.wilson@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi   Chris/Thomas,
=20
  Can we remove pi-shared test from igt?

Thanks,
Mastan

-----Original Message-----
From: Latvala, Petri <petri.latvala@intel.com>=20
Sent: 08 December 2021 17:02
To: Katragadda, MastanX <mastanx.katragadda@intel.com>
Cc: igt-dev@lists.freedesktop.org; Surendrakumar Upadhyay, TejaskumarX <tej=
askumarx.surendrakumar.upadhyay@intel.com>; Hellstrom, Thomas <thomas.hells=
trom@intel.com>
Subject: Re: [igt-dev] [i-g-t] intel-ci: balcklist gem_exec_alignment@pi-sh=
ared

On Wed, Dec 08, 2021 at 04:24:46PM +0530, Mastan Katragadda wrote:
> The reason for this is that it doesn't work with the dma-resv-object=20
> locking introduced recently in the code,and it's not going to be fixed an=
ytime soon.
>=20
> drm/i915: Perform execbuffer object locking as a separate step To help=20
> avoid evicting already resident buffers from the batch we're=20
> processing, perform locking as a separate step.
>=20
> Link:https://cgit.freedesktop.org/drm-tip/commit/?id=3D5cd57f676bb946a00
> 275408f0dd0d75dbc466d25
>=20
> Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>

Should the test be deleted instead?


--
Petri Latvala


> ---
>  tests/intel-ci/blacklist.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index ca361fde..0d307730 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -62,6 +62,7 @@ igt@sysfs_timeslice_duration@off
>  # GEM: Not worth fixing
>  ###############################################
>  igt@gen7_exec_parse@.*lri.*
> +igt@gem_exec_alignment@pi-shared
>  ###############################################
>  # There are no DRRS capable displays in CI lab
>  ###############################################
> --=20
> 2.25.1
>=20
