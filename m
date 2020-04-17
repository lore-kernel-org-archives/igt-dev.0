Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D556E41A
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 12:45:00 +0000 (UTC)
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Date: Fri, 17 Apr 2020 12:44:51 +0000
Message-ID: <CA3CE573A55781488FA37084931071AB14DF7B64@BGSMSX105.gar.corp.intel.com>
References: <20200417105839.12084-1-arjun.melkaveri@intel.com>
 <158712136549.5570.10867694637215979183@build.alporthouse.com>
 <29aef98a-2472-d13e-2350-7b601d9c596a@linux.intel.com>
In-Reply-To: <29aef98a-2472-d13e-2350-7b601d9c596a@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [PATCH
 i-g-t]tests/i915/gem_exec_balancer:Resolving unpredictable tasklet delays
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Chris said he will be sending a patch on IGT change . Waiting for that  .

-Arjun

Thanks 
Arjun M

-----Original Message-----
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> 
Sent: Friday, April 17, 2020 5:49 PM
To: Chris Wilson <chris@chris-wilson.co.uk>; Melkaveri, Arjun <arjun.melkaveri@intel.com>; igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t]tests/i915/gem_exec_balancer:Resolving unpredictable tasklet delays


On 17/04/2020 12:02, Chris Wilson wrote:
> Quoting Arjun Melkaveri (2020-04-17 11:58:39)
>> Increased the Sampling window to help with sporadic test failures due 
>> to unpredicted tasklet delays.
> 
> Then make them predictable. And be sure to add a test to fail if the 
> execution is delayed.

In other words please try using "drm/i915: Expose an option to flush the tasklets via debugfs" Chris posted from IGT and see if that would make the test fail proof without increasing the timeout.

Regards,

Tvrtko

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
