Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36AC6E332
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 11:41:44 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1349f081-c89f-8360-9d1e-20f2a371564a@linux.intel.com>
References: <d4333c56-8067-db49-084d-ff66d929eb51@linux.intel.com>
 <20200124111822.16862-1-anna.karas@intel.com>
 <1349f081-c89f-8360-9d1e-20f2a371564a@linux.intel.com>
Message-ID: <157986608873.2524.12038857715017029844@skylake-alporthouse-com>
Date: Fri, 24 Jan 2020 11:41:28 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] gem_wsim: Distinguish particular
 engines during calculating nop calibration.
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
To: Anna Karas <anna.karas@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-01-24 11:35:35)
> 
> On 24/01/2020 11:18, Anna Karas wrote:
> > Extend handling -n parameter by accepting multiple values of per
> > engine nop calibration. Add raw numbers handling to set default
> > calibration values. Print copyable and pastable string with
> > calibrations. Allow to switch between calculating in parallel
> > or doing it sequentially.
> > 
> > Accepted input values:
> > -n 123456
> > All calibrations will be set to 123456.
> > 
> > -n ENG=value,ENG2=value2,value3
> > i.e.
> > -n RCS=123456,BCS=345678,999999
> > RCS engine's value is set to 123456, BCS engine's value is set to
> > 345678, 999999 is copied to rest of engines. All engines must be set;
> > you can either provide values for each of the engines, or you can set
> > specific values and provide a default value for the others.
> > 
> > -n value,ENG1=value1,ENG2=value2
> > First, value is copied to all engines, then value1 overrides ENG1, and
> > finally value2 overrides ENG2.
> > 
> > New output follows the pattern:
> > Nop calibrations for 1000us delay is: <eng1>=<v1>,<eng2>=<v2>,...
> > So you can easily copy-paste it to the next invocation.
> > 
> > Switching between calculation modes:
> > Run program with -T parameter to calculate calibrations in parallel.
> > The calculations are performed sequentially by default.
> > 
> > v2: Get rid of trailing whitespaces. Skip DEFAULT and VCS engines
> > when printing out calibrations. Reject them in the string passed
> > to -n. Re-align rest of help text. Fix accepting unknown engines.
> > 
> > v3: Consider all cases of arguments
> > for -n (Tvrtko).
> > 
> > -n 10 (raw number)
> > -n RCS (engine without calib)
> > -n AA (neither the engine nor the number)
> > -n RCS=500 (valid eng=val pair)
> > -n RCS=AA (calib is not a number)
> > -n XYZ=10 (engine is not an engine)
> > -n XYZ=AA (combo)
> > 
> > v4: Print calculated values (Chris). Do not make any assumptions
> > about the order of the engines (Tvrtko).
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Interesting, or maybe entirely expected, observation is that parallel 
> calibration gives different values. I think more engines slower they get 
> in parallel because of memory bandwith? Probably. That's why suggested 
> default is sequential. Although in practice is depends a lot on the 
> workload to be executed what matches the reality better. Calibrating for 
> the workload sounded a step too far. In theory could be doable using 
> Chris' wsim to theoretical throughput parser. Along the lines probably. 
> But definitely to complicated for now.

I haven't checked but have you accounted for the overhead in submission
serialisation? Finite memory bandwidth is definitely plausible.

If we can put a timing MI_MATH loop inside 128bytes, there's a chance we
could benefit from the tiny CS prefetch and avoid having N engines all
competing for finite CS throughput.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
