Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6608D10E68C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 10:44:31 +0000 (UTC)
Date: Fri, 11 Aug 2023 12:44:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230811104427.nb2wciaggngombof@kamilkon-desk1>
References: <20230810111234.960098-1-mauro.chehab@linux.intel.com>
 <20230810111234.960098-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230810111234.960098-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/3] xe-fast-feedback.testlist: drop
 device-independent kunit tests
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

Hi Mauro,

On 2023-08-10 at 13:12:03 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Those are executed at build time, and were removed from
> xe_live_ktest. So, drop them from the testlist.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index f7c6b62f5f08..7f171868ba7b 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -250,7 +250,4 @@ igt@core_hotunplug@unbind-rebind
>  # Run KUnit tests at the end
>  igt@xe_live_ktest@bo
>  igt@xe_live_ktest@dmabuf
> -igt@xe_live_ktest@pci
> -igt@xe_live_ktest@rtp
>  igt@xe_live_ktest@migrate
> -igt@xe_live_ktest@wa
> -- 
> 2.41.0
> 

