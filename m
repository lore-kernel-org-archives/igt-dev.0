Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F6610E7C2
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 08:58:39 +0000 (UTC)
Message-ID: <e4e9299b-1e9c-4ec1-a2fb-4fc948f477dd@intel.com>
Date: Fri, 24 Nov 2023 09:58:32 +0100
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <marcin.bernatowicz@linux.intel.com>,
 <michal.wajdeczko@intel.com>
References: <20231120141459.7445-1-lukasz.laguna@intel.com>
 <20231120141459.7445-3-lukasz.laguna@intel.com>
 <20231123092147.uq2yind7tcxzgfti@kamilkon-desk.igk.intel.com>
Content-Language: pl
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20231123092147.uq2yind7tcxzgfti@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] lib/igt_sriov_device: add helper
 for opening VF device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 11/23/2023 10:21, Kamil Konieczny wrote:
> Hi Lukasz,
Hi Kamil,
> On 2023-11-20 at 15:14:53 +0100, Lukasz Laguna wrote:
>> From: Katarzyna Dec <katarzyna.dec@intel.com>
>>
>> Helper opens DRM device node and returns its file descriptor.
>>
>> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   lib/drmtest.c          | 17 +++++++++++----
>>   lib/drmtest.h          |  1 +
>>   lib/igt_sriov_device.c | 47 ++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_sriov_device.h |  1 +
>>   4 files changed, 62 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/drmtest.c b/lib/drmtest.c
>> index f0b97e362..d8b7aace5 100644
>> --- a/lib/drmtest.c
>> +++ b/lib/drmtest.c
>> @@ -245,7 +245,16 @@ static void log_opened_device_path(const char *device_path)
>>   	igt_info("Opened device: %s\n", item->path);
>>   }
>>   
>> -static int open_device(const char *name, unsigned int chipset)
>> +/**
>> + * drm_open_device:
>> + * @name: DRM node name
>> + * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
>> + *
>> + * Open a drm legacy device node.
>> + *
>> + * Returns: DRM file descriptor or -1 on error
>> + */
>> +int drm_open_device(const char *name, unsigned int chipset)
> Please name it __drm_open_device as this function will not assert.
Done
>>   {
>>   	const char *forced;
>>   	char dev_name[16] = "";
>> @@ -350,7 +359,7 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
>>   		if (_is_already_opened(name, as_idx))
>>   			continue;
>>   
>> -		fd = open_device(name, chipset);
>> +		fd = drm_open_device(name, chipset);
>>   		if (fd != -1)
>>   			return fd;
>>   	}
>> @@ -392,13 +401,13 @@ static int __open_driver_exact(const char *name, unsigned int chipset)
>>   {
>>   	int fd;
>>   
>> -	fd = open_device(name, chipset);
>> +	fd = drm_open_device(name, chipset);
>>   	if (fd != -1)
>>   		return fd;
>>   
>>   	drm_load_module(chipset);
>>   
>> -	return open_device(name, chipset);
>> +	return drm_open_device(name, chipset);
>>   }
>>   
>>   /*
>> diff --git a/lib/drmtest.h b/lib/drmtest.h
>> index 909a0c12c..9c040a136 100644
>> --- a/lib/drmtest.h
>> +++ b/lib/drmtest.h
>> @@ -98,6 +98,7 @@ void __set_forced_driver(const char *name);
>>    */
>>   #define ALIGN_DOWN(x, a)	ALIGN((x) - ((a) - 1), (a))
>>   
>> +int drm_open_device(const char *name, unsigned int chipset);
>>   void drm_load_module(unsigned int chipset);
>>   int drm_open_driver(int chipset);
>>   int drm_open_driver_master(int chipset);
>> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
>> index c5c594c2c..cd00c7c5d 100644
>> --- a/lib/igt_sriov_device.c
>> +++ b/lib/igt_sriov_device.c
>> @@ -3,8 +3,10 @@
>>    * Copyright(c) 2023 Intel Corporation. All rights reserved.
>>    */
>>   
>> +#include <dirent.h>
>>   #include <errno.h>
>>   
>> +#include "drmtest.h"
>>   #include "igt_core.h"
>>   #include "igt_sriov_device.h"
>>   #include "igt_sysfs.h"
>> @@ -211,3 +213,48 @@ void igt_sriov_disable_driver_autoprobe(int pf)
>>   {
>>   	pf_attr_set_u32(pf,  "device/sriov_drivers_autoprobe", false);
>>   }
>> +
>> +/**
>> + * igt_sriov_open_vf_drm_device - Open VF DRM device node
>> + * @pf: PF device file descriptor
>> + * @vf_num: VF number (1-based to identify single VF)
>> + *
>> + * Open DRM device node for given VF.
>> + *
>> + * Return:
>> + * VF file descriptor or -1 on error.
>> + */
>> +int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
>> +{
>> +	char dir_path[PATH_MAX], path[PATH_MAX], dev_name[16];
>> +	DIR *dir;
>> +	struct dirent *de;
>> +	bool found = false;
>> +
>> +	igt_assert(vf_num > 0);
>> +
>> +	if (!igt_sysfs_path(pf, dir_path, sizeof(dir_path)))
>> +		return -1;
>> +	/* vf_num is 1-based, but virtfn is 0-based */
>> +	snprintf(path, sizeof(path), "/device/virtfn%u/drm", vf_num - 1);
>> +	strncat(dir_path, path, sizeof(dir_path) - strlen(dir_path));
> --- ^^^^^^^
>
> Make it in one go with snprintf above.
> 	snprintf(path, sizeof(path), "%s/device/virtfn%u/drm", dir_path, vf_num - 1);
>
> Then:
> 	dir = opendir(path);

Done

Regards,
Lukasz

> Regards,
> Kamil
>
>> +
>> +	dir = opendir(dir_path);
>> +	if (!dir)
>> +		return -1;
>> +	while ((de = readdir(dir))) {
>> +		unsigned int card_num;
>> +
>> +		if (sscanf(de->d_name, "card%d", &card_num) == 1) {
>> +			snprintf(dev_name, sizeof(dev_name), "/dev/dri/card%u", card_num);
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +	closedir(dir);
>> +
>> +	if (!found)
>> +		return -1;
>> +
>> +	return drm_open_device(dev_name, DRIVER_ANY);
>> +}
>> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
>> index 337fdf84b..4e57f0dcb 100644
>> --- a/lib/igt_sriov_device.h
>> +++ b/lib/igt_sriov_device.h
>> @@ -25,5 +25,6 @@ void igt_sriov_disable_vfs(int pf);
>>   bool igt_sriov_is_driver_autoprobe_enabled(int pf);
>>   void igt_sriov_enable_driver_autoprobe(int pf);
>>   void igt_sriov_disable_driver_autoprobe(int pf);
>> +int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
>>   
>>   #endif /* __IGT_SRIOV_DEVICE_H__ */
>> -- 
>> 2.40.0
>>
