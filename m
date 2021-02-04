Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0EA6EC73
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Feb 2021 04:12:36 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Thu, 4 Feb 2021 04:12:30 +0000
Message-ID: <1dde5b334a214d238082734b32477ed1@intel.com>
References: <20210203100310.19441-1-anshuman.gupta@intel.com>
 <20210203100310.19441-4-anshuman.gupta@intel.com>
 <161236905581.21832.9494400750427364629@build.alporthouse.com>
In-Reply-To: <161236905581.21832.9494400750427364629@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] i915/i915_pm_rpm: Add PC10
 display off test
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: Wednesday, February 3, 2021 9:48 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] i915/i915_pm_rpm: Add PC10
> display off test
> 
> Quoting Anshuman Gupta (2021-02-03 10:03:09)
> > Add a test to validate PC10 residencies while all output's display is
> > off.
> 
> The pc10 tests look nice and straightforward. Just a general question on
> whether 30s timeout is too lax or just right?
Thanks for review.
I had just followed timeout time from existing pc8 tests for HASWELL/BROADWEL
which was 30 second. It is not an engineering number.
 IMO i915 default auto-suspend ms time 10 sec
(cat /sys/devices/pci0000\:00/0000\:00\:02.0/power/autosuspend_delay_ms)
Considering above it may have some scope of optimization.
Could you please provide some input on it.
Thanks,
Anshuman Gupta.
> -Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
