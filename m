Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB5D10EDDE
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Feb 2022 06:30:36 +0000 (UTC)
Message-ID: <fe397719-6b35-8e26-2a17-84d70b514355@intel.com>
Date: Fri, 4 Feb 2022 12:00:23 +0530
Content-Language: en-US
References: <20220107053238.1760508-1-bhanuprakash.modem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220107053238.1760508-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v3 i-g-t 00/15] Add IGT support for plane color
 management
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, harry.wentland@amd.com, ppaalanen@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi Pekka/Harry,

Did you get a chance to review the latest patches of Plane color management?

- Bhanu

On Fri-07-01-2022 11:02 am, Bhanuprakash Modem wrote:
>  From the Plane Color Management feature design, userspace can
> take the smart blending decisions based on hardware supported
> plane color features to obtain an accurate color profile.
> 
> These IGT patches extend the existing pipe color management
> tests to the plane level.
> 
> Kernel implementation:
> https://patchwork.freedesktop.org/series/90825/
> 
> Bhanuprakash Modem (12):
>    HAX: Get uapi headers to compile the IGT
>    lib/igt_kms: Add plane color mgmt properties
>    kms_color_helper: Add helper functions for plane color mgmt
>    tests/kms_color: New subtests for Plane gamma
>    tests/kms_color: New subtests for Plane degamma
>    tests/kms_color: New subtests for Plane CTM
>    tests/kms_color: New negative tests for plane level color mgmt
>    tests/kms_color_chamelium: New subtests for Plane gamma
>    tests/kms_color_chamelium: New subtests for Plane degamma
>    tests/kms_color_chamelium: New subtests for Plane CTM
>    tests/kms_color_chamelium: Extended IGT tests to support logarithmic
>      gamma mode
>    HAX: Add color mgmt tests to BAT
> 
> Mukunda Pramodh Kumar (3):
>    lib/igt_kms: Add pipe color mgmt properties
>    kms_color_helper: Add helper functions to support logarithmic gamma
>      mode
>    tests/kms_color: Extended IGT tests to support logarithmic gamma mode
> 
>   include/drm-uapi/drm.h                |  10 +
>   include/drm-uapi/drm_mode.h           |  28 ++
>   lib/igt_kms.c                         |   6 +
>   lib/igt_kms.h                         |   6 +
>   tests/intel-ci/fast-feedback.testlist | 112 +++++
>   tests/kms_color.c                     | 672 +++++++++++++++++++++++++-
>   tests/kms_color_chamelium.c           | 597 ++++++++++++++++++++++-
>   tests/kms_color_helper.c              | 303 +++++++++++-
>   tests/kms_color_helper.h              |  44 ++
>   9 files changed, 1761 insertions(+), 17 deletions(-)
> 
> --
> 2.32.0
> 
