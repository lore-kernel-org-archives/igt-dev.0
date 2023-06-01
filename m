Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D0010E089
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 11:31:06 +0000 (UTC)
Message-ID: <4c7c908a-74c3-dde7-730f-872324387999@intel.com>
Date: Thu, 1 Jun 2023 17:00:52 +0530
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230601050928.2487611-1-kunal1.joshi@intel.com>
 <20230601050928.2487611-4-kunal1.joshi@intel.com>
 <8c8f99e86bfd03f388491d9cd71f452cfc1b8e78.camel@intel.com>
 <ae67320b-5871-baba-6a1c-90c888303462@intel.com>
 <4204d49177c441be0d21ff5838fac011f37d2a0c.camel@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <4204d49177c441be0d21ff5838fac011f37d2a0c.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] RFC
 tests/i915/kms_frontbuffer_tracking: xe doesn't support tiling as of now
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


On 6/1/2023 4:53 PM, Hogander, Jouni wrote:
> On Thu, 2023-06-01 at 16:39 +0530, Joshi, Kunal1 wrote:
>> On 6/1/2023 4:12 PM, Hogander, Jouni wrote:
>>> On Thu, 2023-06-01 at 10:39 +0530, Kunal Joshi wrote:
>>>> XE doesn't support tiling as of now, so set tiling to linear
>>> Maybe this should be taken into account in opt_handler as well?
>>> I.e.
>>> Trying to use tiling other than liner for Xe should result error.
>> Hello Jouni,
>>
>> This will be over written in setup_drm where we set tiling to linear
>> if xe,
>> To handle this in opt_handler we will need to open ,close fd,
>> can i have debug print stating opt.tiling parameter is overridden as
>> XE
>> supports onlylinear tiling,
>> how do you see it?
> how about:
>
> igt_assert(is_xe_device() && (opt.tiling == TILING_DEFAULT ||
> opt.tiling == TILING_LINEAR));
>
> in setup_drm() ?
>
Ok Jouni, will use this approach.

Thanks and Regards
Kunal Joshi

