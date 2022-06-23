Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E402113F9B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jun 2022 09:07:32 +0000 (UTC)
Message-ID: <e152fb1c-e7d0-2427-5564-37df417c5772@intel.com>
Date: Thu, 23 Jun 2022 14:37:12 +0530
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220622154837.20582-1-nidhi1.gupta@intel.com>
 <20220622154837.20582-2-nidhi1.gupta@intel.com>
 <5ccc3c41-c403-3e88-e45c-405c8e30af24@intel.com>
 <PH7PR11MB600613CB5A61601B3D50376DC5B59@PH7PR11MB6006.namprd11.prod.outlook.com>
 <4c36f9e7-3103-35b2-3fd8-efcfde22904e@intel.com>
 <YrQVy1l/4gh9vHqB@platvala-desk.ger.corp.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <YrQVy1l/4gh9vHqB@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_invalid_mode: Convert
 tests to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 Nidhi1" <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu-23-06-2022 12:57 pm, Petri Latvala wrote:
> On Thu, Jun 23, 2022 at 11:43:01AM +0530, Modem, Bhanuprakash wrote:
>> On Thu-23-06-2022 11:25 am, Gupta, Nidhi1 wrote:
>>> Hi Bhanu,
>>>
>>> In many tests we are using drm calls, like drmModePageFlip, drmModeSetCrtc, if I will replace it with igt wrapper it will increase the code lines, should I still change it?
>>
>> It's fine to increase the number of lines of code. The idea is to use IGT
>> wrappers wherever it's possible, since IGT helpers were developed
>> purposefully and more handy.
>>
>> Ofcourse, in some tests it is not possible to use these IGT helpers, ex:
>> kms_setmode.
>>
>> @Petri, any thoughts?
> 
> When possible, igt wrappers should be preferred, yes.

Thanks Petri,

@Nidhi, please plan to fix as part of cleanup.

> 
> 
