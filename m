Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6410A6EA07
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Sep 2021 15:01:00 +0000 (UTC)
Date: Fri, 10 Sep 2021 11:00:54 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210910150054.lv2ino3voqql76nr@outlook.office365.com>
References: <20210901123752.14633-1-stylon.wang@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901123752.14633-1-stylon.wang@amd.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/3] Add tests to check Freesync
 capability reporting
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

Hi Stylon,

This series lgtm.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 09/01, Stylon Wang wrote:
> These new tests check if Freesync capability are correctly parsed from
> EDID and reported to debugfs. They were originally made for Freesync
> HDMI only and got extended to cover DP displays. Simulated hotplug triggered
> via debugfs is used to implement the tests and is the major reason why
> the tests are made amdgpu specific.
> 
> Changes from prior rev1 to now:
> 
> v2:
> - Add missing call to igt_amd_require_hpd()
> 
> Stylon Wang (3):
>   tests/amdgpu: Add tests for Freesync capability reporting on HDMI & DP
>     displays
>   tests/amdgpu: Add tests for relaxed reporting of Freesync capability
>   tests/amdgpu: Add tests for Freesync capability with suspend-resume
> 
>  tests/amdgpu/amd_vrr_range.c | 342 +++++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build     |   1 +
>  2 files changed, 343 insertions(+)
>  create mode 100644 tests/amdgpu/amd_vrr_range.c
> 
> -- 
> 2.32.0
> 

-- 
Rodrigo Siqueira
https://siqueira.tech
