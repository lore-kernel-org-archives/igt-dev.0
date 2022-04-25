Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B22810E37D
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 05:24:08 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Mon, 25 Apr 2022 05:24:06 +0000
Message-ID: <6b377d0333494eb1940bd2f96ba15cb8@intel.com>
References: <20220422125912.6862-1-anshuman.gupta@intel.com>
 <87y1zx6qzs.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87y1zx6qzs.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_device_info: Add IS_DGFX()
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Friday, April 22, 2022 9:38 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_device_info: Add IS_DGFX()=
 support
>=20
> On Fri, 22 Apr 2022 05:59:12 -0700, Anshuman Gupta wrote:
> >
> > Currently IGT is lacking IS_DGFX() macro support.
> > There are some power features like D3Cold are only supported on
> > discrete card. So IGT test/tools specific to D3Cold requires to
> > consume IS_DGFX().
> > Adding a is_dgfx field in intel_device_info and initializing it for
> > DG1. All future discrete platform would require to initialize this
> > field.
>=20
> #define IS_DGFX(fd) gem_has_lmem(fd) ?
>=20
> gem_has_lmem() is already pretty widely used so maybe we should not
> introduce another way to achieve the same goal?
Before introducing this , I thought on using gem_has_lmem.
But I was not sure in case every discrete platform mandatory to have lmem r=
egion.
If it is guaranteed that every discrete platform will have lmem memory regi=
on ?
I will  drop  this patch.
Thanks,
Anshuman Gupta.
