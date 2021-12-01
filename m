Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADF96E951
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 22:09:14 +0000 (UTC)
References: <20211130083503.10221-1-stylon.wang@amd.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <85623d50-b802-88a7-6be7-cfd27595fe93@amd.com>
Date: Wed, 1 Dec 2021 17:09:03 -0500
In-Reply-To: <20211130083503.10221-1-stylon.wang@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 00/11] Create tests for multi-plane
 overlay
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Stylon Wang <stylon.wang@amd.com>, igt-dev@lists.freedesktop.org
Cc: anson.jacob@amd.com, Bhawanpreet.Lakha@amd.com, Ahmad.Othman@amd.com, Hayden.Goodfellow@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi Stylon,

I think your patch need has merge conflict in the upstream.

Maybe rebase your change in the latest code from the master, and resend 
it as a V2.

Thanks
Siqueira

On 2021-11-30 3:34 a.m., Stylon Wang wrote:
> A series of new tests on MPO is added to tests/amdgpu/amd_plane.
> 
> Currently most of the sub-tests are AMD-specific and concerns with
> video use cases from projects.
> 
> Ahmad Othman (1):
>    tests/amdgpu/amd_plane: fixes for test-4k-mpo
> 
> Anson Jacob (1):
>    tests/amdgpu/amd_plane: Ensure pipes are enabled before accessing
> 
> Bhawanpreet Lakha (4):
>    tests/amdgpu/amd_plane: Create mpo panning test
>    tests/amdgpu/amd_plane: Create mpo swap between 2 displays test
>    tests/amdgpu/amd_plane: Create mpo scaling tests
>    tests/amdgpu/amd_plane: Add full screen scaling test case
> 
> Nicholas Kazlauskas (1):
>    tests/amdgpu/amd_plane: Add MPO swizzle mode toggle test
> 
> Stylon Wang (1):
>    tests/amdgpu/amd_plane: Add P010 format to MPO tests and add test
>      descriptions
> 
> Victor Lu (3):
>    tests/amdgpu/amd_plane: Introduced 4K MPO test
>    tests/amdgpu/amd_plane: Switch mpo-swizzle-toggle to single-head
>    tests/amdgpu/amd_plane: Add MPO scale and pan subtest single display
>      option
> 
>   tests/amdgpu/amd_plane.c | 805 +++++++++++++++++++++++++++++++++++++++
>   tests/amdgpu/meson.build |   1 +
>   2 files changed, 806 insertions(+)
>   create mode 100644 tests/amdgpu/amd_plane.c
> 
