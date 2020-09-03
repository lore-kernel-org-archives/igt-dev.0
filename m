Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EE26E029
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2020 11:55:46 +0000 (UTC)
Date: Thu, 3 Sep 2020 14:29:31 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200903112931.GT7444@platvala-desk.ger.corp.intel.com>
References: <20200903110110.2403699-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903110110.2403699-1-ayaz.siddiqui@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Fix for device detection issues
 with intel gpu top
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 03, 2020 at 04:31:08PM +0530, Ayaz A Siddiqui wrote:
> Intel_gpu_top device selection filters for drm subsystem were not working=
 as
> expected. intel_gpu_top relies on PCI_SLOT_NAME to select correct PMU pat=
hs
> for dgpu, in case of drm subsystem this property is not present which lea=
ds
> to fall back to igpu if present otherwise it was throwing below error.
> =

> Failed to detect engines! (No such file or directory)
> (Kernel 4.16 or newer is required for i915 PMU support.)
> =

> The fix of this issue is to use parent of drm subsystem to get PCI_SLOT_N=
AME.
> =

> There was another issue in default GPU selection, search logic was relying
> on the first discrete drm device. In case of non-intel drm device is pres=
ent
> prior to intel gpu then it was being=A0selected which leads to error in p=
mu data.
> =

> The default search will now search for the first intel discrete gpu device
> =

> Ayaz A Siddiqui (2):
>   lib/igt_device_scan: Fix device selection filter
>   lib/igt_device_scan: Select intel as default vendor for intel_gpu_top
> =

>  lib/igt_device_scan.c | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)


Series is

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
