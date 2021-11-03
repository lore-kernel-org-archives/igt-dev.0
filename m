Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <f859ebab-8b3a-ef1e-3387-33808282e420@intel.com>
Date: Wed, 3 Nov 2021 11:49:47 -0700
Content-Language: en-GB
References: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
 <20211021234044.3071069-5-John.C.Harrison@Intel.com>
 <20211102233442.GA16356@jons-linux-dev-box>
 <4adc8d9a-8393-2774-2c67-a93083240795@intel.com>
 <YYJYHYT1YrwVikLo@platvala-desk.ger.corp.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <YYJYHYT1YrwVikLo@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 4/8]
 tests/i915/gem_exec_capture: Use contexts and engines properly
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: IGT-Dev@lists.freedesktop.org, Intel-GFX@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 11/3/2021 02:36, Petri Latvala wrote:
> On Tue, Nov 02, 2021 at 06:45:38PM -0700, John Harrison wrote:
>> On 11/2/2021 16:34, Matthew Brost wrote:
>>> On Thu, Oct 21, 2021 at 04:40:40PM -0700, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Some of the capture tests were using explicit contexts, some not. Some
>>>> were poking the per engine pre-emption timeout, some not. This would
>>>> lead to sporadic failures due to random timeouts, contexts being
>>>> banned depending upon how many subtests were run and/or how many
>>>> engines a given platform has, and other such failures.
>>>>
>>>> So, update all tests to be conistent.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    tests/i915/gem_exec_capture.c | 80 +++++++++++++++++++++++++----------
>>>>    1 file changed, 58 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
>>>> index c85c198f7..e373d24ed 100644
>>>> --- a/tests/i915/gem_exec_capture.c
>>>> +++ b/tests/i915/gem_exec_capture.c
>>>> @@ -204,8 +204,19 @@ static int check_error_state(int dir, struct offset *obj_offsets, int obj_count,
>>>>    	return blobs;
>>>>    }
>>>> +static void configure_hangs(int fd, const struct intel_execution_engine2 *e, int ctxt_id)
>>>> +{
>>>> +	/* Ensure fast hang detection */
>>>> +	gem_engine_property_printf(fd, e->name, "preempt_timeout_ms", "%d", 250);
>>>> +	gem_engine_property_printf(fd, e->name, "heartbeat_interval_ms", "%d", 500);
>>> #define for 250, 500?
>> Is there any point? There is no special reason for the values other than
>> small enough to be fast and long enough to not be too small to be usable. So
>> there isn't really any particular name to give them beyond
>> 'SHORT_PREEMPT_TIMEOUT' or some such. And the whole point of the helper
>> function is that the values are programmed in one place only and not used
>> anywhere else. So there is no worry about repetition of magic numbers.
> In about one year everyone has forgotten this explanation and will
> wonder if it's related to some in-kernel behaviour or if there's some
> other reason these values have been chosen.
>
> So at least a comment why the values are these, please.
There is a comment already. Not sure what more can be added that is 
meaningful other than changing it to "Ensure fast hang detection by 
picking some random numbers out of the air that seem to be vaguely 
plausible".

John.

>
>
