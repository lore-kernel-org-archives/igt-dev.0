Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF1C6E5A1
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Nov 2021 15:25:13 +0000 (UTC)
References: <20211104142212.3098989-1-Rodrigo.Siqueira@amd.com>
 <YD9g7MincmSpHKokI9Hxv8LRxCcqmJieUwB_QqxG3lDLAAo8dqQTt0POThWwrYYVIlXby4q2S7CfuTsTgB6WlureHfe_Irct-a41bKvxzIk=@emersion.fr>
 <04b490f7-edbb-f536-995d-5b185a62181a@amd.com>
 <836037356a9641b8ac6e5b5dffb86134@intel.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <1f83bb48-8cf8-2d9d-e757-f8e49faca2ea@amd.com>
Date: Wed, 10 Nov 2021 10:25:08 -0500
In-Reply-To: <836037356a9641b8ac6e5b5dffb86134@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "test/kms_atomic: Skip plane
 overlay test for amdgpu"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, Simon Ser <contact@emersion.fr>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Hayden Goodfellow <Hayden.Goodfellow@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>



On 2021-11-09 12:00 p.m., Vudum, Lakshminarayana wrote:
> Hi,
> 
> We have an issue already for the regression failure. Just re-reported the results.
> https://gitlab.freedesktop.org/drm/intel/-/issues/2867>> All tests - dmesg-warn - *ERROR* power well AUX (G)? TBT\d state mismatch (refcount 1/enabled 0)

In that case, can I safely apply this patch?

Thanks
Siqueira

> Thanks,
> Lakshmi.
> -----Original Message-----
> From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
> Sent: Tuesday, November 9, 2021 7:52 AM
> To: Simon Ser <contact@emersion.fr>; Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>; Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Harry Wentland <harry.wentland@amd.com>; Nicholas Choi <Nicholas.Choi@amd.com>; Hayden Goodfellow <Hayden.Goodfellow@amd.com>; Mark Yacoub <markyacoub@chromium.org>
> Subject: Re: [PATCH i-g-t] Revert "test/kms_atomic: Skip plane overlay test for amdgpu"
> 
> Hi Lakshminarayana,
> 
> It looks like that I got a false-positive from the CI. Here is the patchwork link:
> 
> https://patchwork.freedesktop.org/series/96573/>> 
> Notice that this patch is specific to AMD.
> 
> On 2021-11-04 10:38 a.m., Simon Ser wrote:
>> Reviewed-by: Simon Ser <contact@emersion.fr>
>>
> 
> Thanks Simon :)
> 
> Best Regards
> Siqueira
> 
