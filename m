Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE83410E4E1
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 14:00:25 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id z42so3187442ljq.13
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 06:00:25 -0800 (PST)
Date: Thu, 23 Feb 2023 16:00:22 +0200
From: Petri Latvala <adrinael@adrinael.net>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Y/dxdsDOoINMVH7P@adrinael.net>
References: <20230221114621.32785-1-zbigniew.kempczynski@intel.com>
 <20230221114621.32785-6-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230221114621.32785-6-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/7] intel-ci/xe-fast-feedback:
 Introduce xe-fast-feedback list
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

On Tue, Feb 21, 2023 at 12:46:19PM +0100, Zbigniew Kempczyński wrote:
> Let's start with something simple that runs very quickly and is
> currently passing reliably.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Philippe Lecluse <philippe.lecluse@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 140 +++++++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 tests/intel-ci/xe-fast-feedback.testlist

Don't you need to install the file?

-- 
Petri Latvala


> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> new file mode 100644
> index 00000000..74d0f033
> --- /dev/null
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -0,0 +1,140 @@
> +igt@xe/xe_compute@compute
> +igt@xe/xe_debugfs@base
> +igt@xe/xe_debugfs@gt0
> +igt@xe/xe_debugfs@gt1
> +igt@xe/xe_debugfs@forcewake
> +igt@xe/xe_dma_buf_sync@export-dma-buf-once
> +igt@xe/xe_dma_buf_sync@export-dma-buf-once-read-sync
> +igt@xe/xe_exec_balancer@twice-virtual-basic
> +igt@xe/xe_exec_balancer@no-exec-virtual-basic
> +igt@xe/xe_exec_balancer@twice-cm-virtual-basic
> +igt@xe/xe_exec_balancer@no-exec-cm-virtual-basic
> +igt@xe/xe_exec_balancer@twice-virtual-userptr
> +igt@xe/xe_exec_balancer@no-exec-virtual-userptr
> +igt@xe/xe_exec_balancer@twice-cm-virtual-userptr
> +igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr
> +igt@xe/xe_exec_balancer@twice-virtual-rebind
> +igt@xe/xe_exec_balancer@no-exec-virtual-rebind
> +igt@xe/xe_exec_balancer@twice-cm-virtual-rebind
> +igt@xe/xe_exec_balancer@no-exec-cm-virtual-rebind
> +igt@xe/xe_exec_balancer@twice-virtual-userptr-rebind
> +igt@xe/xe_exec_balancer@no-exec-virtual-userptr-rebind
> +igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-rebind
> +igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-rebind
> +igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate
> +igt@xe/xe_exec_balancer@no-exec-virtual-userptr-invalidate
> +igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate
> +igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate
> +igt@xe/xe_exec_balancer@twice-virtual-userptr-invalidate-race
> +igt@xe/xe_exec_balancer@no-exec-virtual-userptr-invalidate-race
> +igt@xe/xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race
> +igt@xe/xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race
> +igt@xe/xe_exec_balancer@twice-parallel-basic
> +igt@xe/xe_exec_balancer@no-exec-parallel-basic
> +igt@xe/xe_exec_balancer@twice-parallel-userptr
> +igt@xe/xe_exec_balancer@no-exec-parallel-userptr
> +igt@xe/xe_exec_balancer@twice-parallel-rebind
> +igt@xe/xe_exec_balancer@no-exec-parallel-rebind
> +igt@xe/xe_exec_balancer@twice-parallel-userptr-rebind
> +igt@xe/xe_exec_balancer@no-exec-parallel-userptr-rebind
> +igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate
> +igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate
> +igt@xe/xe_exec_balancer@twice-parallel-userptr-invalidate-race
> +igt@xe/xe_exec_balancer@no-exec-parallel-userptr-invalidate-race
> +igt@xe/xe_exec_basic@twice-basic
> +igt@xe/xe_exec_basic@no-exec-basic
> +igt@xe/xe_exec_basic@twice-basic-defer-mmap
> +igt@xe/xe_exec_basic@no-exec-basic-defer-mmap
> +igt@xe/xe_exec_basic@twice-basic-defer-bind
> +igt@xe/xe_exec_basic@no-exec-basic-defer-bind
> +igt@xe/xe_exec_basic@twice-userptr
> +igt@xe/xe_exec_basic@no-exec-userptr
> +igt@xe/xe_exec_basic@twice-rebind
> +igt@xe/xe_exec_basic@no-exec-rebind
> +igt@xe/xe_exec_basic@twice-userptr-rebind
> +igt@xe/xe_exec_basic@no-exec-userptr-rebind
> +igt@xe/xe_exec_basic@twice-userptr-invalidate
> +igt@xe/xe_exec_basic@no-exec-userptr-invalidate
> +igt@xe/xe_exec_basic@twice-userptr-invalidate-race
> +igt@xe/xe_exec_basic@no-exec-userptr-invalidate-race
> +igt@xe/xe_exec_basic@twice-bindengine
> +igt@xe/xe_exec_basic@no-exec-bindengine
> +igt@xe/xe_exec_basic@twice-bindengine-userptr
> +igt@xe/xe_exec_basic@no-exec-bindengine-userptr
> +igt@xe/xe_exec_basic@twice-bindengine-rebind
> +igt@xe/xe_exec_basic@no-exec-bindengine-rebind
> +igt@xe/xe_exec_basic@twice-bindengine-userptr-rebind
> +igt@xe/xe_exec_basic@no-exec-bindengine-userptr-rebind
> +igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate
> +igt@xe/xe_exec_basic@no-exec-bindengine-userptr-invalidate
> +igt@xe/xe_exec_basic@twice-bindengine-userptr-invalidate-race
> +igt@xe/xe_exec_basic@no-exec-bindengine-userptr-invalidate-race
> +igt@xe/xe_exec_compute_mode@twice-basic
> +igt@xe/xe_exec_compute_mode@twice-preempt-fence-early
> +igt@xe/xe_exec_compute_mode@twice-userptr
> +igt@xe/xe_exec_compute_mode@twice-rebind
> +igt@xe/xe_exec_compute_mode@twice-userptr-rebind
> +igt@xe/xe_exec_compute_mode@twice-userptr-invalidate
> +igt@xe/xe_exec_compute_mode@twice-userptr-invalidate-race
> +igt@xe/xe_exec_compute_mode@twice-bindengine
> +igt@xe/xe_exec_compute_mode@twice-bindengine-userptr
> +igt@xe/xe_exec_compute_mode@twice-bindengine-rebind
> +igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-rebind
> +igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate
> +igt@xe/xe_exec_compute_mode@twice-bindengine-userptr-invalidate-race
> +igt@xe/xe_exec_reset@close-fd-no-exec
> +igt@xe/xe_exec_reset@cm-close-fd-no-exec
> +igt@xe/xe_exec_reset@virtual-close-fd-no-exec
> +#igt@xe/xe_exec_threads@threads-basic
> +igt@xe/xe_exec_threads@threads-shared-vm-basic
> +igt@xe/xe_exec_threads@threads-fd-basic
> +#igt@xe/xe_exec_threads@threads-hang-basic
> +igt@xe/xe_exec_threads@threads-bal-basic
> +igt@xe/xe_exec_threads@threads-cm-basic
> +igt@xe/xe_exec_threads@threads-cm-fd-basic
> +igt@xe/xe_exec_threads@threads-mixed-basic
> +igt@xe/xe_exec_threads@threads-mixed-shared-vm-basic
> +igt@xe/xe_exec_threads@threads-mixed-fd-basic
> +igt@xe/xe_exec_threads@threads-bal-mixed-basic
> +igt@xe/xe_exec_threads@threads-bal-mixed-shared-vm-basic
> +igt@xe/xe_exec_threads@threads-bal-mixed-fd-basic
> +igt@xe/xe_guc_pc@freq_basic_api
> +igt@xe/xe_guc_pc@freq_fixed_idle
> +igt@xe/xe_guc_pc@freq_range_idle
> +igt@xe/xe_guc_pc@rc6_on_idle
> +igt@xe/xe_guc_pc@rc0_on_exec
> +igt@xe/xe_huc_copy@huc_copy
> +igt@xe/xe_mmap@system
> +igt@xe/xe_mmap@vram
> +igt@xe/xe_mmap@vram-system
> +igt@xe/xe_mmio@mmio-timestamp
> +igt@xe/xe_mmio@mmio-invalid
> +igt@xe/xe_prime_self_import@basic-with_one_bo
> +igt@xe/xe_prime_self_import@basic-with_fd_dup
> +igt@xe/xe_prime_self_import@export-vs-gem_close-race
> +igt@xe/xe_prime_self_import@reimport-vs-gem_close-race
> +#igt@xe/xe_prime_self_import@basic-llseek-size
> +igt@xe/xe_query@query-engines
> +igt@xe/xe_query@query-mem-usage
> +igt@xe/xe_query@query-gts
> +igt@xe/xe_query@query-config
> +igt@xe/xe_query@query-hwconfig
> +igt@xe/xe_query@query-topology
> +igt@xe/xe_query@query-invalid-query
> +igt@xe/xe_query@query-invalid-size
> +#igt@xe/xe_vm@bind-once
> +#igt@xe/xe_vm@scratch
> +igt@xe/xe_vm@shared-pte-page
> +igt@xe/xe_vm@shared-pde-page
> +igt@xe/xe_vm@shared-pde2-page
> +igt@xe/xe_vm@shared-pde3-page
> +igt@xe/xe_vm@bind-engines-independent
> +igt@xe/xe_vm@munmap-style-unbind-one-partial
> +igt@xe/xe_vm@munmap-style-unbind-end
> +igt@xe/xe_vm@munmap-style-unbind-front
> +igt@xe/xe_vm@munmap-style-unbind-userptr-one-partial
> +igt@xe/xe_vm@munmap-style-unbind-userptr-end
> +igt@xe/xe_vm@munmap-style-unbind-userptr-front
> +igt@xe/xe_vm@munmap-style-unbind-userptr-inval-end
> +igt@xe/xe_vm@munmap-style-unbind-userptr-inval-front
> +igt@xe/xe_waitfence@test
> -- 
> 2.34.1
> 
