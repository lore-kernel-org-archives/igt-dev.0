Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB4710E071
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 20:18:14 +0000 (UTC)
Message-ID: <f7a7f4ac-f8ab-4102-ac98-00244235a0f1@amd.com>
Date: Tue, 22 Aug 2023 16:18:08 -0400
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 hersenxs.wu@amd.com, rodrigo.siqueira@amd.com
References: <20230821140712.1034591-1-aurabindo.pillai@amd.com>
 <20230821140712.1034591-2-aurabindo.pillai@amd.com>
 <581a47bb-0e4c-7408-d107-5ad0e5da8c9e@amd.com>
 <97b7e6a3-bf81-4a17-b224-1351d8dedf53@amd.com>
 <20230822194558.3tebkhiztteeq7rv@kamilkon-desk.igk.intel.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20230822194558.3tebkhiztteeq7rv@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 2/2] tests/amdgpu: Add test for ODM combine
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



On 2023-08-22 15:45, Kamil Konieczny wrote:
> Hi Aurabindo,
> 
> On 2023-08-21 at 16:18:42 -0400, Aurabindo Pillai wrote:
>> Thanks for the review Alex.
>>
>> Kamil,
>>
>> There seems to be a false positive failure for this patchset:
>> https://lists.freedesktop.org/archives/igt-dev/2023-August/060105.html
>>
>> Do you have any further review suggestions or is it okay to merge ?
>>
> 
> This is not ok, on some images your test will not build,
> to reproduce:
> 
> follow links from failed build to find out what image was used
> for example here: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47853345
> 
> install podman, enter to igt-tools source dir,
> then run script:
> 
> POD_IGT=registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-26f3d20c6ff4274aeb71d4851cdf7a7cefb0a008
> 
> mkdir -p /tmp/igt-build
> cp -R * /tmp/igt-build/
> sudo podman run -i -t -v /tmp/igt-build/:/opt/builds --privileged ${POD_IGT}
> 
> ## end of script
> 
> now you will have root prompt '#' inside podman image (debian),
> enter commands:
> 
> # cd /opt/builds
> # meson build
> # ninja -C build
> 
> imho this is problem on some old(?) systems where the system
> and/or igt headers are missing.
> 
> Please fix this before merging.
> 

Hi Kamil,

Thanks for the detailed steps. The Patchwork CI showed build success, 
which is why I merged the patches. I have a oneliner fix that I'll send 
to the list.

--

Thanks & Regards,
Jay
