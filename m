Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAE310E334
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Nov 2023 14:43:28 +0000 (UTC)
Message-ID: <c1431a29-7346-4812-aad7-1802f4e33952@collabora.com>
Date: Mon, 6 Nov 2023 14:43:23 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 bhanuprakash.modem@intel.com, igt-dev@lists.freedesktop.org
References: <20231027144022.2016354-1-vignesh.raman@collabora.com>
 <797dd2bf-25a3-4a6a-b2eb-5c5cbdb25b09@collabora.com>
 <a106c443-eb67-c413-1ac0-cb8a86e8ab30@collabora.com>
From: Daniel Stone <daniels@collabora.com>
In-Reply-To: <a106c443-eb67-c413-1ac0-cb8a86e8ab30@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/igt_kms: Fix memory corruption
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: helen.koike@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vignesh,

On 06/11/2023 02:40, Vignesh Raman wrote:
> Hi Daniel,
>
> On 27/10/23 22:07, Daniel Stone wrote:
>> Hi Vignesh,
>>
>> On 27/10/2023 15:40, Vignesh Raman wrote:
>>> In crosvm, the kernel reports 16 for count_crtcs, which exceeds
>>> IGT_MAX_PIPES set to 8. The function igt_display_require allocates
>>> memory for IGT_MAX_PIPES members of igt_pipe_t structures, but then
>>> writes into it based on the count_crtcs reported by the kernel,
>>> resulting in memory corruption.
>>
>> To make this robust against future changes (32 CRTCs seems totally 
>> fanciful, but so did 16 a while ago), this needs to also be robust 
>> against count_crtcs exceeding IGT_NUM_PIPES, along the lines of your 
>> previous change.
>
> Yes, I agree to make the code robust against potential changes in the 
> future. We can set IGT_MAX_PIPES to 32. I will send an updated patch.

What I mean is to make sure that the code cannot access out of bounds, 
regardless of the number. We can set IGT_MAX_PIPES to 32 but then 
someone will hit the same failure when there are more CRTCs than that.

The way to do this would probably be to igt_require() that count_crtcs 
does not exceed IGT_MAX_PIPES, in all the paths where we access the 
crtcs array. There is no need to bump the limit to 32 until it's required.

Cheers,
Daniel
