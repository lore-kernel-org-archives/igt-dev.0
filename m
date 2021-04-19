Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD526E213
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Apr 2021 09:31:37 +0000 (UTC)
Date: Mon, 19 Apr 2021 12:32:42 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YH1OOtbQdPpDv9ER@platvala-desk.ger.corp.intel.com>
References: <20210416174841.20132-1-ville.syrjala@linux.intel.com>
 <20210416174841.20132-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416174841.20132-2-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib: Document that we have
 --trace-on-oops
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 08:48:38PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Include --trace-on-oops in the help text.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt_core.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 6597acfaacfe..6a43d955d562 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -708,6 +708,7 @@ static void print_usage(const char *help_str, bool ou=
tput_on_stderr)
>  		   "  --debug[=3Dlog-domain]\n"
>  		   "  --interactive-debug[=3Ddomain]\n"
>  		   "  --skip-crc-compare\n"
> +		   "  --trace-on-oops\n"
>  		   "  --help-description\n"
>  		   "  --describe\n"
>  		   "  --device filters\n"
> -- =

> 2.26.3
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
