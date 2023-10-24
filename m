Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B45110E3F5
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 15:59:38 +0000 (UTC)
Date: Tue, 24 Oct 2023 17:59:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231024155918.4ebytsuguc6hewak@kamilkon-desk.igk.intel.com>
References: <20231022155226.3484622-1-bernd@kuhls.net>
 <20231022155226.3484622-3-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231022155226.3484622-3-bernd@kuhls.net>
Subject: Re: [igt-dev] [PATCH 2/7] Include limits.h to fix build with musl
 libc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, Stefano Ragni <st3r4g@protonmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bernd,
On 2023-10-22 at 17:52:21 +0200, Bernd Kuhls wrote:
> From: Stefano Ragni <st3r4g@protonmail.com>
> 
> Original patch was added to void-linux:
> https://github.com/void-linux/void-packages/commit/ddfc1f66a0c571b420303c33aed29fd38ace4fc7
> 
> Bug report with request to split the original patch into some
> functional changes:
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
> 

Add here s-o-b from Stefano:

Signed-off-by: Stefano Ragni <st3r4g@protonmail.com>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  lib/amdgpu/amd_pci_unplug.c   | 1 +
>  lib/igt_audio.c               | 1 +
>  lib/igt_aux.c                 | 1 +
>  lib/igt_device_scan.c         | 1 +
>  lib/igt_eld.c                 | 1 +
>  lib/igt_frame.c               | 1 +
>  lib/igt_hwmon.c               | 1 +
>  runner/executor.c             | 1 +
>  runner/runner_tests.c         | 1 +
>  tests/device_reset.c          | 1 +
>  tests/intel/i915_pm_rpm.c     | 1 +
-------------- ^^^^^^^^^^^^^
There is no MAX_PATH in this file?

>  tests/kms_sysfs_edid_timing.c | 1 +
>  tests/testdisplay.c           | 1 +
>  tests/tools_test.c            | 1 +
>  tools/igt_compliance_utils.c  | 1 +
>  15 files changed, 15 insertions(+)
> 
> diff --git a/lib/amdgpu/amd_pci_unplug.c b/lib/amdgpu/amd_pci_unplug.c
> index 078398b5e..554f489c6 100644
> --- a/lib/amdgpu/amd_pci_unplug.c
> +++ b/lib/amdgpu/amd_pci_unplug.c
> @@ -21,6 +21,7 @@
>   *
>  */
>  #include <linux/limits.h>
------------------ ^^^^^^^^
> +#include <limits.h> // PATH_MAX
------------ ^^^^^^^^
Looks like it already have limits there?

>  #include <fcntl.h>
>  #include <sys/stat.h>
>  #include <pthread.h>
> diff --git a/lib/igt_audio.c b/lib/igt_audio.c
> index e0b1bafe1..dd5e0d2c1 100644
> --- a/lib/igt_audio.c
> +++ b/lib/igt_audio.c
> @@ -26,6 +26,7 @@
>  
>  #include "config.h"
>  
> +#include <limits.h> // PATH_MAX
------------ ^^^^^^^^
Put this in alphabetical order.

>  #include <errno.h>
>  #include <fcntl.h>
>  #include <gsl/gsl_fft_real.h>
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 18edc5ef9..d6aeb876b 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -31,6 +31,7 @@
>  #endif
>  #include <stdio.h>
>  #include <fcntl.h>
> +#include <limits.h> // PATH_MAX
>  #include <pwd.h>
>  #include <sys/stat.h>
>  #include <sys/ioctl.h>
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index f4f95fef3..23b17a715 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -27,6 +27,7 @@
>  #include "igt_list.h"
>  #include "intel_chipset.h"
>  
> +#include <limits.h> // PATH_MAX
------------ ^^^^^^^^
Put this in alphabetical order.

>  #include <ctype.h>
>  #include <dirent.h>
>  #include <fcntl.h>
> diff --git a/lib/igt_eld.c b/lib/igt_eld.c
> index ef6625df1..3e9b8a404 100644
> --- a/lib/igt_eld.c
> +++ b/lib/igt_eld.c
> @@ -26,6 +26,7 @@
>  #include "config.h"
>  
>  #include <dirent.h>
> +#include <limits.h> // PATH_MAX
------------ ^^^^^^^^
Put this in alphabetical order.

