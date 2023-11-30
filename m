Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C8710E750
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 18:15:53 +0000 (UTC)
Date: Thu, 30 Nov 2023 19:15:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231130181547.zybwom4w3chmyaey@kamilkon-desk.igk.intel.com>
References: <20231130171850.461941-1-matthew.auld@intel.com>
 <20231130171850.461941-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231130171850.461941-2-matthew.auld@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/intel-ci/xe-fast-feedback:
 add create-invalid-mbz
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Matthew,
On 2023-11-30 at 17:18:50 +0000, Matthew Auld wrote:
> Ensure we have some coverage in BAT for gem_create MBZ fields.
> 
> v2: (Kamil)
>   - Keep it locally sorted
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 5c53e249d..01ad9a9f3 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -4,6 +4,7 @@ igt@xe_module_load@load
>  igt@xe_compute@compute-square
>  igt@xe_create@create-execqueues-noleak
>  igt@xe_create@create-execqueues-leak
> +igt@xe_create@create-invalid-mbz
>  igt@xe_create@create-massive-size
>  igt@xe_debugfs@base
>  igt@xe_debugfs@gt
> -- 
> 2.43.0
> 
