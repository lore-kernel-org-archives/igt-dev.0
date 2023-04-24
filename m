Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8052F10E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 08:13:26 +0000 (UTC)
Message-ID: <800c831c-8a60-95f3-2b14-d9383f32a806@intel.com>
Date: Mon, 24 Apr 2023 13:43:06 +0530
Content-Language: en-US
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230418164501.1687266-27-bhanuprakash.modem@intel.com>
 <347cb1aa-8064-a50e-72a2-b48bde93751d@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <347cb1aa-8064-a50e-72a2-b48bde93751d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t,26/45] tests/color: Add XE support
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

Hi Kunal,

On Mon-24-04-2023 01:30 pm, Joshi, Kunal1 wrote:
> 
> On 4/18/2023 10:14 PM, Bhanuprakash Modem wrote:
>> Add XE driver support for kms tests.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/chamelium/kms_chamelium_color.c |  2 +-
>>   tests/kms_color.c                     | 10 +++++-----
>>   tests/kms_color_helper.c              |  2 +-
>>   3 files changed, 7 insertions(+), 7 deletions(-)
>>
> Function i915_pipe_output_combo_valid in tests/kms_color_helper.c should 
> be renamed to intel_pipe_output_combo_valid
> Please ignore if already part of other series

This renaming task is not included in any series. Will plan after 
merging this XE series.

- Bhanu

> 
> Failures seen on newer platforms are expected due to pipe rounding issue
> LGTM
> Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
