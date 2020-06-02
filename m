Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <87pnahsu51.fsf@gaia.fi.intel.com>
References: <20200602002650.1355736-1-chris@chris-wilson.co.uk>
 <87pnahsu51.fsf@gaia.fi.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159108982127.29407.999463186059558684@build.alporthouse.com>
Date: Tue, 02 Jun 2020 10:23:41 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_exec_schedule: Try
 to spot unfairness
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
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Mika Kuoppala (2020-06-02 10:18:34)
> Chris Wilson <chris@chris-wilson.co.uk> writes:
> 
> > An important property for multi-client systems is that each client gets
> > a 'fair' allotment of system time. (Where fairness is at the whim of the
> > context properties, such as priorities.) This test forks N independent
> > clients (albeit they happen to share a single vm), and does an equal
> > amount of work in client and asserts that they take an equal amount of
> > time.
> >
> > Though we have never claimed to have a completely fair scheduler, that
> > is what is expected.
> >
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > ---
> >  tests/i915/gem_exec_schedule.c | 418 +++++++++++++++++++++++++++++++++
> >  1 file changed, 418 insertions(+)
> >
> > diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> > index 56c638833..d1121ecd2 100644
> > --- a/tests/i915/gem_exec_schedule.c
> > +++ b/tests/i915/gem_exec_schedule.c
> > @@ -2495,6 +2495,417 @@ static void measure_semaphore_power(int i915)
> >       rapl_close(&pkg);
> >  }
> >  
> > +static int read_timestamp_frequency(int i915)
> > +{
> > +     int value = 0;
> > +     drm_i915_getparam_t gp = {
> > +             .value = &value,
> > +             .param = I915_PARAM_CS_TIMESTAMP_FREQUENCY,
> > +     };
> > +     ioctl(i915, DRM_IOCTL_I915_GETPARAM, &gp);
> > +     return value;
> > +}
> > +
> > +static uint64_t div64_u64_round_up(uint64_t x, uint64_t y)
> > +{
> > +     return (x + y - 1) / y;
> > +}
> > +
> > +static uint64_t ns_to_ticks(int i915, uint64_t ns)
> > +{
> > +     return div64_u64_round_up(ns * read_timestamp_frequency(i915),
> > +                               NSEC_PER_SEC);
> > +}
> > +
> > +static uint64_t ticks_to_ns(int i915, uint64_t ticks)
> > +{
> > +     return div64_u64_round_up(ticks * NSEC_PER_SEC,
> > +                               read_timestamp_frequency(i915));
> > +}
> > +
> > +#define MI_INSTR(opcode, flags) (((opcode) << 23) | (flags))
> > +
> > +#define MI_MATH(x)                      MI_INSTR(0x1a, (x) - 1)
> > +#define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
> > +/* Opcodes for MI_MATH_INSTR */
> > +#define   MI_MATH_NOOP                  MI_MATH_INSTR(0x000, 0x0, 0x0)
> > +#define   MI_MATH_LOAD(op1, op2)        MI_MATH_INSTR(0x080, op1, op2)
> > +#define   MI_MATH_LOADINV(op1, op2)     MI_MATH_INSTR(0x480, op1, op2)
> > +#define   MI_MATH_LOAD0(op1)            MI_MATH_INSTR(0x081, op1)
> > +#define   MI_MATH_LOAD1(op1)            MI_MATH_INSTR(0x481, op1)
> > +#define   MI_MATH_ADD                   MI_MATH_INSTR(0x100, 0x0, 0x0)
> > +#define   MI_MATH_SUB                   MI_MATH_INSTR(0x101, 0x0, 0x0)
> > +#define   MI_MATH_AND                   MI_MATH_INSTR(0x102, 0x0, 0x0)
> > +#define   MI_MATH_OR                    MI_MATH_INSTR(0x103, 0x0, 0x0)
> > +#define   MI_MATH_XOR                   MI_MATH_INSTR(0x104, 0x0, 0x0)
> > +#define   MI_MATH_STORE(op1, op2)       MI_MATH_INSTR(0x180, op1, op2)
> > +#define   MI_MATH_STOREINV(op1, op2)    MI_MATH_INSTR(0x580, op1, op2)
> > +/* Registers used as operands in MI_MATH_INSTR */
> > +#define   MI_MATH_REG(x)                (x)
> > +#define   MI_MATH_REG_SRCA              0x20
> > +#define   MI_MATH_REG_SRCB              0x21
> > +#define   MI_MATH_REG_ACCU              0x31
> > +#define   MI_MATH_REG_ZF                0x32
> > +#define   MI_MATH_REG_CF                0x33
> 
> Are you thinking that we should just pull in the driver gpu_commands.h
> as is into lib?

Yes. We should at least share the header for mi commands between the
kernel and igt.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
