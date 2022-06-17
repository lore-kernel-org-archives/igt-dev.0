Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C107F10E45A
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 17:33:33 +0000 (UTC)
Message-ID: <592635b4-4d3d-4304-b499-b6e4f6f4d360@intel.com>
Date: Fri, 17 Jun 2022 18:22:31 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220610085711.4087880-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220610085711.4087880-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t 0/2] tests/kms_cursor_crc: IGT test cleanup
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

On 10-Jun-22 2:27 PM, Bhanuprakash Modem wrote:
> Convert all possible subtests to dynamic and sanitize the system
> state before starting/exiting the subtest.
> 
> Bhanuprakash Modem (2):
>    tests/kms_cursor_crc: Convert tests to dynamic
>    tests/kms_cursor_crc: Test Cleanup
> 
>   tests/kms_cursor_crc.c | 222 +++++++++++++++++++++++++----------------
>   1 file changed, 136 insertions(+), 86 deletions(-)
> 
> --
> 2.35.1
> 

-- 
~Swati Sharma
