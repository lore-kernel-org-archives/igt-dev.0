Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80606E842
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Aug 2021 12:54:56 +0000 (UTC)
Date: Thu, 26 Aug 2021 08:39:09 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210826123909.3bfelyirr3hsqfvl@outlook.office365.com>
References: <20210719125835.652219-1-stylon.wang@amd.com>
 <20210825122413.1708578-1-stylon.wang@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825122413.1708578-1-stylon.wang@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 0/2] New ASSR test on DP/eDP links
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Stylon Wang <stylon.wang@amd.com>
Cc: igt-dev@lists.freedesktop.org, nicholas.kazlauskas@amd.com, sunpeng.li@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

On 08/25, Stylon Wang wrote:
> Create new tests for checking if ASSR is working on eDP displays.
> The tests also cover embedded and non-removable displays that
> appear as DP.
> 
> Currrently the tests are verified to work on AMD hardware but failing
> on some others, so they are AMD-specific for the time being.
> 
> Changes from prior rev1 to now:
> 
> v4:
>   - Move tests back to being amdgpu specific
>   - Fix spacing in the test description
> v3:
>   - Move tests from amdgpu to generic
> v2:
>   - Fix static local variable used in path name creation
>   - Fix test assertion
>   - Allow tests to run on any GPU
>   - Keep test in alphabetical order
> 
> Stylon Wang (2):
>   tests/amdgpu: New ASSR test on DP/eDP links
>   tests/amdgpu: Add suspend and DPMS subtests to ASSR test
> 
>  tests/amdgpu/amd_assr.c  | 303 +++++++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build |   1 +
>  2 files changed, 304 insertions(+)
>  create mode 100644 tests/amdgpu/amd_assr.c
> 
> -- 
> 2.32.0
>

Hi Stylon,

Thanks for this new version. Everything looks ok to me, series is:

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com> 

-- 
Rodrigo Siqueira
https://siqueira.tech
