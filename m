Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B497C6EC2C
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2020 09:21:59 +0000 (UTC)
Date: Fri, 15 May 2020 12:21:57 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200515092157.GR9497@platvala-desk.ger.corp.intel.com>
References: <20200515074150.475142-1-harish.chegondi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515074150.475142-1-harish.chegondi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner/resultgen: Fix dmesg whitelist
 entry's regular expression
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
To: Harish Chegondi <harish.chegondi@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 15, 2020 at 12:41:50AM -0700, Harish Chegondi wrote:
> PCI devices' B/D/F numbers can have alphabets in hex. Fix the regexp
> so that hex B/D/F numbers also match the regular expression.
> =

> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
> Cc: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  runner/resultgen.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index fe59aafeb..17147a8fa 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -800,7 +800,7 @@ static const char igt_dmesg_whitelist[] =3D
>  	 * module load after the testing finishes, which produces this
>  	 * message.
>  	 */
> -	"i915: probe of [0-9:.]+ failed with error -25" _
> +	"i915: probe of [0-9a-fA-F:.]+ failed with error -25" _
>  	/* swiotbl warns even when asked not to */
>  	"mock: DMA: Out of SW-IOMMU space for [0-9]+ bytes" _
>  	"usb usb[0-9]+: root hub lost power or was reset"
> -- =

> 2.25.4
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
