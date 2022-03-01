Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B3410E1A5
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Mar 2022 06:25:59 +0000 (UTC)
Date: Tue, 1 Mar 2022 07:25:55 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <Yh28cwOyRirr99IX@zkempczy-mobl2>
References: <20220224220229.25548-1-ashutosh.dixit@intel.com>
 <Yhi9t7mBg4pFncI+@zkempczy-mobl2>
 <87zgmefv4i.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zgmefv4i.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_dummyload: Drop ahnd from
 igt_spin_t
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, jasmine.newsome@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 02:18:21PM -0800, Dixit, Ashutosh wrote:
> On Fri, 25 Feb 2022 03:29:59 -0800, Zbigniew Kempczyński wrote:
> >
> > On Thu, Feb 24, 2022 at 02:02:29PM -0800, Ashutosh Dixit wrote:
> > > In 4d9396e67930 we have started storing the opts with which the spin was
> > > created as part of igt_spin_t. The ahnd stored as part of igt_spin_t is
> > > therefore redundant. We can get ahnd from opts.ahnd.
> >
> > More than redundancy I like to keep opts which comes from the caller
> > and thus suggests spinner code that's immune. Unfortunatelly we cannot
> > block this after memcmp using c-syntax (I'm not able to do this).
> 
> Sorry, didn't follow what you are referring to here?

I mean - opts come from caller and should be immune within spinner
with const keyword. But memcpy() to it could be only done via pointer
tricks. 

Go ahead and merge :)

--
Zbigniew

> 
> > Anyway, keeping caller vars in opts suggests this so:
> >
> > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> Thanks, but will wait for your reply before merging.
