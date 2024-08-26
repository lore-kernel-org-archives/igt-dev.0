Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29067C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 15:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5F210E229;
	Mon, 26 Aug 2024 15:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wn8f0isr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E12410E229
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 15:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724684888; x=1756220888;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hxMqqXd/LzrOds8+nk7nbtc+ldC80lhyAxopeN1Xrqw=;
 b=Wn8f0isrvlI01Q+3LTtoMp45VONPLBg2cl+tP1xPxyt1mXtVpTQHr3zZ
 HuhC7em+F0+64HbL6Innlj7bGoTiLsgi1dYTrqrI20gLQDzhCzHvbBIlE
 ASEkHXCZoRW0w90IP8ryx3K157Do46rknHXmzfkoJ6kt3WcK5ZN1SCgGc
 whUQjS7d6WPrAma2TvrhboN67ChWCO4bWpX2ITdA9a/ffqUgxyjggXvwJ
 eD4d0EHX6En9g/lQmYgWVwA9rWYwRR43BX37vCtr0NRgr9H7//1yWvRtY
 gczDOwqA0wLDKFNLbqrRT1q4nHQaNhUHtzc04FuWxWj0Q1k7aX+kZW3mk w==;
X-CSE-ConnectionGUID: gweTJIhZThCRK3JN42/M5A==
X-CSE-MsgGUID: kIBsYDeuSia7IDZTeoaZQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26997817"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26997817"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:08:08 -0700
X-CSE-ConnectionGUID: s6ctzVLNQGWxgvfNf3nGnA==
X-CSE-MsgGUID: QqaFj7r6SYSecz+q/BdqPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62375925"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.106])
 ([10.245.246.106])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 08:08:04 -0700
Message-ID: <fd290f6a-abcf-4bb8-880d-b5585300f0c3@intel.com>
Date: Mon, 26 Aug 2024 17:08:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 02/17] drm-uapi/xe: Sync with eudebug uapi
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20240823182222.305965-1-christoph.manszewski@intel.com>
 <20240823182222.305965-3-christoph.manszewski@intel.com>
 <20240826093226.k5xwomyjsp6vjuw7@zkempczy-mobl2>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240826093226.k5xwomyjsp6vjuw7@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Zbigniew,

