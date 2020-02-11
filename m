Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C3D6EA5C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 13:10:13 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
In-Reply-To: <158142038106.2359.2223868848546234044@skylake-alporthouse-com>
References: <20200211111634.10802-1-jani.nikula@intel.com>
 <158142038106.2359.2223868848546234044@skylake-alporthouse-com>
Date: Tue, 11 Feb 2020 15:10:08 +0200
Message-ID: <87wo8tz2vj.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/pm_backlight: ensure driver is
 loaded before checking backlight
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 11 Feb 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Jani Nikula (2020-02-11 11:16:34)
>> Checking the existence of the backlight interface before ensuring the
>> driver is loaded skips whenever the test is run without the driver
>> loaded. None of the tests would work properly if they were run as the
>> first thing or after tests that unload the driver.
>> 
>> Open the driver (and thus probe it as needed) as the first thing.
>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
>
>> (This is the low-hanging fruit. A proper test for skipping would be
>> based on the presence of embedded displays, not based on the presence of
>> the interface we're aiming to test.)
>
> Slightly different test idea. Here we say this is a test for particular
> interface, what you have in mind is a requirement that if available HW,
> the kernel *must* provide an interface. (I don't really like userspace
> demanding the kernel makes something available, for the cases were it
> really can't be done due to some flaw or another. From the HW vendor
> perspective, such a conformance test is understandable -- but we are
> focusing on the interfaces the kernel does expose and verifying that
> work as expected.)

That's fair. I'll drop the parenthesized paragraph before pushing.

Thanks for the reviews.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
