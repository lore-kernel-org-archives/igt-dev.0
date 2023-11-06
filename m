Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0F610E0B5
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Nov 2023 02:40:19 +0000 (UTC)
Message-ID: <a106c443-eb67-c413-1ac0-cb8a86e8ab30@collabora.com>
Date: Mon, 6 Nov 2023 08:10:13 +0530
MIME-Version: 1.0
To: Daniel Stone <daniels@collabora.com>, bhanuprakash.modem@intel.com,
 igt-dev@lists.freedesktop.org
References: <20231027144022.2016354-1-vignesh.raman@collabora.com>
 <797dd2bf-25a3-4a6a-b2eb-5c5cbdb25b09@collabora.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <797dd2bf-25a3-4a6a-b2eb-5c5cbdb25b09@collabora.com>
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

Hi Daniel,

On 27/10/23 22:07, Daniel Stone wrote:
> Hi Vignesh,
> 
> On 27/10/2023 15:40, Vignesh Raman wrote:
>> In crosvm, the kernel reports 16 for count_crtcs, which exceeds
>> IGT_MAX_PIPES set to 8. The function igt_display_require allocates
>> memory for IGT_MAX_PIPES members of igt_pipe_t structures, but then
>> writes into it based on the count_crtcs reported by the kernel,
>> resulting in memory corruption.
> 
> To make this robust against future changes (32 CRTCs seems totally 
> fanciful, but so did 16 a while ago), this needs to also be robust 
> against count_crtcs exceeding IGT_NUM_PIPES, along the lines of your 
> previous change.

Yes, I agree to make the code robust against potential changes in the 
future. We can set IGT_MAX_PIPES to 32. I will send an updated patch.

Thanks.

Regards,
Vignesh


