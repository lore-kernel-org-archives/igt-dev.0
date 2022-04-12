Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7845310E43A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Apr 2022 14:37:59 +0000 (UTC)
Message-ID: <18e849d1-e1a0-42b5-b9fa-f7d8d5e0e4f4@intel.com>
Date: Tue, 12 Apr 2022 20:07:36 +0530
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220412104616.1669124-1-bhanuprakash.modem@intel.com>
 <YlVowJW3h0iVFl+t@platvala-desk.ger.corp.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <YlVowJW3h0iVFl+t@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] intel-ci: Drop
 kms_setmode@basic-clone-single-crtc from BAT
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

On Tue-12-04-2022 05:25 pm, Petri Latvala wrote:
> On Tue, Apr 12, 2022 at 04:16:16PM +0530, Bhanuprakash Modem wrote:
>> Remove subtest "kms_setmode@basic-clone-single-crtc" from the
>> BAT test-list as most BAT systems are having single display
>> only and this subtest requires a multi-display configuration.
>>
>> Cc: Petri Latvala <petri.latvala@intel.com>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> True, there's only fi-snb-2600 that has non-skips on this test. But
> wouldn't it be better to request more multi-display configs in the BAT
> farm?
> 
>  From what I can see, removing this test from fast-feedback gains under
> 2 seconds of runtime on said fi-snb-2600, 0.001s on the other
> platforms. What's the real gain here?

Yeah, we won't gain much in CI time, but AFAIK, SKIPs are not 
recommended in BAT. Otherwise we need to update the CI-buglog to mark 
these SKIPs are expected.

- Bhanu

> 
> 
