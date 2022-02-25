Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0501910E76E
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 08:42:32 +0000 (UTC)
Date: Fri, 25 Feb 2022 10:42:52 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <20220225084252.GG29898@intel.com>
References: <20220225050853.8349-1-jeevan.b@intel.com>
 <20220225050853.8349-10-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225050853.8349-10-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 09/10] igt/tests: Add support for
 Tile4(TileF) format to testdisplay
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 10:38:52AM +0530, Jeevan B wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> testdisplay is a great test for manual testing/debug of Tile-4; we just
> need an extra parameter to enable that tiling format.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  tests/testdisplay.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/testdisplay.c b/tests/testdisplay.c
> index 54327761..e9fbd260 100644
> --- a/tests/testdisplay.c
> +++ b/tests/testdisplay.c
> @@ -593,7 +593,7 @@ static void set_termio_mode(void)
>  	tcsetattr(tio_fd, TCSANOW, &tio);
>  }
>  
> -static char optstr[] = "3Aiaf:s:d:p:mrto:j:y";
> +static char optstr[] = "3Aiaf:s:d:p:mrt4o:j:y";
>  static struct option long_opts[] = {
>  	{"yb", 0, 0, OPT_YB},
>  	{"yf", 0, 0, OPT_YF},
> @@ -612,6 +612,7 @@ static const char *help_str =
>  	"  -t\tuse an X-tiled framebuffer\n"
>  	"  -y, --yb\n"
>  	"  \tuse a Y-tiled framebuffer\n"
> +	"  -4\tuse an Tile-4 framebuffer\n"
>  	"  --yf\tuse a Yf-tiled framebuffer\n"
>  	"  -j\tdo dpms off, optional arg to select dpms level (1-3)\n"
>  	"  -r\tprint a QR code on the screen whose content is \"pass\" for the automatic test\n"
> @@ -680,6 +681,9 @@ static int opt_handler(int opt, int opt_index, void *data)
>  	case OPT_YF:
>  		modifier = I915_FORMAT_MOD_Yf_TILED;
>  		break;
> +	case '4':
> +		modifier = I915_FORMAT_MOD_4_TILED;
> +		break;
>  	case 'r':
>  		qr_code = 1;
>  		break;
> -- 
> 2.17.1
> 
