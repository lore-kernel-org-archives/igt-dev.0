Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C11B10E603
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 06:32:18 +0000 (UTC)
Message-ID: <4bcb1d5a-8c01-9053-aa06-3f4d2a3c9dde@intel.com>
Date: Thu, 26 Oct 2023 12:02:01 +0530
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Swati Sharma <swati2.sharma@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20231017055252.781140-1-kunal1.joshi@intel.com>
 <20231017055252.781140-2-kunal1.joshi@intel.com>
 <20231017085520.l2n4i6cvox2g675d@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20231017085520.l2n4i6cvox2g675d@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/2] lHEib/igt_dpcd: move dpcd_read and
 dpcd_write to lib
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

Hello Kamil,

On 10/17/2023 2:25 PM, Kamil Konieczny wrote:
> Hi Kunal,
>
> On 2023-10-17 at 11:22:51 +0530, Kunal Joshi wrote:
>> moved dpcd_read and dpcd_write to lib/igt_dpcd
> - ^
> s/moved/Moved/
>
> Start with uppercase, also imho this should be "Copy"
> not a move, see below.
>
>> v2: added copyright (swati)
> -----------------------^
> Uppercase: s/swati/Swati/
>
>>      added comment for functions (swati)
> ---------------------------------- ^
> Same here.
>
>>      sorted headers (swati)
> --------------------- ^
> Same here.
>
>
>>      added new function dpcd_read_buf (kunal)
> --------------------------------------- ^
> Same here, s/kunal/Kunal/
>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   lib/igt_dpcd.c   | 104 +++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_dpcd.h   |  24 +++++++++++
>>   tools/dpcd_reg.c |  60 +--------------------------
> It would help if you add a useage of these new functions in
> actual test.
>
>>   3 files changed, 129 insertions(+), 59 deletions(-)
>>   create mode 100644 lib/igt_dpcd.c
>>   create mode 100644 lib/igt_dpcd.h
>>
>> diff --git a/lib/igt_dpcd.c b/lib/igt_dpcd.c
>> new file mode 100644
>> index 000000000..edddad8c7
>> --- /dev/null
>> +++ b/lib/igt_dpcd.c
>> @@ -0,0 +1,104 @@
> Add at begin of file licence:
>
> // SPDX-License-Identifier: MIT
>
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> +*/
>> +
>> +#include "igt_dpcd.h"
>> +
>> +/**
>> + * dpcd_read:
>> + * @fd: drm_fd
>> + * @offset: dpcd address to read
>> + * @count: bytes to read from @offset
> If regs are byte/word/dword you may consider returning it's value
> with pointer.
>
>> + *
>> + * Returns: EXIT_SUCCESS on success else errno
> ------------------------------------------- ^
> imho better -errno
>
>> + */
>> +int dpcd_read(int fd, uint32_t offset, size_t count)
>> +{
>> +    int ret = EXIT_SUCCESS;
>> +    uint8_t *buf = calloc(count, sizeof(uint8_t));
> --------------- ^
> This should be parameter of function.
>
>> +    ssize_t bytes_read;
>> +
>> +    if (!buf) {
>> +        fprintf(stderr, "Can't allocate read buffer\n");
> ---------- ^
> In igt lib you should use igt_debug.
>
>> +        return ENOMEM;
> Here better to igt_assert.
>
>> +    }
>> +
>> +    bytes_read = pread(fd, buf, count, offset);
>> +
>> +    if (bytes_read < 0) {
>> +        fprintf(stderr, "Failed to read - %s\n", strerror(errno));
> ---------- ^
> Same here, use igt_debug.
>
>> +        ret = errno;
>> +    } else {
>> +        printf("0x%04x: ", offset);
> ---------- ^
> Same here, use igt_debug.
>
>> +        for (ssize_t i = 0; i < bytes_read; i++) {
>> +            printf(" %02x", buf[i]);
> -------------- ^
> Same here, use igt_debug.
>
>> +        }
>> +        printf("\n");
> -------------- ^
> Same here, use igt_debug.
>
>> +    }
>> +
>> +    free(buf);
>> +    return ret;
>> +}
>> +
>> +/* dpcd_read_buf:
>> + * @fd: drm_fd
>> + * @offset: dpcd address to read
>> + * @count: bytes to read from @offset
>> + * @buf:   buf to write read data
>> + *
>> + * Returns: EXIT_SUCCESS on success else errno
>> + */
>> +int dpcd_read_buf(int fd, uint32_t offset, size_t count, uint8_t *buf)
> The same goes here - rewrite it as above.
>
>> +{
>> +    int ret = EXIT_SUCCESS;
>> +    *buf = calloc(count, sizeof(uint8_t));
> ------- ^^^
> This is your param?
>
>> +    ssize_t bytes_read;
>> +
>> +    if (!buf) {
>> +        fprintf(stderr, "Can't allocate read buffer\n");
>> +        return ENOMEM;
>> +    }
>> +
>> +    bytes_read = pread(fd, buf, count, offset);
>> +
>> +    if (bytes_read < 0) {
>> +        fprintf(stderr, "Failed to read - %s\n", strerror(errno));
>> +        ret = errno;
>> +    } else {
>> +        printf("0x%04x: ", offset);
>> +        for (ssize_t i = 0; i < bytes_read; i++) {
>> +            printf(" %02x", buf[i]);
>> +        }
>> +        printf("\n");
>> +    }
>> +
>> +    free(buf);
>> +    return ret;
>> +}
>> +
>> +
>> +/**
>> + * dpcd_write:
>> + * @fd: drm_fd
>> + * @offset: dpcd address to write
>> + * @cal : value to write
> -------^
> s/cal/val/
>
>> + *
>> + * Returns: EXIT_SUCCESS on success else errno
> ------------------------------------------- ^^
>
>> + */
>> +int dpcd_write(int fd, uint32_t offset, uint8_t val)
> Same here - no printf/fprintf in lib.
>
>> +{
>> +    int ret = EXIT_SUCCESS;
>> +    ssize_t bytes_written;
>> +
>> +    bytes_written = pwrite(fd, &val, sizeof(uint8_t), offset);
>> +
>> +    if (bytes_written < 0) {
>> +        fprintf(stderr, "Failed to write - %s\n", strerror(errno));
>> +        ret = errno;
>> +    } else if (bytes_written == 0) {
>> +        fprintf(stderr, "Zero bytes were written\n");
>> +        ret = EXIT_FAILURE;
>> +    }
>> +
>> +    return ret;
>> +}
>> diff --git a/lib/igt_dpcd.h b/lib/igt_dpcd.h
>> new file mode 100644
>> index 000000000..a5abe900f
>> --- /dev/null
>> +++ b/lib/igt_dpcd.h
>> @@ -0,0 +1,24 @@
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> +*/
>> +
>> +#ifndef IGT_DPCD_H
>> +#define IGT_DPCD_H
>> +
>> +#include <errno.h>
>> +#include <fcntl.h>
>> +#include <getopt.h>
> -------------^^^^^^
> No need for this.
>
>> +#include <limits.h>
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <unistd.h>
>> +
>> +int dpcd_read(int fd, uint32_t offset, size_t count);
>> +int dpcd_read_buf(int fd, uint32_t offset, size_t count,
>> +		  uint8_t *buf);
>> +int dpcd_write(int fd, uint32_t offset, uint8_t val);
>> +
>> +#endif /* IGT_DPCD_H */
>> diff --git a/tools/dpcd_reg.c b/tools/dpcd_reg.c
>> index 2761168d0..b7454cca1 100644
>> --- a/tools/dpcd_reg.c
>> +++ b/tools/dpcd_reg.c
> imho we should keep this tool without change as it may help in
> debugging.
>
> Regards,
> Kamil


