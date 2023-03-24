Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D0410E4A7
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 06:12:50 +0000 (UTC)
Date: Fri, 24 Mar 2023 07:12:46 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230324071246.3eb2ef35@maurocar-mobl2>
In-Reply-To: <20230324050253.2560-1-niranjana.vishwanathapura@intel.com>
References: <20230324050253.2560-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe/xe_query: Extern
 xe_supports_faults()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 23 Mar 2023 22:02:53 -0700
Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com> wrote:

> Do not check for supports_faults in xe_device_get() as
> it creates a VM in fault mode which prohibits creation
> of any other VM in non-fault mode until this fault mode
> VM is closed. This leads to test failures in multi threaded
> cases.

Hmm...

> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  lib/xe/xe_query.c | 51 ++++++++++++++++++++++-------------------------
>  lib/xe/xe_query.h |  3 ---
>  2 files changed, 24 insertions(+), 30 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 183523280..dc91d59bc 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -160,23 +160,6 @@ static uint32_t __mem_default_alignment(struct drm_xe_query_mem_usage *mem_usage
>  	return alignment;
>  }
>  
> -static bool xe_check_supports_faults(int fd)
> -{
> -	bool supports_faults;
> -
> -	struct drm_xe_vm_create create = {
> -		.flags = DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> -			 DRM_XE_VM_CREATE_FAULT_MODE,
> -	};
> -
> -	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> -
> -	if (supports_faults)
> -		xe_vm_destroy(fd, create.vm_id);

Weren't the VM supposed to be closed here?


Regards,
Mauro
