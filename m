Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCC06EA88
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Feb 2021 12:21:48 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Wed, 24 Feb 2021 12:21:42 +0000
Message-ID: <b75f3d5cfc4442b799f4de2c2b0130a5@intel.com>
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Box, David E" <david.e.box@intel.com>, "Brown, Len" <len.brown@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: Wednesday, February 3, 2021 9:48 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] i915/i915_pm_rpm: Add PC10 display
> off test
> 
> Quoting Anshuman Gupta (2021-02-03 10:03:09)
> > Add a test to validate PC10 residencies while all output's display is
> > off.
> 
> The pc10 tests look nice and straightforward. Just a general question on
> whether 30s timeout is too lax or just right?
Hi Len / David ,
This is a IGT test to validate PC8/PC10.
https://patchwork.freedesktop.org/series/84737/
We want an optimum test time out value to wait for PC10.
Could you please provide your inputs for optimum time out value for PC8/PC10 tests.  
Thanks,
Anshuman.
> -Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
