Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC5E6E563
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 07:36:57 +0000 (UTC)
References: <20200327044250.64274-1-ashutosh.dixit@intel.com>
 <87wo76s8or.wl-ashutosh.dixit@intel.com>
 <91876d66-5ba8-0351-583e-8baf1ff4a1e1@intel.com>
 <87v9mpsjqp.wl-ashutosh.dixit@intel.com>
 <199e0a58-95d0-f88f-efef-12d59bacdd76@intel.com>
 <87r1xdshml.wl-ashutosh.dixit@intel.com>
 <87lfnhm52d.wl-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <5fdba63f-3e17-7b20-663b-ffbe08294235@intel.com>
Date: Tue, 31 Mar 2020 10:36:54 +0300
MIME-Version: 1.0
In-Reply-To: <87lfnhm52d.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: add a test for OA data
 polling reads using "small" buffers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 31/03/2020 09:06, Dixit, Ashutosh wrote:
> On Fri, 27 Mar 2020 12:49:22 -0700, Dixit, Ashutosh wrote:
>> On Fri, 27 Mar 2020 12:06:13 -0700, Lionel Landwerlin wrote:
>>> On 27/03/2020 21:03, Dixit, Ashutosh wrote:
>>>> On Fri, 27 Mar 2020 09:09:41 -0700, Lionel Landwerlin wrote:
>>>>> On 27/03/2020 06:50, Dixit, Ashutosh wrote:
>>>>>> On Thu, 26 Mar 2020 21:42:50 -0700, Ashutosh Dixit wrote:
>>>>>>> diff --git a/tests/perf.c b/tests/perf.c
>>>>>>> index 724f6f809..3dc757c3b 100644
>>>>>>> --- a/tests/perf.c
>>>>>>> +++ b/tests/perf.c
>>>>>>> +static void test_polling_small_buf(void)
>>>>>>> +{
>>>>>> /snip/
>>>>>>
>>>>>>> +
>>>>>>> +	igt_assert(abs(n_expect_read_bytes - n_bytes_read) < (0.10 * n_expect_read_bytes));
>>>>>>> +}
>>>>>>> +
>>>>>> I'd be wary of a 90% match on slow platforms like Atom? Maybe 80% is safer?
>>>>> Do we have any experiment showing them behaving differently?
>>>> No I don't have any data, but considering that in previous stable versions
>>>> we can only read < 10% of the data, I think it should be ok to go down to
>>>> 80%? So that we don't start getting unnecessary false alarms in CI, even
>>>> when the issue is fixed.
>>> Okay, for the record I get somewhere between 93~95% of expected reports on
>>> KBLGT2.
>> Yes I tried it and saw that. I already gave a R-b so we could probably
>> merge the patch after making that change (0.2 instead of 0.1 above), or do
>> you want me to post a new version with the change? Thanks!
> Actually there has been some change in the kernel, earlier like you I was
> also getting around 94% with a 1 KB buffer, now I am getting about
> 87%. I am getting 94% with a 1 MB buffer. Does the amount of expected data
> in the test need to be modified? I can try to bisect tomorrow and see what
> has done this, unless you already know. Thanks!

Ah, that's probably the read() bug you're fixing...

Are you running with the kernel patch : "drm/i915/perf: Do not clear 
pollin for small user read buffers" ?


-Lionel

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
