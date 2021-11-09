Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2059.outbound.protection.outlook.com [40.107.101.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B89889CAA
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Nov 2021 15:52:28 +0000 (UTC)
References: <20211104142212.3098989-1-Rodrigo.Siqueira@amd.com>
 <YD9g7MincmSpHKokI9Hxv8LRxCcqmJieUwB_QqxG3lDLAAo8dqQTt0POThWwrYYVIlXby4q2S7CfuTsTgB6WlureHfe_Irct-a41bKvxzIk=@emersion.fr>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <04b490f7-edbb-f536-995d-5b185a62181a@amd.com>
Date: Tue, 9 Nov 2021 10:52:23 -0500
In-Reply-To: <YD9g7MincmSpHKokI9Hxv8LRxCcqmJieUwB_QqxG3lDLAAo8dqQTt0POThWwrYYVIlXby4q2S7CfuTsTgB6WlureHfe_Irct-a41bKvxzIk=@emersion.fr>
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
To: Simon Ser <contact@emersion.fr>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, lakshminarayana.vudum@intel.com
Cc: igt-dev@lists.freedesktop.org, Hayden Goodfellow <Hayden.Goodfellow@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshminarayana,

It looks like that I got a false-positive from the CI. Here is the 
patchwork link:

https://patchwork.freedesktop.org/series/96573/

Notice that this patch is specific to AMD.

On 2021-11-04 10:38 a.m., Simon Ser wrote:
> Reviewed-by: Simon Ser <contact@emersion.fr>
> 

Thanks Simon :)

Best Regards
Siqueira
