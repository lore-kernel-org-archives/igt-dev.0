Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C823F6E405
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 12:19:24 +0000 (UTC)
References: <20200417105839.12084-1-arjun.melkaveri@intel.com>
 <158712136549.5570.10867694637215979183@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <29aef98a-2472-d13e-2350-7b601d9c596a@linux.intel.com>
Date: Fri, 17 Apr 2020 13:19:21 +0100
MIME-Version: 1.0
In-Reply-To: <158712136549.5570.10867694637215979183@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH] [PATCH
 i-g-t]tests/i915/gem_exec_balancer:Resolving unpredictable tasklet delays
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 17/04/2020 12:02, Chris Wilson wrote:
> Quoting Arjun Melkaveri (2020-04-17 11:58:39)
>> Increased the Sampling window to help with sporadic test failures
>> due to unpredicted tasklet delays.
> 
> Then make them predictable. And be sure to add a test to fail if the
> execution is delayed.

In other words please try using "drm/i915: Expose an option to flush the 
tasklets via debugfs" Chris posted from IGT and see if that would make 
the test fail proof without increasing the timeout.

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