On 26.08.2024 11:32, Zbigniew Kempczyński wrote:
> On Fri, Aug 23, 2024 at 08:22:07PM +0200, Christoph Manszewski wrote:
>> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>>
>> Align with kernel commit 09411c6ecbef ("drm/xe/eudebug: Add debug
>> metadata support for xe_eudebug") from:
>>
>> https://gitlab.freedesktop.org/miku/kernel.git
>>
>> which introduces most recent changes to the eudebug uapi.
>>
>> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>   include/drm-uapi/xe_drm_eudebug.h | 332 ++++++++++++++++++++++++++++++
>>   1 file changed, 332 insertions(+)
>>   create mode 100644 include/drm-uapi/xe_drm_eudebug.h
>>
>> diff --git a/include/drm-uapi/xe_drm_eudebug.h b/include/drm-uapi/xe_drm_eudebug.h
>> new file mode 100644
>> index 000000000..a058427e9
>> --- /dev/null
>> +++ b/include/drm-uapi/xe_drm_eudebug.h
>> @@ -0,0 +1,332 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_DRM_EUDEBUG_H_
>> +#define _XE_DRM_EUDEBUG_H_
>> +
>> +#if defined(__cplusplus)
>> +extern "C" {
>> +#endif
>> +
>> +/* XXX: BEGIN section moved from xe_drm.h as temporary solution */
> 
> I think why those defines are in this file instead xe_drm.h requires
> explanation. Feel free to describe it more here in the comment
> or in commit message. With this fixed:

Sure, will add an explanation for this.


> 
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Thanks,
Christoph


> 
> --
> Zbigniew
> 
>> +#define DRM_XE_EUDEBUG_CONNECT		0x0c
>> +#define DRM_XE_DEBUG_METADATA_CREATE	0x0d
>> +#define DRM_XE_DEBUG_METADATA_DESTROY	0x0e
>> +
>> +/* ... */
>> +
>> +#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)
>> +#define DRM_IOCTL_XE_DEBUG_METADATA_CREATE	 DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_CREATE, struct drm_xe_debug_metadata_create)
>> +#define DRM_IOCTL_XE_DEBUG_METADATA_DESTROY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_DESTROY, struct drm_xe_debug_metadata_destroy)
>> +
>> +/* ... */
>> +
>> +struct drm_xe_vm_bind_op_ext_attach_debug {
>> +	/** @base: base user extension */
>> +	struct drm_xe_user_extension base;
>> +
>> +	/** @id: Debug object id from create metadata */
>> +	__u64 metadata_id;
>> +
>> +	/** @flags: Flags */
>> +	__u64 flags;
>> +
>> +	/** @cookie: Cookie */
>> +	__u64 cookie;
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved;
>> +};
>> +
>> +/* ... */
>> +
>> +#define XE_VM_BIND_OP_EXTENSIONS_ATTACH_DEBUG 0
>> +
>> +/* ... */
>> +
>> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		2
>> +#define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
>> +
>> +/* ... */
>> +
>> +/*
>> + * Debugger ABI (ioctl and events) Version History:
>> + * 0 - No debugger available
>> + * 1 - Initial version
>> + */
>> +#define DRM_XE_EUDEBUG_VERSION 1
>> +
>> +struct drm_xe_eudebug_connect {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	__u64 pid; /* input: Target process ID */
>> +	__u32 flags; /* MBZ */
>> +
>> +	__u32 version; /* output: current ABI (ioctl / events) version */
>> +};
>> +
>> +/*
>> + * struct drm_xe_debug_metadata_create - Create debug metadata
>> + *
>> + * Add a region of user memory to be marked as debug metadata.
>> + * When the debugger attaches, the metadata regions will be delivered
>> + * for debugger. Debugger can then map these regions to help decode
>> + * the program state.
>> + *
>> + * Returns handle to created metadata entry.
>> + */
>> +struct drm_xe_debug_metadata_create {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +#define DRM_XE_DEBUG_METADATA_ELF_BINARY     0
>> +#define DRM_XE_DEBUG_METADATA_PROGRAM_MODULE 1
>> +#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_MODULE_AREA 2
>> +#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SBA_AREA 3
>> +#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA 4
>> +#define WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM (1 + \
>> +	  WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_SIP_AREA)
>> +
>> +	/** @type: Type of metadata */
>> +	__u64 type;
>> +
>> +	/** @user_addr: pointer to start of the metadata */
>> +	__u64 user_addr;
>> +
>> +	/** @len: length, in bytes of the medata */
>> +	__u64 len;
>> +
>> +	/** @metadata_id: created metadata handle (out) */
>> +	__u32 metadata_id;
>> +};
>> +
>> +/**
>> + * struct drm_xe_debug_metadata_destroy - Destroy debug metadata
>> + *
>> + * Destroy debug metadata.
>> + */
>> +struct drm_xe_debug_metadata_destroy {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	/** @metadata_id: metadata handle to destroy */
>> +	__u32 metadata_id;
>> +};
>> +/* XXX: END section moved from xe_drm.h as temporary solution */
>> +
>> +/**
>> + * Do a eudebug event read for a debugger connection.
>> + *
>> + * This ioctl is available in debug version 1.
>> + */
>> +#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
>> +#define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
>> +#define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x4, struct drm_xe_eudebug_ack_event)
>> +#define DRM_XE_EUDEBUG_IOCTL_VM_OPEN		_IOW('j', 0x1, struct drm_xe_eudebug_vm_open)
>> +#define DRM_XE_EUDEBUG_IOCTL_READ_METADATA	_IOWR('j', 0x3, struct drm_xe_eudebug_read_metadata)
>> +
>> +/* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
>> +struct drm_xe_eudebug_event {
>> +	__u32 len;
>> +
>> +	__u16 type;
>> +#define DRM_XE_EUDEBUG_EVENT_NONE		0
>> +#define DRM_XE_EUDEBUG_EVENT_READ		1
>> +#define DRM_XE_EUDEBUG_EVENT_OPEN		2
>> +#define DRM_XE_EUDEBUG_EVENT_VM			3
>> +#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
>> +#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
>> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
>> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
>> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
>> +#define DRM_XE_EUDEBUG_EVENT_METADATA		9
>> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 10
>> +
>> +	__u16 flags;
>> +#define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
>> +#define DRM_XE_EUDEBUG_EVENT_DESTROY		(1 << 1)
>> +#define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE	(1 << 2)
>> +#define DRM_XE_EUDEBUG_EVENT_NEED_ACK		(1 << 3)
>> +
>> +	__u64 seqno;
>> +	__u64 reserved;
>> +};
>> +
>> +struct drm_xe_eudebug_event_client {
>> +	struct drm_xe_eudebug_event base;
>> +
>> +	__u64 client_handle; /* This is unique per debug connection */
>> +};
>> +
>> +struct drm_xe_eudebug_event_vm {
>> +	struct drm_xe_eudebug_event base;
>> +
>> +	__u64 client_handle;
>> +	__u64 vm_handle;
>> +};
>> +
>> +struct drm_xe_eudebug_event_exec_queue {
>> +	struct drm_xe_eudebug_event base;
>> +
>> +	__u64 client_handle;
>> +	__u64 vm_handle;
>> +	__u64 exec_queue_handle;
>> +	__u32 engine_class;
>> +	__u32 width;
>> +	__u64 lrc_handle[];
>> +};
>> +
>> +struct drm_xe_eudebug_event_eu_attention {
>> +	struct drm_xe_eudebug_event base;
>> +
>> +	__u64 client_handle;
>> +	__u64 exec_queue_handle;
>> +	__u64 lrc_handle;
>> +	__u32 flags;
>> +	__u32 bitmask_size;
>> +	__u8 bitmask[];
>> +};
>> +
>> +struct drm_xe_eudebug_eu_control {
>> +	__u64 client_handle;
>> +
>> +#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL	0
>> +#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED		1
>> +#define DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME		2
>> +	__u32 cmd;
>> +	__u32 flags;
>> +
>> +	__u64 seqno;
>> +
>> +	__u64 exec_queue_handle;
>> +	__u64 lrc_handle;
>> +	__u32 reserved;
>> +	__u32 bitmask_size;
>> +	__u64 bitmask_ptr;
>> +};
>> +
>> +/*
>> + *  When client (debuggee) does vm_bind_ioctl() following event
>> + *  sequence will be created (for the debugger):
>> + *
>> + *  ┌───────────────────────┐
>> + *  │  EVENT_VM_BIND        ├───────┬─┬─┐
>> + *  └───────────────────────┘       │ │ │
>> + *      ┌───────────────────────┐   │ │ │
>> + *      │ EVENT_VM_BIND_OP #1   ├───┘ │ │
>> + *      └───────────────────────┘     │ │
>> + *                 ...                │ │
>> + *      ┌───────────────────────┐     │ │
>> + *      │ EVENT_VM_BIND_OP #n   ├─────┘ │
>> + *      └───────────────────────┘       │
>> + *                                      │
>> + *      ┌───────────────────────┐       │
>> + *      │ EVENT_UFENCE          ├───────┘
>> + *      └───────────────────────┘
>> + *
>> + * All the events below VM_BIND will reference the VM_BIND
>> + * they associate with, by field .vm_bind_ref_seqno.
>> + * event_ufence will only be included if the client did
>> + * attach sync of type UFENCE into its vm_bind_ioctl().
>> + *
>> + * When EVENT_UFENCE is sent by the driver, all the OPs of
>> + * the original VM_BIND are completed and the [addr,range]
>> + * contained in them are present and modifiable through the
>> + * vm accessors. Accessing [addr, range] before related ufence
>> + * event will lead to undefined results as the actual bind
>> + * operations are async and the backing storage might not
>> + * be there on a moment of receiving the event.
>> + *
>> + * Client's UFENCE sync will be held by the driver: client's
>> + * drm_xe_wait_ufence will not complete and the value of the ufence
>> + * won't appear until ufence is acked by the debugger process calling
>> + * DRM_XE_EUDEBUG_IOCTL_ACK_EVENT with the event_ufence.base.seqno.
>> + * This will signal the fence, .value will update and the wait will
>> + * complete allowing the client to continue.
>> + *
>> + */
>> +
>> +struct drm_xe_eudebug_event_vm_bind {
>> +	struct drm_xe_eudebug_event base;
>> +
>> +	__u64 client_handle;
>> +	__u64 vm_handle;
>> +
>> +	__u32 flags;
>> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_FLAG_UFENCE (1 << 0)
>> +
>> +	__u32 num_binds;
>> +};
>> +
>> +struct drm_xe_eudebug_event_vm_bind_op {
>> +	struct drm_xe_eudebug_event base;
>> +	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
>> +	__u64 num_extensions;
>> +
>> +	__u64 addr; /* XXX: Zero for unmap all? */
>> +	__u64 range; /* XXX: Zero for unmap all? */
>> +};
>> +
>> +struct drm_xe_eudebug_event_vm_bind_ufence {
>> +	struct drm_xe_eudebug_event base;
>> +	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
>> +};
>> +
>> +struct drm_xe_eudebug_ack_event {
>> +	__u32 type;
>> +	__u32 flags; /* MBZ */
>> +	__u64 seqno;
>> +};
>> +
>> +struct drm_xe_eudebug_vm_open {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	/** @client_handle: id of client */
>> +	__u64 client_handle;
>> +
>> +	/** @vm_handle: id of vm */
>> +	__u64 vm_handle;
>> +
>> +	/** @flags: flags */
>> +	__u64 flags;
>> +
>> +	/** @timeout_ns: Timeout value in nanoseconds operations (fsync) */
>> +	__u64 timeout_ns;
>> +};
>> +
>> +struct drm_xe_eudebug_read_metadata {
>> +	__u64 client_handle;
>> +	__u64 metadata_handle;
>> +	__u32 flags;
>> +	__u32 reserved;
>> +	__u64 ptr;
>> +	__u64 size;
>> +};
>> +
>> +struct drm_xe_eudebug_event_metadata {
>> +	struct drm_xe_eudebug_event base;
>> +
>> +	__u64 client_handle;
>> +	__u64 metadata_handle;
>> +	/* XXX: Refer to xe_drm.h for fields */
>> +	__u64 type;
>> +	__u64 len;
>> +};
>> +
>> +struct drm_xe_eudebug_event_vm_bind_op_metadata {
>> +	struct drm_xe_eudebug_event base;
>> +	__u64 vm_bind_op_ref_seqno; /* *_event_vm_bind_op.base.seqno */
>> +
>> +	__u64 metadata_handle;
>> +	__u64 metadata_cookie;
>> +};
>> +
>> +#if defined(__cplusplus)
>> +}
>> +#endif
>> +
>> +#endif
>> -- 
>> 2.34.1
>>
