Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E366E4B1
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 11:26:46 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200211111634.10802-1-jani.nikula@intel.com>
References: <20200211111634.10802-1-jani.nikula@intel.com>
Message-ID: <158142038106.2359.2223868848546234044@skylake-alporthouse-com>
Date: Tue, 11 Feb 2020 11:26:21 +0000
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
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Jani Nikula (2020-02-11 11:16:34)
> Checking the existence of the backlight interface before ensuring the
> driver is loaded skips whenever the test is run without the driver
> loaded. None of the tests would work properly if they were run as the
> first thing or after tests that unload the driver.
> 
> Open the driver (and thus probe it as needed) as the first thing.

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

> (This is the low-hanging fruit. A proper test for skipping would be
> based on the presence of embedded displays, not based on the presence of
> the interface we're aiming to test.)

Slightly different test idea. Here we say this is a test for particular
interface, what you have in mind is a requirement that if available HW,
the kernel *must* provide an interface. (I don't really like userspace
demanding the kernel makes something available, for the cases were it
really can't be done due to some flaw or another. From the HW vendor
perspective, such a conformance test is understandable -- but we are
focusing on the interfaces the kernel does expose and verifying that
work as expected.)
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
