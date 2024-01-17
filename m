Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD5410E754
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 17:20:37 +0000 (UTC)
Date: Wed, 17 Jan 2024 18:13:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v4 3/3] tests/intel-ci: Add mi_atomic test to
 fast-feedback
Message-ID: <20240117171327.dcgqvtuitm67ydtr@kamilkon-desk.igk.intel.com>
References: <20240117133050.19605-1-nirmoy.das@intel.com>
 <20240117133050.19605-3-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240117133050.19605-3-nirmoy.das@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nirmoy,
On 2024-01-17 at 14:30:49 +0100, Nirmoy Das wrote:
> Add this basic functionality test the fast feedback list.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index bef5b0b8a..da79c76b4 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -29,6 +29,8 @@ igt@xe_evict@evict-small-multi-vm-cm
>  igt@xe_evict@evict-threads-small
>  igt@xe_evict_ccs@evict-overcommit-simple
>  igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd
> +igt@xe_exec_atomic@basic-inc-all
> +igt@xe_exec_atomic@basic-dec-all

Now test itself is in correct place but -dec- should be before -inc-.

This can be corrected at merge.

Regards,
Kamil

>  igt@xe_exec_balancer@twice-virtual-basic
>  igt@xe_exec_balancer@no-exec-virtual-basic
>  igt@xe_exec_balancer@twice-cm-virtual-basic
> -- 
> 2.42.0
> 
