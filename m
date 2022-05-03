Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4BE10F62F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 May 2022 02:52:16 +0000 (UTC)
Message-ID: <a484228b-84ed-5af2-6742-9cdb8b89b4f5@intel.com>
Date: Tue, 3 May 2022 08:22:03 +0530
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, <igt-dev@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <swati2.sharma@intel.com>
References: <20220411094147.1650859-1-bhanuprakash.modem@intel.com>
 <245be3e5-1009-ae8b-bd19-1e242d52584a@amd.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <245be3e5-1009-ae8b-bd19-1e242d52584a@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V2 0/5] Add support for connector & crtc debugfs
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

On Tue-03-05-2022 12:22 am, Harry Wentland wrote:
> On 2022-04-11 05:41, Bhanuprakash Modem wrote:
>> Add helper functions to read debugfs & update the subtests
>> to use newly added helper functions:
>>      - Read maximum bpc from connector debugfs
>>      - Read Current bpc from crtc debugfs
>>      - Compare/Assert if Current & Requested bpc are not equal
>>
>> Bhanuprakash Modem (5):
>>    lib/igt_kms: Add helper functions to read few debugfs
>>    tests/kms_color: Use debugfs apis for deep-color
>>    tests/kms_hdr: Adopt to use updated debugfs functions
>>    tests/kms_dither: Adopt to use updated debugfs functions
>>    tests/amdgpu: Adopt to use updated debugfs functions
>>
> 
> Series is:
> Acked-by: Harry Wentland <harry.wentland@amd.com>

Thanks Harry,

Also, can you slap your R-b for amdgpu tests (patch [5/5]) in this series?

- Bhanu

> 
> Harry
> 
>>   lib/igt_kms.c              | 110 +++++++++++++++++++++++++++++++++++++
>>   lib/igt_kms.h              |   7 +++
>>   tests/amdgpu/amd_dp_dsc.c  |  56 +------------------
>>   tests/amdgpu/amd_max_bpc.c |  47 +---------------
>>   tests/kms_color.c          |   9 ++-
>>   tests/kms_color_helper.c   |  46 ++--------------
>>   tests/kms_color_helper.h   |   2 +-
>>   tests/kms_dither.c         |  11 ++--
>>   tests/kms_hdr.c            |  69 +++--------------------
>>   9 files changed, 151 insertions(+), 206 deletions(-)
>>
>> --
>> 2.35.1
>>
