Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191210142531.6447-1-janusz.krzysztofik@linux.intel.com>
References: <20191210142531.6447-1-janusz.krzysztofik@linux.intel.com>
Message-ID: <157598825003.15362.12796328052956396686@skylake-alporthouse-com>
Date: Tue, 10 Dec 2019 14:30:50 +0000
Subject: Re: [igt-dev] [RFC PATCH i-g-t] lib/sysfs: Add support for getting
 boolean module parameters
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: =?utf-8?q?Micha=C5=82_Czapli=C5=84ski?= <michal.czaplinski@intel.com>, Jari Tahvanainen <jari.tahvanainen@intel.com>, Karol Krol <karol.krol@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Janusz Krzysztofik (2019-12-10 14:25:31)
> Boolean module parameters are exposed as "Y"/"N" strings, not 0/1.
> Make igt_sysfs_get_boolean() helper useful for getting their values.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  lib/igt_sysfs.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index c439944d..c2b8291d 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -474,11 +474,23 @@ bool igt_sysfs_set_u32(int dir, const char *attr, uint32_t value)
>   */
>  bool igt_sysfs_get_boolean(int dir, const char *attr)
>  {
> +       char *buf;
>         int result;
>  
> -       if (igt_sysfs_scanf(dir, attr, "%d", &result) != 1)
> +       buf = igt_sysfs_get(dir, attr);
> +       if (!buf)
>                 return false;
>  
> +       if (sscanf(buf, "%d", &result) == 1)
> +               goto out;
> +
> +       /* kernel's param_get_bool() returns "Y"/"N" */
> +       if (!strcmp(buf, "Y"))
> +               result = true;
> +       else
> +               result = false;

result = !strcasecmp(buf, "Y");

Just for compactness?

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