>  #include <errno.h>
>  #include <glob.h>
>  #include <stdint.h>
> diff --git a/lib/igt_frame.c b/lib/igt_frame.c
> index 45523a79f..86b8aad4d 100644
> --- a/lib/igt_frame.c
> +++ b/lib/igt_frame.c
> @@ -26,6 +26,7 @@
>  
>  #include "config.h"
>  
> +#include <limits.h> // PATH_MAX
------------ ^^^^^^^^
Put this in alphabetical order.

>  #include <fcntl.h>
>  #include <pixman.h>
>  #include <cairo.h>
> diff --git a/lib/igt_hwmon.c b/lib/igt_hwmon.c
> index f37ced2d9..53c346e73 100644
> --- a/lib/igt_hwmon.c
> +++ b/lib/igt_hwmon.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright © 2022 Intel Corporation
>   */
> +#include <limits.h> // PATH_MAX
>  #include <sys/stat.h>
>  #include <sys/sysmacros.h>
>  #include <dirent.h>
> diff --git a/runner/executor.c b/runner/executor.c
> index d3e6296dd..d2737af89 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1,6 +1,7 @@
>  #include <ctype.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#include <limits.h> // PATH_MAX
------------ ^^^^^^^^
Put this in alphabetical order.

>  #include <glib.h>
>  #ifdef __linux__
>  #include <linux/watchdog.h>
> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> index a7e968f85..6d605251f 100644
> --- a/runner/runner_tests.c
> +++ b/runner/runner_tests.c
> @@ -1,5 +1,6 @@
>  #include <dirent.h>
>  #include <fcntl.h>
> +#include <limits.h> // PATH_MAX
>  #include <sys/stat.h>
>  #include <sys/types.h>
>  #include <unistd.h>
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 9ebd479df..ecb01d29f 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -3,6 +3,7 @@
>   * Copyright(c) 2020 Intel Corporation. All rights reserved.
>   */
>  #include <fcntl.h>
> +#include <limits.h> // PATH_MAX
>  #include <sys/ioctl.h>
>  #include <sys/stat.h>
>  #include <signal.h>
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index 2b0a63bde..289dfc508 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -27,6 +27,7 @@
>  
>  #include "config.h"
>  
> +#include <limits.h> // PATH_MAX

Remove this change, there is no PATH_MAX in this file.

>  #include <stdio.h>
>  #include <stdint.h>
>  #include <stdbool.h>
> diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
> index ee47a024e..5df2da533 100644
> --- a/tests/kms_sysfs_edid_timing.c
> +++ b/tests/kms_sysfs_edid_timing.c
> @@ -22,6 +22,7 @@
>   */
>  #include "igt.h"
>  
> +#include <limits.h> // PATH_MAX
------------ ^^^^^^^^
Put this in alphabetical order.

>  #include <dirent.h>
>  #include <fcntl.h>
>  #include <sys/stat.h>
> diff --git a/tests/testdisplay.c b/tests/testdisplay.c
> index 42218210f..4c31c0e59 100644
> --- a/tests/testdisplay.c
> +++ b/tests/testdisplay.c
> @@ -58,6 +58,7 @@
>  #include <strings.h>
>  #include <unistd.h>
>  #include <termios.h>
> +#include <limits.h> // PATH_MAX
------------ ^^^^^^^^
Put this in alphabetical order.

>  #include <sys/poll.h>
>  #include <sys/time.h>
>  #include <sys/ioctl.h>
> diff --git a/tests/tools_test.c b/tests/tools_test.c
> index 8412ba521..f36a61927 100644
> --- a/tests/tools_test.c
> +++ b/tests/tools_test.c
> @@ -26,6 +26,7 @@
>  #include <sys/types.h>
>  #include <sys/stat.h>
>  #include <fcntl.h>
> +#include <limits.h> // PATH_MAX
------------ ^^^^^^^^
Put this in alphabetical order.

Regards,
Kamil

>  #include <libgen.h>
>  #include <unistd.h>
>  #ifdef __linux__
> diff --git a/tools/igt_compliance_utils.c b/tools/igt_compliance_utils.c
> index 0faf3fc87..f6bd970e3 100644
> --- a/tools/igt_compliance_utils.c
> +++ b/tools/igt_compliance_utils.c
> @@ -24,6 +24,7 @@
>   */
>  
>  #include "igt.h"
> +#include <limits.h> // PATH_MAX
>  #include <stdio.h>
>  #include <string.h>
>  #include <stdlib.h>
> -- 
> 2.39.2
> 
