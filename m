Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9741A6EBFF
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 15:26:51 +0000 (UTC)
References: <20211119155344.2709274-1-Rodrigo.Siqueira@amd.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <56aecdcb-1269-2271-4890-c5f358a7c03c@amd.com>
Date: Wed, 24 Nov 2021 10:26:43 -0500
In-Reply-To: <20211119155344.2709274-1-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] test/amdgpu: Add multi-eDP support
 to ABM test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Cc: Roman Li <romli@amd.com>, igt-dev@lists.freedesktop.org, Mikita Lipski <mikita.lipski@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

I think I got a false-positive in this series:

https://patchwork.freedesktop.org/series/97113/

Could you trigger the CI again?

Ps.: This series is for amdgpu specific tests.

Thanks
Siqueira

On 2021-11-19 10:53 a.m., Rodrigo Siqueira wrote:
> We recently enabled multiple-eDP support on amdgpu. As a result, this
> patchset adds tests to cover this case.
> 
> Cc: Mikita Lipski <mikita.lipski@amd.com>
> Cc: Roman Li <romli@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> 
> Mikita Lipski (1):
>    tests/amdgpu: Add multi-eDP support to ABM test
> 
> Roman Li (1):
>    amdgpu/amd_abm: Double convergence timeout
> 
>   tests/amdgpu/amd_abm.c | 268 +++++++++++++++++++++++------------------
>   1 file changed, 154 insertions(+), 114 deletions(-)
> 
