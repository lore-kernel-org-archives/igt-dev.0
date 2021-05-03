Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20210430161808.323225-1-janusz.krzysztofik@linux.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <bd835d14-d17d-390f-5dff-2348e220be60@intel.com>
Date: Mon, 3 May 2021 10:07:09 +0300
MIME-Version: 1.0
In-Reply-To: <20210430161808.323225-1-janusz.krzysztofik@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [RFC PATCH i-g-t] lib/i915/perf: Fix non-card0
 processing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 30/04/2021 19:18, Janusz Krzysztofik wrote:
> IGT i915/perf library functions now always operate on sysfs perf
> attributes of card0 device node, no matter which DRM device fd a user
> passes.  The intention was to always switch to primary device node if
> a user passes a render device node fd, but that breaks handling of
> non-card0 devices.
>
> Instead of forcibly using DRM device minor number 0 when opening a
> device sysfs area, convert device minor number of a user passed device
> fd to the minor number of respective primary (cardX) device node.
>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>   lib/i915/perf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> index 56d5c0b3a..336824df7 100644
> --- a/lib/i915/perf.c
> +++ b/lib/i915/perf.c
> @@ -376,8 +376,8 @@ open_master_sysfs_dir(int drm_fd)
>   	if (fstat(drm_fd, &st) || !S_ISCHR(st.st_mode))
>                   return -1;
>   
> -        snprintf(path, sizeof(path), "/sys/dev/char/%d:0",
> -                 major(st.st_rdev));
> +        snprintf(path, sizeof(path), "/sys/dev/char/%d:%d",
> +                 major(st.st_rdev), minor(st.st_rdev) & ~128);


Isn't it minor(st.st_rdev) & 0xff ? or even 0x3f ?

Looks like /dev/dri/controlD64 can exist too.


-Lionel


>   
>   	return open(path, O_DIRECTORY);
>   }


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
