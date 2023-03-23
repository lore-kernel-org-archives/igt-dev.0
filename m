Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FB610E0C7
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 13:56:58 +0000 (UTC)
Date: Thu, 23 Mar 2023 14:56:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230323135653.ofaaiawfd6hyaxsr@kamilkon-desk1>
References: <20230323132827.1948500-1-mauro.chehab@linux.intel.com>
 <20230323132827.1948500-2-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230323132827.1948500-2-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 1/3] intel-ci: update i915 blacklist
 to ignore the Xe driver
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

On 2023-03-23 at 14:28:25 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> It doesn't make sense to run Xe tests with i915 driver loaded.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/intel-ci/blacklist.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
> index 6e5cc43667cf..243bc60934f6 100644
> --- a/tests/intel-ci/blacklist.txt
> +++ b/tests/intel-ci/blacklist.txt
> @@ -1,3 +1,8 @@
> +###############################################
> +# This file is for non-Xe tests only

imho better write:

Do not run Xe tests on i915 driver

or maybe:
This file is for blocking tests from running on i915 driver

With or without that
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +###############################################
> +igt@xe.*
> +
>  igt@meta_test(@.*)?
>  ###############################################
>  # Handle module reloads with great care!
> -- 
> 2.39.2
> 

