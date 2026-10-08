Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7873CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 13:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EA210E840;
	Thu,  8 Oct 2026 13:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqWBeKyt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D1310E832
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791464403; x=1823000403;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yvPTRSwpwNR0C7+5FHGJw2W7ZGK7qM19RhVKpVr799o=;
 b=VqWBeKytxTZDdJmjoUB8LNGOb/iczs8QMdrj3EeBk/7za0c/MTYKNG9n
 OMie/p5vnhbKSh7/cMdTB87+Xp41qoqak8FXFI/H0vkvhrm3P2XYcDDgd
 BFZUcGNvk2YfVnAJmpHtLdMcYPP9yQJngOajCQKTelitscMyyNJlWZaw0
 6wVoAiSycjUUsxIJf3YkHWvPmJ2Mq6WHgYvI+GFR64GPxJzpl1QOVw1YR
 oekmhvu0n1Q/J6koyg+8QJ33wcvEfBSUrYpd/Vta2wbBUR/wD03DdCZZO
 ufZQ+UVne3cB5KJPi2nSJ7U8tly6FCnx5MPIk8bvTWLi5tcEBxEBVtfRu w==;
X-CSE-ConnectionGUID: ZkaoFEI0Tfqkp0lRy5k2jQ==
X-CSE-MsgGUID: t1BI7efWR1OqOaqtWDnLtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="253828"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="253828"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:00:02 -0700
X-CSE-ConnectionGUID: prq/+HfOSV+y8tE6RIakQw==
X-CSE-MsgGUID: vO9iOQsHQg6AYAB4xod3nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="40345"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.3])
 ([172.28.182.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:00:01 -0700
Message-ID: <c48614db-7dfc-45a7-9fa8-c440ae21e3ee@linux.intel.com>
Date: Thu, 8 Oct 2026 14:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 7/7] tools/vmtb: Extend IGT and WSIM executors
To: Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <20260928072600.426902-1-adam.miszczak@linux.intel.com>
 <20260928072600.426902-8-adam.miszczak@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260928072600.426902-8-adam.miszczak@linux.intel.com>
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

On 9/28/2026 9:26 AM, Adam Miszczak wrote:
> Introduce an optional 'env_vars' param (list) on IgtExecutor
> that injects 'igt_runner --environment KEY=VALUE' options,
> allowing environment variables to be passed to IGT test processes.
>
> Cache GemWsim ProcessResult (like IgtExecutor) so status()/wait()
> results are reused instead of re-fetched.
> Add a common clear_results() to both: GemWsim and IgtExecutor.
>
> Additionally, align test_migration with executors' changes:
> - use common IGT/WSIM clear_results() instead of instance checks.
> - call check_results() before failing so the IGT or WSIM
>    error output is logged on unexpected workload exit.
>
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
> ---
>   tools/vmtb/bench/executors/gem_wsim.py | 38 +++++++++++++++++++++-----
>   tools/vmtb/bench/executors/igt.py      | 10 ++++++-
>   tools/vmtb/vmm_flows/test_migration.py | 22 +++++++++------
>   3 files changed, 54 insertions(+), 16 deletions(-)
>
> diff --git a/tools/vmtb/bench/executors/gem_wsim.py b/tools/vmtb/bench/executors/gem_wsim.py
> index 0cdfcc7e4..0510a9f9a 100644
> --- a/tools/vmtb/bench/executors/gem_wsim.py
> +++ b/tools/vmtb/bench/executors/gem_wsim.py
> @@ -8,7 +8,7 @@ from pathlib import Path
>   
>   from bench import exceptions
>   from bench.executors.shell import ShellExecutor
> -from bench.machines.machine_interface import DEFAULT_TIMEOUT, MachineInterface
> +from bench.machines.machine_interface import (DEFAULT_TIMEOUT, MachineInterface, ProcessResult)
>   
>   logger = logging.getLogger('GemWsim')
>   
> @@ -44,26 +44,45 @@ class GemWsim(ShellExecutor):
>   
>           wsim_path = Path(target.get_igt_config().test_dir) / 'benchmarks' / 'gem_wsim'
>           command = f'{wsim_path} -w {workload} -c {num_clients} -r {num_repeats}'
> +        self.proc_result = ProcessResult()
>   
>           super().__init__(target, command, timeout)
>   
>       def __str__(self) -> str:
>           return f'gem_wsim({self.machine_id}:{self.pid})'
>   
> +    # ShellExecutor overrides
> +    def status(self) -> ProcessResult:
> +        if self.proc_result.exited:
> +            return self.proc_result
> +
> +        self.proc_result = super().status()
> +        return self.proc_result
> +
> +    def wait(self) -> ProcessResult:
> +        if self.proc_result.exited:
> +            return self.proc_result
> +
> +        self.proc_result = super().wait()
> +        return self.proc_result
> +
> +    # IGT/WSIM specific methods
>       def is_running(self) -> bool:
>           return not self.status().exited
>   
>       def wait_results(self) -> GemWsimResult:
> -        proc_result = self.wait()
> -        if proc_result.exit_code == 0:
> -            logger.info('%s: %s', self, proc_result.stdout)
> +        if not self.proc_result.exited:
> +            self.proc_result = self.wait()
> +
> +        if self.proc_result.exit_code == 0:
> +            logger.info('%s: %s', self, self.proc_result.stdout)
>               # Try parse output ex.: 19.449s elapsed (102.836 workloads/s)
>               pattern = r'(?P<elapsed>\d+(\.\d*)?|\.\d+)s elapsed \((?P<wps>\d+(\.\d*)?|\.\d+) workloads/s\)'
> -            match = re.search(pattern, proc_result.stdout, re.MULTILINE)
> +            match = re.search(pattern, self.proc_result.stdout, re.MULTILINE)
>               if match:
>                   return GemWsimResult(float(match.group('elapsed')), float(match.group('wps')))
> -        raise exceptions.GemWsimError(f'{self}: exit_code: {proc_result.exit_code}'
> -                                      f' stdout: {proc_result.stdout} stderr: {proc_result.stderr}')
> +        raise exceptions.GemWsimError(f'{self}: exit_code: {self.proc_result.exit_code}'
> +                                      f' stdout: {self.proc_result.stdout} stderr: {self.proc_result.stderr}')
>   
>       def check_results(self) -> bool:
>           """Verify gem_wsim execution results. Return True for workload success, False on fail."""
> @@ -78,6 +97,11 @@ class GemWsim(ShellExecutor):
>                         self.target, wl_results.elapsed_sec, wl_results.workloads_per_sec)
>           return True
>   
> +    def clear_results(self) -> None:
> +        """Clear gem_wsim results cache."""
> +        self.proc_result = ProcessResult()
> +        self.machine_id = str(self.target)
> +
>   
>   def gem_wsim_parallel_exec_and_check(vms: typing.List[MachineInterface], workload: str, iterations: int,
>                                        expected: typing.Optional[GemWsimResult] = None) -> GemWsimResult:
> diff --git a/tools/vmtb/bench/executors/igt.py b/tools/vmtb/bench/executors/igt.py
> index f443fb99e..f4587c1fb 100644
> --- a/tools/vmtb/bench/executors/igt.py
> +++ b/tools/vmtb/bench/executors/igt.py
> @@ -119,6 +119,7 @@ class IgtExecutor(ExecutorInterface):
>       def __init__(self, target: MachineInterface,
>                    test: typing.Union[str, IgtType],
>                    num_repeats: int = 1,
> +                 env_vars: typing.Optional[typing.List[str]] = None,
>                    timeout: int = DEFAULT_TIMEOUT) -> None:
>           self.igt_config = target.get_igt_config()
>   
> @@ -126,7 +127,9 @@ class IgtExecutor(ExecutorInterface):
>           #ld_library_path = f'LD_LIBRARY_PATH={igt_config.lib_dir}'
>           runner = posixpath.join(self.igt_config.tool_dir, 'igt_runner')
>           testlist = '/tmp/igt_executor.testlist'
> -        command = f'{runner} {self.igt_config.options} ' \
> +        # Set test environment variables via igt_runner: --environment KEY=VALUE (or KEY)
> +        env_options = ''.join(f'--environment {env} ' for env in env_vars) if env_vars else ''
> +        command = f'{runner} {self.igt_config.options} {env_options}' \
>                     f'--test-list {testlist} {self.igt_config.test_dir} {self.igt_config.result_dir}'
>           self.results: typing.Dict[str, typing.Any] = {}
>           self.target: MachineInterface = target
> @@ -176,6 +179,11 @@ class IgtExecutor(ExecutorInterface):
>           logger.error("[%s] IGT failed: %s", self.target, self.proc_result)
>           return False
>   
> +    def clear_results(self) -> None:
> +        """Clear IGT results cache."""
> +        self.proc_result = ProcessResult()
> +        self.results.clear()
> +
>       def get_results_log(self) -> typing.Dict:
>           # Results are cached
>           if self.results:
> diff --git a/tools/vmtb/vmm_flows/test_migration.py b/tools/vmtb/vmm_flows/test_migration.py
> index 8a3f10d52..c13350fd2 100644
> --- a/tools/vmtb/vmm_flows/test_migration.py
> +++ b/tools/vmtb/vmm_flows/test_migration.py
> @@ -233,7 +233,9 @@ class BaseTestBusyMigration:
>           logger.debug("Execute migration in-flight workload on source VM")
>           migration_wl = run_source_workload
>           time.sleep(IGT_INIT_DELAY)
> -        assert migration_wl.is_running(), 'IGT/wsim migration workload is not running on source VM'
> +        if not migration_wl.is_running():
> +            migration_wl.check_results()
> +            assert False, 'IGT/wsim migration workload is not running on source VM'
>   
>           # Pause VM and save snapshot
>           logger.debug("Pause execution and save source VM state")
> @@ -267,10 +269,7 @@ class BaseTestBusyMigration:
>   
>           # Patch the source IgtExecutor/GemWsim instance with the current VM
>           migration_wl.target = vm_dst
> -        if isinstance(migration_wl, IgtExecutor):
> -            # Clear IGT test results cache - remove post-save source VM results
> -            # TODO: implement common IgtExecutor/GemWsim results clear interface to avoid instance type check
> -            migration_wl.results.clear()
> +        migration_wl.clear_results()
>   
>           # Load the source state snapshot
>           logger.debug("Restore source state on the destination VM")
> @@ -281,7 +280,10 @@ class BaseTestBusyMigration:
>           sync_value = random.randint(1, 0xFFFF)
>           assert vm_dst.ga.sync(sync_value)['return'] == sync_value
>   
> -        assert migration_wl.is_running(), 'IGT/wsim migration workload is not running on destination VM'
> +        if not migration_wl.is_running():
> +            migration_wl.check_results()
> +            assert False, 'IGT/wsim migration workload is not running on destination VM'
> +
>           time.sleep(IGT_RESTORE_DELAY)
>   
>           assert migration_wl.check_results(), 'VF migration workload failed on destination VM (post-restore)'
> @@ -824,7 +826,9 @@ class BaseTestDoubleMigration:
>           logger.debug("Execute throughout-migration workload on source VM")
>           migration_wl: GemWsim = run_source_workload
>           time.sleep(IGT_INIT_DELAY)
> -        assert migration_wl.is_running(), 'IGT/wsim migration workload is not running on source VM'
> +        if not migration_wl.is_running():
> +            migration_wl.check_results()
> +            assert False, 'IGT/wsim migration workload is not running on source VM'
>   
>           # Pause source VM and save snapshot
>           logger.debug("Pause execution and save source VM state (snapshot #1)")
> @@ -1113,7 +1117,9 @@ def test_2vm_pause_resume(create_1host_2vm):
>   
>       # Allow wsim WL to run some time
>       time.sleep(IGT_INIT_DELAY)
> -    assert gem_wsim_vm0.is_running()
> +    if not gem_wsim_vm0.is_running():
> +        gem_wsim_vm0.check_results()
> +        assert False, 'IGT/wsim workload is not running on VM0'
>   
>       logger.debug("Submit IGT WL (gem_spin_batch) on VM1")
>       igt_vm1 = IgtExecutor(vm1, IgtType.SPIN_BATCH)
