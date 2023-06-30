Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A899610E10D
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 07:05:35 +0000 (UTC)
Message-ID: <f9faa0a1-8534-5623-c354-af3172e72d53@intel.com>
Date: Fri, 30 Jun 2023 12:35:29 +0530
MIME-Version: 1.0
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230630063727.3091822-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230630063727.3091822-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] tests/intel-ci/xe: Drop unsupported tests
 from BAT
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

On 30-Jun-23 12:07 PM, Bhanuprakash Modem wrote:
> Below tests needs the intel display version as less than 9 and
> these are not applicable for XE. Hence drop these from the BAT.
> 
> igt@kms_cursor_legacy@basic-busy-flip-before-cursor-(legacy|atomic)
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel-ci/xe-fast-feedback.testlist | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 73724a184..c6734b9c7 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -259,8 +259,6 @@ igt@kms_chamelium_hpd@common-hpd-after-suspend
>   igt@kms_chamelium_hpd@dp-hpd-fast
>   igt@kms_chamelium_hpd@hdmi-hpd-fast
>   igt@kms_chamelium_hpd@vga-hpd-fast
> -igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
> -igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
>   igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
>   igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
>   igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
