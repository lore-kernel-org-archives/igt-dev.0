Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 30 Aug 2023 17:07:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZO+virfAA5GrPPHE@intel.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829141107.1505705-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH igt 0/4] Add LNL support to xe tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 07:11:03AM -0700, Lucas De Marchi wrote:
> Add Lunar Lake support so xe driver can be tested. This brings the new
> xe_pciids.h from kernel since now the PCI IDs is not going to be added
> on the i915 side.


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
 for the series

> 
> Janga Rahul Kumar (1):
>   tests/xe_debugfs: skip page table level check for Xe2
> 
> Lucas De Marchi (2):
>   lib: Add xe_pciids.h
>   lib/intel_chipset: Add Lunar Lake support
> 
> Zbigniew Kempczyński (1):
>   lib/intel_device_info: Add blitter cmd info for Lunar Lake
> 
>  docs/reference/igt-gpu-tools/meson.build |   1 +
>  lib/intel_chipset.h                      |   5 +
>  lib/intel_device_info.c                  |  14 ++
>  lib/xe_pciids.h                          | 215 +++++++++++++++++++++++
>  tests/xe/xe_debugfs.c                    |  23 +--
>  5 files changed, 248 insertions(+), 10 deletions(-)
>  create mode 100644 lib/xe_pciids.h
> 
> -- 
> 2.40.1
> 
