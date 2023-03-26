Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Sun, 26 Mar 2023 06:51:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Message-ID: <ZCAjl7AmtScKwKHf@intel.com>
References: <20230325003442.1767568-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230325003442.1767568-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe_guc_pc: Restore max freq first
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 05:34:42PM -0700, Vinay Belgaumkar wrote:
> When min/max are both at RPn, restoring min back to 300
> will not work. Max needs to be increased first.

why max needs to come first in this case? we should probably at
least document so we don't forget it again...

> Also, add
> igt_assert() here, which would have caught the issue.

I was going to ask if we should really add asserts inside the fixture
or maybe using igt_require instead, but then I noticed more cases
doing the assert...

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  tests/xe/xe_guc_pc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
> index 60c93288..43bf6f48 100644
> --- a/tests/xe/xe_guc_pc.c
> +++ b/tests/xe/xe_guc_pc.c
> @@ -489,8 +489,8 @@ igt_main
>  
>  	igt_fixture {
>  		xe_for_each_gt(fd, gt) {
> -			set_freq(sysfs, gt, "min", stash_min);
> -			set_freq(sysfs, gt, "max", stash_max);
> +			igt_assert(set_freq(sysfs, gt, "max", stash_max) > 0);
> +			igt_assert(set_freq(sysfs, gt, "min", stash_min) > 0);
>  		}
>  		close(sysfs);
>  		xe_device_put(fd);
> -- 
> 2.38.1
> 
