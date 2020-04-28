Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15F06EBB3
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2020 19:04:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k13so26026305wrw.7
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2020 12:04:21 -0700 (PDT)
References: <20200421161725.12249-1-juhapekka.heikkila@gmail.com>
 <20200421161725.12249-7-juhapekka.heikkila@gmail.com>
 <20200428125427.GT9497@platvala-desk.ger.corp.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <167782ca-4758-e2a5-2021-6d04c2552ee6@gmail.com>
Date: Tue, 28 Apr 2020 22:04:14 +0300
MIME-Version: 1.0
In-Reply-To: <20200428125427.GT9497@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 6/8] igt/params: use igt_params_set_save
 for igt_set_module_param*
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 28.4.2020 15.54, Petri Latvala wrote:
> On Tue, Apr 21, 2020 at 07:17:23PM +0300, Juha-Pekka Heikkila wrote:
>> Unify parameter access.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   lib/igt_params.c | 133 +++++++++++++++++++++++++++++++++++------------
>>   1 file changed, 100 insertions(+), 33 deletions(-)
>>
>> diff --git a/lib/igt_params.c b/lib/igt_params.c
>> index 8de47b02..369d224c 100644
>> --- a/lib/igt_params.c
>> +++ b/lib/igt_params.c
>> @@ -27,12 +27,14 @@
>>   #include <stdbool.h>
>>   #include <stdio.h>
>>   #include <sys/ioctl.h>
>> +#include <sys/stat.h>
>>   
>>   #include <i915_drm.h>
>>   
>>   #include "igt_core.h"
>>   #include "igt_params.h"
>>   #include "igt_sysfs.h"
>> +#include "igt_debugfs.h"
>>   
>>   struct module_param_data {
>>   	char *path;
>> @@ -107,15 +109,59 @@ static void igt_params_save(int dir, const char *path, const char *name)
>>   	module_params = data;
>>   }
>>   
>> -static int __igt_params_open(int device, char **outpath)
>> +static int __igt_params_open(int device, char **outpath, const char *param)
>>   {
>>   	int dir, params = -1;
>> +	struct stat buffer;
>> +	char searchname[64];
>> +	char searchpath[PATH_MAX];
>> +	char *foundname, *ctx;
>>   
>> -	dir = igt_sysfs_open(device);
>> +	dir = igt_debugfs_dir(device);
>>   	if (dir >= 0) {
>> -		params = openat(dir,
>> -				"device/driver/module/parameters",
>> -				O_RDONLY);
>> +		int devname;
>> +
>> +		devname = openat(dir, "name", O_RDONLY);
>> +		igt_assert(devname >= 0);
>> +
>> +		read(devname, searchname, sizeof(searchname));
>> +		close(devname);
>> +
>> +		foundname = strtok_r(searchname, " ", &ctx);
>> +		igt_assert(foundname);
>> +
>> +		snprintf(searchpath, PATH_MAX, "%s_params", foundname);
>> +		params = openat(dir, searchpath, O_RDONLY);
>> +
>> +		if (params >= 0) {
>> +			char *debugfspath = malloc(PATH_MAX);
>> +
>> +			igt_debugfs_path(device, debugfspath, PATH_MAX);
>> +			if (param != NULL) {
>> +				char filepath[PATH_MAX];
>> +
>> +				snprintf(filepath, PATH_MAX, "%s/%s",
>> +					 debugfspath, param);
>> +
>> +				if (stat(filepath, &buffer) == 0) {
>> +					if (outpath != NULL)
>> +						*outpath = debugfspath;
>> +					else
>> +						free(debugfspath);
>> +				} else {
>> +					free(debugfspath);
>> +					close(params);
>> +					params = -1;
>> +				}
>> +			} else if (outpath != NULL) {
>> +				/*
>> +				 * Caller is responsible to free this.
>> +				 */
>> +				*outpath = debugfspath;
>> +			} else {
>> +				free(debugfspath);
>> +			}
>> +		}
>>   		close(dir);
>>   	}
>>   
>> @@ -124,11 +170,51 @@ static int __igt_params_open(int device, char **outpath)
>>   		char name[32] = "";
>>   		char path[PATH_MAX];
>>   
>> -		memset(&version, 0, sizeof(version));
>> -		version.name_len = sizeof(name);
>> -		version.name = name;
>> -		ioctl(device, DRM_IOCTL_VERSION, &version);
>> -
>> +		if (device == -1) {
>> +			/*
>> +			 * find default device
>> +			 */
> 
> Oh, here's the defaulting.
> 
> Like stated in the replies for one of the other patches, I'm not
> greatly fond of carrying around a concept of a "default" device. Are
> there users of -1 today?

There was handful of those, kms_busy comes first to my mind since I was 
looking at it today. Agreed this defaulting doesn't sound good idea but 
I'd first put plumbing in place and once there's no users scrap it. 
There's for example kms_force_connector_basic@force-load-detect test 
which I cannot now go test how it go if change this behavior since it 
says igt_require(connector->connector_type == DRM_MODE_CONNECTOR_VGA)

> 
> This is also considerably more code that one would expect from just
> "use params_set_save" as the subject states.
> 
> 
> 
> 
>> +			int file, i;
>> +			const char *debugfs_root = igt_debugfs_mount();
>> +
>> +			igt_assert(debugfs_root);
>> +
>> +			for (i = 0; i < 63; i++) {
>> +				char testpath[PATH_MAX];
>> +
>> +				snprintf(searchpath, PATH_MAX,
>> +					 "%s/dri/%d/name", debugfs_root, i);
>> +
>> +				file = open(searchpath, O_RDONLY);
>> +
>> +				if (file < 0)
>> +					continue;
>> +
>> +				read(file, searchname, sizeof(searchname));
>> +				close(file);
>> +
>> +				foundname = strtok_r(searchname, " ", &ctx);
>> +				if (!foundname)
>> +					continue;
>> +
>> +				snprintf(testpath, PATH_MAX,
>> +					 "/sys/module/%s/parameters",
>> +					 foundname);
>> +
>> +				if (stat(testpath, &buffer) == 0 &&
>> +				    S_ISDIR(buffer.st_mode)) {
>> +					memcpy(name, foundname,
>> +					       (sizeof(name) < strlen(foundname) ?
>> +					       sizeof(name) : strlen(foundname)));
> 
> If foundname is larger than the array, doesn't this leave 'name'
> without a nul-termination?

ah, I got caught by the famous buffer overflow thingy. I'll fix.

Thanks for the comments.

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
