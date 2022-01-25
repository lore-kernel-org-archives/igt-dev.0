Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E8410E2DF
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jan 2022 00:45:14 +0000 (UTC)
From: "Liu, Chuansheng" <chuansheng.liu@intel.com>
Date: Tue, 25 Jan 2022 00:45:08 +0000
Message-ID: <BL1PR11MB544552F6B858FFE3A33EF495975F9@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20220124023833.13535-1-chuansheng.liu@intel.com>
 <87o841p05i.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87o841p05i.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_busy: Prevent context ban with
 right ctx id
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Tuesday, January 25, 2022 12:30 AM
> To: Liu, Chuansheng <chuansheng.liu@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_busy: Prevent context ban w=
ith
> right ctx id
>=20
> On Sun, 23 Jan 2022 18:38:33 -0800, Chuansheng Liu wrote:
> >
> > This patch corrects the ctx id accordindly. Furthermore,
> > there are other code places with similar mistakes, will
> > try to send out the fixes further.
>=20
> Yes we know about this issue. Maybe a single patch which fixes these
> globally is preferred (to avoid having separate commit messages
> etc.). Anyway for this:

Thanks Ashutosh, I could try to cook one patch to clean all the places up l=
ater.
