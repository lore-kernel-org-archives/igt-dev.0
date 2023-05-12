Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E8910E696
 for <igt-dev@lists.freedesktop.org>; Fri, 12 May 2023 12:06:25 +0000 (UTC)
Message-ID: <265919ae-a4f2-eb65-c422-c1c444e32725@linux.intel.com>
Date: Fri, 12 May 2023 13:06:21 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
 <20230506005528.1890922-16-umesh.nerlige.ramappa@intel.com>
 <04a7f10e-99ff-e1cd-0fe7-6f63d9e896d0@linux.intel.com>
 <ZFwXTD5H9uDZBo/8@orsosgc001.jf.intel.com>
 <575087db-30d4-e9d7-8ed0-529c651e3e53@linux.intel.com>
 <ZF0vLUFghg4yTrgl@orsosgc001.jf.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <ZF0vLUFghg4yTrgl@orsosgc001.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 15/15] intel_gpu_top: Add gt specific
 values to header in interactive mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 11/05/2023 19:08, Umesh Nerlige Ramappa wrote:
> On Thu, May 11, 2023 at 08:50:58AM +0100, Tvrtko Ursulin wrote:
>>
>> On 10/05/2023 23:14, Umesh Nerlige Ramappa wrote:
>>> On Wed, May 10, 2023 at 09:46:53AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 06/05/2023 01:55, Umesh Nerlige Ramappa wrote:
>>>>> If -p options is specified in INTERACTIVE mode, show the gt specific
>>>>> values.
>>>>>
>>>>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>>> ---
>>>>>  tools/intel_gpu_top.c | 33 +++++++++++++++++++++++++--------
>>>>>  1 file changed, 25 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>>>>> index 0acc81e9e..7018499c7 100644
>>>>> --- a/tools/intel_gpu_top.c
>>>>> +++ b/tools/intel_gpu_top.c
>>>>> @@ -1988,14 +1988,31 @@ print_header(const struct igt_device_card 
>>>>> *card,
>>>>>      lines = print_header_token(" @ ", lines, con_w, con_h, &rem,
>>>>>                     "%s", card->card);
>>>>> -    lines = print_header_token(" - ", lines, con_w, con_h, &rem,
>>>>> -                   "%s/%s MHz",
>>>>> -                   freq_items[1].buf,
>>>>> -                   freq_items[0].buf);
>>>>> -
>>>>> -    lines = print_header_token("; ", lines, con_w, con_h, &rem,
>>>>> -                   "%s%% RC6",
>>>>> -                   rc6_items[0].buf);
>>>>> +    if (class_view || engines->num_gts == 1) {
>>>>> +        lines = print_header_token(" - ", lines, con_w, con_h, &rem,
>>>>> +                       "%s/%s MHz",
>>>>> +                       freq_items[1].buf,
>>>>> +                       freq_items[0].buf);
>>>>> +
>>>>> +        lines = print_header_token("; ", lines, con_w, con_h, &rem,
>>>>> +                       "%s%% RC6",
>>>>> +                       rc6_items[0].buf);
>>>>> +    } else {
>>>>> +        for (i = 0; i < engines->num_gts; i++) {
>>>>> +            const char *cont = !i ? " - ": "; ";
>>>>> +
>>>>> +            lines = print_header_token(cont, lines, con_w, con_h, 
>>>>> &rem,
>>>>> +                           "%s/%s MHz(gt%d)",
>>>>> +                           freq_items_gt[i * 4 + 1].buf,
>>>>> +                           freq_items_gt[i * 4 + 0].buf,
>>>>> +                           i);
>>>>> +
>>>>> +            lines = print_header_token("; ", lines, con_w, con_h, 
>>>>> &rem,
>>>>> +                           "%s%% RC6(gt%d)",
>>>>> +                           rc6_items_gt[i * 3].buf,
>>>>> +                           i);
>>>>> +        }
>>>>> +    }
>>>>>      if (engines->r_gpu.present) {
>>>>>          lines = print_header_token("; ", lines, con_w, con_h,
>>>>
>>>> Series was a super easy read, thanks for that! Pretty much r-b for 
>>>> the lot from me but I would just like to visualize how the output 
>>>> looks like first. Would you mind pasting some examples for all the 
>>>> modes?
>>>
>>> great, I am attaching the outputs in text files for MTL and DG2 here, 
>>> hope that is visible. If not, I can paste it in pastebin.
>>>
>>> MTL shows the gt specific changes. DG2 is single tile, so there are 
>>> no changes.
>>
>> Thank you, looks solid.
>>
>> Only thing I would change is use uppercase GTn in the interactive 
>> output, so it matches with -l and -c.
>>
>> Is it also doable to make the formatting of those labels match like 
>> "MHz GT0", or "GT0 MHz"?
> 
> MHz GT0 looks good to me because that will keep the unit adjacent to the 
> value. Something like this:
> 
> intel-gpu-top: Intel Meteorlake (Gen12) @ /dev/dri/card0 -      0/     0 
> MHz GT0;      100% RC6 GT0;      0/     0 MHz GT1;      100% RC6 GT1;  
> 0.00/ 4.98 W;        0 irqs/s
> 
> Let me know if that's not what you meant.

Yes that looks better and is more consistent with the other output 
modes. It all looks good to me. For the series:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
