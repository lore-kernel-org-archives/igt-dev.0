Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493B210E94E
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 11:31:32 +0000 (UTC)
Date: Fri, 7 Oct 2022 13:31:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0AOEHiX2mrA8Uwc@kamilkon-desk1>
References: <20221007040717.2924978-1-jfree@freebsd.org>
 <20221007040717.2924978-2-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221007040717.2924978-2-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t 02/10] include/freebsd-uapi/sync_file.h:
 Create FreeBSD sync_file header
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>, Petri Latvala <petri.latvala@intel.com>,
 Jake Freeland <jake@technologyfriends.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jake,

On 2022-10-06 at 23:07:10 -0500, Jake Freeland wrote:
> Instead of modifying the Linux uapi sync_file.h, create FreeBSD
> uapi sync_file.h. The correct uapi will be determined at compile
> time in the root meson.build.

Put also note into README.md how to get new version of
sync_file.h, in the same way linux one is described.

Regards,
Kamil

> 
> Signed-off-by: Jake Freeland <jfree@freebsd.org>
> ---
>  include/freebsd-uapi/sync_file.h | 102 +++++++++++++++++++++++++++++++
>  meson.build                      |   5 ++
>  2 files changed, 107 insertions(+)
>  create mode 100644 include/freebsd-uapi/sync_file.h
> 
> diff --git a/include/freebsd-uapi/sync_file.h b/include/freebsd-uapi/sync_file.h
> new file mode 100644
> index 00000000..3b5c5544
> --- /dev/null
> +++ b/include/freebsd-uapi/sync_file.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-1.0+ WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2012 Google, Inc.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#ifndef _FREEBSD_SYNC_H
> +#define _FREEBSD_SYNC_H
> +
> +#include <sys/ioctl.h>
> +#include <sys/types.h>
> +
> +typedef	int32_t		__s32;
> +typedef	uint32_t	__u32;
> +typedef	uint64_t	__u64;
> +
> +/**
> + * struct sync_merge_data - data passed to merge ioctl
> + * @name:	name of new fence
> + * @fd2:	file descriptor of second fence
> + * @fence:	returns the fd of the new fence to userspace
> + * @flags:	merge_data flags
> + * @pad:	padding for 64-bit alignment, should always be zero
> + */
> +struct sync_merge_data {
> +	char	name[32];
> +	__s32	fd2;
> +	__s32	fence;
> +	__u32	flags;
> +	__u32	pad;
> +};
> +
> +/**
> + * struct sync_fence_info - detailed fence information
> + * @obj_name:		name of parent sync_timeline
> +* @driver_name:	name of driver implementing the parent
> +* @status:		status of the fence 0:active 1:signaled <0:error
> + * @flags:		fence_info flags
> + * @timestamp_ns:	timestamp of status change in nanoseconds
> + */
> +struct sync_fence_info {
> +	char	obj_name[32];
> +	char	driver_name[32];
> +	__s32	status;
> +	__u32	flags;
> +	__u64	timestamp_ns;
> +};
> +
> +/**
> + * struct sync_file_info - data returned from fence info ioctl
> + * @name:	name of fence
> + * @status:	status of fence. 1: signaled 0:active <0:error
> + * @flags:	sync_file_info flags
> + * @num_fences	number of fences in the sync_file
> + * @pad:	padding for 64-bit alignment, should always be zero
> + * @sync_fence_info: pointer to array of structs sync_fence_info with all
> + *		 fences in the sync_file
> + */
> +struct sync_file_info {
> +	char	name[32];
> +	__s32	status;
> +	__u32	flags;
> +	__u32	num_fences;
> +	__u32	pad;
> +
> +	__u64	sync_fence_info;
> +};
> +
> +#define SYNC_IOC_MAGIC		'>'
> +
> +/**
> + * Opcodes  0, 1 and 2 were burned during a API change to avoid users of the
> + * old API to get weird errors when trying to handling sync_files. The API
> + * change happened during the de-stage of the Sync Framework when there was
> + * no upstream users available.
> + */
> +
> +/**
> + * DOC: SYNC_IOC_MERGE - merge two fences
> + *
> + * Takes a struct sync_merge_data.  Creates a new fence containing copies of
> + * the sync_pts in both the calling fd and sync_merge_data.fd2.  Returns the
> + * new fence's fd in sync_merge_data.fence
> + */
> +#define SYNC_IOC_MERGE		_IOWR(SYNC_IOC_MAGIC, 3, struct sync_merge_data)
> +
> +/**
> + * DOC: SYNC_IOC_FILE_INFO - get detailed information on a sync_file
> + *
> + * Takes a struct sync_file_info. If num_fences is 0, the field is updated
> + * with the actual number of fences. If num_fences is > 0, the system will
> + * use the pointer provided on sync_fence_info to return up to num_fences of
> + * struct sync_fence_info, with detailed fence information.
> + */
> +#define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info)
> +
> +#endif /* _FREEBSD_SYNC_H */
> diff --git a/meson.build b/meson.build
> index 3e937f5a..4ceb85dd 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -86,7 +86,12 @@ with_libdrm = get_option('libdrm_drivers')
>  
>  build_info = ['Build type: ' + get_option('buildtype')]
>  
> +system = build_machine.system()
> +if system == 'linux'
>  inc = include_directories('include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
> +elif system == 'freebsd'
> +inc = include_directories('include/drm-uapi', 'include/freebsd-uapi', 'lib', 'lib/stubs/syscalls', '.', '/usr/local/include')
> +endif
>  
>  inc_for_gtkdoc = include_directories('lib')
>  
> -- 
> 2.37.3
> 
