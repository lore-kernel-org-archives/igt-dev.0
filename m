Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190336ED01
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 13:50:37 +0000 (UTC)
References: <20200121123120.27148-1-arjun.melkaveri@intel.com>
 <157961043554.3096.4464531165987455648@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <bd4c78e6-59fd-ebdd-d18e-0c8cbf0d30ac@linux.intel.com>
Date: Tue, 21 Jan 2020 13:50:34 +0000
MIME-Version: 1.0
In-Reply-To: <157961043554.3096.4464531165987455648@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_nop:Adjusted test to
 utilize all available engines
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


On 21/01/2020 12:40, Chris Wilson wrote:
> Quoting Arjun Melkaveri (2020-01-21 12:31:20)
>> Added __for_each_physical_engine to utilize all available engines.
>> Moved single, signal, preempt, poll and headless test cases
>> from static to dynamic group.
> 
> But doesn't this prevent us from exercising the legacy ABI?

It was my suggestion that for gem_exec_nop (measuring execution speed) 
we don't care about legacy ABI.

Regards,

Tvrtko


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
