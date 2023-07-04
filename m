Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1767610E29E
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 07:33:44 +0000 (UTC)
Message-ID: <830e8f6b-9bf5-fde3-6547-9b8a897d142c@intel.com>
Date: Tue, 4 Jul 2023 09:28:56 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230704072347.65359-1-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230704072347.65359-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe_*.c: Fix build break on Ubuntu
 22.04.2 LTS
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

On 4.07.2023 09:23, Zbigniew Kempczyński wrote:
> I've noticed missing fcntl.h include which breaks compilation of xe
> tests.

Also older Ubuntus are impacted, but it's a big nitpick. The patch fixes 
compilation errors, thanks Zbigniew.

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   tests/xe/xe_sysfs_defaults.c  | 1 +
>   tests/xe/xe_sysfs_scheduler.c | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/tests/xe/xe_sysfs_defaults.c b/tests/xe/xe_sysfs_defaults.c
> index a1df312e74..5c9de43e9f 100644
> --- a/tests/xe/xe_sysfs_defaults.c
> +++ b/tests/xe/xe_sysfs_defaults.c
> @@ -14,6 +14,7 @@
>    */
>   
>   #include <dirent.h>
> +#include <fcntl.h>
>   #include <sys/types.h>
>   #include <sys/stat.h>
>   #include <unistd.h>
> diff --git a/tests/xe/xe_sysfs_scheduler.c b/tests/xe/xe_sysfs_scheduler.c
> index 9650194732..1da0f541ad 100644
> --- a/tests/xe/xe_sysfs_scheduler.c
> +++ b/tests/xe/xe_sysfs_scheduler.c
> @@ -24,6 +24,7 @@
>    */
>   
>   #include <dirent.h>
> +#include <fcntl.h>
>   #include <sys/types.h>
>   #include <sys/stat.h>
>   #include <unistd.h>
