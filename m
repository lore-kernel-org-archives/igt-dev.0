Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B3F6E94E
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 10:26:12 +0000 (UTC)
Date: Thu, 28 Oct 2021 12:26:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211028102608.GB6307@zkempczy-mobl2>
References: <20211028101819.17967-1-kamil.konieczny@linux.intel.com>
 <20211028101819.17967-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211028101819.17967-3-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/gem_exec_whisper: Change
 duplicated test names
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 28, 2021 at 12:18:18PM +0200, Kamil Konieczny wrote:
> Add suffix "-engine" for testing specific engines and avoid tests
> name duplication.

I haven't found anything better so:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_exec_whisper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
> index 104f0a16..c93134db 100644
> --- a/tests/i915/gem_exec_whisper.c
> +++ b/tests/i915/gem_exec_whisper.c
> @@ -630,7 +630,7 @@ igt_main
>  		if (m->flags & CHAIN)
>  			continue;
>  
> -		igt_subtest_with_dynamic_f("%s", m->name) {
> +		igt_subtest_with_dynamic_f("%s-engine", m->name) {
>  			for_each_ctx_engine(fd, ctx, e) {
>  				if (!gem_class_can_store_dword(fd, e->class))
>  					continue;
> -- 
> 2.30.2
> 
