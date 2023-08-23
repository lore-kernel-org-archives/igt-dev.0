Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5FF10E3DE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 08:03:30 +0000 (UTC)
Date: Wed, 23 Aug 2023 10:02:43 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230823080243.sniyeayghyzw34df@kamilkon-desk.igk.intel.com>
References: <20230821140712.1034591-1-aurabindo.pillai@amd.com>
 <20230821140712.1034591-2-aurabindo.pillai@amd.com>
 <581a47bb-0e4c-7408-d107-5ad0e5da8c9e@amd.com>
 <97b7e6a3-bf81-4a17-b224-1351d8dedf53@amd.com>
 <20230822194558.3tebkhiztteeq7rv@kamilkon-desk.igk.intel.com>
 <f7a7f4ac-f8ab-4102-ac98-00244235a0f1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f7a7f4ac-f8ab-4102-ac98-00244235a0f1@amd.com>
Subject: Re: [igt-dev] [PATCH v4 2/2] tests/amdgpu: Add test for ODM combine
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

Hi Aurabindo,

On 2023-08-22 at 16:18:08 -0400, Aurabindo Pillai wrote:
> 
> 
> On 2023-08-22 15:45, Kamil Konieczny wrote:
> > Hi Aurabindo,
> > 
> > On 2023-08-21 at 16:18:42 -0400, Aurabindo Pillai wrote:
> > > Thanks for the review Alex.
> > > 
> > > Kamil,
> > > 
> > > There seems to be a false positive failure for this patchset:
> > > https://lists.freedesktop.org/archives/igt-dev/2023-August/060105.html
> > > 
> > > Do you have any further review suggestions or is it okay to merge ?
> > > 
> > 
> > This is not ok, on some images your test will not build,
> > to reproduce:
> > 
> > follow links from failed build to find out what image was used
> > for example here: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47853345
> > 
> > install podman, enter to igt-tools source dir,
> > then run script:
> > 
> > POD_IGT=registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian:commit-26f3d20c6ff4274aeb71d4851cdf7a7cefb0a008
> > 
> > mkdir -p /tmp/igt-build
> > cp -R * /tmp/igt-build/
> > sudo podman run -i -t -v /tmp/igt-build/:/opt/builds --privileged ${POD_IGT}
> > 
> > ## end of script
> > 
> > now you will have root prompt '#' inside podman image (debian),
> > enter commands:
> > 
> > # cd /opt/builds
> > # meson build
> > # ninja -C build
> > 
> > imho this is problem on some old(?) systems where the system
> > and/or igt headers are missing.
> > 
> > Please fix this before merging.
> > 
> 
> Hi Kamil,
> 
> Thanks for the detailed steps. The Patchwork CI showed build success, which
> is why I merged the patches. I have a oneliner fix that I'll send to the
> list.

Well I do not see it, even now it shows build failure but there is color
issue with that (for me it is hard to diff between green and that orange).
It shows success (green) for Fi.CI.BAT so maybe you missed GitLab.build
status. Please always look into build warnings, wait a few days for
replay as people sometimes go to vacations/meetings/conferences, ask on
irc #igt/oftc.

I also plan to add some help for container how-to or instead adding some
script into scripts/podman-example.sh. +cc Petri

Regards,
Kamil

> 
> --
> 
> Thanks & Regards,
> Jay
