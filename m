Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72875C52D6F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 13:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E16910E721;
	Thu,  8 Aug 2024 13:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STKA+vj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B718E10E721
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Aug 2024 13:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723123136; x=1754659136;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=u5dgs0i4HTBlhcO+Mik5YjMP9f4Azxw2H7UmupAdXpw=;
 b=STKA+vj5DCstWnvPwlRjQnvNAHWyVjCzJz8A5hGjVNjdsZ5VY5f1TNId
 SiD0XtFuWonVfEqyZCDcU8wBQhClMzl3o7iwwRj5CTbiI+3zVyEHtS1Pa
 ktAj9ZNSUSZ1ByQE2RSpr+dgWNKkpOxXtBrtka1iZB2yTpyPcX0xd8bYT
 HjXrqDJf+LVJsVCKZiKlkPubqMcoseReA/DTrWwy2BZ11xo87bIIVUmlM
 +KRCilePH3YcG79SFtfiKtWGDztIu6KejxK2bLxr7wF1NKVDaQShO7JEG
 +or+5qeQYOjb8pSD7j7D4SI6gnU54Aa6Gurn4HOno2ag8VuPDlV8x6Ezm g==;
X-CSE-ConnectionGUID: CzojAfAuTxK3phusURHzDA==
X-CSE-MsgGUID: 4aFl4vuiRrid5T+zXHKUgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21105257"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="21105257"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 06:18:56 -0700
X-CSE-ConnectionGUID: /V73WYYESRWwI9Mt3wSfNw==
X-CSE-MsgGUID: g6+q4aimSk2BU8gndypPRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57458103"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 06:18:52 -0700
Date: Thu, 8 Aug 2024 15:18:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v2 01/66] drm-uapi/xe: Sync with eudebug uapi
Message-ID: <20240808131834.yjffrg36cyuvormy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-2-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730114523.334156-2-christoph.manszewski@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Christoph,
On 2024-07-30 at 13:44:18 +0200, Christoph Manszewski wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Align with kernel commit 09411c6ecbef ("drm/xe/eudebug: Add debug
> metadata support for xe_eudebug") from:
> 
> https://gitlab.freedesktop.org/miku/kernel.git
> 
> which introduces most recent changes to the eudebug uapi.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

You should put here your s-o-b, to this and all other patches you sent.
One more nit below.

> ---
>  include/drm-uapi/xe_drm.h         | 104 +++++++++++++-
>  include/drm-uapi/xe_drm_eudebug.h | 226 ++++++++++++++++++++++++++++++

Could that second change be in separate patch?
Or do the kernel counterpart have also two parts?

>  2 files changed, 324 insertions(+), 6 deletions(-)
>  create mode 100644 include/drm-uapi/xe_drm_eudebug.h
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 29425d7fd..ff9d4e7b6 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -3,8 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef _UAPI_XE_DRM_H_
> -#define _UAPI_XE_DRM_H_
> +#ifndef _XE_DRM_H_
> +#define _XE_DRM_H_

Why are you touching this?

Regards,
Kamil

>  
>  #include "drm.h"
>  
> @@ -102,7 +102,9 @@ extern "C" {
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
> -
> +#define DRM_XE_EUDEBUG_CONNECT		0x0c
> +#define DRM_XE_DEBUG_METADATA_CREATE	0x0d
> +#define DRM_XE_DEBUG_METADATA_DESTROY	0x0e
>  /* Must be kept compact -- no holes */
>  
>  #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
> @@ -117,6 +119,9 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)
> +#define DRM_IOCTL_XE_DEBUG_METADATA_CREATE	 DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_CREATE, struct drm_xe_debug_metadata_create)
> +#define DRM_IOCTL_XE_DEBUG_METADATA_DESTROY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_DESTROY, struct drm_xe_debug_metadata_destroy)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -134,7 +139,7 @@ extern "C" {
>   * redefine the interface more easily than an ever growing struct of
>   * increasing complexity, and for large parts of that interface to be
>   * entirely optional. The downside is more pointer chasing; chasing across
> - * the __user boundary with pointers encapsulated inside u64.
> + * the boundary with pointers encapsulated inside u64.
>   *
>   * Example chaining:
>   *
> @@ -881,6 +886,23 @@ struct drm_xe_vm_destroy {
>  	__u64 reserved[2];
>  };
>  
> +struct drm_xe_vm_bind_op_ext_attach_debug {
> +	/** @base: base user extension */
> +	struct drm_xe_user_extension base;
> +
> +	/** @id: Debug object id from create metadata */
> +	__u64 metadata_id;
> +
> +	/** @flags: Flags */
> +	__u64 flags;
> +
> +	/** @cookie: Cookie */
> +	__u64 cookie;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved;
> +};
> +
>  /**
>   * struct drm_xe_vm_bind_op - run bind operations
>   *
> @@ -905,7 +927,9 @@ struct drm_xe_vm_destroy {
>   *    handle MBZ, and the BO offset MBZ. This flag is intended to
>   *    implement VK sparse bindings.
>   */
> +
>  struct drm_xe_vm_bind_op {
> +#define XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG 0
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> @@ -1108,7 +1132,8 @@ struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> -
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		2
> +#define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> @@ -1694,8 +1719,75 @@ struct drm_xe_oa_stream_info {
>  	__u64 reserved[3];
>  };
>  
> +/*
> + * Debugger ABI (ioctl and events) Version History:
> + * 0 - No debugger available
> + * 1 - Initial version
> + */
> +#define DRM_XE_EUDEBUG_VERSION 1
> +
> +struct drm_xe_eudebug_connect {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	__u64 pid; /* input: Target process ID */
> +	__u32 flags; /* MBZ */
> +
> +	__u32 version; /* output: current ABI (ioctl / events) version */
> +};
> +
> +/*
> + * struct drm_xe_debug_metadata_create - Create debug metadata
> + *
> + * Add a region of user memory to be marked as debug metadata.
> + * When the debugger attaches, the metadata regions will be delivered
> + * for debugger. Debugger can then map these regions to help decode
> + * the program state.
> + *
> + * Returns handle to created metadata entry.
> + */
> +struct drm_xe_debug_metadata_create {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +#define DRM_XE_DEBUG_METADATA_ELF_BINARY     0
> +#define DRM_XE_DEBUG_METADATA_PROGRAM_MODULE 1
> +#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_MODULE_AREA 2
> +#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SBA_AREA 3
> +#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA 4
> +#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM (1 + \
> +	  WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA)
> +
> +	/** @type: Type of metadata */
> +	__u64 type;
> +
> +	/** @user_addr: pointer to start of the metadata */
> +	__u64 user_addr;
> +
> +	/** @len: length, in bytes of the medata */
> +	__u64 len;
> +
> +	/** @metadata_id: created metadata handle (out) */
> +	__u32 metadata_id;
> +};
> +
> +/**
> + * struct drm_xe_debug_metadata_destroy - Destroy debug metadata
> + *
> + * Destroy debug metadata.
> + */
> +struct drm_xe_debug_metadata_destroy {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @metadata_id: metadata handle to destroy */
> +	__u32 metadata_id;
> +};
> +
> +#include "xe_drm_eudebug.h"
> +
>  #if defined(__cplusplus)
>  }
>  #endif
>  
> -#endif /* _UAPI_XE_DRM_H_ */
> +#endif /* _XE_DRM_H_ */
> diff --git a/include/drm-uapi/xe_drm_eudebug.h b/include/drm-uapi/xe_drm_eudebug.h
> new file mode 100644
> index 000000000..55df6f7cd
> --- /dev/null
> +++ b/include/drm-uapi/xe_drm_eudebug.h
> @@ -0,0 +1,226 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_DRM_EUDEBUG_H_
> +#define _XE_DRM_EUDEBUG_H_
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * Do a eudebug event read for a debugger connection.
> + *
> + * This ioctl is available in debug version 1.
> + */
> +#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
> +#define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
> +#define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x4, struct drm_xe_eudebug_ack_event)
> +#define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x1, struct drm_xe_eudebug_vm_open)
> +#define DRM_XE_EUDEBUG_IOCTL_READ_METADATA	_IOWR('j', 0x3, struct drm_xe_eudebug_read_metadata)
> +
> +/* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
> +struct drm_xe_eudebug_event {
> +	__u32 len;
> +
> +	__u16 type;
> +#define DRM_XE_EUDEBUG_EVENT_NONE		0
> +#define DRM_XE_EUDEBUG_EVENT_READ		1
> +#define DRM_XE_EUDEBUG_EVENT_OPEN		2
> +#define DRM_XE_EUDEBUG_EVENT_VM			3
> +#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
> +#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
> +#define DRM_XE_EUDEBUG_EVENT_METADATA		9
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 10
> +#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA
> +
> +	__u16 flags;
> +#define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
> +#define DRM_XE_EUDEBUG_EVENT_DESTROY		(1 << 1)
> +#define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE	(1 << 2)
> +#define DRM_XE_EUDEBUG_EVENT_NEED_ACK		(1 << 3)
> +
> +	__u64 seqno;
> +	__u64 reserved;
> +};
> +
> +struct drm_xe_eudebug_event_client {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle; /* This is unique per debug connection */
> +};
> +
> +struct drm_xe_eudebug_event_vm {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle;
> +	__u64 vm_handle;
> +};
> +
> +struct drm_xe_eudebug_event_exec_queue {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle;
> +	__u64 vm_handle;
> +	__u64 exec_queue_handle;
> +	__u32 engine_class;
> +	__u32 width;
> +	__u64 lrc_handle[];
> +};
> +
> +struct drm_xe_eudebug_event_eu_attention {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle;
> +	__u64 exec_queue_handle;
> +	__u64 lrc_handle;
> +	__u32 flags;
> +	__u32 bitmask_size;
> +	__u8 bitmask[];
> +};
> +
> +struct drm_xe_eudebug_eu_control {
> +	__u64 client_handle;
> +
> +#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL	0
> +#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED		1
> +#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME		2
> +	__u32 cmd;
> +	__u32 flags;
> +
> +	__u64 seqno;
> +
> +	__u64 exec_queue_handle;
> +	__u64 lrc_handle;
> +	__u32 reserved;
> +	__u32 bitmask_size;
> +	__u64 bitmask_ptr;
> +};
> +
> +/*
> + *  When client (debuggee) does vm_bind_ioctl() following event
> + *  sequence will be created (for the debugger):
> + *
> + *  ┌───────────────────────┐
> + *  │  EVENT_VM_BIND        ├───────┬─┬─┐
> + *  └───────────────────────┘       │ │ │
> + *      ┌───────────────────────┐   │ │ │
> + *      │ EVENT_VM_BIND_OP #1   ├───┘ │ │
> + *      └───────────────────────┘     │ │
> + *                 ...                │ │
> + *      ┌───────────────────────┐     │ │
> + *      │ EVENT_VM_BIND_OP #n   ├─────┘ │
> + *      └───────────────────────┘       │
> + *                                      │
> + *      ┌───────────────────────┐       │
> + *      │ EVENT_UFENCE          ├───────┘
> + *      └───────────────────────┘
> + *
> + * All the events below VM_BIND will reference the VM_BIND
> + * they associate with, by field .vm_bind_ref_seqno.
> + * event_ufence will only be included if the client did
> + * attach sync of type UFENCE into its vm_bind_ioctl().
> + *
> + * When EVENT_UFENCE is sent by the driver, all the OPs of
> + * the original VM_BIND are completed and the [addr,range]
> + * contained in them are present and modifiable through the
> + * vm accessors. Accessing [addr, range] before related ufence
> + * event will lead to undefined results as the actual bind
> + * operations are async and the backing storage might not
> + * be there on a moment of receiving the event.
> + *
> + * Client's UFENCE sync will be held by the driver: client's
> + * drm_xe_wait_ufence will not complete and the value of the ufence
> + * won't appear until ufence is acked by the debugger process calling
> + * DRM_XE_EUDEBUG_IOCTL_ACK_EVENT with the event_ufence.base.seqno.
> + * This will signal the fence, .value will update and the wait will
> + * complete allowing the client to continue.
> + *
> + */
> +
> +struct drm_xe_eudebug_event_vm_bind {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle;
> +	__u64 vm_handle;
> +
> +	__u32 flags;
> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE (1 << 0)
> +
> +	__u32 num_binds;
> +};
> +
> +struct drm_xe_eudebug_event_vm_bind_op {
> +	struct drm_xe_eudebug_event base;
> +	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
> +	__u64 num_extensions;
> +
> +	__u64 addr; /* XXX: Zero for unmap all? */
> +	__u64 range; /* XXX: Zero for unmap all? */
> +};
> +
> +struct drm_xe_eudebug_event_vm_bind_ufence {
> +	struct drm_xe_eudebug_event base;
> +	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
> +};
> +
> +struct drm_xe_eudebug_ack_event {
> +	__u32 type;
> +	__u32 flags; /* MBZ */
> +	__u64 seqno;
> +};
> +
> +struct drm_xe_eudebug_vm_open {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @client_handle: id of client */
> +	__u64 client_handle;
> +
> +	/** @vm_handle: id of vm */
> +	__u64 vm_handle;
> +
> +	/** @flags: flags */
> +	__u64 flags;
> +
> +	/** @timeout_ns: Timeout value in nanoseconds operations (fsync) */
> +	__u64 timeout_ns;
> +};
> +
> +struct drm_xe_eudebug_read_metadata {
> +	__u64 client_handle;
> +	__u64 metadata_handle;
> +	__u32 flags;
> +	__u32 reserved;
> +	__u64 ptr;
> +	__u64 size;
> +};
> +
> +struct drm_xe_eudebug_event_metadata {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle;
> +	__u64 metadata_handle;
> +	/* XXX: Refer to xe_drm.h for fields */
> +	__u64 type;
> +	__u64 len;
> +};
> +
> +struct drm_xe_eudebug_event_vm_bind_op_metadata {
> +	struct drm_xe_eudebug_event base;
> +	__u64 vm_bind_op_ref_seqno; /* *_event_vm_bind_op.base.seqno */
> +
> +	__u64 metadata_handle;
> +	__u64 metadata_cookie;
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif
> -- 
> 2.34.1
> 
