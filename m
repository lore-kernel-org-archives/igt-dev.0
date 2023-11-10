Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC7910E994
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 11:38:15 +0000 (UTC)
Message-ID: <5299cd15-dc06-5431-a13c-627b962646be@collabora.com>
Date: Fri, 10 Nov 2023 17:08:08 +0530
MIME-Version: 1.0
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 daniels@collabora.com, helen.koike@collabora.com,
 juhapekka.heikkila@gmail.com, igt-dev@lists.freedesktop.org
References: <20231110084106.655504-1-vignesh.raman@collabora.com>
 <b4585b60-0fa7-c139-401d-fb215fac4336@intel.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <b4585b60-0fa7-c139-401d-fb215fac4336@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/3 v5] lib/igt_kms: Fix memory
 corruption
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

Hi Bhanu,

On 10/11/23 15:21, Modem, Bhanuprakash wrote:
>> @@ -2770,6 +2770,10 @@ void igt_display_require(igt_display_t 
>> *display, int drm_fd)
>>       }
>>   #endif
>> +    igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,
> ---------------------------------------------^
> As pipe index starts from 0, we must use '<' not '<='.

igt_require_f - Skip a (sub-)test if a condition is not met

igt_require_f(resources->count_crtcs <= IGT_MAX_PIPES,
                      "count_crtcs exceeds IGT_MAX_PIPES, 
resources->count_crtcs=%d, IGT_MAX_PIPES=%d\n",
                      resources->count_crtcs, IGT_MAX_PIPES);

If count_crtcs=16 and IGT_MAX_PIPES=16 (In the current case with 
virtio-gpu),

count_crtcs <= IGT_MAX_PIPES will be true and test requirement is passed 
and following statement will be executed.
display->n_pipes = IGT_MAX_PIPES;

In another case,
count_crtcs < IGT_MAX_PIPES will be false and test will be skipped,

So we need to use <= right?

>>   enum pipe {
>> @@ -70,7 +80,15 @@ enum pipe {
>>           PIPE_F,
>>       PIPE_G,
>>       PIPE_H,
>> -        IGT_MAX_PIPES
>> +    PIPE_I,
>> +    PIPE_J,
>> +    PIPE_K,
>> +    PIPE_L,
>> +    PIPE_M,
>> +    PIPE_N,
>> +    PIPE_O,
>> +    PIPE_P,
>> +    IGT_MAX_PIPES
> 
> Please don't mix tabs & spaces, and try to align with the declaration of 
> previous pipes.

The previous ones G and H used tabs and the rest were spaces. I will use 
spaces for all now.

> 
> Apart from these minor fixes, this patch LGTM. With above comments 
> addressed, this patch is
> 
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Thank you.

Regards,
Vignesh
