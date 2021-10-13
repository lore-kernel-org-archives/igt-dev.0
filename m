Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B2289DA2
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 09:03:48 +0000 (UTC)
Date: Wed, 13 Oct 2021 12:02:08 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YWagkKoY8BRLaLQ4@platvala-desk.ger.corp.intel.com>
References: <20211011234320.152735-1-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011234320.152735-1-igormtorrente@gmail.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_writeback.c: Prevents test failure
 by the XR48/AR48 format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Igor Torrente <igormtorrente@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 11, 2021 at 08:43:20PM -0300, Igor Torrente wrote:
> The test fails if the driver exposes the XR48/AR48 (XRGB16161616/ARGB16161616)
> formats, altough it doesn't test any format beyond XR24(XRGB88888).
> 
> This failure happens because the format validation doesn't contain the
> number '8' in the list of valid char.
> 
> This patch adds it to the list.
> 
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/kms_writeback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 03edb7af..21d62faa 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -386,7 +386,7 @@ igt_main
>  	igt_describe("Check the writeback format");
>  	igt_subtest("writeback-pixel-formats") {
>  		drmModePropertyBlobRes *formats_blob = get_writeback_formats_blob(output);
> -		const char *valid_chars = "0123456 ABCGNRUVXY";
> +		const char *valid_chars = "01234568 ABCGNRUVXY";
>  		unsigned int i;
>  		char *c;
>  
> -- 
> 2.30.2
> 
