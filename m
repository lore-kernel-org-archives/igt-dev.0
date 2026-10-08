Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AA5CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 13:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BFB10E092;
	Thu,  8 Oct 2026 13:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oq9LGkbR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4AD10E8DA
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 13:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791467632; x=1823003632;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GCIMWn6ILYZw/36RSi58ZMAd+rhq5/de6FFb1SzuTuI=;
 b=Oq9LGkbRVSPfBjlK1Sg2Ms3hltwhajmIWQVzNpsLZsTeNOXaZH6b4itB
 ie99KEACwFMgFvY75Zwa/wq8Ls9mGYPsEgS0ub1m3DbZ0jz4crsc+7OZg
 8cVOIdBf6pKwyiETzgca5eMh6roJs5pL1D36NswWoKuk0OPPMrM+zkDEP
 w7t/uLR2l3ft6r8LscMSlhAc9XyUFJxguV3e1Oea41/iYhzFEY470t6Z0
 CQwQcE5SW0QBT3SgSYGmS9Alln0NoqNq+wwnZxj7bKo9cS8keCB+ac4T0
 f4AtQBYUkZBcP9X3AcwVeowpIWSQchRUTQH+fFoAlNHfYvhkJnUzJpPtP A==;
X-CSE-ConnectionGUID: LqDQfskdTXKGjFUsBUF3yA==
X-CSE-MsgGUID: ej2NZ/xtQnCM6lY01wgx8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="276936"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="276936"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:53:51 -0700
X-CSE-ConnectionGUID: ZwYZnsIsRmOTqkenv1E39g==
X-CSE-MsgGUID: YS9PDZhySMirVm4M7ZZBew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="54346"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:53:51 -0700
Message-ID: <b88b2937-c293-42e8-ab1b-db4d7e071cc0@linux.intel.com>
Date: Thu, 8 Oct 2026 15:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/7] tools/vmtb: Introduce asynchronous VM state
 save/load functions
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
 <20260928072600.426902-2-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260928072600.426902-2-adam.miszczak@linux.intel.com>
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

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

