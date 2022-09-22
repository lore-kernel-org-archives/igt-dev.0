Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95EA10E06D
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 05:49:53 +0000 (UTC)
Date: Thu, 22 Sep 2022 08:49:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <Yyv3fowHUEsbY9cN@intel.com>
References: <20220922051142.2003118-1-bhanuprakash.modem@intel.com>
 <20220922051142.2003118-9-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220922051142.2003118-9-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V2 8/8] tests/kms_color: Fix crc compare check
 in CTM tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 10:41:42AM +0530, Bhanuprakash Modem wrote:
> !igt_skip_crc_compare || igt_check_crc_equal() is always true
> which is not correct.
> 
> Fixes: 1a42910d

Hang on. Now you're saying the regression in detecting actual failures
was introduced in commit 1a42910d4f8b ("tests/kms_color: Don't opencode
igt_check_crc_equal()") rather than the dynamic subtest conversion
commit (which is what the previous Fixes line claimed)?

So apparently the test may have been broken for 1.5 years now and
no one realize it.

Hmm. And idea just came to me. Could we introduce some kind of fairly
generic (say, igt_fb level) knob that would attempt to introduce a real
crc mismatch into all (or at least most) tests? Eg. maybe igt_fb could
frob around with the pixels a bit or something? This would at least
allow one to easily verify that the test *may* start to fail when
turning that knob on. Whether it actually starts to fail for a given
pixel frobbry isn't 100% guaraneed though since we could just end up
with a crc collision by dumb luck. Ideally we would have some way to
guarantee the failure, and then we would just make CI run every test
a second time with knob turned on to validate that the test can
actually detect the failure. But maybe this is a pipe dream.

> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index ba06947b..e2462aa3 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -510,7 +510,7 @@ static bool test_pipe_ctm(data_t *data,
>  	/* Verify that the CRC of the software computed output is
>  	 * equal to the CRC of the CTM matrix transformation output.
>  	 */
> -	ret &= !igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
> +	ret = igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
> 
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
> --
> 2.37.3

-- 
Ville Syrjälä
Intel
