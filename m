Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997BEC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 11:13:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5513010E6D9;
	Thu,  8 Aug 2024 11:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBpa4NM5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3769210E6D9
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Aug 2024 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723115625; x=1754651625;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=A/yTHEuPH/qkdperdqPgcWjapKxfdrGg4GCtLxBEF18=;
 b=GBpa4NM5GVDVrEetBLXaJk8/dZu7qt1zj8ASp3O5nhWsK52E87It+Ehc
 w72AWaydGUYPDklh0tGFd5dGx1Xe3AZU9nOVBIxrMDXQyoxnGXjN6Bq4u
 d0CvOBGbEFjgwBBoJimPnkUMCLAF+oXKR4LuGHLMm3hH69qYeJDzi2HQd
 OTK7dm7hxfj53hxlv6+D033AqN9SoLjkiMqNvWegsa14b7zkv5wTo50Hk
 f1SBE0K5rKaHUsvAkW5Mqms/gyiI4e/9zhZAGca+kGeyEV9EL7BdMkGfJ
 BLfZQ1RpZoz3Hp9drGT8E83uF6geH5ozIuKTfRewGDfN/aMOzQIBvCCIw A==;
X-CSE-ConnectionGUID: KtaAYOi9RwadiGk7t/Yonw==
X-CSE-MsgGUID: n5qFlpFATAe0MCqhxRq9pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38740636"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="38740636"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 04:13:45 -0700
X-CSE-ConnectionGUID: LCa8yF5CRVehQAGbFCJe1A==
X-CSE-MsgGUID: EAjPzG/MRvmeadCdlwtRJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="94730915"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 04:13:42 -0700
Date: Thu, 8 Aug 2024 13:13:39 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v2 00/66] Test coverage for GPU debug support
Message-ID: <20240808111339.4kttfliosn6y525a@zkempczy-mobl2>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

