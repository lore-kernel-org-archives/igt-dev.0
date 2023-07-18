Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <7b948154-8b32-bb0a-0268-46194b8129ae@linux.intel.com>
Date: Tue, 18 Jul 2023 08:35:46 +0100
MIME-Version: 1.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230717165318.831766-1-tvrtko.ursulin@linux.intel.com>
 <20230717171219.832728-1-tvrtko.ursulin@linux.intel.com>
 <ZLWOJ+EDk1jyBk37@intel.com> <87sf9mib8k.wl-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <87sf9mib8k.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915_pm_rps: Fix test after
 silent conflict
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 17/07/2023 20:33, Dixit, Ashutosh wrote:
> On Mon, 17 Jul 2023 11:53:27 -0700, Rodrigo Vivi wrote:
>>
>> On Mon, Jul 17, 2023 at 06:12:19PM +0100, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> A silent conflict sneaked in as I was merging
>>> d86ca7e17b58 ("tests/i915_pm_rps: Exercise sysfs thresholds") in a way
>>> that igt_sysfs_set_u32 has became a function returning void.
>>>
>>> Assert is now built-in so drop it from the test.
>>>
>>> v2:
>>>   * Fix invalid value test.
>>>   * Assert new values after write while at it.
>>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Merged to fix the IGT build.

Ah thank you, didn't realize it was broken, I thought it was only warnings.

Regards,

Tvrtko
