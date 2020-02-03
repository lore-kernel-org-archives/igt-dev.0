Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5776EA0E
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 16:37:07 +0000 (UTC)
References: <20200131171150.8333-1-antonio.argenziano@intel.com>
 <87blqj565y.wl-ashutosh.dixit@intel.com>
 <158063948798.17828.2067896502546028406@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <90567319-4f8a-4f96-7291-0a5eccccebba@intel.com>
Date: Mon, 3 Feb 2020 08:37:05 -0800
MIME-Version: 1.0
In-Reply-To: <158063948798.17828.2067896502546028406@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_ctx_sseu: Skip gtt
 tests if mappable aperture unavailable
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 02/02/20 02:31, Chris Wilson wrote:
> Quoting Dixit, Ashutosh (2020-02-01 03:37:45)
>> On Fri, 31 Jan 2020 09:11:50 -0800, Antonio Argenziano wrote:
>>> The gtt tests try to verify that a gtt mapped area can be used as an
>>> sseu pointer so it wouldn't make sense to run those when gtt mapping is
>>> not available.
>>>
>>> v2:
>>>        - Move require in subtest definition. (Ashutosh)
>>>
>>
>> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>
>>> Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
>>> Cc: Dixit Ashutosh <ashutosh.dixit@intel.com>
>>> ---
>>>   tests/i915/gem_ctx_sseu.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
>>> index 38dc584b..b5e9658e 100644
>>> --- a/tests/i915/gem_ctx_sseu.c
>>> +++ b/tests/i915/gem_ctx_sseu.c
>>> @@ -528,8 +528,11 @@ igt_main
>>>                igt_subtest("invalid-sseu")
>>>                        test_invalid_sseu(fd);
>>>
>>> -             igt_subtest("ggtt-args")
>>> +             igt_subtest("ggtt-args") {
>>> +                     gem_require_mappable_ggtt(fd);
>>> +
>>>                        test_ggtt_args(fd);
> 
> It pains me to say because of all the duplication, but we do need to
> cover the cases where args are inside strange mmaped objects.
> 
> Long ago we wanted a 'toolbox', as nearly all of these tests are the
> same except for the ioctl layout. Ideal candidates for annotated
> fuzzing (how many different types of mmap/faulthandlers can we think
> of?)
> 
> We need a better solution here.

How about looping across all mappings like we do for other tests?

Antonio

> -Chris
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
