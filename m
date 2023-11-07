Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FF210E13E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 11:24:10 +0000 (UTC)
Message-ID: <653b83e4-940c-42f8-b72f-d8fb3fc0a604@collabora.com>
Date: Tue, 7 Nov 2023 11:24:04 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 bhanuprakash.modem@intel.com, igt-dev@lists.freedesktop.org
References: <20231027144022.2016354-1-vignesh.raman@collabora.com>
 <797dd2bf-25a3-4a6a-b2eb-5c5cbdb25b09@collabora.com>
 <a106c443-eb67-c413-1ac0-cb8a86e8ab30@collabora.com>
 <c1431a29-7346-4812-aad7-1802f4e33952@collabora.com>
 <1b0a6bc9-9e45-95b7-a108-738dd7fd2a90@collabora.com>
From: Daniel Stone <daniels@collabora.com>
In-Reply-To: <1b0a6bc9-9e45-95b7-a108-738dd7fd2a90@collabora.com>
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

On 07/11/2023 08:58, Vignesh Raman wrote:
> On 06/11/23 20:13, Daniel Stone wrote:
>> What I mean is to make sure that the code cannot access out of 
>> bounds, regardless of the number. We can set IGT_MAX_PIPES to 32 but 
>> then someone will hit the same failure when there are more CRTCs than 
>> that.
>>
>> The way to do this would probably be to igt_require() that 
>> count_crtcs does not exceed IGT_MAX_PIPES, in all the paths where we 
>> access the crtcs array. There is no need to bump the limit to 32 
>> until it's required.
>
> Okay understood. We can use igt_assert_f to make the test fail 
> (instead of skipping it) if count_crtcs exceeds IGT_MAX_PIPES.
>
> ERROR - Igt error: (kms_vblank:81) igt_kms-CRITICAL: Failed assertion: 
> resources->count_crtcs <= IGT_MAX_PIPES
> ERROR - Igt error: (kms_vblank:81) igt_kms-CRITICAL: count_crtcs 
> exceeds IGT_MAX_PIPES, count_crtcs=16, IGT_MAX_PIPES=8
> ERROR - Igt error: Test kms_vblank failed.
>
> I will check other code paths as well. Thanks.

That's perfect, thanks Vignesh.

Cheers,

Daniel

