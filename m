Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Sat, 11 Apr 2020 01:33:23 +0300
From: Andi Shyti <andi@etezian.org>
Message-ID: <20200410223323.GB264232@jack.zhora.eu>
References: <20200408102408.1959598-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408102408.1959598-1-chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH i-g-t] kms_flip: Reduce hang tests to
 minimum duration
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chris,

On Wed, Apr 08, 2020 at 11:24:08AM +0100, Chris Wilson wrote:
> Hang tests are slow since we must wait for the kernel to detect the GPU
> hang before it forcibly completes the execution and signals the fence.
> The flip is not allowed before the fence is signaled and so must wait.
> Our test is that the flip does eventually occur, we only need to do that
> once, and let the power of repeated runs across many machines weed out
> the corner cases.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/kms_flip.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index afaed69aa..4535ecc8b 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1546,8 +1546,8 @@ igt_main
>  					"flip-vs-wf_vblank" },
>  		{ 30, TEST_FLIP | TEST_VBLANK | TEST_VBLANK_BLOCK |
>  			TEST_CHECK_TS, "flip-vs-blocking-wf-vblank" },
> -		{ 30, TEST_FLIP | TEST_MODESET | TEST_HANG | TEST_NOEVENT, "flip-vs-modeset-vs-hang" },
> -		{ 30, TEST_FLIP | TEST_PAN | TEST_HANG, "flip-vs-panning-vs-hang" },
> +		{ 1, TEST_FLIP | TEST_MODESET | TEST_HANG | TEST_NOEVENT, "flip-vs-modeset-vs-hang" },
> +		{ 1, TEST_FLIP | TEST_PAN | TEST_HANG, "flip-vs-panning-vs-hang" },

Reviewed-by: Andi Shyti <andi.shyti@intel.com>

Andi
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
