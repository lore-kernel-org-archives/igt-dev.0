Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2077.outbound.protection.outlook.com [40.107.95.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B98F10E3F1
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Nov 2023 20:00:39 +0000 (UTC)
Message-ID: <8896a7e9-5ce6-4ae8-81b8-43e8c815901f@amd.com>
Date: Mon, 6 Nov 2023 15:00:35 -0500
Content-Language: en-US
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com
References: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/5] Add a new test for Sub-viewport
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2023-11-03 14:22, Aurabindo Pillai wrote:
> Changes in v2
> =================
> 
> * Removed an unused struct definition
> * Fixes style issues reported by checkpatch.pl
> * Added SPDX license identifier to the new test
> * Fixed #include order for system includes
> 
> ---
> 
> Aurabindo Pillai (5):
>    lib/amdgpu: Remove unused struct
>    llib/amd: Update function documentation
>    lib/amd: improve readablity for MALL capability check
>    lib/amd: Add check for SubVP feature status
>    test/amdgpu: Add test for Sub-viewport
> 
>   lib/igt_amd.c            |  44 ++++++++--
>   lib/igt_amd.h            |   1 +
>   tests/amdgpu/amd_subvp.c | 180 +++++++++++++++++++++++++++++++++++++++
>   tests/amdgpu/meson.build |   1 +
>   4 files changed, 217 insertions(+), 9 deletions(-)
>   create mode 100644 tests/amdgpu/amd_subvp.c
> 

Hi Kamil,

Any other concerns?
