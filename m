Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <159102684249.29407.7177954715956460299@build.alporthouse.com>
References: <20200531191307.180023-1-chris@chris-wilson.co.uk>
 <87sgfesuko.fsf@gaia.fi.intel.com>
 <159102684249.29407.7177954715956460299@build.alporthouse.com>
Date: Tue, 02 Jun 2020 11:57:20 +0300
Message-ID: <87a71lj15b.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_exec_balancer:
 Disable pre-parser for rewritten batches
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> Quoting Mika Kuoppala (2020-06-01 15:56:55)
>> Chris Wilson <chris@chris-wilson.co.uk> writes:
>> 
>> > As we rewrite the batches on the fly to implement the non-preemptible
>> > lock, we need to tell Tigerlake to read the batch afresh each time.
>> > Amusingly, the disable is a part of an arb-check, so we have to be
>> > careful not to include the arbitration point inside our unpreemptible
>> > loop.
>> >
>> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> > ---
>> >  tests/i915/gem_exec_balancer.c | 13 +++++++++----
>> >  1 file changed, 9 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
>> > index 026f8347e..0e3b52900 100644
>> > --- a/tests/i915/gem_exec_balancer.c
>> > +++ b/tests/i915/gem_exec_balancer.c
>> > @@ -1350,6 +1350,11 @@ static void __bonded_dual(int i915,
>> >       *out = cycles;
>> >  }
>> >  
>> > +static uint32_t preparser_disable(void)
>> > +{
>> > +     return 0x5 << 23 | 1 << 8 | 1; /* preparser masked disable */
>> 
>> there is MI_ARB_CHECK
>> 
>> > +}
>> > +
>> >  static uint32_t sync_from(int i915, uint32_t addr, uint32_t target)
>> >  {
>> >       uint32_t handle = gem_create(i915, 4096);
>> > @@ -1363,14 +1368,14 @@ static uint32_t sync_from(int i915, uint32_t addr, uint32_t target)
>> >       *cs++ = 0;
>> >       *cs++ = 0;
>> >  
>> > -     *cs++ = MI_NOOP;
>> > +     *cs++ = preparser_disable();
>> >       *cs++ = MI_NOOP;
>> >       *cs++ = MI_NOOP;
>> >       *cs++ = MI_NOOP;
>> >  
>> >       /* wait for them to cancel us */
>> >       *cs++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
>> > -     *cs++ = addr + 16;
>> > +     *cs++ = addr + 24;
>> 
>> I must be totally confused about the layout as I can't get
>> the +8. You take one nop out and put one arb check in
>> and everything moves with 8?
>
> It's just skipping over the MI_ARB_CHECK, +4, aligned to the next qword
> because some old habits die hard.

Well that explains it,
Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> -Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
