Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <c0f2a9c4-0a29-47f8-0726-735bf72e8c51@linux.intel.com>
References: <20201102153334.3732960-1-chris@chris-wilson.co.uk>
 <20201104170907.3950206-1-chris@chris-wilson.co.uk>
 <c0f2a9c4-0a29-47f8-0726-735bf72e8c51@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 06 Nov 2020 15:47:44 +0000
Message-ID: <160467766474.23251.2910114305073575306@build.alporthouse.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2] gem_wsim: Use
 CTX_TIMESTAMP for timed spinners
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Tvrtko Ursulin (2020-11-06 15:17:12)
> 
> On 04/11/2020 17:09, Chris Wilson wrote:
> > Use MI_MATH and MI_COND_BBE we can construct a loop that runs for a
> > precise number of clock cycles, as measured by the CTX_TIMESTAMP. We use
> > the CTX_TIMESTAMP (as opposed to the CS_TIMESTAMP) so that the elapsed
> > time is measured local to the context, and the length of the batch is
> > unaffected by preemption. Since the clock ticks at a known frequency, we
> > can directly translate the batch durations into cycles and so remove the
> > requirement for nop calibration, and the often excessively large nop
> > batches.
> > 
> > The downside to this is that we need to use engine local registers, and
> > before gen11 there is no support in the CS for relative mmio and so this
> > technique does not support transparent load balancing on a virtual
> > engine before Icelake.
> > 
> > v2: More commentary, more code removal.
> 
> I almost acked it a few times but then since a) I don't have a local 
> gen11+ and b) trace.pl is broken upstream I kept getting I got cold 
> feet. Trace.pl becuase I wanted to check if durations now works as 
> advertised. Although that could be done simpliy with test workloads as 
> well.

Yes. I used a wsim that did a single wait for 100ms and 10 repeats to
satisfy myself (which was very useful for testing how the relative mmio
bit actually worked).

> Anyway, it looks good and gem_wsim.c is inactive enough so I could 
> easily revert locally it if I needed to run something on my local gen9. 
> No point in delaying this brilliant improvement.
> 
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Oh one question I had - does preemption period works as expected - the 
> MI_MATH instructions do not prevent setting to non-preemtpable by any 
> chance?

No. It's reduced to a boolean as it is unconditionally checked every few us.
I didn't work out a way of having 2 loops. (The problem boils down to
not having a conditional jump, only a conditional return; I think the
predicated MI_BATCH_BUFFER_START is rcs only.) We could use preempt_us
MI_NOOP, but I was hoping it wasn't critical.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
