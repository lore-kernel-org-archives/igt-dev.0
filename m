Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D45110E21D
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Sep 2023 09:17:00 +0000 (UTC)
Message-ID: <c83a02eb-e863-5412-be7a-103b831ba26c@linux.intel.com>
Date: Mon, 25 Sep 2023 10:16:55 +0100
MIME-Version: 1.0
Content-Language: en-US
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230906155108.2175876-1-marcin.bernatowicz@linux.intel.com>
 <20230906155108.2175876-9-marcin.bernatowicz@linux.intel.com>
 <431b9135-1c7c-cbf7-cc3a-f8d52ff1f015@linux.intel.com>
 <64eb8b87-c01d-ed9c-b964-6cce4195ef42@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <64eb8b87-c01d-ed9c-b964-6cce4195ef42@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 8/8] [RFC] benchmarks/gem_wsim: added
 basic xe support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 21/09/2023 20:39, Bernatowicz, Marcin wrote:
> Hi,
> 
> On 9/21/2023 5:57 PM, Tvrtko Ursulin wrote:
>>
>> On 06/09/2023 16:51, Marcin Bernatowicz wrote:
>>> Added basic xe support with few examples.
>>> Single binary handles both i915 and Xe devices,
>>> but workload definitions differ between i915 and xe.
>>> Xe does not use context abstraction, introduces new VM and Exec Queue
>>> steps and BATCH step references exec queue.
>>> For more details see wsim/README.
>>> Some functionality is still missing: working sets,
>>> load balancing (need some input if/how to do it in Xe - exec queues
>>> width?).
>>>
>>> The tool is handy for scheduling tests, we find it useful to verify vGPU
>>> profiles defining different execution quantum/preemption timeout
>>> settings.
>>>
>>> There is also some rationale for the tool in following thread:
>>> https://lore.kernel.org/dri-devel/a443495f-5d1b-52e1-9b2f-80167deb6d57@linux.intel.com/
>>>
>>> With this patch it should be possible to run following on xe device:
>>>
>>> gem_wsim -w benchmarks/wsim/xe_media_load_balance_fhd26u7.wsim -c 36 
>>> -r 600
>>
>> For historical reference there used to be a tool called media-bench.pl 
>> in IGT which was used to answer a question of "how many streams of 
>> this can this load balancer do". In simplified terms it worked by 
>> increasing the -c above until engine busyness would stop growing, 
>> which meant saturation. With that we were able to compare load 
>> balancing strategies and some other things. Like how many streams 
>> until starting to drop frames.
>>
>> These days, if resurrected, or resurrected in principle, it could 
>> answer the question of which driver can fit more streams of workload 
>> X, or does the new GuC fw regress something.
> 
> interesting
>>
>>> Best with drm debug logs disabled:
>>>
>>> echo 0 > /sys/module/drm/parameters/debug
>>>
>>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>> ---
>>>   benchmarks/gem_wsim.c                         | 534 ++++++++++++++++--
>>>   benchmarks/wsim/README                        |  85 ++-
>>>   benchmarks/wsim/xe_cloud-gaming-60fps.wsim    |  25 +
>>>   benchmarks/wsim/xe_example.wsim               |  28 +
>>>   benchmarks/wsim/xe_example01.wsim             |  19 +
>>>   benchmarks/wsim/xe_example_fence.wsim         |  23 +
>>>   .../wsim/xe_media_load_balance_fhd26u7.wsim   |  63 +++
>>>   7 files changed, 722 insertions(+), 55 deletions(-)
>>>   create mode 100644 benchmarks/wsim/xe_cloud-gaming-60fps.wsim
>>>   create mode 100644 benchmarks/wsim/xe_example.wsim
>>>   create mode 100644 benchmarks/wsim/xe_example01.wsim
>>>   create mode 100644 benchmarks/wsim/xe_example_fence.wsim
>>>   create mode 100644 benchmarks/wsim/xe_media_load_balance_fhd26u7.wsim
>>
>> 8<
>>> diff --git a/benchmarks/wsim/README b/benchmarks/wsim/README
>>> index e4fd61645..ddfefff47 100644
>>> --- a/benchmarks/wsim/README
>>> +++ b/benchmarks/wsim/README
>>> @@ -3,6 +3,7 @@ Workload descriptor format
>>>   Lines starting with '#' are treated as comments (do not create work 
>>> step).
>>> +# i915
>>>   ctx.engine.duration_us.dependency.wait,...
>>>   <uint>.<str>.<uint>[-<uint>]|*.<int <= 0>[/<int <= 0>][...].<0|1>,...
>>>   B.<uint>
>>> @@ -13,6 +14,23 @@ b.<uint>.<str>[|<str>].<str>
>>>   w|W.<uint>.<str>[/<str>]...
>>>   f
>>> +# xe
>>> +Xe does not use context abstraction and adds additional work step types
>>> +for VM (v.) and exec queue (e.) creation.
>>> +Each v. and e. step creates array entry (in workload's VM and Exec 
>>> Queue arrays).
>>> +Batch step references the exec queue on which it is to be executed.
>>> +Exec queue reference (eq_idx) is the index (0-based) in workload's 
>>> exec queue array.
>>> +VM reference (vm_idx) is the index (0-based) in workload's VM array.
>>> +
>>> +v.compute_mode
>>> +v.<0|1>
>>> +e.vm_idx.class.instance.compute_mode.job_timeout_ms,...
>>> +e.<uint>.<uint 0=RCS,1=BCS,2=VCS,3=VECS,4=CCS>.<int>.<0|1>.<uint>,...
>>> +eq_idx.duration_us.dependency.wait,...
>>> +<uint>.<uint>[-<uint>]|*.<int <= 0>[/<int <= 0>][...].<0|1>,...
>>> +d|p|s|t|q|a|T.<int>,...
>>> +f
>>> +
>>>   For duration a range can be given from which a random value will be 
>>> picked
>>>   before every submit. Since this and seqno management requires CPU 
>>> access to
>>>   objects, care needs to be taken in order to ensure the submit queue 
>>> is deep
>>> @@ -29,21 +47,22 @@ Additional workload steps are also supported:
>>>    'q' - Throttle to n max queue depth.
>>>    'f' - Create a sync fence.
>>>    'a' - Advance the previously created sync fence.
>>> - 'B' - Turn on context load balancing.
>>> - 'b' - Set up engine bonds.
>>> - 'M' - Set up engine map.
>>> - 'P' - Context priority.
>>> - 'S' - Context SSEU configuration.
>>> + 'B' - Turn on context load balancing. (i915 only)
>>> + 'b' - Set up engine bonds. (i915 only)
>>> + 'M' - Set up engine map. (i915 only)
>>> + 'P' - Context priority. (i915 only)
>>> + 'S' - Context SSEU configuration. (i915 only)
>>>    'T' - Terminate an infinite batch.
>>> - 'w' - Working set. (See Working sets section.)
>>> - 'W' - Shared working set.
>>> - 'X' - Context preemption control.
>>> + 'w' - Working set. (See Working sets section.) (i915 only)
>>> + 'W' - Shared working set. (i915 only)
>>> + 'X' - Context preemption control. (i915 only)
>>>   Engine ids: DEFAULT, RCS, BCS, VCS, VCS1, VCS2, VECS
>>>   Example (leading spaces must not be present in the actual file):
>>>   ----------------------------------------------------------------
>>> +# i915
>>>     1.VCS1.3000.0.1
>>>     1.RCS.500-1000.-1.0
>>>     1.RCS.3700.0.0
>>> @@ -53,6 +72,25 @@ Example (leading spaces must not be present in the 
>>> actual file):
>>>     1.VCS2.600.-1.1
>>>     p.16000
>>> +# xe equivalent
>>> +  #VM: v.compute_mode
>>> +  v.0
>>> +  #EXEC_QUEUE: e.vm_idx.class.intance.compute_mode.job_timeout_ms
>>> +  e.0.2.0.0.0 # VCS1
>>
>> A minor digression - I would suggest using more symbolic names and 
>> less numbers. For instance encode class instance in names.
> 
> yes, it is just a first fast prototype ;/
> Currently have something like
> e.vm_idx.class.instance[.jb=[uint].ts=[uint].pt=[uint].pr=[uint]]
> so some fields (job timeout/timeslice_us/preempt_timeout_us/priority 
> properties) are optional, so now it is : e.0.2.0 # VCS1
> Introduction of symbolic names is next step, first wanted any feedback.
>>
>>> +  e.0.0.0.0.0 # RCS
>>> +  e.0.2.1.0.0 # VCS2
>>> +  e.0.0.0.0.0 # second RCS exec queue
>>> +  #BATCH: eq_idx.duration.dependency.wait
>>> +  0.3000.0.1       # 1.VCS1.3000.0.1
>>> +  1.500-1000.-1.0  # 1.RCS.500-1000.-1.0
>>> +  3.3700.0.0       # 1.RCS.3700.0.0
>>> +  1.1000.-2.1      # 1.RCS.1000.-2.0
>>> +  2.2300.-2.0      # 1.VCS2.2300.-2.0
>>> +  3.4700.-1.0      # 1.RCS.4700.-1.0
>>> +  2.600.-1.1       # 1.VCS2.600.-1.1
>>> +  p.16000
>>
>> My initial feeling, and also after some thinking, is that it would be 
>> good to look for solutions for minimising divergence. That means try 
>> to avoid having completely different syntax and zero chance of 
>> workloads which can be run with either driver.
> 
> My first thought was to introduce new syntax to have xe uAPI granularity 
> (if it exposes vm, exec_queue - make it accessible), but it was just 
> first shot.
> 
>>
>> For instance the concept of a queue is relatively similar and in 
>> practice with xe ends up a little bit more limited. Which I think is 
>> solvable.
>>
>> For instance I think this can be made to work with xe.
>>
>> M.1.VCS1|VCS2
>> # or M.1.VCS - class names without numbers can be kept considered VCS*
>> B.1
>> 1.VCS.500-2000.0.0
>>
>> As for i915 this creates a load balancing context with engine map 
>> populated, I think with xe you have the same concept when creating a 
>> queue - allowed engine mask - right?
> 
> Yes, I think we have num_placements to allow exec queue represent a set 
> of engines of given class.
> 
>>
>> B.1 step you can skip with xe if it is not needed, I mean if multiple 
>> allowed engines imply load balancing there.
> 
> That is to be checked. I've a patch (not posted yet) which allows to 
> create exec queue with all engines of given class (using num_placements):
> 
>      benchmarks/gem_wsim: use num_placements for exec queue creation
> 
>      Enable num_placement exec queue creation option.
> 
>      Tried following workload:
> 
>      gem_wsim -w xe_media_load_balance_fhd26u7.wsim -c 36 -r 25 -v
> 
>      with three versions of exec queue definitions
>      (listed from worse to best in terms of workloads/s):
> 
>      e.0.2.0 # 1.VCS1
>      e.0.0.0 # 2.RCS       -> ~83% of last one
>      e.0.2.-1 # any VCS
> 
>      e.0.2.0 # 1.VCS1
>      e.0.0.0 # 2.RCS       -> ~85% of last one
>      e.0.2.1 # always VCS2
> 
>      e.0.2.-1 # any VCS
>      e.0.0.0  # RCS        -> 100%
>      e.0.2.-1 # any VCS
> 
> So it looks best results (load balancing?) happen when all exec queues 
> of given class are configured to use all engines of that class.
> With two exec queues of which one was on VCS1 and second exec queue on 
> all VCS it was even a bit worse then when first was on VCS1 and second 
> on VCS2.
> Full xe_media_load_balance_fhd26u7.wsim workload is at end of this 
> message (i915 and my xe version), more or less we have there exec_queue 
> <-> context equivalence.

