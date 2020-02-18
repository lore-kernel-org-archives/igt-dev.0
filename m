Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1E26E9C7
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 09:36:58 +0000 (UTC)
References: <20200218082904.12327-1-tomeu.vizoso@collabora.com>
 <20200218092943.GO25209@platvala-desk.ger.corp.intel.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <6d942253-03f3-4c60-fbe7-662d54c13670@collabora.com>
Date: Tue, 18 Feb 2020 10:36:53 +0100
MIME-Version: 1.0
In-Reply-To: <20200218092943.GO25209@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: Avoid hitting assertion on
 non-intel HW
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2/18/20 10:29 AM, Petri Latvala wrote:
> On Tue, Feb 18, 2020 at 09:29:04AM +0100, Tomeu Vizoso wrote:
>> Recently a call to intel_get_drm_devid was added in a code path that
>> gets run on all hardware.
>>
>> Restore the previous behavior by bailing out before we reach the assert.
>>
>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> Fixes: 8b90eefce9b4 ("lib/igt_fb: Use render copy/blit on platforms w/o HW detiling")
> 
> The path is from use_blitter() to blitter_ok() to fast_blit_ok() where
> the intel_get_drm_devid call is, right? And the change that broke this
> was using blitter_ok() unconditionally instead of almost-accidentally
> avoiding the blitter_ok call by checking for I915_FORMAT_MOD_*
> modifiers...

Yep, that's right, this patch makes a little bit more explicit.

> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Thanks,

Tomeu

> 
>> ---
>>   lib/igt_fb.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
>> index 49a032f65c06..0c4fdc5d4889 100644
>> --- a/lib/igt_fb.c
>> +++ b/lib/igt_fb.c
>> @@ -1992,6 +1992,9 @@ static bool fast_blit_ok(const struct igt_fb *fb)
>>   
>>   static bool blitter_ok(const struct igt_fb *fb)
>>   {
>> +	if (!is_i915_device(fb->fd))
>> +		return false;
>> +
>>   	if (is_ccs_modifier(fb->modifier))
>>   		return false;
>>   
>> -- 
>> 2.21.0
>>
>> _______________________________________________
>> igt-dev mailing list
>> igt-dev@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
