Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EF310E15D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 14:40:06 +0000 (UTC)
Date: Wed, 6 Apr 2022 07:40:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20220406144005.st6y4kdp6vtdgzl4@ldmartin-desk2>
References: <20220405211913.2728176-1-lucas.demarchi@intel.com>
 <Yk1C6J/r+Lgl/cFZ@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Yk1C6J/r+Lgl/cFZ@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci/fast-feedback: Move
 gem_lmem_swapping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 10:36:08AM +0300, Petri Latvala wrote:
>On Tue, Apr 05, 2022 at 02:19:13PM -0700, Lucas De Marchi wrote:
>> Since commit 37ec3b8ffd2c ("tests/gem_lmem_swapping: limit lmem to 4G")
>> we load the driver with limited 4GB of lmem for test execution. However
>> this means we also have to 1) reload the driver with that param set and
>> 2) unload it after we are done. However tests/intel-ci/fast-feedback.testlist
>> has a dedicated section for tests that rely on module (un|re)loading so
>> not to impact other tests.
>>
>> Move all gem_lmem_swapping to that section, after the coment:
>>
>> 	# All tests that do module unloading and reloading are executed last.
>> 	# They will sometimes reveal issues of earlier tests leaving the
>> 	# driver in a broken state that is not otherwise noticed in that test.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Damn, I missed this when reviewing.
>
>Acked-by: Petri Latvala <petri.latvala@intel.com>

thanks, pushed.

Lucas De Marchi
