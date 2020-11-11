Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BAA89FE8
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 12:04:05 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201110083506.GX7444@platvala-desk.ger.corp.intel.com>
References: <20200504073707.268608-1-arkadiusz.hiler@intel.com>
 <160494136881.21258.1784453412780097986@build.alporthouse.com>
 <20201110083506.GX7444@platvala-desk.ger.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 11 Nov 2020 12:03:52 +0000
Message-ID: <160509623289.6304.6899379822049293015@build.alporthouse.com>
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-11-10 08:35:06)
> On Mon, Nov 09, 2020 at 05:02:48PM +0000, Chris Wilson wrote:
> > Quoting Arkadiusz Hiler (2020-05-04 08:37:05)
> > > This patch brings back support for multiple filters that was in the
> > > original series by Zbyszek.
> > 
> > How is this filtering meant to work for tests that try to open two
> > different devices? Shouldn't the igt_device_filter_count() take into
> > account whether the filter even matches the desired device?
> > Should all of the filters include all possible devices?
> 
> 
> If you use filters, and you have two different devices you want to
> use, the test should use drm_open_driver_another() and have filters
> for two devices, semicolon-separated. See kms_prime for a good example
> of the usage.

Why does the test know about filters?

	drm_open_driver(DRIVER_INTEL);
	drm_open_driver(DRIVER_VGEM);

fails to find vgem because some filter is restricting the available set
to intel. And _another still does not overcome an imposed restriction.

I would not call kms_prime a good example. :|
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
