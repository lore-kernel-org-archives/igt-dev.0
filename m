Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEF589FD9
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2020 14:11:52 +0000 (UTC)
Date: Wed, 5 Aug 2020 17:11:50 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200805141150.GU20883@platvala-desk.ger.corp.intel.com>
References: <20200805140501.485699-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805140501.485699-1-lionel.g.landwerlin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] test: fix missing syncobj_timeline
 tests for Autotools
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 05, 2020 at 05:05:01PM +0300, Lionel Landwerlin wrote:
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Fixes: 28c1e6980d6e20 ("igt: add timeline test cases")

Reviewed-by: Petri Latvala <petri.latvala@intel.com>



> ---
>  tests/Makefile.sources | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> index fc1cb59c..269b506d 100644
> --- a/tests/Makefile.sources
> +++ b/tests/Makefile.sources
> @@ -99,6 +99,7 @@ TESTS_progs = \
>  	prime_vgem \
>  	sw_sync \
>  	syncobj_basic \
> +	syncobj_timeline \
>  	syncobj_wait \
>  	template \
>  	tools_test \
> -- 
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
