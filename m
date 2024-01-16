Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3969A10E4F1
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jan 2024 13:03:09 +0000 (UTC)
Message-ID: <feda6b18-51bc-4080-8fa2-c1a6447519a0@linux.intel.com>
Date: Tue, 16 Jan 2024 13:03:05 +0000
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: Fix misaligned rendering
Content-Language: en-US
To: anonymoustranquillity@proton.me,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <cPSpR9MXRhQ1yFaJm1l9QDoVT9SiH_resuKtBB52HnpHOiI5AO2BPTNYg3Srfj_vaU8_u-cSp5u7luqyAUta-9p8EjyIGKhizxL4hCwMNpY=@proton.me>
 <20240115152907.ilhrhy5zhegt4b7l@kamilkon-desk.igk.intel.com>
 <960382c0-a8ef-464b-ada5-c9d66a58561e@linux.intel.com>
 <EOyBwdNxkVNQWyfdtYOrT4lVOSHddYw7GcBAVb3X7zd7i4PXIZfA2qPVZmOW89smu3o4u4cXUs5I6ebB2SxI-cC9JuCwyrsEBLPv9tjRRLk=@proton.me>
 <02ed8aa7-f4e3-4648-b393-81cf103112e3@linux.intel.com>
 <xOvoNSfmYKg4CYcHk28rPS4wPszrNXK0BIPk5FCiG1dG_-vDr-bI8VsmK8MiZs5fHS3mhZcfBxqctGkLNtM0-UZPmMnDDOQNfIobtI_M_P8=@proton.me>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <xOvoNSfmYKg4CYcHk28rPS4wPszrNXK0BIPk5FCiG1dG_-vDr-bI8VsmK8MiZs5fHS3mhZcfBxqctGkLNtM0-UZPmMnDDOQNfIobtI_M_P8=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 16/01/2024 12:32, anonymoustranquillity@proton.me wrote:
> I have done some further testing, and it seems that my patch does in fact not resolve the issue. I am attaching a few screenshots that I was able to reproduce. I am not sure why the patch seemed to work yesterday, I apologize, I should have done more thorough testing.

No worries.

It seems load in the percentage bar is the key to repro. Can you try this:

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 046ead15a122..5b4f94d7de7a 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1015,9 +1015,8 @@ print_percentage_bar(double percent, double max, 
int max_len, bool numeric)
                 printf("%s", bars[i]);

         len -= (bar_len + (w - 1)) / w;
-       if (len < 1)
-               return;
-       n_spaces(len);
+       if (len >= 1)
+               n_spaces(len);

         putchar('|');

Regards,

Tvrtko

> 
> 
> On Tuesday, January 16th, 2024 at 12:48 PM, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> 
>>
>>
>>
>> On 16/01/2024 09:39, anonymoustranquillity@proton.me wrote:
>>
>>> Hello,
>>>
>>> I have not used send-email as my email provider (protonmail) does not seem to support SMTP (I have been meaning to switch to a self hosted provider for a while now, haven't been able to yet).
>>>
>>> This email is the one I use for FOSS contributions, it's the same one as the one I used to sign up to the freedesktop gitlab (https://gitlab.freedesktop.org/tranquillity-codes). I am unable to include my real name due to personal reasons related to my safety (since it will be visible publicly).
>>>
>>> Running intel_gpu_top on some terminal sizes seems to overflow a character at end of line N to the first character of line N+1, misalign the column marker for PIDs, and sometimes hide the first few lines describing the engines. I used alacritty on X11 to test this.
>>
>>
>> I can't repro it I'm afraid. Tried xterm, alactritty and konsole.
>> Resizing the windows to large or small it always re-renders mostly OK.
>> Mostly because if you go too small then parts of the UI start to get
>> dropped but can't really show everything if there is no space.
>>
>> What terminal size should I try, at least roughly? Or could you share a
>> screenshot somewhere?
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Thank you for your time,
>>> Ity
>>>
>>> On Tuesday, January 16th, 2024 at 9:49 AM, Tvrtko Ursulin tvrtko.ursulin@linux.intel.com wrote:
>>>
>>>> Hi,
>>>>
>>>> On 15/01/2024 15:29, Kamil Konieczny wrote:
>>>>
>>>>> Hi anonymoustranquillity,
>>>>> On 2024-01-14 at 21:26:36 +0000, anonymoustranquillity@proton.me wrote:
>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> there seems to be a problem with rendering in the interactive
>>>>>> mode in intel_gpu_top, seems to be a simple off-by-one. Below
>>>>>> is a patch. I am new to contributing via email, so I apologize
>>>>>> if I did something wrong - I tried to follow CONTRIBUTING.md
>>>>>> to the best of my ability.
>>>>
>>>> What renders incorrectly? Asking since locally things look fine for me.
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>> Have a nice day,
>>>>>> - Ity.
>>>>>
>>>>> Thank you for patch, if you would like to use git and re-send
>>>>> with the help of 'git format-patch -1' and then
>>>>> 'git send e-mail 0001-your-first.patch'
>>>>>
>>>>> Before that setup your real name and e-mail in git configuration,
>>>>> like "First Last your@email-address.me"
>>>>>
>>>>> If it is too much bother someone can take it from here
>>>>> but without your real name we cannot give you contribution
>>>>> (except for link into patchwork).
>>>>>
>>>>> +cc Tvrtko
>>>>>
>>>>> Regards,
>>>>> Kamil
>>>>>
>>>>>> ---
>>>>>> tools/intel_gpu_top.c | 2 +-
>>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>>>>>> index 046ead15a..24363e72f 100644
>>>>>> --- a/tools/intel_gpu_top.c
>>>>>> +++ b/tools/intel_gpu_top.c
>>>>>> @@ -2178,7 +2178,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
>>>>>> len += *class_w;
>>>>>> }
>>>>>>
>>>>>> - printf(" %-*s\n", con_w - len - 1, c->print_name);
>>>>>> + printf(" %-*s\n", con_w - len - 2, c->print_name);
>>>>>> } else if (output_mode == JSON) {
>>>>>> char buf[64];
>>>>>>
>>>>>> --
>>>>>> 2.43.0
