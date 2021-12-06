Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8F073A75
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Dec 2021 19:51:19 +0000 (UTC)
References: <20211206090208.12923-1-stylon.wang@amd.com>
From: Rodrigo Siqueira Jordao <rjordrigo@amd.com>
Message-ID: <d10d868c-4064-f2e4-f483-be1317cd1148@amd.com>
Date: Mon, 6 Dec 2021 14:51:15 -0500
In-Reply-To: <20211206090208.12923-1-stylon.wang@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 00/11] Create tests for multi plane
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
Cc: Bhawanpreet.Lakha@amd.com, Ahmad.Othman@amd.com, Hayden.Goodfellow@amd.com
List-ID: <igt-dev@lists.freedesktop.org>



On 2021-12-06 4:01 a.m., Stylon Wang wrote:
> A series of new tests on MPO is created in tests/amdgpu/amd_plane.
> Currently most of the sub-tests are AMD-specific and concerns with
> video use cases from projects.
> 
> Changes from prior rev1 to now:
> 
> v4: Change title of cover letter
> v3: Fix conflict in meson.build
> v2: Fix conflict in meson.build
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

Hi Stylon,

Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

For this entire series.

Thanks.
