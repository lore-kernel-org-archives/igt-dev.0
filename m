Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CB189FE3
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 12:55:45 +0000 (UTC)
Date: Wed, 11 Nov 2020 14:55:39 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201111125539.GN7444@platvala-desk.ger.corp.intel.com>
References: <20200504073707.268608-1-arkadiusz.hiler@intel.com>
 <160494136881.21258.1784453412780097986@build.alporthouse.com>
 <20201110083506.GX7444@platvala-desk.ger.corp.intel.com>
 <160509623289.6304.6899379822049293015@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160509623289.6304.6899379822049293015@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib: Support multiple filters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, Arkadiusz Hiler <arek@hiler.eu>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 12:03:52PM +0000, Chris Wilson wrote:
> Quoting Petri Latvala (2020-11-10 08:35:06)
> > On Mon, Nov 09, 2020 at 05:02:48PM +0000, Chris Wilson wrote:
> > > Quoting Arkadiusz Hiler (2020-05-04 08:37:05)
> > > > This patch brings back support for multiple filters that was in the
> > > > original series by Zbyszek.
> > > 
> > > How is this filtering meant to work for tests that try to open two
> > > different devices? Shouldn't the igt_device_filter_count() take into
> > > account whether the filter even matches the desired device?
> > > Should all of the filters include all possible devices?
> > 
> > 
> > If you use filters, and you have two different devices you want to
> > use, the test should use drm_open_driver_another() and have filters
> > for two devices, semicolon-separated. See kms_prime for a good example
> > of the usage.
> 
> Why does the test know about filters?
> 
> 	drm_open_driver(DRIVER_INTEL);
> 	drm_open_driver(DRIVER_VGEM);
> 
> fails to find vgem because some filter is restricting the available set
> to intel. And _another still does not overcome an imposed restriction.

Tradeoffs on top of tradeoffs.

If you have two intel devices and you want to kms_prime between them,
you need to be able to say "this DRIVER_INTEL goes here, this other
DRIVER_INTEL goes here."

If you have an intel and a non-intel device, you need to be able to
say "run tests on this device, don't even touch that other device, I
don't care about it for this run."

Now, having said that, vgem is kinda special and it might be worth to
keep special-casing its usage (it being already not part of DRIVER_ANY
and all that), by way of ignoring all filters when chipset ==
DRIVER_VGEM.

Arek, opinions on that?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
