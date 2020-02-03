Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200203214518.723198-1-chris@chris-wilson.co.uk>
 <4b37a582-fd82-f6b8-bc0b-d0f75aafafda@intel.com>
 <158076833186.27392.1232173407287492916@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <61c41fec-e783-35bf-17e6-98f5048543a8@intel.com>
Date: Mon, 3 Feb 2020 14:37:40 -0800
MIME-Version: 1.0
In-Reply-To: <158076833186.27392.1232173407287492916@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_basic: Drop per-engine
 testing of *execbuf
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 03/02/20 14:18, Chris Wilson wrote:
> Quoting Antonio Argenziano (2020-02-03 22:15:26)
>>
>>
>> On 03/02/20 13:45, Chris Wilson wrote:
>>> @@ -121,30 +43,29 @@ igt_main
>>>    
>>>        igt_fixture {
>>>                fd = drm_open_driver(DRIVER_INTEL);
>>> -             igt_require_gem(fd);
>>> -
>>> +             /* igt_require_gem(fd); // test is mandatory */
>>
>> What if that fd is bad? Assert?
> 
> fd can't be bad, that's taken care of by drm_open_driver(). If the
> driver is unusable for execbuf, we want the test failure. It's a choice.
> 
> Not sure the right answer, both have advantages.

Fair enough.

> 
>>> +static void mmapped(int i915)
>>> +{
>>> +     struct drm_i915_gem_execbuffer2 *execbuf;
>>> +     struct drm_i915_gem_exec_object2 *exec;
>>> +     uint32_t handle;
>>
>> gem_require_mappable_ggtt()?
> 
> No... I was dropping a hint in the name. How's the toolbox?

I'm afraid I'm not the right person to develop new stuff for IGT... 
gem_require_mappable_ggtt() /* insert comment about extending the test 
*/? :)

Antonio

> -Chris
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
