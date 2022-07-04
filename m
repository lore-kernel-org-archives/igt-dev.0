Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE3BF10E0F2
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Jul 2022 13:11:30 +0000 (UTC)
Date: Mon, 4 Jul 2022 16:11:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <YsLm+rHvka+aVPQG@intel.com>
References: <cover.1656731010.git.ashutosh.dixit@intel.com>
 <1b3c9a560bb9f087c346cea0699d6e6add02eab9.1656731010.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b3c9a560bb9f087c346cea0699d6e6add02eab9.1656731010.git.ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/kms_cursor_crc: Fix
 -Wformat-truncation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 01, 2022 at 08:05:36PM -0700, Ashutosh Dixit wrote:
> [72/1181] Compiling C object tests/kms_cursor_crc.p/kms_cursor_crc.c.o
> ../tests/kms_cursor_crc.c: In function ‘run_size_tests.constprop’:
> ../tests/kms_cursor_crc.c:702:50: warning: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size between 4 and 14 [-Wformat-truncation=]
>   702 |                 snprintf(name, sizeof(name), "%dx%d", w, h);
>       |                                                  ^~
> ../tests/kms_cursor_crc.c:702:46: note: directive argument in the range [-2147483648, 1024]
>   702 |                 snprintf(name, sizeof(name), "%dx%d", w, h);
>       |                                              ^~~~~~~

Weird that it almost managed to figure out the upper limit
(just off by ^2 for some reason) but totally failed at the lower
limit.

Anyways, series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/kms_cursor_crc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 5c90537b2337..588063555c67 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -693,7 +693,7 @@ static void test_rapid_movement(data_t *data)
>  static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
>  			   int w, int h)
>  {
> -	char name[16];
> +	char name[32];
>  	enum pipe pipe;
>  
>  	if (w == 0 && h == 0)
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
