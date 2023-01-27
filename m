Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 27 Jan 2023 18:18:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
Message-ID: <20230127171800.booy57ammztuhy2l@kamilkon-desk1>
References: <20230127111241.3624629-1-tvrtko.ursulin@linux.intel.com>
 <20230127111241.3624629-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230127111241.3624629-2-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/6] intel_gpu_top: Fix man page
 formatting
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Tvrtko,

On 2023-01-27 at 11:12:36 +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> New lines are not respected when rst2man generates the page so try to work
> around that by followin advice from the Internet.
> 
> v2:
>  * Improve some wording.
>  * Tidy -o option description.
>  * Update dates.
>  * Convert the filter list to table.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com> # v1
--------------------------------------------------------------- ^^^^^
Remove this addition at end,
s/ # v1//

Man page looks much better so you can keep my r-b,
thank you for your effort,

Regards,
Kamil

> ---
>  man/intel_gpu_top.rst | 55 ++++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 30 deletions(-)
> 
> diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
> index 748c7740c800..4417bcff0d5b 100644
> --- a/man/intel_gpu_top.rst
> +++ b/man/intel_gpu_top.rst
> @@ -7,9 +7,9 @@ Display a top-like summary of Intel GPU usage
>  ---------------------------------------------
>  .. include:: defs.rst
>  :Author: IGT Developers <igt-dev@lists.freedesktop.org>
> -:Date: 2020-03-18
> +:Date: 2023-01-27
>  :Version: |PACKAGE_STRING|
> -:Copyright: 2009,2011,2012,2016,2018,2019,2020 Intel Corporation
> +:Copyright: 2009,2011,2012,2016,2018,2019,2020,2023 Intel Corporation
>  :Manual section: |MANUAL_SECTION|
>  :Manual group: |MANUAL_GROUP|
>  
> @@ -23,7 +23,7 @@ DESCRIPTION
>  
>  **intel_gpu_top** is a tool to display usage information on Intel GPU's.
>  
> -The tool gathers data using perf performance counters (PMU) exposed by i915 and other platform drivers like RAPL (power) and Uncore IMC (memory bandwidth).
> +The tool presents data collected from performance counters (PMU), exposed by i915 and other platform drivers like RAPL (power) and Uncore IMC (memory bandwidth).
>  
>  OPTIONS
>  =======
> @@ -37,49 +37,44 @@ OPTIONS
>  -l
>      List plain text data.
>  
> --o <file path | ->
> -    Output to the specified file instead of standard output.
> -    '-' can also be specified to explicitly select standard output.
> +-o <file>, or -o -
> +    Output to the specified file instead of standard output. '-' can also be specified to explicitly select standard output.
>  
>  -s <ms>
>      Refresh period in milliseconds.
> +
>  -L
> -    List available GPUs on the platform.
> +    List available GPUs on the system.
> +
>  -d
> -    Select a specific GPU using supported filter.
> +    Select a specific GPU using one of the supported filters.
>  
>  RUNTIME CONTROL
>  ===============
>  
>  Supported keys:
>  
> -    'q'    Exit from the tool.
> -    'h'    Show interactive help.
> -    '1'    Toggle between aggregated engine class and physical engine mode.
> -    'n'    Toggle display of numeric client busyness overlay.
> -    's'    Toggle between sort modes (runtime, total runtime, pid, client id).
> -    'i'    Toggle display of clients which used no GPU time.
> -    'H'    Toggle between per PID aggregation and individual clients.
> +|
> +|    'q'    Exit from the tool.
> +|    'h'    Show interactive help.
> +|    '1'    Toggle between aggregated by engine class and physical engine mode.
> +|    'n'    Toggle display of numeric client busyness overlay.
> +|    's'    Toggle between sort modes (runtime, total runtime, pid, client id).
> +|    'i'    Toggle display of clients which used no GPU time.
> +|    'H'    Toggle between per PID aggregation and individual clients.
>  
>  DEVICE SELECTION
>  ================
>  
> -User can select specific GPU for performance monitoring on platform where multiple GPUs are available.
> -A GPU can be selected by sysfs path, drm node or using various PCI sub filters.
> -
> -Filter types: ::
> -
> -    ---
> -    filter   syntax
> -    ---
> -    sys      sys:/sys/devices/pci0000:00/0000:00:02.0
> -             find device by its sysfs path
> -
> -    drm      drm:/dev/dri/* path
> -             find drm device by /dev/dri/* node
> +On systems where multiple GPUs are present it is possible to select a specific GPU to be monitored. A GPU can be selected by sysfs path, drm device node or using various PCI sub filters.
>  
> -    pci      pci:[vendor=%04x/name][,device=%04x][,card=%d]
> -             vendor is hex number or vendor name
> +==========  ====================================================== ======================
> +**Filter**  **Syntax**                                             **GPU selection criteria**
> +==========  ====================================================== ======================
> +sys          | ``sys:/sys/devices/pci0000:00/0000:00:02.0``        Select using the sysfs path.
> +drm          | ``drm:/dev/dri/<node>``                             Select using the /dev/dri/\* device node.
> +pci          | ``pci:[vendor=%04x/name][,device=%04x][,card=%d]``  Select using the PCI addrress. Vendor is hexadecinal number or vendor name.
> +==========  ====================================================== ======================
>  
>  JSON OUTPUT
>  ===========
> -- 
> 2.34.1
> 
