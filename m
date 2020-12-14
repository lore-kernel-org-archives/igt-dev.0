Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20201214105123.542518-1-chris@chris-wilson.co.uk>
 <32a5b538-628b-826b-7d75-f44bd6d0f65b@linux.intel.com>
 <160796095538.13039.6937084501164894559@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <7063edc7-4edf-3382-dde9-868b32a8b101@linux.intel.com>
Date: Mon, 14 Dec 2020 16:08:34 +0000
MIME-Version: 1.0
In-Reply-To: <160796095538.13039.6937084501164894559@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] i915/perf_pmu: Verify RC6
 measurements before/after suspend
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 14/12/2020 15:49, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-12-14 15:42:20)
>>
>> On 14/12/2020 10:51, Chris Wilson wrote:
>>> RC6 should work before suspend, and continue to increment while idle
>>> after suspend. Should.
>>>
>>> v2: Include a longer sleep after suspend; it appears we are reticent to
>>> idle so soon after waking up.
>>>
>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> ---
>>>    tests/i915/perf_pmu.c | 28 +++++++++++++++++++++++++---
>>>    1 file changed, 25 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
>>> index cb7273142..0b470c1bc 100644
>>> --- a/tests/i915/perf_pmu.c
>>> +++ b/tests/i915/perf_pmu.c
>>> @@ -170,6 +170,7 @@ static unsigned int measured_usleep(unsigned int usec)
>>>    #define TEST_RUNTIME_PM (8)
>>>    #define FLAG_LONG (16)
>>>    #define FLAG_HANG (32)
>>> +#define TEST_S3 (64)
>>>    
>>>    static igt_spin_t * __spin_poll(int fd, uint32_t ctx,
>>>                                const struct intel_execution_engine2 *e)
>>> @@ -1578,7 +1579,7 @@ test_frequency_idle(int gem_fd)
>>>                     "Actual frequency should be 0 while parked!\n");
>>>    }
>>>    
>>> -static bool wait_for_rc6(int fd)
>>> +static bool wait_for_rc6(int fd, int timeout)
>>>    {
>>>        struct timespec tv = {};
>>>        uint64_t start, now;
>>> @@ -1594,7 +1595,7 @@ static bool wait_for_rc6(int fd)
>>>                now = pmu_read_single(fd);
>>>                if (now - start > 1e6)
>>>                        return true;
>>> -     } while (!igt_seconds_elapsed(&tv));
>>> +     } while (igt_seconds_elapsed(&tv) <= timeout);
>>>    
>>>        return false;
>>>    }
>>> @@ -1636,14 +1637,32 @@ test_rc6(int gem_fd, unsigned int flags)
>>>                }
>>>        }
>>>    
>>> -     igt_require(wait_for_rc6(fd));
>>> +     igt_require(wait_for_rc6(fd, 1));
>>>    
>>>        /* While idle check full RC6. */
>>>        prev = __pmu_read_single(fd, &ts[0]);
>>>        slept = measured_usleep(duration_ns / 1000);
>>>        idle = __pmu_read_single(fd, &ts[1]);
>>> +
>>>        igt_debug("slept=%lu perf=%"PRIu64"\n", slept, ts[1] - ts[0]);
>>> +     assert_within_epsilon(idle - prev, ts[1] - ts[0], tolerance);
>>> +
>>> +     if (flags & TEST_S3) {
>>> +             prev = __pmu_read_single(fd, &ts[0]);
>>> +             igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>>> +                                           SUSPEND_TEST_NONE);
>>> +             idle = __pmu_read_single(fd, &ts[1]);
>>> +             igt_debug("suspend=%"PRIu64"\n", ts[1] - ts[0]);
>>> +             //assert_within_epsilon(idle - prev, ts[1] - ts[0], tolerance);
>>> +     }
>>> +
>>> +     igt_assert(wait_for_rc6(fd, 5));
>>>    
>>> +     prev = __pmu_read_single(fd, &ts[0]);
>>> +     slept = measured_usleep(duration_ns / 1000);
>>> +     idle = __pmu_read_single(fd, &ts[1]);
>>> +
>>> +     igt_debug("slept=%lu perf=%"PRIu64"\n", slept, ts[1] - ts[0]);
>>
>> You plan to leave the C++ bit commented out above and just check it
>> here? Doesn't seem it harms to check twice in the non-S3 case anyway,
>> just asking.
> 
> My expectation is that we should have a momentary blip !rc6 during
> suspend, and so across suspend we should find mono_raw ~= rc6
> 
> However, since it is taking a few seconds for us to start rc6 again
> after resume, that clearly fails. I'm not sure why it takes so long, so
> I suspect a bug. (Possibly something like we are not entering rc6 until
> a heartbeat after resume????)
> 
> So the // is my expectation; the current test the reality.
> How best to document that?

CPU clock is stopped and we expect RC6 to be stopped but we probably 
cannot be certain enough of the error between the two. So now I am not 
sure we will every be able to rely on it matching close enough.

How do the absolute cpu ts and rc6 values look after resume, and both 
relative to pre-suspend? Do they not see the S3 as expected but just rc6 
is not increasing for how long?

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
