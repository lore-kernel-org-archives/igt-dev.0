Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B239110E871
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 11:29:09 +0000 (UTC)
Message-ID: <0737d078-e423-334f-faf9-50103b75b210@intel.com>
Date: Fri, 14 Jul 2023 16:58:54 +0530
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230714094121.1446298-1-riana.tauro@intel.com>
 <20230714094121.1446298-4-riana.tauro@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230714094121.1446298-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/3] xe-fast-feedback.testlist: Add
 gt-c6-on-idle to BAT
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



On 14-07-2023 15:11, Riana Tauro wrote:
> Add the new test gt-c6-on-idle to BAT.
> This test validates if gt is in c6 on idle.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel-ci/xe-fast-feedback.testlist | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index e6f134f3d..2799d9cfb 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -149,6 +149,7 @@ igt@xe_mmap@vram
>   igt@xe_mmap@vram-system
>   igt@xe_mmio@mmio-timestamp
>   igt@xe_mmio@mmio-invalid
> +igt@xe_pm_residency@gt-c6-on-idle
Acked-by: Badal Nilawar <badal.nilawar@intel.com>
>   igt@xe_prime_self_import@basic-with_one_bo
>   igt@xe_prime_self_import@basic-with_fd_dup
>   #igt@xe_prime_self_import@basic-llseek-size