Agree, will keep tool intact just rewrite function in a useful way for 
tests.
Does that sound ok?

>
>> @@ -25,16 +25,7 @@
>>    * and write, so CONFIG_DRM_DP_AUX_DEV needs to be set.
>>    */
>>   
>> -#include <stdio.h>
>> -#include <errno.h>
>> -#include <string.h>
>> -#include <stdlib.h>
>> -#include <fcntl.h>
>> -#include <getopt.h>
>> -#include <stdint.h>
>> -#include <unistd.h>
>> -#include <limits.h>
>> -#include <stdbool.h>
>> +#include "igt_dpcd.h"
>>   
>>   #define MAX_DP_OFFSET	0xfffff
>>   #define DRM_AUX_MINORS	256
>> @@ -214,55 +205,6 @@ static int parse_opts(struct dpcd_data *dpcd, int argc, char **argv)
>>   	return EXIT_SUCCESS;
>>   }
>>   
>> -static int dpcd_read(int fd, uint32_t offset, size_t count)
>> -{
>> -	int ret = EXIT_SUCCESS, pret, i;
>> -	uint8_t *buf = calloc(count, sizeof(uint8_t));
>> -
>> -	if (!buf) {
>> -		fprintf(stderr, "Can't allocate read buffer\n");
>> -		return ENOMEM;
>> -	}
>> -
>> -	pret = pread(fd, buf, count, offset);
>> -	if (pret < 0) {
>> -		fprintf(stderr, "Failed to read - %s\n", strerror(errno));
>> -		ret = errno;
>> -		goto out;
>> -	}
>> -
>> -	if (pret < count) {
>> -		fprintf(stderr,
>> -			"Read %u byte(s), expected %zu bytes, starting at offset %x\n\n", pret, count, offset);
>> -		ret = EXIT_FAILURE;
>> -	}
>> -
>> -	printf("0x%04x: ", offset);
>> -	for (i = 0; i < pret; i++)
>> -		printf(" %02x", *(buf + i));
>> -	printf("\n");
>> -
>> -out:
>> -	free(buf);
>> -	return ret;
>> -}
>> -
>> -static int dpcd_write(int fd, uint32_t offset, uint8_t val)
>> -{
>> -	int ret = EXIT_SUCCESS, pret;
>> -
>> -	pret = pwrite(fd, (const void *)&val, sizeof(uint8_t), offset);
>> -	if (pret < 0) {
>> -		fprintf(stderr, "Failed to write - %s\n", strerror(errno));
>> -		ret = errno;
>> -	} else if (pret == 0) {
>> -		fprintf(stderr, "Zero bytes were written\n");
>> -		ret = EXIT_FAILURE;
>> -	}
>> -
>> -	return ret;
>> -}
>> -
>>   static int dpcd_dump(int fd)
>>   {
>>   	size_t count;
>> -- 
>> 2.25.1
>>
