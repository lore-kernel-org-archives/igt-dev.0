Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A6210E980
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Oct 2023 11:59:03 +0000 (UTC)
Message-ID: <0d1eb92d-1b39-9e95-da93-010f4e25241e@collabora.com>
Date: Fri, 27 Oct 2023 17:28:56 +0530
MIME-Version: 1.0
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231026022041.1851831-1-vignesh.raman@collabora.com>
 <59230665-790f-4bd8-37b4-30b5446127f7@intel.com>
 <7421357d-5adf-85b4-de1a-30eee373d86b@collabora.com>
 <2b05e124-6772-ec09-1b50-f1dbfa860d57@intel.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <2b05e124-6772-ec09-1b50-f1dbfa860d57@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kms: Fix memory corruption
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: helen.koike@collabora.com, daniels@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanu,

On 27/10/23 15:25, Modem, Bhanuprakash wrote:
>> With the initial patch all-pipes subtest was passing.
> 
> Looks, these tests are considering crtc count as display->n_pipes (16), 
> but for_each_pipe() operates on IGT_MAX_PIPES (8) causing the failures.
> 
>>
>>
>>>> -    for (i = 0; i < resources->count_crtcs; i++) {
>>>> +    for (i = 0; i < min(resources->count_crtcs, IGT_MAX_PIPES); i++) {
>>>
>>> With this change, we are missing the information of crtc index 7 to 
>>> 15 in the display structure, aren't we?
>>
>> Yes agree. Do we need to fix the all-pipes subtest failure with your 
>> proposed solution?
> 
> IMHO, increasing IGT_MAX_PIPES to 16 would be the simplest solution.
> 
> @@ -68,8 +68,15 @@ enum pipe {
>           PIPE_D,
>           PIPE_E,
>           PIPE_F,
>           PIPE_G,
>           PIPE_H,
> +        PIPE_I,
> +        PIPE_J,
> +        PIPE_K,
> +        PIPE_L,
> +        PIPE_M,
> +        PIPE_N,
> +        PIPE_O,
>           IGT_MAX_PIPES
>   };

Thanks for the suggestion. This works and all-pipes subtest passed. I 
will run some tests and send v2 patch.

Regards,
Vignesh