On Tue, Jul 30, 2024 at 01:44:17PM +0200, Christoph Manszewski wrote:
> Hi,
> 
> In this series the eudebug kernel and validation team would like to
> add test coverage for GPU debug support recently proposed as an RFC.
> (https://patchwork.freedesktop.org/series/136572/)
> 
> This series adds 'xe_eudebug' and 'xe_eudebug_online' tests together
> with a library that encapsulates common paths in current and future
> EU debugger scenarios. It also extends the 'xe_exec_sip' test and
> 'gpgpu_shader' library.
> 
> The aim of the 'xe_eudebug' test is to validate the eudebug resource
> tracking and event delivery mechanism. The 'xe_eudebug_online' test is
> dedicated for 'online' scenarios which means scenarios that exercise
> hardware exception handling and thread state manipulation.
> 
> The xe_eudebug library provides an abstraction over debugger and debuggee
> processes, asynchronous event reader, and event log buffers for post-mortem
> analysis.
> 
> Latest kernel code can be found here:
> https://gitlab.freedesktop.org/miku/kernel/-/commits/eudebug-dev
> 
> Thank you in advance for any comments and insight.

May I ask to just divide series to library and tests part where
library changes is in few patches max, then tests in separate
patches? I've noticed through rough walk through the series
some code appears in some patches, whereas it disappears in
others. I mean I would like to review final state of the code
instead going through the history of the development eudebug
feature. Upstreaming Xe driver igts was also done in similar way
in few commits only. If you think some commit messages might
be interesting from the future perspective please keep them
during squashing.

--
Zbigniew

> 
> v2:
>  - make sure to include all patches and verify that each individual
>  patch compiles (Zbigniew)
> 
> Andrzej Hajda (6):
>   tests/xe_eudebug: Add userptr variant of basic-vm-access test
>   lib/gpgpu_shader: Add write_on_exception template
>   lib/gpgpu_shader: Add set/clear exception register (cr0.1) helpers
>   lib/intel_batchbuffer: Add helper to get pointer at specified offset
>   lib/gpgpu_shader: Allow enabling illegal opcode exceptions in shader
>   tests/xe_exec_sip: Rework invalid instruction tests
> 
> Christoph Manszewski (17):
>   lib/xe_ioctl: Add wrapper with vm_bind_op extension parameter
>   lib/xe_eudebug: Add support for vm_bind events
>   lib/xe_eudebug: Add support for user fence acking
>   lib/xe_eudebug: Add support for dynamic debugger sysfs toggle
>   tests/xe_eudebug: Add basic vm-bind coverage
>   tests/xe_eudebug: Add support for dynamic debugger sysfs toggle
>   tests/xe_eudebug: Add coverage for sysfs debugger toggle
>   lib/xe_eudebug: Allow debugger to wait for client
>   tests/xe_eudebug: Add vm-bind discovery tests
>   tests/xe_eudebug: Add basic-vm-bind-ufence
>   tests/xe_eudebug: Add vm-bind-clear test
>   lib/gpgpu_shader: Extend shader building library
>   tests/xe_exec_sip: Port tests for shaders and sip
>   tests/xe_exec_sip: Add support for dynamic debugger sysfs toggle
>   tests/xe_eudebug_online: Add support for dynamic debugger sysfs toggle
>   tests/xe_eudebug_online: Add subtests w/o long running mode
>   tests/xe_live_ktest: Add xe_eudebug live test
> 
> Dominik Grzegorzek (18):
>   drm-uapi/xe: Sync with eudebug uapi
>   tests/xe_eudebug: Test eudebug connection
>   lib/xe_eudebug: Introduce eu debug testing framework
>   lib/xe_eudebug: Add exec_queue support
>   lib/xe_eudebug: Add attention events support
>   lib/xe_eudebug: Add metadata support
>   tests/xe_eudebug: Test open close events
>   tests/xe_eudebug: Exercise read_event ioctl
>   tests/xe_eudebug: Add vm events sanity check
>   tests/xe_eudebug: Race discovery against eudebug attach.
>   tests/xe_eudebug: Introduce basic exec_queue testing
>   tests/xe_eudebug: Include exec queues in discovery testing
>   tests/xe_exec_sip: Check if we reset due to unhandled attention
>   tests/xe_exec_sip: Check usercoredump for attentions
>   tests/xe_eudebug_online: Debug client which runs workloads on EU
>   tests/xe_eudebug_online: Set dynamic breakpoint on interrupt-all
>   tests/xe_eudebug_online: What if user does not set debug mode?
>   tests/xe_eudebug_online: Check if eu debugger disables preemption
>     timeout
> 
> Dominik Karol Piatkowski (1):
>   tests/xe_eudebug_online: Add caching tests
> 
> Dominik Karol Piątkowski (5):
>   tests/xe_eudebug: Add multigpu scenarios
>   tests/xe_exec_sip: Add breakpoint-writesip-twice test
>   tests/xe_exec_sip: Add breakpoint-waitsip-heavy test
>   tests/xe_eudebug_online: Add tdctl-parameters test
>   tests/xe_eudebug_online: Add single-step and single-step-one tests
> 
> Gwan-gyeong Mun (1):
>   lib/intel_batchbuffer: Add support for long-running mode execution
> 
> Jonathan Cavitt (2):
>   tests/xe_eudebug: Exercise lseek
>   tests/xe_eudebug: Test multiple bo sizes
> 
> Karolina Stolarek (6):
>   tests/xe_eudebug: Add discovery-race-vmbind subtest
>   tests/xe_exec_sip: Add sanity-after-timeout test
>   tests/xe_exec_sip: Add nodebug test cases
>   lib/xe_eudebug: Expose xe_eudebug_connect
>   tests/xe_eudebug_online: Add interrupt-reconnect test
>   tests/xe_eudebug_online: Add multisession test cases
> 
> Kolanupaka Naveena (1):
>   tests/xe_eudebug_online: Adds debugger-reopen test
> 
> Maciej Patelczyk (3):
>   tests/xe_eudebug: Exercise debug metadata events sent to debugger
>   tests/xe_eudebug: Add basic-vm-bind-metadata-discovery
>   tests/xe_eudebug: Added connect-user test
> 
> Mika Kuoppala (2):
>   lib/xe_eudebug: Allow client to wait for debugger
>   tests/xe_eudebug: Add vm open/pread/pwrite basic tests
> 
> Pawel Sikora (4):
>   tests/xe_eudebug: Add basic-vm-access-parameters test
>   lib/xe_eudebug: Add mutex for log events write
>   tests/xe_eudebug: Add basic-client-th test
>   tests/xe_eudebug_online: Add reset-with-attention test
> 
>  include/drm-uapi/xe_drm.h         |  104 +-
>  include/drm-uapi/xe_drm_eudebug.h |  226 +++
>  lib/gpgpu_shader.c                |  474 +++++-
>  lib/gpgpu_shader.h                |   29 +-
>  lib/iga64_generated_codes.c       |  428 ++++-
>  lib/intel_batchbuffer.c           |  153 +-
>  lib/intel_batchbuffer.h           |   22 +
>  lib/meson.build                   |    1 +
>  lib/xe/xe_eudebug.c               | 2192 ++++++++++++++++++++++++++
>  lib/xe/xe_eudebug.h               |  206 +++
>  lib/xe/xe_ioctl.c                 |   20 +-
>  lib/xe/xe_ioctl.h                 |    5 +
>  tests/intel/xe_eudebug.c          | 2425 +++++++++++++++++++++++++++++
>  tests/intel/xe_eudebug_online.c   | 2117 +++++++++++++++++++++++++
>  tests/intel/xe_exec_sip.c         |  332 +++-
>  tests/intel/xe_live_ktest.c       |    6 +
>  tests/meson.build                 |    2 +
>  17 files changed, 8701 insertions(+), 41 deletions(-)
>  create mode 100644 include/drm-uapi/xe_drm_eudebug.h
>  create mode 100644 lib/xe/xe_eudebug.c
>  create mode 100644 lib/xe/xe_eudebug.h
>  create mode 100644 tests/intel/xe_eudebug.c
>  create mode 100644 tests/intel/xe_eudebug_online.c
> 
> -- 
> 2.34.1
> 
