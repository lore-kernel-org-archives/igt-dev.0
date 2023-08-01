Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0348210E30A
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Aug 2023 05:01:54 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 1 Aug 2023 05:01:50 +0000
Message-ID: <SJ1PR11MB62045381225AA29DB1B17842810AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230731140953.1167462-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20230731140953.1167462-1-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/4] Update code to use xe_sysfs_gt_open
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
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Monday, July 31, 2023 7:40 PM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> dev@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 0/4] Update code to use xe_sysfs_gt_open
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Tests have been updated to use xe_sysfs_gt_open function.
> Updated code to work non privileged user.
> Modified documentation.
>=20
> v2: Split updated tests patch into 2 patches
> 1 with only to use xe_sysfs_gt_open and other to update documentation,
> non privileged user.(Tejas)

Please change tests with following consideration as KMD behaves like that n=
ow,

1. These parameter can be set through sysfs, (and sysfs setting would alway=
s be done by super user) , normal permission cant change sysfs
2. Other way to set these parameters is through ioctls (like engine_create =
and passing parameter), here we will have differentiation for superuser and=
 normal user as we used to do in tests till now.

So if you are writing tests for sysfs then please follow 1.

Thanks,
Tejas
>=20
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Priyanka Dandamudi (4):
>   xe/xe_sysfs: Updated tests to use xe_sysfs_gt_open
>   xe/xe_sysfs: Modified code to work for non priv user
>   xe-fast-feedback.testlist: Add sysfs tests to BAT
>   tests/intel-ci: Remove xe_sysfs from blacklist
>=20
>  tests/intel-ci/xe-fast-feedback.testlist | 10 ++++++++
>  tests/intel-ci/xe.blocklist.txt          |  2 --
>  tests/xe/xe_sysfs_defaults.c             | 16 +++++++------
>  tests/xe/xe_sysfs_scheduler.c            | 29 +++++++++++++++++-------
>  4 files changed, 40 insertions(+), 17 deletions(-)
>=20
> --
> 2.25.1
