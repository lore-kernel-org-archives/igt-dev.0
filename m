Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979D310E4BD
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 13:04:58 +0000 (UTC)
Date: Wed, 31 May 2023 15:04:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230531130456.i46ixc4bdf6aiq2e@kamilkon-desk1>
References: <20230529085931.473267-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230529085931.473267-1-janga.rahul.kumar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add
 multi threaded eviction tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janga,

On 2023-05-29 at 14:29:31 +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Add VRAM eviction tests with multi-threading.

Thank you for submitting this patch, I looked at test source
code and find out that all of them are marked as FULL runs.
Could you follow up and correct documentation in test ?

This is not a blocker,

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> 
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 7242c8d8..69e70118 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -7,17 +7,22 @@ igt@xe_debugfs@gt
>  igt@xe_debugfs@forcewake
>  igt@xe_dma_buf_sync@export-dma-buf-once
>  igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
> +igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
>  igt@xe_evict@evict-beng-small
>  igt@xe_evict@evict-beng-small-cm
>  igt@xe_evict@evict-beng-small-external
>  igt@xe_evict@evict-beng-small-external-cm
>  igt@xe_evict@evict-beng-small-multi-vm
> +igt@xe_evict@evict-cm-threads-small
> +igt@xe_evict@evict-mixed-threads-small
> +igt@xe_evict@evict-mixed-threads-small-multi-vm
>  igt@xe_evict@evict-small
>  igt@xe_evict@evict-small-cm
>  igt@xe_evict@evict-small-external
>  igt@xe_evict@evict-small-external-cm
>  igt@xe_evict@evict-small-multi-vm
>  igt@xe_evict@evict-small-multi-vm-cm
> +igt@xe_evict@evict-threads-small
>  igt@xe_exec_balancer@twice-virtual-basic
>  igt@xe_exec_balancer@no-exec-virtual-basic
>  igt@xe_exec_balancer@twice-cm-virtual-basic
> -- 
> 2.25.1
> 
