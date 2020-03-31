Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CFF882C2
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 06:44:43 +0000 (UTC)
Date: Tue, 31 Mar 2020 09:44:40 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200331064440.GF9497@platvala-desk.ger.corp.intel.com>
References: <20200330110229.4755-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330110229.4755-1-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_concurrent: Move bandwidth
 calculation to igt_fixture
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 02:02:29PM +0300, Mika Kahola wrote:
> The commit 153b34b5353df8c18a87d ("tests/kms_concurrent:
> Test maximum number of planes supported by the platform")
> caused regression on HSW pipe B testing such as.
> 
> IGT-Version: 1.25-gfd8248084 (x86_64) (Linux: 5.6.0-rc7-CI-CI_DRM_8194+ x86_64)
> Starting subtest: pipe-B
> Testing resolution with connector VGA-1 using pipe B with seed 1585245074
> child 0 died with signal 11, Segmentation fault
> Subtest pipe-B: FAIL (0.330s)
> 
> To fix this, we need move bandwidth calculation routines into part of
> igt_fixture instead of calculating it just before actual testing. The patch
> takes the minimum of those maximum number of planes for given output.
> 
> v2: Limit bandwidth check only gen11+ (CI)
> v3: Loop child process 5x longer when running test with 1 iteration (CI)
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  tests/kms_concurrent.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 1403e990..31c5620a 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -36,6 +36,7 @@ typedef struct {
>  	igt_display_t display;
>  	igt_plane_t **plane;
>  	struct igt_fb *fb;
> +	int max_planes;
>  } data_t;
>  
>  /* Command line parameters. */
> @@ -223,13 +224,13 @@ test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
>  				igt_output_t *output)
>  {
>  	int i;
> -	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
> +	int iterations = opt.iterations < 5 ? 1 : opt.iterations;

This changes nothing though for CI. You still use 1. In fact this just
limits the iterations to 1 for everyone who specifies more than 1,
until they use 5 or more.

And still, this patch needs an actual explanation why the crash
happened and why doing the same calculation in a fixture
help. Otherwise there's no guarantee it won't happen again. Until
proven otherwise, avoiding the crash is accidental.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
