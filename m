Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3832210E191
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 14:13:45 +0000 (UTC)
Date: Mon, 7 Aug 2023 16:13:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230807141340.k2ky2cdo73o3xpd5@kamilkon-desk1>
References: <20230804105358.3079020-1-katarzyna.dec@intel.com>
 <20230804105358.3079020-2-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230804105358.3079020-2-katarzyna.dec@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/intel-ci: Reduce
 xe_exec_threads tests in BATs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Katarzyna,
On 2023-08-04 at 10:53:58 +0000, Katarzyna Dec wrote:
> We received recommendation for KMD team to reduce xe_exec_threads
> tests to have only:
> igt@xe_exec_threads@threads-basic
> igt@xe_exec_threads@threads-mixed-basic
> igt@xe_exec_threads@threads-mixed-shared-vm-basic
> igt@xe_exec_threads@threads-mixed-fd-basic
> NEW igt@xe_exec_threads@threads-mixed-userptr-invalidate
> NEW igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
> 
> Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> Cc: Aditya Chauhan <aditya.chauhan@intel.com>
> Cc: Himanshu Girotra <himanshu.girotra@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 78814f650..201a2d550 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -107,18 +107,12 @@ igt@xe_exec_reset@close-fd-no-exec
>  igt@xe_exec_reset@cm-close-fd-no-exec
>  igt@xe_exec_reset@virtual-close-fd-no-exec
>  igt@xe_exec_store@basic-store
> -#igt@xe_exec_threads@threads-basic
> -igt@xe_exec_threads@threads-shared-vm-basic
> -igt@xe_exec_threads@threads-fd-basic
> -igt@xe_exec_threads@threads-bal-basic
> -igt@xe_exec_threads@threads-cm-basic
> -igt@xe_exec_threads@threads-cm-fd-basic
> +igt@xe_exec_threads@threads-basic
>  igt@xe_exec_threads@threads-mixed-basic
>  igt@xe_exec_threads@threads-mixed-shared-vm-basic
>  igt@xe_exec_threads@threads-mixed-fd-basic
> -igt@xe_exec_threads@threads-bal-mixed-basic
> -igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic
> -igt@xe_exec_threads@threads-bal-mixed-fd-basic
> +igt@xe_exec_threads@threads-mixed-userptr-invalidate
> +igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
>  igt@xe_gpgpu_fill@basic
>  igt@xe_guc_pc@freq_basic_api
>  igt@xe_guc_pc@freq_fixed_idle
> -- 
> 2.34.1
> 