On 9/28/2026 9:25 AM, Adam Miszczak wrote:
> Split existing VM snapshot save/load functions into explicit initialization
> and completion-check phases.
> Making save and load as asynchronous/non-blocking operations allows
> parallel migration of multiple VMs.
>
> Refactor QMP 'query_jobs' handling function to keep reading QMP responses
> until the requested job type is received. Remove unused 'get_qmp_event_job'
> since 'query_jobs' now consumes JOB_STATUS_CHANGE events.
>
> Add handling of QMP command acknowledgments to ensure QEMU has
> processed a command before proceeding.
> Implement __wait_for_ack() helper that consumes the QMP acknowledgment
> (empty return on success) and raises QmpError on an error response.
> Apply __wait_for_ack() to confirm QMP commands that have no event-based
> confirmation: 'stop', 'cont', 'snapshot-save' and 'snapshot-load'.
> Remaining commands like 'system_reset' or 'system_wakeup' are confirmed
> via events in VirtualMachine wrappers.
>
> Also tighten query_status() to wait until the response contains both
> the 'status' and 'running' fields (QMP StatusInfo type), avoiding acting
> on a partial return.
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/bench/exceptions.py                | 10 ++-
>   .../machines/virtual/backends/qmp_monitor.py  | 55 +++++++++-------
>   tools/vmtb/bench/machines/virtual/vm.py       | 66 +++++++++++++------
>   3 files changed, 86 insertions(+), 45 deletions(-)
>
> diff --git a/tools/vmtb/bench/exceptions.py b/tools/vmtb/bench/exceptions.py
> index 95ca2aa9b..1c151669a 100644
> --- a/tools/vmtb/bench/exceptions.py
> +++ b/tools/vmtb/bench/exceptions.py
> @@ -1,5 +1,5 @@
>   # SPDX-License-Identifier: MIT
> -# Copyright © 2024 Intel Corporation
> +# Copyright © 2024-2026 Intel Corporation
>   
>   class BenchError(Exception):
>       pass
> @@ -19,11 +19,19 @@ class GuestAgentError(GuestError):
>       pass
>   
>   
> +class GuestMigrationError(GuestError):
> +    pass
> +
> +
>   class AlarmTimeoutError(GuestError):
>       pass
>   
>   
>   # Generic errors:
> +class QmpError(BenchError):
> +    pass
> +
> +
>   class GemWsimError(BenchError):
>       pass
>   
> diff --git a/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py b/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
> index d364a5711..8b273ca07 100644
> --- a/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
> +++ b/tools/vmtb/bench/machines/virtual/backends/qmp_monitor.py
> @@ -9,6 +9,8 @@ import threading
>   import time
>   import typing
>   
> +from bench.exceptions import QmpError
> +
>   logger = logging.getLogger('QmpMonitor')
>   
>   
> @@ -46,7 +48,7 @@ class QmpMonitor():
>           self.sockf.flush()
>   
>           ret: typing.Dict = {}
> -        while 'status' not in ret:
> +        while not ('status' in ret and 'running' in ret):
>               qmp_msg = self.qmp_queue.get()
>               if 'return' in qmp_msg:
>                   ret = qmp_msg.get('return')
> @@ -55,26 +57,27 @@ class QmpMonitor():
>           logger.debug('Machine status: %s', status)
>           return status
>   
> -    def query_jobs(self, requested_type: str) -> typing.Tuple[str, str]:
> +    def query_jobs(self, requested_type: str) -> typing.Tuple[str, typing.Optional[str]]:
>           json.dump({'execute': 'query-jobs'}, self.sockf)
>           self.sockf.flush()
>   
> -        job_type: str = ''
> -        job_status: str = ''
> -        job_error: str = ''
> -        ret: typing.Dict = {}
> +        job_status: str = 'N/A'
> +        job_error: typing.Optional[str] = None
> +        is_job_info: bool = False
>   
> -        qmp_msg = self.qmp_queue.get()
> -        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
> -        if 'return' in qmp_msg:
> -            ret = qmp_msg.get('return')
> -            for param in ret:
> -                job_type = param.get('type')
> -                job_status = param.get('status')
> -                job_error = param.get('error')
> +        while not is_job_info:
> +            qmp_msg = self.qmp_queue.get()
> +            if 'return' in qmp_msg:
> +                ret = qmp_msg.get('return')
> +                if not isinstance(ret, list):
> +                    continue
>   
> -                if job_type == requested_type:
> -                    break
> +                for job_info in ret:
> +                    if job_info.get('type') == requested_type:
> +                        job_status = job_info.get('status')
> +                        job_error = job_info.get('error')
> +                        is_job_info = True
> +                        break
>   
>           return (job_status, job_error)
>   
> @@ -84,15 +87,15 @@ class QmpMonitor():
>           event: str = qmp_msg.get('event', '')
>           return event
>   
> -    def get_qmp_event_job(self) -> str:
> +    def __wait_for_ack(self, cmd_name: str) -> None:
> +        """Consume QMP command acknowledgment (empty return on success).
> +        Throw QmpError exception on error response."""
>           qmp_msg = self.qmp_queue.get()
> -        # logger.debug('[QMP RSP Queue] -> %s', qmp_msg)
> -
> -        status: str = ''
> -        if qmp_msg.get('event') == 'JOB_STATUS_CHANGE':
> -            status = qmp_msg.get('data', {}).get('status', '')
> -
> -        return status
> +        while not ('return' in qmp_msg or 'error' in qmp_msg):
> +            qmp_msg = self.qmp_queue.get()
> +        if 'error' in qmp_msg:
> +            desc = qmp_msg['error'].get('desc', 'unknown error')
> +            raise QmpError(f'QMP {cmd_name} failed: {desc}')
>   
>       def system_reset(self) -> None:
>           json.dump({'execute': 'system_reset'}, self.sockf)
> @@ -105,10 +108,12 @@ class QmpMonitor():
>       def stop(self) -> None:
>           json.dump({'execute': 'stop'}, self.sockf)
>           self.sockf.flush()
> +        self.__wait_for_ack('stop')
>   
>       def cont(self) -> None:
>           json.dump({'execute': 'cont'}, self.sockf)
>           self.sockf.flush()
> +        self.__wait_for_ack('cont')
>   
>       def quit(self) -> None:
>           json.dump({'execute': 'quit'}, self.sockf)
> @@ -149,6 +154,7 @@ class QmpMonitor():
>               'arguments': {'job-id': job_id, 'tag': snapshot_tag, 'vmstate': node_name, 'devices': [node_name]}},
>               self.sockf)
>           self.sockf.flush()
> +        self.__wait_for_ack('snapshot-save')
>   
>       def load_snapshot(self) -> None:
>           job_id: str = f'loadvm_{time.time()}'
> @@ -160,3 +166,4 @@ class QmpMonitor():
>               'arguments': {'job-id': job_id, 'tag': snapshot_tag, 'vmstate': node_name, 'devices': [node_name]}},
>               self.sockf)
>           self.sockf.flush()
> +        self.__wait_for_ack('snapshot-load')
> diff --git a/tools/vmtb/bench/machines/virtual/vm.py b/tools/vmtb/bench/machines/virtual/vm.py
> index 2469af965..8229084d4 100644
> --- a/tools/vmtb/bench/machines/virtual/vm.py
> +++ b/tools/vmtb/bench/machines/virtual/vm.py
> @@ -84,6 +84,7 @@ class VirtualMachine(MachineInterface):
>   
>           self.migrate_source_image: typing.Optional[str] = None
>           self.migrate_destination_vm: bool = False
> +        self._migration_ongoing: bool = False
>   
>           self.dmesg_logger = self.__setup_dmesg_logger()
>   
> @@ -558,32 +559,57 @@ class VirtualMachine(MachineInterface):
>   
>           return True
>   
> -    @Decorators.timeout_signal
> -    def save_state(self) -> None:
> -        logger.debug('Saving VM%s state (snapshot)', self.vmnum)
> +    def save_state_init(self) -> None:
> +        """Initiate VM snapshot-save operation (asynchronous)."""
> +        logger.debug("Starting VM%s state save (snapshot)", self.vmnum)
>           self.qm.save_snapshot()
> +        self._migration_ongoing = True
>   
> -        job_status: str = self.qm.get_qmp_event_job()
> -        while job_status != 'concluded':
> -            job_status = self.qm.get_qmp_event_job()
> +    def load_state_init(self) -> None:
> +        """Initiate VM snapshot-load operation (asynchronous)."""
> +        logger.debug("Starting VM%s state load (snapshot)", self.vmnum)
> +        self.qm.load_snapshot()
> +        self._migration_ongoing = True
>   
> -        job_status, job_error = self.qm.query_jobs('snapshot-save')
> -        if job_status == 'concluded' and job_error is not None:
> -            raise exceptions.GuestError(f'VM{self.vmnum} state save error: {job_error}')
> +    def __is_snapshot_operation_complete(self, op_name: str) -> bool:
> +        """Poll VM snapshot save/load job completion."""
> +        if not self._migration_ongoing:
> +            logger.warning("VM%s migration is not in progress", self.vmnum)
> +            return False
>   
> -        logger.debug('VM%s state save finished successfully', self.vmnum)
> +        job_status, job_error = self.qm.query_jobs(f'snapshot-{op_name}')
> +        if job_error is not None:
> +            logger.error("VM%s snapshot-%s error: %s", self.vmnum, op_name, job_error)
> +            return False
> +
> +        return job_status == 'concluded'
>   
>       @Decorators.timeout_signal
> -    def load_state(self) -> None:
> -        logger.debug('Loading VM state (snapshot)')
> -        self.qm.load_snapshot()
> +    def save_state_check(self, timeout: int = DEFAULT_TIMEOUT) -> None:
> +        """Check if previously started snapshot-save has completed successfully."""
> +        if not self.__is_snapshot_operation_complete('save'):
> +            logger.error("VM%s state save has not completed", self.vmnum)
> +            raise exceptions.GuestMigrationError(f'VM{self.vmnum} state save has not completed')
> +
> +        self._migration_ongoing = False
> +        logger.debug("VM%s state save finished successfully", self.vmnum)
> +
> +    @Decorators.timeout_signal
> +    def load_state_check(self, timeout: int = DEFAULT_TIMEOUT) -> None:
> +        """Check if previously started snapshot-load has completed successfully."""
> +        if not self.__is_snapshot_operation_complete('load'):
> +            logger.error("VM%s state load has not completed", self.vmnum)
> +            raise exceptions.GuestMigrationError(f'VM{self.vmnum} state load has not completed')
>   
> -        job_status: str = self.qm.get_qmp_event_job()
> -        while job_status != 'concluded':
> -            job_status = self.qm.get_qmp_event_job()
> +        self._migration_ongoing = False
> +        logger.debug("VM%s state load finished successfully", self.vmnum)
>   
> -        job_status, job_error = self.qm.query_jobs('snapshot-load')
> -        if job_status == 'concluded' and job_error is not None:
> -            raise exceptions.GuestError(f'VM{self.vmnum} state load error: {job_error}')
> +    def save_state(self) -> None:
> +        """Save VF state - submit snapshot-save and check result (synchronous save)."""
> +        self.save_state_init()
> +        self.save_state_check()
>   
> -        logger.debug('VM state load finished successfully')
> +    def load_state(self) -> None:
> +        """Load VF state - submit snapshot-load and check result (synchronous load)."""
> +        self.load_state_init()
> +        self.load_state_check()
