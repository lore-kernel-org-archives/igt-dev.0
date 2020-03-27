Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7D56EA57
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2020 16:09:43 +0000 (UTC)
References: <20200327044250.64274-1-ashutosh.dixit@intel.com>
 <87wo76s8or.wl-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <91876d66-5ba8-0351-583e-8baf1ff4a1e1@intel.com>
Date: Fri, 27 Mar 2020 18:09:41 +0200
MIME-Version: 1.0
In-Reply-To: <87wo76s8or.wl-ashutosh.dixit@intel.com>
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 27/03/2020 06:50, Dixit, Ashutosh wrote:
> On Thu, 26 Mar 2020 21:42:50 -0700, Ashutosh Dixit wrote:
>> diff --git a/tests/perf.c b/tests/perf.c
>> index 724f6f809..3dc757c3b 100644
>> --- a/tests/perf.c
>> +++ b/tests/perf.c
>> +static void test_polling_small_buf(void)
>> +{
> /snip/
>
>> +
>> +	igt_assert(abs(n_expect_read_bytes - n_bytes_read) < (0.10 * n_expect_read_bytes));
>> +}
>> +
> I'd be wary of a 90% match on slow platforms like Atom? Maybe 80% is safer?


Do we have any experiment showing them behaving differently?


-Lionel

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
