Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D2C10E566
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 06:45:34 +0000 (UTC)
Message-ID: <f7de4690-6e24-4d81-a163-9db8dd6ccfc3@intel.com>
Date: Tue, 12 Dec 2023 12:14:52 +0530
MIME-Version: 1.0
Subject: Re: [i-g-t] intel-ci/xe.blocklist: Update PSR subtests
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231212061003.3575145-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231212061003.3575145-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 12-Dec-23 11:40 AM, Bhanuprakash Modem wrote:
> Fix subtests in XE blocklist as kms_psr subtests got renamed
> by: b1a76d7d0 (tests/intel/kms_psr: fix subtest naming)
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 1dfbf6825..7d1ac38a7 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -66,7 +66,7 @@ igt@kms_force_connector_basic@force-load-detect
>   igt@kms_frontbuffer_tracking@.*-(cpu|gtt|pwrite)
>   igt@kms_legacy_colorkey@.*
>   igt@kms_pipe_b_c_ivb@.*
> -igt@kms_psr@.*_mmap_(cpu|gtt)
> +igt@kms_psr@.*-mmap-(cpu|gtt)
>   igt@kms_pwrite_crc
>   igt@kms_rotation_crc@exhaust-fences
>   ##################################################################
