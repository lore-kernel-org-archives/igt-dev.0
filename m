Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782B310E7E5
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Feb 2023 06:15:28 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id j17so5408598ioa.9
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Feb 2023 22:15:28 -0800 (PST)
Date: Tue, 14 Feb 2023 08:15:25 +0200
From: Petri Latvala <adrinael@adrinael.net>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Y+sm/Zr9LM8CK0IT@adrinael.net>
References: <20230209193231.57538-1-janusz.krzysztofik@linux.intel.com>
 <13320072.uLZWGnKmhe@jkrzyszt-mobl1.ger.corp.intel.com>
 <20230213095139.c5gcznwdf4a5kpgo@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230213095139.c5gcznwdf4a5kpgo@zkempczy-mobl2>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] tests/i915_suspend: Free
 device list after *-without-i915 subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 13, 2023 at 10:51:39AM +0100, Zbigniew Kempczyński wrote:
> On Fri, Feb 10, 2023 at 10:33:21PM +0100, Janusz Krzysztofik wrote:
> > On Thursday, 9 February 2023 20:32:31 CET Janusz Krzysztofik wrote:
> > > If any of *-without-i915 subtests fails or skips for any reason, it may
> > > leave the i915 module unloaded while keeping our device list populated
> > > with initially collected data.  In a follow up igt_fixture section we then
> > > try to reopen the device.  If the test has been executed with a device
> > > filter specified, an attempt to open the device finds a matching entry
> > > that belongs to the no longer existing device in that initially collected
> > > device list, fails to stat() it, concludes that's because of the device
> > > having been already open, and returns an error.
> > > 
> > > Fix this potentially confusing test result by freeing the potentially
> > > outdated device list before continuing with drm_open_driver().
> > 
> > Freeing device list occurred not safe if device scan was not performed before.  
> > I can see 3 potential solutions:
> > 1) force device rescan instead of free before calling drm_open_driver(),
> > 2) teach igt_device_free() to return immediately if the device list has not 
> >    been allocated,
> > 3) provide a has_device_list() helper for to be used if not sure before 
> >    calling igt_device_free().
> > 
> > Any preferences?
> 
> I would enforce rescan.
> 
> BTW I wonder how it can happen if runner is executing each subtest
> in new process so you're starting from scratch and rescan should be
> executed automatically.
> 
> Is is the case you're running few tests from the console?

For the record, igt_runner has --multiple-mode where multiple subtests
are executed in the same exec.


-- 
Petri Latvala
