Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C68910E53D
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Aug 2023 14:48:57 +0000 (UTC)
Received: from linux.intel.com (jimmycox-mobl1.ger.corp.intel.com
 [10.252.22.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2B5D7580C73
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Aug 2023 07:44:50 -0700 (PDT)
Received: from localhost ([127.0.0.1])
 by linux.intel.com with esmtp (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qbMR5-001m12-02
 for igt-dev@lists.freedesktop.org; Wed, 30 Aug 2023 16:44:48 +0200
Message-ID: <4ae1e113-61fd-a6cc-7c18-e88c3ffe90b3@linux.intel.com>
Date: Wed, 30 Aug 2023 16:44:47 +0200
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
In-Reply-To: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanu,

On 8/2/23 21:33, Bhanuprakash Modem wrote:
> In-order to organize tests, move all intel specific tests to
> a new directory "tests/intel". And rename all intel specific
> tests to represent the supported driver. Test name should start
> with the driver_name prefix. Below are the Examples.
>
> - tests/intel/xe_*.c   : All XE specific tests. Ex: xe_module_load.c
> - tests/intel/kms_*.c  : All kms tests. Ex: kms_psr.c
> - tests/intel/intel_*.c: All tests those supports both i915 & XE.
> - tests/intel/i915_*.c : All i915 specific tests. Ex: i915_module_load.c
>
> Bhanuprakash Modem (7):
>    testplan/i915: Exclude non-i915 tests from i915 testplan
>    testplan/kms: Move kms testplan to intel dir
>    tests/i915/prime_mmap_kms: Add missing documentation
>    tests/meson.build: Simplify builds for Chamelium targets
>    tests: Move intel specific tests to new directory
>    tests/meson.build: Split intel targets based on their nature
>    tests: Rename all intel specific tests


Could you please rebase it and resend? currently, it doesn't apply cleanly:

$ wget 
https://patchwork.freedesktop.org/api/1.0/series/117227/revisions/7/mbox/ 
-O rename.patch
--2023-08-30 16:43:11-- 
https://patchwork.freedesktop.org/api/1.0/series/117227/revisions/7/mbox/
Resolving proxy-ir.intel.com (proxy-ir.intel.com)... 10.102.248.16
Connecting to proxy-ir.intel.com 
(proxy-ir.intel.com)|10.102.248.16|:912... connected.
Proxy request sent, awaiting response... 200 OK
Length: 145255 (142K) [text/plain]
Saving to: ‘rename.patch’

rename.patch 
100%[=====================================================================================================>] 
141.85K   295KB/s    in 0.5s

2023-08-30 16:43:13 (295 KB/s) - ‘rename.patch’ saved [145255/145255]

$ patch -p1 -i rename.patch -f -s
1 out of 1 hunk FAILED -- saving rejects to file 
tests/i915/i915_test_config.json.rej
1 out of 1 hunk FAILED -- saving rejects to file 
tests/i915/kms_test_config.json.rej
1 out of 4 hunks FAILED -- saving rejects to file 
tests/intel-ci/fast-feedback.testlist.rej

Regards,
Mauro
