Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADC610E09A
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 10:14:02 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 26 Jun 2023 10:13:56 +0000
Message-ID: <SJ1PR11MB620495177F5B90F214AC15AD8126A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230625111316.534770-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20230625111316.534770-1-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/5] Add tests for scheduler control
 interface
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
> Sent: Sunday, June 25, 2023 4:43 PM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; igt-dev@lists.freedesktop.org; Dandamudi,
> Priyanka <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 0/5] Add tests for scheduler control interface
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> New lib function has been added to iterate over sysfs/engines.
> Added 4 new tests to validate basic scheduler control interface and its
> defaults.
>=20
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Priyanka Dandamudi (5):
>   lib/igt_sysfs: Add support to iterate over engines
>   xe/xe_sysfs_defaults: Verify .defaults in engines directory
>   xe/xe_sysfs_preempt_timeout: Verify preempt_timeout
>   xe/xe_sysfs_timeslice: Verify timeslice_duration
>   xe/xe_sysfs_job_timeout: Verify job_timeout

These basic tests are enough, though one basic test for min/max cap range w=
ould complete basic test requirement here.

Thanks,
Tejas
>=20
>  lib/igt_sysfs.c                     |  35 +++++++
>  lib/igt_sysfs.h                     |   3 +
>  tests/meson.build                   |   4 +
>  tests/xe/xe_sysfs_defaults.c        | 105 +++++++++++++++++++++
>  tests/xe/xe_sysfs_job_timeout.c     | 138 +++++++++++++++++++++++++++
>  tests/xe/xe_sysfs_preempt_timeout.c | 139
> ++++++++++++++++++++++++++++
>  tests/xe/xe_sysfs_timeslice.c       | 138 +++++++++++++++++++++++++++
>  7 files changed, 562 insertions(+)
>  create mode 100644 tests/xe/xe_sysfs_defaults.c  create mode 100644
> tests/xe/xe_sysfs_job_timeout.c  create mode 100644
> tests/xe/xe_sysfs_preempt_timeout.c
>  create mode 100644 tests/xe/xe_sysfs_timeslice.c
>=20
> --
> 2.25.1
