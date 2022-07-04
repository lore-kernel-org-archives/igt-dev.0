Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D02510E00A
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Jul 2022 06:47:46 +0000 (UTC)
Message-ID: <2866f2d3-0294-fa70-fe5a-7a7873eeacc3@intel.com>
Date: Mon, 4 Jul 2022 12:17:23 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com
References: <20220630085523.291024-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220630085523.291024-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V7 0/2] tests/kms_color: IGT test cleanup
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

LGTM
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>

On 30-Jun-22 2:25 PM, Bhanuprakash Modem wrote:
> Convert all possible subtests to dynamic and sanitize the system
> state before starting/exiting the subtest.
> 
> Bhanuprakash Modem (2):
>    tests/kms_color: Convert tests to dynamic
>    tests/kms_color: Test Cleanup
> 
>   tests/kms_color.c        | 622 +++++++++++++++++++++------------------
>   tests/kms_color_helper.h |   2 +
>   2 files changed, 341 insertions(+), 283 deletions(-)
> 
> --
> 2.35.1
> 

-- 
~Swati Sharma