Note that fhd26u7 is an equivalent of a real transcoding session which 
was running on platforms where not all VCS engines were equal. Therefore 
some batches *had* to go to VCS1 only, while some could be load-balanced.

(See I915_VIDEO_CLASS_CAPABILITY_HEVC and 
I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC.)

Therefore if you would change it to any VCS it would no longer be 
representative of a real media workload. At least on those platforms. I 
am not up to speed if modern gens still have the same design or things 
got simplified.

>> And then the actual submission you know it is queue 1 and VCS you can 
>> you to sanitize. If it doesn't match the queue configuration error 
>> out, otherwise just submit to the queue.
>>
>> VM management can be explicit steps, and AFAIR gem_wsim already shares 
>> the VM implicitly, so for xe you just need to add some commands to 
>> make it explicit:
>>
>> V.1             # create VM 1
>> M.1.VCS         # create ctx/queue 1 with all VCS engines
>> v.1.1            # assign VM 1 to ctx/queue 1
>> B.1            # turn on load balancing for ctx 1
>> 1.VCS.1000.0.0        # submit to ctx/queue 1
>>
>> I think this could work with both i915 and xe as is.
> 
> will think on this.
> 
>>
>> Things like compute mode you add as extensions which i915 could then 
>> ignore.
>>
>> V.1
>> c.1    # turn on compute mode on vm 1
>> M.1.VCS    # do you *need* to repeat the compute mode if vm carries 
>> the info?
> I think not, recent changes to uAPI 
> (https://patchwork.freedesktop.org/series/123916/) remove the need for 
> COMPUTE_MODE property on exec queue.
>> v.1.1
>> B.1
>> 1.VCS.1000.0.0
>>
>> Still would work with both i915 and xe if I am not missing something.
>>
>> I mean maybe even you don't need explicit VM management in the first 
>> go and can just do what the code currently does which is shares the 
>> same VM for all contexts?
>>
>> That much for now, let the brainstorming commence! :)
>>
>> Regards,
>>
>> Tvrtko
>>
>> P.S.
>>
>> Engine bonds could be used to validate and set up parallel submission 
>> queue. For instance:
>>
>> b.1.VCS2.VCS1
>>
>> Is probably a no-op on xe with parallel queues. Or you use it to 
>> configure the engine map order, if that is important.
>>
>> Problem will be converting multiple submission into one. It is 
>> probably doable but not warranted to include. It is okay to error out 
>> for now on workloads which use the feature.
> 
> I don't get parallel submission queue concept - is it submission on 
> multiple engines of same class at same time (I think in xe it's a width 
> parameter of exec ioctl ?)

