Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF66B10E1FD
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 20:02:44 +0000 (UTC)
Date: Wed, 26 Apr 2023 22:02:41 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
Message-ID: <20230426200241.p5g6cznn2tqotaus@zkempczy-mobl2>
References: <20230425184003.3089338-1-janga.rahul.kumar@intel.com>
 <20230426101230.6ym5owacxguqkbas@zkempczy-mobl2>
 <MW3PR11MB4748F814067C7881DDE97BEBAE659@MW3PR11MB4748.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4748F814067C7881DDE97BEBAE659@MW3PR11MB4748.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH] tests/xe/xe_query: Add subtest
 query-invalid-extension
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 08:58:41PM +0200, Kumar, Janga Rahul wrote:

<cut>

> > 
> > We need to start fixing those tests as they are not properly validating uapi. See
> > gem_mmap_offset@bad-extensions.
> I think the best way here is to use the do_ioctl_err(..) wrapper. It will help in checking the expecting error as well.
> 
> -   igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), -1);
> +   do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);

Sure, we didn't use this broadly in i915 igt but looks good for me.

--
Zbigniew

> > 
> > --
> > Zbigniew
> > 
> > >  	igt_fixture {
> > >  		xe_device_put(xe);
> > >  		close(xe);
> > > --
> > > 2.25.1
> > >
