Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20200616123758.3331-1-ramadevi.gandi@intel.com>
References: <20200616123758.3331-1-ramadevi.gandi@intel.com>
Date: Mon, 22 Jun 2020 18:31:24 +0300
Message-ID: <87wo3znmlv.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH libdrm] intel: sync i915_pciids.h
 with kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: ramadevi.gandi@intel.com, ashutosh.dixit@intel.com, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, ramadevi.gandi@intel.com, igt-dev@lists.freedesktop.org
Cc: kalyan.kondapally@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 16 Jun 2020, ramadevi.gandi@intel.com wrote:
> From: Gandi Ramadevi <ramadevi.gandi@intel.com>
>
> Add DG1 PCI ID

There are no DG1 PCI IDs in kernel. So please don't add them here
either.

BR,
Jani.


>
> Signed-off-by: Gandi Ramadevi <ramadevi.gandi@intel.com>
> ---
>  intel/i915_pciids.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/intel/i915_pciids.h b/intel/i915_pciids.h
> index 662d8351..724e68a0 100644
> --- a/intel/i915_pciids.h
> +++ b/intel/i915_pciids.h
> @@ -605,4 +605,9 @@
>  	INTEL_VGA_DEVICE(0x9AD9, info), \
>  	INTEL_VGA_DEVICE(0x9AF8, info)
>  
> +/* DG1 */
> +#define INTEL_DG1_IDS(info) \
> +        INTEL_VGA_DEVICE(0x4905, info), \
> +        INTEL_VGA_DEVICE(0x4906, info)
> +
>  #endif /* _I915_PCIIDS_H */

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
