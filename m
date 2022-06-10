Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA2911A4DC
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 05:21:41 +0000 (UTC)
Message-ID: <683aff1b-4784-bd67-ed14-3f8b12ceb507@intel.com>
Date: Fri, 10 Jun 2022 10:51:18 +0530
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>, "Gupta, Nidhi1"
 <nidhi1.gupta@intel.com>
References: <20220520011226.24017-1-nidhi1.gupta@intel.com>
 <20220520011226.24017-2-nidhi1.gupta@intel.com>
 <YocvKicRCAmZY0aR@platvala-desk.ger.corp.intel.com>
 <PH7PR11MB60063398DB84553A1CD21ADDC5A29@PH7PR11MB6006.namprd11.prod.outlook.com>
 <Yp2x61wwuFbKE5aZ@platvala-desk.ger.corp.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <Yp2x61wwuFbKE5aZ@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_invalid_mode : Convert tests to
 dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon-06-06-2022 01:21 pm, Petri Latvala wrote:
> On Mon, Jun 06, 2022 at 08:36:08AM +0300, Gupta, Nidhi1 wrote:
>> Hi Petri,
>>
>> Thanks for the review.
>>
>> We are trying to convert all the tests in IGT into dynamic tests, for better reporting and get more data just from the name of the subtest to ease the debugging process.
>>
>> Trying to do the same with this test, this test will be executed on every pipe with valid output.
> 
> Doing that for a test that doesn't even care about pipes is not
> achieving anything.

In this test, we are trying to set invalid output mode on each pipe.

So, this subtest is running on all pipe/output combinations. Hence, it 
is reasonable to have dynamic subtests. Thoughts?

- Bhanu

> 
> 
