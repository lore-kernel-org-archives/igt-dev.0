Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B7310E4F2
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 05:57:11 +0000 (UTC)
Message-ID: <51df798f-677c-99f3-5f86-191c80643c28@intel.com>
Date: Fri, 6 May 2022 11:26:57 +0530
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20220107053238.1760508-1-bhanuprakash.modem@intel.com>
 <fe397719-6b35-8e26-2a17-84d70b514355@intel.com>
 <20220429151955.7a78faae@eldfell>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220429151955.7a78faae@eldfell>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri-29-04-2022 05:49 pm, Pekka Paalanen wrote:
> On Fri, 4 Feb 2022 12:00:23 +0530
> "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com> wrote:
> 
>> Hi Pekka/Harry,
>>
>> Did you get a chance to review the latest patches of Plane color management?
> 
> Hi,
> 
> no, I didn't, sorry.

I just rebased and floated this series again to re-trigger the 
discussions. If you get some time, please review this latest rev of IGT 
patches.

- Bhanu

> 
> I'm also not following dri-devel@ or igt-dev@ unless explicitly Cc'd.
> 
> 
> Thanks,
> pq
> 
>> On Fri-07-01-2022 11:02 am, Bhanuprakash Modem wrote:
>>>   From the Plane Color Management feature design, userspace can
>>> take the smart blending decisions based on hardware supported
>>> plane color features to obtain an accurate color profile.
>>>
>>> These IGT patches extend the existing pipe color management
>>> tests to the plane level.
>>>
>>> Kernel implementation:
>>> https://patchwork.freedesktop.org/series/90825/
>>>
>>> Bhanuprakash Modem (12):
>>>     HAX: Get uapi headers to compile the IGT
>>>     lib/igt_kms: Add plane color mgmt properties
>>>     kms_color_helper: Add helper functions for plane color mgmt
>>>     tests/kms_color: New subtests for Plane gamma
>>>     tests/kms_color: New subtests for Plane degamma
>>>     tests/kms_color: New subtests for Plane CTM
>>>     tests/kms_color: New negative tests for plane level color mgmt
>>>     tests/kms_color_chamelium: New subtests for Plane gamma
>>>     tests/kms_color_chamelium: New subtests for Plane degamma
>>>     tests/kms_color_chamelium: New subtests for Plane CTM
>>>     tests/kms_color_chamelium: Extended IGT tests to support logarithmic
>>>       gamma mode
>>>     HAX: Add color mgmt tests to BAT
>>>
>>> Mukunda Pramodh Kumar (3):
>>>     lib/igt_kms: Add pipe color mgmt properties
>>>     kms_color_helper: Add helper functions to support logarithmic gamma
>>>       mode
>>>     tests/kms_color: Extended IGT tests to support logarithmic gamma mode
>>>
>>>    include/drm-uapi/drm.h                |  10 +
>>>    include/drm-uapi/drm_mode.h           |  28 ++
>>>    lib/igt_kms.c                         |   6 +
>>>    lib/igt_kms.h                         |   6 +
>>>    tests/intel-ci/fast-feedback.testlist | 112 +++++
>>>    tests/kms_color.c                     | 672 +++++++++++++++++++++++++-
>>>    tests/kms_color_chamelium.c           | 597 ++++++++++++++++++++++-
>>>    tests/kms_color_helper.c              | 303 +++++++++++-
>>>    tests/kms_color_helper.h              |  44 ++
>>>    9 files changed, 1761 insertions(+), 17 deletions(-)
>>>
>>> --
>>> 2.32.0
>>>    
>>
> 
