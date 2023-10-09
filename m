Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03CC10E259
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 10:24:23 +0000 (UTC)
Date: Mon, 9 Oct 2023 12:23:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231009102355.356f4xwxyghdpljl@kamilkon-desk.igk.intel.com>
References: <20231009100332.392968-1-mauro.chehab@linux.intel.com>
 <20231009100332.392968-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231009100332.392968-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] intel/xe_sysfs_scheduler.c: remove
 nonpriviledged-user tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,
On 2023-10-09 at 12:01:39 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The logic which used to implement those were removed, but the doc
> tag was kept, making this out of sync with the actual tests on
> this file.
> 
> Fixes: fc53c6bf1dad ("xe/xe_sysfs: Removing non privileged user test")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Please merge this and next ones 3/4 and 4/4 before first one.

With this:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_sysfs_scheduler.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
> index e41fc4b6bb61..954dad1305f1 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -17,10 +17,6 @@
>   * Description: Test to check if %s arg[1] schedule parameter checks for min max values.
>   * Test category: functionality test
>   *
> - * SUBTEST: %s-nonprivileged-user
> - * Description: Test %s arg[1] schedule parameter for nonprivileged user.
> - * Test category: functionality test
> - *
>   * arg[1]:
>   *
>   * @preempt_timeout_us:		preempt timeout us
> -- 
> 2.41.0
> 