Yes, it is for example two VCS engines working in a parallel on the same 
data block. And they have to run strictly in parallel.

I think the only example in wsim of that is frame-split-60fps.wsim:

... set up two contexts on two vcs engines and set up the "bond"...
f # create a fence
1.DEFAULT.*.f-1.0 # submit 1st batch blocked on the fence
2.DEFAULT.4000-6000.s-1.0 # submit 2nd batch with submit fence on 1st
a.-3 # unblock 1st batch (and therefore both)
...

But as said, even though it is used by media, I think best to leave this 
for the 2nd stage of gem_wsim refactors. We can then decide if it makes 
sense (or if even possible) to auto-magically convert this to a xe 
parallel queue or diverge.

Regards,

Tvrtko

> 
> Thanks a lot for valuable feedback
> -- 
> marcin
>>
>>> +
>>> +
>>>   The above workload described in human language works like this:
>>>     1.   A batch is sent to the VCS1 engine which will be executing 
>>> for 3ms on the
>>> @@ -78,16 +116,30 @@ Multiple dependencies can be given separated by 
>>> forward slashes.
>>>   Example:
>>> +# i915
>>>     1.VCS1.3000.0.1
>>>     1.RCS.3700.0.0
>>>     1.VCS2.2300.-1/-2.0
>>> +# xe
>>> +  v.0
>>> +  e.0.2.0.0.0
>>> +  e.0.0.0.0.0
>>> +  e.0.2.1.0.0.0
>>> +  0.3000.0.1
>>> +  1.3700.0.0
>>> +  2.2300.-1/-2.0
>>> +
>>>   I this case the last step has a data dependency on both first and 
>>> second steps.
>>>   Batch durations can also be specified as infinite by using the '*' 
>>> in the
>>>   duration field. Such batches must be ended by the terminate command 
>>> ('T')
>>>   otherwise they will cause a GPU hang to be reported.
>>> +Note: On Xe Batch dependencies are expressed with syncobjects,
>>> +so there is no difference between f-1 and -1
>>> +ex. 1.1000.-2.0 is same as 1.1000.f-2.0.
>>> +
>>>   Sync (fd) fences
>>>   ----------------
>>> @@ -116,6 +168,7 @@ VCS1 and VCS2 batches will have a sync fence 
>>> dependency on the RCS batch.
>>>   Example:
>>> +# i915
>>>     1.RCS.500-1000.0.0
>>>     f
>>>     2.VCS1.3000.f-1.0
>>> @@ -125,13 +178,27 @@ Example:
>>>     s.-4
>>>     s.-4
>>> +# xe equivalent
>>> +  v.0
>>> +  e.0.0.0.0.0    # RCS
>>> +  e.0.2.0.0.0    # VCS1
>>> +  e.0.2.1.0.0    # VCS2
>>> +  0.500-1000.0.0
>>> +  f
>>> +  1.3000.f-1.0
>>> +  2.3000.f-2.0
>>> +  0.500-1000.0.1
>>> +  a.-4
>>> +  s.-4
>>> +  s.-4
>>> +
>>>   VCS1 and VCS2 batches have an input sync fence dependecy on the 
>>> standalone fence
>>>   created at the second step. They are submitted ahead of time while 
>>> still not
>>>   runnable. When the second RCS batch completes the standalone fence 
>>> is signaled
>>>   which allows the two VCS batches to be executed. Finally we wait 
>>> until the both
>>>   VCS batches have completed before starting the (optional) next 
>>> iteration.
>>> -Submit fences
>>> +Submit fences (i915 only?)
>>>   -------------
>>>   Submit fences are a type of input fence which are signalled when 
>>> the originating
>>> diff --git a/benchmarks/wsim/xe_cloud-gaming-60fps.wsim 
>>> b/benchmarks/wsim/xe_cloud-gaming-60fps.wsim
>>> new file mode 100644
>>> index 000000000..9fdf15e27
>>> --- /dev/null
>>> +++ b/benchmarks/wsim/xe_cloud-gaming-60fps.wsim
>>> @@ -0,0 +1,25 @@
>>> +#w.1.10n8m
>>> +#w.2.3n16m
>>> +#1.RCS.500-1500.r1-0-4/w2-0.0
>>> +#1.RCS.500-1500.r1-5-9/w2-1.0
>>> +#1.RCS.500-1500.r2-0-1/w2-2.0
>>> +#M.2.VCS
>>> +#B.2
>>> +#3.RCS.500-1500.r2-2.0
>>> +#2.DEFAULT.2000-4000.-1.0
>>> +#4.VCS1.250-750.-1.1
>>> +#p.16667
>>> +#
>>> +#xe
>>> +v.0
>>> +e.0.0.0.0.0 # 1.RCS.500-1500.r1-0-4/w2-0.0
>>> +e.0.2.0.0.0 # 2.DEFAULT.2000-4000.-1.0
>>> +e.0.0.0.0.0 # 3.RCS.500-1500.r2-2.0
>>> +e.0.2.1.0.0 # 4.VCS1.250-750.-1.1
>>> +0.500-1500.0.0
>>> +0.500-1500.0.0
>>> +0.500-1500.0.0
>>> +2.500-1500.-2.0 # #3.RCS.500-1500.r2-2.0
>>> +1.2000-4000.-1.0
>>> +3.250-750.-1.1
>>> +p.16667
>>> diff --git a/benchmarks/wsim/xe_example.wsim 
>>> b/benchmarks/wsim/xe_example.wsim
>>> new file mode 100644
>>> index 000000000..3fa620932
>>> --- /dev/null
>>> +++ b/benchmarks/wsim/xe_example.wsim
>>> @@ -0,0 +1,28 @@
>>> +#i915
>>> +#1.VCS1.3000.0.1
>>> +#1.RCS.500-1000.-1.0
>>> +#1.RCS.3700.0.0
>>> +#1.RCS.1000.-2.0
>>> +#1.VCS2.2300.-2.0
>>> +#1.RCS.4700.-1.0
>>> +#1.VCS2.600.-1.1
>>> +#p.16000
>>> +#
>>> +#xe
>>> +#
>>> +#VM: v.compute_mode
>>> +v.0
>>> +#EXEC_QUEUE: e.vm_idx.class.intance.compute_mode.job_timeout_ms
>>> +e.0.2.0.0.0 # VCS1
>>> +e.0.0.0.0.0 # RCS
>>> +e.0.2.1.0.0 # VCS2
>>> +e.0.0.0.0.0 # second RCS exec_queue
>>> +#BATCH: eq_idx.duration.dependency.wait
>>> +0.3000.0.1       # 1.VCS1.3000.0.1
>>> +1.500-1000.-1.0  # 1.RCS.500-1000.-1.0
>>> +3.3700.0.0       # 1.RCS.3700.0.0
>>> +1.1000.-2.1      # 1.RCS.1000.-2.0
>>> +2.2300.-2.0      # 1.VCS2.2300.-2.0
>>> +3.4700.-1.0      # 1.RCS.4700.-1.0
>>> +2.600.-1.1       # 1.VCS2.600.-1.1
>>> +p.16000
>>> diff --git a/benchmarks/wsim/xe_example01.wsim 
>>> b/benchmarks/wsim/xe_example01.wsim
>>> new file mode 100644
>>> index 000000000..496905371
>>> --- /dev/null
>>> +++ b/benchmarks/wsim/xe_example01.wsim
>>> @@ -0,0 +1,19 @@
>>> +#VM: v.compute_mode
>>> +v.0
>>> +#EXEC_QUEUE: e.vm_idx.class.intance.compute_mode.job_timeout_ms
>>> +e.0.0.0.0.0
>>> +e.0.2.0.0.0
>>> +e.0.1.0.0.0
>>> +#BATCH: eq_idx.duration.dependency.wait
>>> +# B1 - 10ms batch on BCS0
>>> +2.10000.0.0
>>> +# B2 - 10ms batch on RCS0; waits on B1
>>> +0.10000.0.0
>>> +# B3 - 10ms batch on VECS0; waits on B2
>>> +1.10000.0.0
>>> +# B4 - 10ms batch on BCS0
>>> +2.10000.0.0
>>> +# B5 - 10ms batch on RCS0; waits on B4
>>> +0.10000.-1.0
>>> +# B6 - 10ms batch on VECS0; waits on B5; wait on batch fence out
>>> +1.10000.-1.1
>>> diff --git a/benchmarks/wsim/xe_example_fence.wsim 
>>> b/benchmarks/wsim/xe_example_fence.wsim
>>> new file mode 100644
>>> index 000000000..4f810d64e
>>> --- /dev/null
>>> +++ b/benchmarks/wsim/xe_example_fence.wsim
>>> @@ -0,0 +1,23 @@
>>> +#i915
>>> +#1.RCS.500-1000.0.0
>>> +#f
>>> +#2.VCS1.3000.f-1.0
>>> +#2.VCS2.3000.f-2.0
>>> +#1.RCS.500-1000.0.1
>>> +#a.-4
>>> +#s.-4
>>> +#s.-4
>>> +#
>>> +#xe
>>> +v.0
>>> +e.0.0.0.0.0
>>> +e.0.2.0.0.0
>>> +e.0.2.1.0.0
>>> +0.500-1000.0.0
>>> +f
>>> +1.3000.f-1.0
>>> +2.3000.f-2.0
>>> +0.500-1000.0.1
>>> +a.-4
>>> +s.-4
>>> +s.-4
>>> diff --git a/benchmarks/wsim/xe_media_load_balance_fhd26u7.wsim 
>>> b/benchmarks/wsim/xe_media_load_balance_fhd26u7.wsim
>>> new file mode 100644
>>> index 000000000..2214914eb
>>> --- /dev/null
>>> +++ b/benchmarks/wsim/xe_media_load_balance_fhd26u7.wsim
>>> @@ -0,0 +1,63 @@
>>> +# 
>>> https://lore.kernel.org/dri-devel/a443495f-5d1b-52e1-9b2f-80167deb6d57@linux.intel.com/
>>> +#i915
>>> +#M.3.VCS
>>> +#B.3
>>> +#1.VCS1.1200-1800.0.0
>>> +#1.VCS1.1900-2100.0.0
>>> +#2.RCS.1500-2000.-1.0
>>> +#3.VCS.1400-1800.-1.1
>>> +#1.VCS1.1900-2100.-1.0
>>> +#2.RCS.1500-2000.-1.0
>>> +#3.VCS.1400-1800.-1.1
>>> +#1.VCS1.1900-2100.-1.0
>>> +#2.RCS.200-400.-1.0
>>> +#2.RCS.1500-2000.0.0
>>> +#3.VCS.1400-1800.-1.1
>>> +#1.VCS1.1900-2100.-1.0
>>> +#2.RCS.1500-2000.-1.0
>>> +#3.VCS.1400-1800.-1.1
>>> +#1.VCS1.1900-2100.-1.0
>>> +#2.RCS.200-400.-1.0
>>> +#2.RCS.1500-2000.0.0
>>> +#3.VCS.1400-1800.-1.1
>>> +#1.VCS1.1900-2100.-1.0
>>> +#2.RCS.1500-2000.-1.0
>>> +#3.VCS.1400-1800.-1.1
>>> +#1.VCS1.1900-2100.-1.0
>>> +#2.RCS.1500-2000.-1.0
>>> +#2.RCS.1500-2000.0.0
>>> +#3.VCS.1400-1800.-1.1
>>> +#
>>> +#xe
>>> +#
>>> +#M.3.VCS ??
>>> +#B.3     ??
>>> +v.0
>>> +e.0.2.0.0.0 # 1.VCS1
>>> +e.0.0.0.0.0 # 2.RCS
>>> +e.0.2.1.0.0 # 3.VCS - no load balancing yet always VCS2
>>> +0.1200-1800.0.0
>>> +0.1900-2100.0.0
>>> +1.1500-2000.-1.0
>>> +2.1400-1800.-1.1
>>> +0.1900-2100.-1.0
>>> +1.1500-2000.-1.0
>>> +2.1400-1800.-1.1
>>> +0.1900-2100.-1.0
>>> +1.200-400.-1.0
>>> +1.1500-2000.0.0
>>> +2.1400-1800.-1.1
>>> +0.1900-2100.-1.0
>>> +1.1500-2000.-1.0
>>> +2.1400-1800.-1.1
>>> +0.1900-2100.-1.0
>>> +1.200-400.-1.0
>>> +1.1500-2000.0.0
>>> +2.1400-1800.-1.1
>>> +0.1900-2100.-1.0
>>> +1.1500-2000.-1.0
>>> +2.1400-1800.-1.1
>>> +0.1900-2100.-1.0
>>> +1.1500-2000.-1.0
>>> +1.1500-2000.0.0
>>> +2.1400-1800.-1.1
