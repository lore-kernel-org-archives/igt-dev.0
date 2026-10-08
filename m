Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C567CA600C
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 13:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3090310E896;
	Thu,  8 Oct 2026 13:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOlas+9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E6F10E092
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 13:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791467721; x=1823003721;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xsMwHw2XDVyOp6gCMiqLiY2nmC1VQhO3s4FIF5P6Qu0=;
 b=JOlas+9Bc8BYRH4rfZ9x5S4cdcH0PZInkNht1tfA0WspRnArBKjp/NR7
 inuiTnt36gU5RHeYhnYJ7ER6HFhYB0fwaterNky+eITkTtHsEbpSLQ/W3
 o9F4bKcD2fl9ydjqm6CAHNyA8DXjOQpY7s0r/5IiFaSypHDSuVvNdNVtl
 EQr9qfCAhS3sd9L92Y57r7LFXP8LvWO6yPXIVYUtbODOaXVZZC7XjJqyz
 5tlYreC015nZchks2UH67hLO3kj0ShMkq+0QRyr2spNGVhE4xVY40K7ub
 SyDXwJRiUkg5cr2KNQft3HPFZWrz3qUouOYQAjQtXjAMiXVKMPtF2j44e w==;
X-CSE-ConnectionGUID: DNlLhq02QhuHKbxJuXZHhw==
X-CSE-MsgGUID: tneD7JQzR7iO54R4O0YZRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="362182"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="362182"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:55:21 -0700
X-CSE-ConnectionGUID: +xBvKi47T46Qct2WPm8AVQ==
X-CSE-MsgGUID: RmG1ndOURRGRG0gG5434aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="51305"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:55:19 -0700
Message-ID: <ea12b4c7-4879-4ab6-a934-f98e9a3b2434@linux.intel.com>
Date: Thu, 8 Oct 2026 15:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/7] tools/vmtb: Fix guest timeout handling and PCI
 BDF matching
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
 <20260928072600.426902-5-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260928072600.426902-5-adam.miszczak@linux.intel.com>
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
> Resolve timeouts from keyword or positional arguments and function
> defaults. Give VM power-off a configurable 60-second default.
>
> Match complete PCI BDF names using hexadecimal fields and a literal
> dot before the function number, rejecting malformed directory names.
>
> Also, avoid nested f-string quotes for compatibility with older Python.
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/bench/machines/virtual/vm.py | 48 +++++++++++++++++++------
>   1 file changed, 38 insertions(+), 10 deletions(-)
>
> diff --git a/tools/vmtb/bench/machines/virtual/vm.py b/tools/vmtb/bench/machines/virtual/vm.py
> index 8229084d4..e0b6fb150 100644
> --- a/tools/vmtb/bench/machines/virtual/vm.py
> +++ b/tools/vmtb/bench/machines/virtual/vm.py
> @@ -2,6 +2,7 @@
>   # Copyright © 2024-2026 Intel Corporation
>   
>   import base64
> +import inspect
>   import json
>   import logging
>   import re
> @@ -34,13 +35,39 @@ class VirtualMachine(MachineInterface):
>   
>           @classmethod
>           def timeout_signal(cls, func: typing.Callable) -> typing.Callable:
> +            timeout_default: int = DEFAULT_TIMEOUT
> +
> +            # Check for timeout provided as function signature default
> +            func_sig = inspect.signature(func)
> +            timeout_param = func_sig.parameters.get('timeout')
> +            if timeout_param and isinstance(timeout_param.default, int):
> +                timeout_default = timeout_param.default
> +
> +            # Check timeout parameter positional index
> +            # (to avoid repeated introspection on every call)
> +            timeout_positional_idx: typing.Optional[int] = None
> +            positional_params = [
> +                name for name, param in func_sig.parameters.items()
> +                if param.kind == inspect.Parameter.POSITIONAL_OR_KEYWORD
> +            ]
> +            if 'timeout' in positional_params:
> +                timeout_positional_idx = positional_params.index('timeout')
> +
>               def timeout_wrapper(*args: typing.Any, **kwargs: typing.Optional[typing.Any]) -> typing.Any:
> -                timeout: int = DEFAULT_TIMEOUT
> -                if len(args) > 2:
> -                    timeout = args[2] # Argument position in execute_wait(self, pid, timeout)
> -                elif kwargs.get('timeout') is not None:
> -                    if isinstance(kwargs['timeout'], int):
> -                        timeout = kwargs['timeout']
> +                timeout: int = timeout_default
> +
> +                # Resolve timeout in this order:
> +                # 1. Explicit keyword value, e.g. vm.func(timeout=60)
> +                # 2. Explicit positional value, e.g. vm.func(..., 60)
> +                # 3. Default function signature value, e.g. def func(self, timeout=60)
> +                # 4. Default global value (DEFAULT_TIMEOUT)
> +                timeout_kwarg = kwargs.get('timeout')
> +                if isinstance(timeout_kwarg, int):
> +                    timeout = timeout_kwarg
> +                elif (timeout_positional_idx is not None
> +                      and len(args) > timeout_positional_idx
> +                      and isinstance(args[timeout_positional_idx], int)):
> +                    timeout = args[timeout_positional_idx]
>   
>                   # mypy: silence the following problem in signal.signal() call:
>                   # error: Argument 2 to "signal" has incompatible type "Callable[[Signals, FrameType], Any]";
> @@ -89,7 +116,8 @@ class VirtualMachine(MachineInterface):
>           self.dmesg_logger = self.__setup_dmesg_logger()
>   
>       def __str__(self) -> str:
> -        return f'VM{self.vmnum}-VF:{self.passed_vf_bdfs[0] if self.passed_vf_bdfs else 'N/A'}'
> +        vf_bdf = self.passed_vf_bdfs[0] if self.passed_vf_bdfs else 'N/A'
> +        return f'VM{self.vmnum}-VF:{vf_bdf}'
>   
>       def __del__(self) -> None:
>           if not self.is_running():
> @@ -250,7 +278,7 @@ class VirtualMachine(MachineInterface):
>   
>           # Look for a directory name with a PCI BDF (e.g. 0000:1a:00.0)
>           for bdf in dev_dir_ls:
> -            match = re.match(r'\d{4}(?::[0-9a-z-A-Z]{2}){2}.[0-7]', bdf)
> +            match = re.fullmatch(r'[0-9a-fA-F]{4}(?::[0-9a-fA-F]{2}){2}\.[0-7]', bdf)
>               if match:
>                   device = VirtualDevice(bdf, self)
>                   detected_devices.append(device)
> @@ -328,7 +356,7 @@ class VirtualMachine(MachineInterface):
>           return False
>   
>       @Decorators.timeout_signal
> -    def poweroff(self) -> None:
> +    def poweroff(self, timeout: int = 60) -> None:
>           """Power off VM via the Guest-Agent guest-shutdown(powerdown) command."""
>           logger.debug('Powering off VM%s', self.vmnum)
>           assert self.process
> @@ -343,7 +371,7 @@ class VirtualMachine(MachineInterface):
>               while event != 'SHUTDOWN':
>                   event = self.qm.get_qmp_event()
>           except exceptions.AlarmTimeoutError:
> -            logger.warning('VM%s hanged on poweroff. Initiating forced termination', self.vmnum)
> +            logger.warning('VM%s has not responded to power off request - force termination', self.vmnum)
>               self.process.terminate()
>           finally:
>               # Wait and make sure that qemu shutdown
