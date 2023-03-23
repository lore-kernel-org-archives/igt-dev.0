Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2845A10E429
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 02:45:19 +0000 (UTC)
Date: Wed, 22 Mar 2023 19:45:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Message-ID: <ZBu9OEFKfvkcrXng@orsosgc001.jf.intel.com>
References: <20230322000523.3310187-1-umesh.nerlige.ramappa@intel.com>
 <20230322000523.3310187-31-umesh.nerlige.ramappa@intel.com>
 <20230322172006.otiu7cxhczsg7i4v@kamilkon-desk1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230322172006.otiu7cxhczsg7i4v@kamilkon-desk1>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 30/31] tools/perf: Choose the right
 card
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

On Wed, Mar 22, 2023 at 06:20:06PM +0100, Kamil Konieczny wrote:
>Hi Umesh,
>
>On 2023-03-21 at 17:05:22 -0700, Umesh Nerlige Ramappa wrote:
>> Choose the right dri card to open for perf recorder.
>
>Is it one of patches which enables GPUvis ? I would like to
>see this in commit message in one (or first) patch which
>enables it (with description that following patches are also
>needed). It would also help to write a little more why we
>need this patch (as Ashutosh pointed).

It's actually this one - "Enable multi-tile support for perf library" 
that enables GPUvis to pass a class:instance and select OAM. In that 
patch I have now added GPUvis in the description.

Thanks,
Umesh
>
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
