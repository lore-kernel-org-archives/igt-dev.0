Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200211192253.1120964-1-chris@chris-wilson.co.uk>
 <1e8603fe-d4b8-5860-37cc-6ac381276e6d@linux.intel.com>
 <158158749815.11180.3098367349420655936@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <17dd2eef-40c1-0bfc-299f-ced610de0681@linux.intel.com>
Date: Thu, 13 Feb 2020 11:02:09 +0000
MIME-Version: 1.0
In-Reply-To: <158158749815.11180.3098367349420655936@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ctx_persistence: Race context
 closure with replace-engines
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


On 13/02/2020 09:51, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-02-13 09:07:59)
>>
>> On 11/02/2020 19:22, Chris Wilson wrote:
>>> +     igt_until_timeout(5) {
>>> +             igt_spin_t *spin;
>>> +             uint32_t ctx;
>>> +
>>> +             ctx = gem_context_clone_with_engines(i915, 0);
>>> +             gem_context_set_persistence(i915, ctx, true);
>>> +
>>> +             spin = igt_spin_new(i915, ctx, .flags = IGT_SPIN_FENCE_OUT);
>>> +             for (int i = 0; i < ncpus; i++)
>>> +                     write(t[i].pipe[1], &ctx, sizeof(ctx));
>>
>> It's early so I hope I am not too confused, but drm client in the forked
>> process is a different one. So I think it needs to use threads to be
>> able to share.
> 
> It using the same fd, so the children have control over the parents ctx
> (and shares the ctx id space via the fd)

It was too early then.

Then with a more neutral comment:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
