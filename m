Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F8810E14B
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jun 2022 16:28:22 +0000 (UTC)
Message-ID: <c0e23ce6-35c6-36ab-0e16-6c798f677bc1@intel.com>
Date: Mon, 20 Jun 2022 21:58:16 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220610090910.4089211-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220610090910.4089211-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t 0/3] tests/kms_cursor_legacy: IGT test cleanup
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

Patches LGTM.
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>

On 10-Jun-22 2:39 PM, Bhanuprakash Modem wrote:
> Convert all possible subtests to dynamic and sanitize the system
> statte before starting/exiting the subtest. This series will also
> rename the tests in BAT with updated ones.
> 
> Bhanuprakash Modem (3):
>    tests/kms_cursor_legacy: Convert tests to dynamic
>    tests/kms_cursor_legacy: Test Cleanup
>    tests/intel-ci: Rename kms_cursor_legacy subtests in BAT
> 
>   tests/intel-ci/fast-feedback.testlist |  11 +-
>   tests/kms_cursor_legacy.c             | 411 +++++++++++++++++---------
>   2 files changed, 269 insertions(+), 153 deletions(-)
> 
> --
> 2.35.1
> 

-- 
~Swati Sharma
