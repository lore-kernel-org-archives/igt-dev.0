Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088516E14C
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 09:35:21 +0000 (UTC)
Date: Thu, 14 Oct 2021 11:35:16 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211014093516.GA16801@zkempczy-mobl2>
References: <20211012050228.21959-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211012050228.21959-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_capture : Add
 support for local memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 12, 2021 at 10:32:28AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Add a subtest that performs the exercise on an object allocated in
> device memory.
> 
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_exec_capture.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index 7e0a8b8a..9664ee07 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -632,6 +632,19 @@ static void userptr(int fd, int dir)
>  	free(ptr);
>  }
>  
> +static void lmem(int fd, int dir, const intel_ctx_t *ctx, unsigned ring)
> +{
> +	uint32_t handle;
> +	uint64_t ahnd;
> +
> +	handle = gem_create_in_memory_regions(fd, 4096, REGION_LMEM(0));
> +	ahnd = get_reloc_ahnd(fd, ctx->id);
> +	__capture1(fd, dir, ahnd, ctx, ring, handle, 4096);
> +
> +	gem_close(fd, handle);
> +	put_ahnd(ahnd);
> +}
> +

Instead of creating separate lmem test just reuse 'capture', but 
involve walk over regioning. 

--
Zbigniew

>  static bool has_capture(int fd)
>  {
>  	drm_i915_getparam_t gp;
> @@ -720,6 +733,12 @@ igt_main
>  	test_each_engine("pi", fd, ctx, e)
>  		prioinv(fd, dir, ctx, e->flags, e->name);
>  
> +	igt_subtest_f("LMEM") {
> +		igt_require(gem_has_lmem(fd));
> +		igt_require(gem_can_store_dword(fd, 0));
> +		lmem(fd, dir, ctx, e->flags);
> +	}
> +
>  	igt_fixture {
>  		close(dir);
>  		igt_disallow_hang(fd, hang);
> -- 
> 2.32.0
> 
