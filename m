Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F77510E7D7
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 09:37:15 +0000 (UTC)
Date: Tue, 11 Oct 2022 11:37:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y0U5RumOStuAmibz@kamilkon-desk1>
References: <20221007232757.3210308-1-jfree@freebsd.org>
 <20221007232757.3210308-2-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221007232757.3210308-2-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t v1 1/6] lib/igt_freebsd.h: Create
 FreeBSD compatibility header
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

On 2022-10-07 at 18:27:52 -0500, Jake Freeland wrote:
> This header attempts to be a simple drop-in to enable FreeBSD
> support in a given source file. It includes macro substitutions
> that replace Linux-specific phrases with their FreeBSD equivalents.
> 
> Signed-off-by: Jake Freeland <jfree@freebsd.org>

Your patchset got merged but please in future ask someone from
FreeBSD community for review of changes related to FreeBSD.

Ideally, if you know who might review it, put that person on Cc
just before your s-b, so it will look like

Cc: Name Here <e-mail-address_from_freebsd.org>
Signed-off-by: Jake Freeland <jfree@freebsd.org>

btw this is only example, it may outside from freebsd.org

Regards,
Kamil

> ---
>  lib/igt_core.h    |   4 ++
>  lib/igt_freebsd.h | 118 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 122 insertions(+)
>  create mode 100644 lib/igt_freebsd.h
> 
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index f21723de..a6b4b5ae 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -43,6 +43,10 @@
>  #include <getopt.h>
>  #include <unistd.h>
>  
> +#ifdef __FreeBSD__
> +#include "igt_freebsd.h"
> +#endif
> +
>  #ifndef IGT_LOG_DOMAIN
>  #define IGT_LOG_DOMAIN (NULL)
>  #endif
> diff --git a/lib/igt_freebsd.h b/lib/igt_freebsd.h
> new file mode 100644
> index 00000000..53fa8fb6
> --- /dev/null
> +++ b/lib/igt_freebsd.h
> @@ -0,0 +1,118 @@
> +/*
> + * SPDX-License-Identifier: MIT
> + *
> + * Copyright (c) 2022, Jake Freeland <jfree@FreeBSD.org>
> + */
> +
> +#if !defined(IGT_FREEBSD_H)
> +
> +#if !defined(__FreeBSD__)
> +#error "This header is only for FreeBSD platform."
> +#endif
> +
> +#define IGT_FREEBSD_H
> +
> +#include <sys/consio.h>
> +#include <sys/endian.h>
> +#include <sys/errno.h>
> +#include <sys/mman.h>
> +#include <sys/mount.h>
> +#include <sys/sched.h>
> +#include <sys/types.h>
> +#include <sys/wait.h>
> +#include <sys/watchdog.h>
> +
> +#include <libgen.h>
> +#include <limits.h>
> +#include <pthread.h>
> +#include <setjmp.h>
> +#include <signal.h>
> +#include <unistd.h>
> +
> +/*
> + * Proper substitutions:
> + * The following macros replace Linux-specific functions
> + * and macros with their FreeBSD equivalents.
> + */
> +
> +typedef	int32_t		__s32;
> +typedef	uint32_t	__u32;
> +typedef	uint64_t	__u64;
> +
> +typedef	ino_t		ino64_t;
> +typedef	sig_t		sighandler_t;
> +
> +#define	jmp_buf	sigjmp_buf
> +
> +#define	PTRACE_TRACEME  PT_TRACE_ME
> +#define	PTRACE_ATTACH   PT_ATTACH
> +#define	PTRACE_PEEKDATA PT_READ_D
> +#define	PTRACE_POKEDATA PT_WRITE_D
> +#define	PTRACE_DETACH   PT_DETACH
> +
> +#define	I2C_RDWR		I2CRDWR
> +#define	I2C_M_RD		IIC_M_RD
> +#define	i2c_msg			iic_msg
> +#define	i2c_rdwr_ioctl_data	iic_rdwr_data
> +
> +#define	bswap_32(x)	bswap32(x)
> +
> +#define	_IOC_TYPE(nr)	(((nr) >> 8) & 255)
> +
> +#define	SYS_getdents64	SYS_freebsd11_getdents
> +
> +#define	mount(src, dest, fstype, flags, data)	\
> +	mount(fstype, dest, flags, data)
> +
> +/*
> + * Improper substitutions:
> + * The following macros are temporary replacements for functions
> + * and macros that exist on Linux and do not exist on FreeBSD.
> + */
> +
> +#define	ETIME	ETIMEDOUT
> +
> +#define	MAP_POPULATE	MAP_PREFAULT_READ
> +
> +#define	MADV_HUGEPAGE	MADV_SEQUENTIAL
> +#define	MADV_DONTFORK	MADV_NOSYNC
> +
> +#define	WDIOC_KEEPALIVE	WDIOCPATPAT
> +
> +#define	SCHED_RESET_ON_FORK	0
> +#define	SCHED_IDLE	SCHED_OTHER
> +
> +#define	gettid()	getpid()
> +
> +#define	pthread_sigqueue(pid, signo, value)	\
> +	sigqueue(pid, signo, value)
> +
> +#define	signalfd(fd, mask, flags)	-ENOSYS
> +#define	timerfd_create(c, f)		-ENOSYS
> +#define	timerfd_settime(fd, f, n, o)	-ENOSYS
> +
> +/*
> + * Macro conflict resolution.
> + */
> +
> +#undef	ALIGN
> +#undef	PAGE_SIZE
> +
> +/*
> + * Missing Linux structures.
> + */
> +
> +struct signalfd_siginfo {
> +	uint32_t ssi_signo;
> +	uint32_t ssi_pid;
> +};
> +
> +struct kmod_module {
> +	size_t size;
> +};
> +
> +typedef struct {
> +	char state;
> +} proc_t;
> +
> +#endif /* IGT_FREEBSD_H */
> -- 
> 2.37.3
> 
