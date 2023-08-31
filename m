Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435A010E696
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 15:33:41 +0000 (UTC)
Message-ID: <6687c36e-ef66-9dd9-f400-240cf8c6f3e1@intel.com>
Date: Thu, 31 Aug 2023 21:03:18 +0530
References: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
 <4ae1e113-61fd-a6cc-7c18-e88c3ffe90b3@linux.intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <4ae1e113-61fd-a6cc-7c18-e88c3ffe90b3@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V4 0/7] New dir structure for intel specific
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hello Mauro,

On Wed-30-08-2023 08:14 pm, Mauro Carvalho Chehab wrote:
> Hi Bhanu,
> 
> On 8/2/23 21:33, Bhanuprakash Modem wrote:
>> In-order to organize tests, move all intel specific tests to
>> a new directory "tests/intel". And rename all intel specific
>> tests to represent the supported driver. Test name should start
>> with the driver_name prefix. Below are the Examples.
>>
>> - tests/intel/xe_*.c   : All XE specific tests. Ex: xe_module_load.c
>> - tests/intel/kms_*.c  : All kms tests. Ex: kms_psr.c
>> - tests/intel/intel_*.c: All tests those supports both i915 & XE.
>> - tests/intel/i915_*.c : All i915 specific tests. Ex: i915_module_load.c
>>
>> Bhanuprakash Modem (7):
>>    testplan/i915: Exclude non-i915 tests from i915 testplan
>>    testplan/kms: Move kms testplan to intel dir
>>    tests/i915/prime_mmap_kms: Add missing documentation
>>    tests/meson.build: Simplify builds for Chamelium targets
>>    tests: Move intel specific tests to new directory
>>    tests/meson.build: Split intel targets based on their nature
>>    tests: Rename all intel specific tests
> 
> 
> Could you please rebase it and resend? currently, it doesn't apply cleanly:

Here is the latest rev: https://patchwork.freedesktop.org/series/117227/

- Bhanu

> 
> $ wget 
> https://patchwork.freedesktop.org/api/1.0/series/117227/revisions/7/mbox/ -O rename.patch
> --2023-08-30 16:43:11-- 
> https://patchwork.freedesktop.org/api/1.0/series/117227/revisions/7/mbox/
> Resolving proxy-ir.intel.com (proxy-ir.intel.com)... 10.102.248.16
> Connecting to proxy-ir.intel.com 
> (proxy-ir.intel.com)|10.102.248.16|:912... connected.
> Proxy request sent, awaiting response... 200 OK
> Length: 145255 (142K) [text/plain]
> Saving to: ‘rename.patch’
> 
> rename.patch 
> 100%[=====================================================================================================>] 141.85K   295KB/s    in 0.5s
> 
> 2023-08-30 16:43:13 (295 KB/s) - ‘rename.patch’ saved [145255/145255]
> 
> $ patch -p1 -i rename.patch -f -s
> 1 out of 1 hunk FAILED -- saving rejects to file 
> tests/i915/i915_test_config.json.rej
> 1 out of 1 hunk FAILED -- saving rejects to file 
> tests/i915/kms_test_config.json.rej
> 1 out of 4 hunks FAILED -- saving rejects to file 
> tests/intel-ci/fast-feedback.testlist.rej
> 
> Regards,
> Mauro
> 

