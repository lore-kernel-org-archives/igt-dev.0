Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4019510EBE7
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 17:57:24 +0000 (UTC)
Date: Wed, 29 Mar 2023 19:56:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230329175620.5lsqb3qhgvgb55br@kamilkon-desk1>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
 <20230327133155.2428454-11-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230327133155.2428454-11-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 10/11] xe/xe_vm: add documentation for
 igt@xe_vm@userptr-invalid
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-03-27 at 15:31:54 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Solves this build-time warning:
> 
> 	Warning: Missing documentation for igt@xe_vm@userptr-invalid
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/xe/xe_vm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
> index 15356c704d2c..9ba00f0885f5 100644
> --- a/tests/xe/xe_vm.c
> +++ b/tests/xe/xe_vm.c
> @@ -294,9 +294,13 @@ static void unbind_all(int fd, int n_vmas)
>  
>  #define	MAP_ADDRESS	0x00007fadeadbe000
>  
> -/*
> - * This tests verifies that mapping an invalid userptr returns -EFAULT,
> - * and that it is correctly handled.
> +/**
> + * SUBTEST: userptr-invalid
> + * Description:
> + *	Verifies that mapping an invalid userptr returns -EFAULT,
> + *	and that it is correctly handled.
> + * Run type: FULL
> + * TODO: change ``'Run type' == FULL`` to a better category
>   */
>  static void userptr_invalid(int fd)
>  {
> -- 
> 2.39.2
> 

