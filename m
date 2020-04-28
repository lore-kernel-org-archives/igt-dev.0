Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094F76E394
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2020 12:54:29 +0000 (UTC)
Date: Tue, 28 Apr 2020 15:54:27 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200428125427.GT9497@platvala-desk.ger.corp.intel.com>
References: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
 <20200421161725.12249-7-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421161725.12249-7-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/8] igt/params: use igt_params_set_save
 for igt_set_module_param*
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 21, 2020 at 07:17:23PM +0300, Juha-Pekka Heikkila wrote:
> Unify parameter access.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_params.c | 133 +++++++++++++++++++++++++++++++++++------------
>  1 file changed, 100 insertions(+), 33 deletions(-)
> 
> diff --git a/lib/igt_params.c b/lib/igt_params.c
> index 8de47b02..369d224c 100644
> --- a/lib/igt_params.c
> +++ b/lib/igt_params.c
> @@ -27,12 +27,14 @@
>  #include <stdbool.h>
>  #include <stdio.h>
>  #include <sys/ioctl.h>
> +#include <sys/stat.h>
>  
>  #include <i915_drm.h>
>  
>  #include "igt_core.h"
>  #include "igt_params.h"
>  #include "igt_sysfs.h"
> +#include "igt_debugfs.h"
>  
>  struct module_param_data {
>  	char *path;
> @@ -107,15 +109,59 @@ static void igt_params_save(int dir, const char *path, const char *name)
>  	module_params = data;
>  }
>  
> -static int __igt_params_open(int device, char **outpath)
> +static int __igt_params_open(int device, char **outpath, const char *param)
>  {
>  	int dir, params = -1;
> +	struct stat buffer;
> +	char searchname[64];
> +	char searchpath[PATH_MAX];
> +	char *foundname, *ctx;
>  
> -	dir = igt_sysfs_open(device);
> +	dir = igt_debugfs_dir(device);
>  	if (dir >= 0) {
> -		params = openat(dir,
> -				"device/driver/module/parameters",
> -				O_RDONLY);
> +		int devname;
> +
> +		devname = openat(dir, "name", O_RDONLY);
> +		igt_assert(devname >= 0);
> +
> +		read(devname, searchname, sizeof(searchname));
> +		close(devname);
> +
> +		foundname = strtok_r(searchname, " ", &ctx);
> +		igt_assert(foundname);
> +
> +		snprintf(searchpath, PATH_MAX, "%s_params", foundname);
> +		params = openat(dir, searchpath, O_RDONLY);
> +
> +		if (params >= 0) {
> +			char *debugfspath = malloc(PATH_MAX);
> +
> +			igt_debugfs_path(device, debugfspath, PATH_MAX);
> +			if (param != NULL) {
> +				char filepath[PATH_MAX];
> +
> +				snprintf(filepath, PATH_MAX, "%s/%s",
> +					 debugfspath, param);
> +
> +				if (stat(filepath, &buffer) == 0) {
> +					if (outpath != NULL)
> +						*outpath = debugfspath;
> +					else
> +						free(debugfspath);
> +				} else {
> +					free(debugfspath);
> +					close(params);
> +					params = -1;
> +				}
> +			} else if (outpath != NULL) {
> +				/*
> +				 * Caller is responsible to free this.
> +				 */
> +				*outpath = debugfspath;
> +			} else {
> +				free(debugfspath);
> +			}
> +		}
>  		close(dir);
>  	}
>  
> @@ -124,11 +170,51 @@ static int __igt_params_open(int device, char **outpath)
>  		char name[32] = "";
>  		char path[PATH_MAX];
>  
> -		memset(&version, 0, sizeof(version));
> -		version.name_len = sizeof(name);
> -		version.name = name;
> -		ioctl(device, DRM_IOCTL_VERSION, &version);
> -
> +		if (device == -1) {
> +			/*
> +			 * find default device
> +			 */

Oh, here's the defaulting.

Like stated in the replies for one of the other patches, I'm not
greatly fond of carrying around a concept of a "default" device. Are
there users of -1 today?

This is also considerably more code that one would expect from just
"use params_set_save" as the subject states.




> +			int file, i;
> +			const char *debugfs_root = igt_debugfs_mount();
> +
> +			igt_assert(debugfs_root);
> +
> +			for (i = 0; i < 63; i++) {
> +				char testpath[PATH_MAX];
> +
> +				snprintf(searchpath, PATH_MAX,
> +					 "%s/dri/%d/name", debugfs_root, i);
> +
> +				file = open(searchpath, O_RDONLY);
> +
> +				if (file < 0)
> +					continue;
> +
> +				read(file, searchname, sizeof(searchname));
> +				close(file);
> +
> +				foundname = strtok_r(searchname, " ", &ctx);
> +				if (!foundname)
> +					continue;
> +
> +				snprintf(testpath, PATH_MAX,
> +					 "/sys/module/%s/parameters",
> +					 foundname);
> +
> +				if (stat(testpath, &buffer) == 0 &&
> +				    S_ISDIR(buffer.st_mode)) {
> +					memcpy(name, foundname,
> +					       (sizeof(name) < strlen(foundname) ?
> +					       sizeof(name) : strlen(foundname)));

If foundname is larger than the array, doesn't this leave 'name'
without a nul-termination?

-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
