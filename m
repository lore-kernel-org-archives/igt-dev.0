Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1b69e977-5597-217b-f3c8-ccb1e24fced5@linux.intel.com>
References: <20200123124306.18857-1-tvrtko.ursulin@linux.intel.com>
 <157978404508.19995.12294352233320424183@skylake-alporthouse-com>
 <ec205d22-3882-d655-921d-d35f24f99763@linux.intel.com>
 <157978539009.19995.13535399102451802903@skylake-alporthouse-com>
 <8ddcfcb7-d701-01a1-e208-c18c207b21fa@linux.intel.com>
 <157978900463.19995.12327750600329302953@skylake-alporthouse-com>
 <1b69e977-5597-217b-f3c8-ccb1e24fced5@linux.intel.com>
Message-ID: <157979110937.19995.14064795687896872714@skylake-alporthouse-com>
Date: Thu, 23 Jan 2020 14:51:49 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_engine_topology: Introduce and
 use gem_context_clone_with_engines
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-01-23 14:48:24)
> 
> On 23/01/2020 14:16, Chris Wilson wrote:
> > Quoting Tvrtko Ursulin (2020-01-23 14:01:41)
> >>
> >> On 23/01/2020 13:16, Chris Wilson wrote:
> >>> Either way, I would suggest doing
> >>>
> >>> int __gem_context_clone_with_engines(int i915, uint32_t src, uint32_t *out);
> >>> uint32_t gem_context_clone_with_engines(int i915, uint32_t src);
> >>>
> >>> as I prefer that style of error message.
> >>
> >> Error message? What do you mean?
> > 
> > igt_assert_eq(__gem_context_clone_with_engine(i915, src, &ctx), 0);
> > is the nicest assert message without using igt_assert_f and writing an
> > information message by hand.
> 
> But you will get that, either helper gem_context_clone_with_engines 
> calls uses that style.

Yeah, depends on whether you want to see the error for the underlying
ioctl and then have to look at the stack to work out we are in clone, or
if the clone itself is the interesting detail that wants to standout in
the assert message :)
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
