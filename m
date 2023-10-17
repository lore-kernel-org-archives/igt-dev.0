Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E72210E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 08:49:17 +0000 (UTC)
Date: Tue, 17 Oct 2023 10:49:13 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <20231017084913.bgijm5qkxzbw2fmx@zkempczy-mobl2>
References: <20231016180716.8513-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016180716.8513-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] Add copy basic test to exercise blt
 commands
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

On Mon, Oct 16, 2023 at 11:37:13PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Add copy basic test which exercies mem-se and mem-copy commands, this
> patch series involves in following changes:
> 
> 1. Add copy basic test to exercise blt commands.
> 2. Add wrappers for batch preparation and submit exec.
> 3. Add copy commands MEM_SET_CMD and MEM_COPY_CMD in the lib.

May you check your patches with checkpatch? I see there's mixing
of spaces and tabs indentation as well as function arguments are
not aligned properly.

--
Zbigniew

> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Sai Gowtham Ch (3):
>   lib/intel_blt: Add wrappers to prepare batch buffers and submit exec
>   lib/intel_cmds_info: Add M_MATRIX in mem_copy as it is supported for
>     PVC
>   intel/xe_copy_basic: Add copy basic test to exercise blt commands
> 
>  lib/intel_blt.c             | 200 ++++++++++++++++++++++++++++++++++++
>  lib/intel_blt.h             |  39 +++++++
>  lib/intel_cmds_info.c       |   3 +-
>  lib/intel_reg.h             |   4 +
>  tests/intel/xe_copy_basic.c | 192 ++++++++++++++++++++++++++++++++++
>  tests/meson.build           |   1 +
>  6 files changed, 438 insertions(+), 1 deletion(-)
>  create mode 100644 tests/intel/xe_copy_basic.c
> 
> -- 
> 2.39.1
> 
