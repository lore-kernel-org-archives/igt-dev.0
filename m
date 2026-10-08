Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24B5CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 13:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72EB510E88F;
	Thu,  8 Oct 2026 13:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3S40MFw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F5810E88F
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 13:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791467771; x=1823003771;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0gF2nUQYWOeD2k3mu47PrN7PbWEXirQl2DDW4xlAS10=;
 b=L3S40MFwb+Z7pUPno6ZkAwvNI3wWaDx6WF07HUHFlGiCn0y3+9qTVYu3
 qpWwC//UDZB8Pso2cNbvD8YX8fiUMCrn57UJ3/Z0RWuWJ8yLNN5k+IOiW
 09tQvkcTL50/wl3xU6kS07SMvsFF9zCPfxysfRTLuj40YPz2f9K2K+a4d
 UbD7J3lInTdI/3wVTCSwtMiWV/L3w7Sl7s60yhAALW4By6xOqy5z9xh//
 41IyAuFLdrUn8/Oy0DZuGKIMkf/dpUBV/7NXg36C7JZfSVC/OCOItwZsf
 j4PJjdOz4X0pvP9Lg24su2DK3s5D2X4BPkTBDwAoUKViPTt5RxfDwcDI+ w==;
X-CSE-ConnectionGUID: 5CuouC9DR+a/MCorutqceg==
X-CSE-MsgGUID: lmBoFPfbRQCChmwi2naWHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="139325"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="139325"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:56:11 -0700
X-CSE-ConnectionGUID: UX4PdirEQ+SMR+YRnrz52g==
X-CSE-MsgGUID: QaiYMSOPSNSHT/oxUtee8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1873258"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:56:10 -0700
Message-ID: <d8aa547c-4fa4-41a4-b6cf-af232dac0876@linux.intel.com>
Date: Thu, 8 Oct 2026 15:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/7] tools/vmtb: Add VM dmesg wait support
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
 <20260928072600.426902-7-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260928072600.426902-7-adam.miszczak@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> Introduce VirtualMachine.wait_for_dmesg() to block until a line matching
> a given regex pattern appears on the guest serial console, returning the
> matched line or raising an exception on timeout.
>
> QEMU output (including guest dmesg) is buffered in a thread-safe buffer
> guarded by a condition variable, notifying waiters as new lines arrive.
> ANSI escape (color) codes are stripped from dmesg before logging.
>
> New function provides 'from_beginning' parameter:
> default (from_beginning=True) scans the whole dmesg collected since
> power on, while from_beginning=False resumes right after the previously
> matched line (uses cursor shared for all patterns).
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/bench/machines/virtual/vm.py | 48 ++++++++++++++++++++++++-
>   1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/tools/vmtb/bench/machines/virtual/vm.py b/tools/vmtb/bench/machines/virtual/vm.py
> index e0b6fb150..6b8425d13 100644
> --- a/tools/vmtb/bench/machines/virtual/vm.py
> +++ b/tools/vmtb/bench/machines/virtual/vm.py
> @@ -26,6 +26,10 @@ from bench.machines.virtual.device import VirtualDevice
>   
>   logger = logging.getLogger('VirtualMachine')
>   
> +# Matches ANSI escape sequences (e.g. color codes like \x1b[0;32m) emitted on the
> +# guest serial console, so they can be stripped before logging dmesg lines.
> +ANSI_ESCAPE_RE = re.compile(r'\x1b\[[0-9;]*[A-Za-z]')
> +
>   
>   class VirtualMachine(MachineInterface):
>       class Decorators():
> @@ -113,6 +117,13 @@ class VirtualMachine(MachineInterface):
>           self.migrate_destination_vm: bool = False
>           self._migration_ongoing: bool = False
>   
> +        # Buffer of guest serial console (dmesg) lines captured since power on,
> +        # guarded by a condition variable to allow waiting for specific messages.
> +        self._dmesg_buffer: typing.List[str] = []
> +        self._dmesg_condition = threading.Condition()
> +        # Dmesg wait cursor (shared across patterns): first dmesg line not consumed yet
> +        self._dmesg_scan_idx: int = 0
> +
>           self.dmesg_logger = self.__setup_dmesg_logger()
>   
>       def __str__(self) -> str:
> @@ -180,7 +191,11 @@ class VirtualMachine(MachineInterface):
>   
>       def __log_qemu_output(self, out: typing.TextIO) -> None:
>           for line in iter(out.readline, ''):
> -            self.dmesg_logger.debug(line.strip())
> +            stripped_line = ANSI_ESCAPE_RE.sub('', line).strip()
> +            self.dmesg_logger.debug(stripped_line)
> +            with self._dmesg_condition:
> +                self._dmesg_buffer.append(stripped_line)
> +                self._dmesg_condition.notify_all()
>   
>       def __sockets_exists(self) -> bool:
>           return self.questagent_sockpath.exists() and self.qmp_sockpath.exists()
> @@ -587,6 +602,37 @@ class VirtualMachine(MachineInterface):
>   
>           return True
>   
> +    @Decorators.timeout_signal
> +    def wait_for_dmesg(self, pattern: str, from_beginning: bool = True, timeout: int = 300) -> str:
> +        """Wait until a line matching the given regex pattern appears in the guest dmesg.
> +
> +        Scans the guest serial console output and blocks until a matching line is observed.
> +        By default the whole dmesg collected since VM power on is scanned.
> +        Clear 'from_beginning' to start right after the line matched by a previous
> +        wait_for_dmesg() call, to match consecutive occurrences of a repeating message.
> +        Returns the matched dmesg line (e.g. for further parsing) or raises AlarmTimeoutError
> +        if the pattern does not appear within the given timeout (in seconds).
> +        """
> +        regex = re.compile(pattern)
> +        logger.debug("[VM%s] Waiting for dmesg pattern: '%s'%s", self.vmnum, pattern,
> +                     '' if from_beginning else ' (since last match)')
> +
> +        with self._dmesg_condition:
> +            scan_idx = 0 if from_beginning else self._dmesg_scan_idx
> +            while True:
> +                while scan_idx < len(self._dmesg_buffer):
> +                    line = self._dmesg_buffer[scan_idx]
> +                    scan_idx += 1
> +                    if regex.search(line):
> +                        # Do not rewind the cursor
> +                        self._dmesg_scan_idx = max(self._dmesg_scan_idx, scan_idx)
> +                        logger.debug("[VM%s] Matched dmesg pattern: '%s'", self.vmnum, pattern)
> +                        return line
> +
> +                # Poll with a short timeout so the SIGALRM raised by
> +                # Decorators.timeout_signal can interrupt the wait and propagate.
> +                self._dmesg_condition.wait(timeout=1)
> +
>       def save_state_init(self) -> None:
>           """Initiate VM snapshot-save operation (asynchronous)."""
>           logger.debug("Starting VM%s state save (snapshot)", self.vmnum)
