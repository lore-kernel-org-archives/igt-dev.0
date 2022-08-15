Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C74CEB2E
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 17:23:52 +0000 (UTC)
Message-ID: <2c95ac8d-a323-468b-6bbe-15fff02a6969@igalia.com>
Date: Mon, 15 Aug 2022 14:23:30 -0300
MIME-Version: 1.0
Content-Language: en-US
To: Tales <tales.aparecida@gmail.com>
References: <20220815145146.24038-1-tales.aparecida@gmail.com>
 <20220815145146.24038-5-tales.aparecida@gmail.com>
 <10bea995-4d44-1f86-a92b-d9e4552e1463@igalia.com>
 <CAGVoLp557zL7bVWi7Qcr7QtBcrZjttRyd_jjw_o4_Rdoyfx3qg@mail.gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <CAGVoLp557zL7bVWi7Qcr7QtBcrZjttRyd_jjw_o4_Rdoyfx3qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/4] lib/igt_kmod: add igt_kselftests
 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, siqueirajordao@riseup.net,
 Magali Lemes <magalilemes00@gmail.com>, igt-dev@lists.freedesktop.org,
 Isabella Basso <isabbasso@riseup.net>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@riseup.net>,
 Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 8/15/22 14:20, Tales wrote:
> Hello,
> 
> Em seg., 15 de ago. de 2022 às 13:46, André Almeida <tonyk@igalia.com> escreveu:
>>
>> Hi Tales,
>>
>> On 8/15/22 11:51, Tales Aparecida wrote:
>>> Add documentation for igt_kselftests functions and structs. Also adds
>>> comments to non trivial lines.
>>>
>>> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
>>> ---
>>>
>>> Notes:
>>>       v2 -> v3: rephrase igt_kselftest_begin() documentation to say skips instead of fails
>>>
>>>    lib/igt_kmod.c | 109 +++++++++++++++++++++++++++++++++++++++++++++++++
>>>    lib/igt_kmod.h |  18 ++++++++
>>>    2 files changed, 127 insertions(+)
>>>
>>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>>> index 5864f68c..a39bec18 100644
>>> --- a/lib/igt_kmod.c
>>> +++ b/lib/igt_kmod.c
>>> @@ -792,6 +792,12 @@ igt_amdgpu_driver_unload(void)
>>>        return IGT_EXIT_SUCCESS;
>>>    }
>>>
>>> +/**
>>> + * kmsg_dump:
>>> + * @fd: file descriptor for `/dev/kmsg` opened for reading
>>
>> In other places you refer to this file as
>> <filename>/dev/kmsg</filename>, should it be the same here?
> 
> I might have skipped this one just to avoid line breaking.
> I found that using the <filename> tag provides very similar styling to
> `back tick quoting` when rendering the documentation,
> but can make the raw code less readable.
> 
> I can convert it though!
> 

I see, thanks for the clarification. I think it can be left as this, but 
it's a good practice to be consistent given that people may use this as 
reference for new documentation.

Anyhow, series is Reviewed-by: André Almeida <andrealmeid@igalia.com>

> Thanks for the review, André.
> 
> Kind regards,
> Tales
