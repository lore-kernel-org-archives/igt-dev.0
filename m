Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1012E6E195
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2019 13:31:39 +0000 (UTC)
Date: Mon, 16 Dec 2019 15:31:34 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20191216133134.GF25209@platvala-desk.ger.corp.intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
 <20191211005235.67897-12-d.scott.phillips@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211005235.67897-12-d.scott.phillips@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 11/29] i915/pm_backlight: use POSIX
 basename
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
To: D Scott Phillips <d.scott.phillips@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 04:52:17PM -0800, D Scott Phillips wrote:
> We can get POSIX basename by including libgen.h. It behaves
> slightly differently from GNU basename, like possibly modifying
> the passed in string. This is OK in this usage, and POSIX basename
> is available on other platforms.
> 
> Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
> ---
>  tests/i915/i915_pm_backlight.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
> index 83b1ed68..2f65156f 100644
> --- a/tests/i915/i915_pm_backlight.c
> +++ b/tests/i915/i915_pm_backlight.c
> @@ -30,6 +30,7 @@
>  #include <sys/types.h>
>  #include <sys/stat.h>
>  #include <fcntl.h>
> +#include <libgen.h>

Needs to be wrapped in #ifdef HAVE_LIBGEN_H though.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
