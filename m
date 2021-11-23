Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4AE6F60C
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Nov 2021 12:36:18 +0000 (UTC)
Date: Tue, 23 Nov 2021 13:34:27 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211123123427.GA12436@zkempczy-mobl2>
References: <20211122064849.785894-1-apoorva1.singh@intel.com>
 <20211122064849.785894-2-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122064849.785894-2-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v2 1/3] lib/i915: Introduce libraries i915_blt and intel_mocs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 12:18:47PM +0530, apoorva1.singh@intel.com wrote:

<cut>

> +/*
> + * make_ctrl_surf_batch:
> + * @fd: open i915 drm file descriptor
> + * @batch_buf: the batch buffer to populate with the command
> + * @src: fd of the source BO
> + * @dst: fd of the destination BO
> + * @length: size of the ctrl surf in bytes
> + * @reloc: pointer to the relocation entyr for this command
> + * @src_mem_access: source memory type (denotes direct or indirect
> + *			addressing)
> + * @dst_mem_acdcess: destination memory type (denotes direct or indirect
> + *			addressing)
> + */
> +static int make_ctrl_surf_batch(int fd, uint32_t *batch_buf,
> +				uint32_t src, uint32_t dst, uint32_t length,
> +				struct drm_i915_gem_relocation_entry *reloc,
> +				int src_mem_access, int dst_mem_access)
> +{
> +	int num_ccs_blocks;
> +	uint32_t *b = batch_buf;
> +	uint8_t src_mocs = intel_get_uc_mocs(fd);
> +	uint8_t dst_mocs = src_mocs;
> +
> +	num_ccs_blocks = length / CCS_RATIO;
> +	if (num_ccs_blocks < 1)
> +		num_ccs_blocks = 1;
> +	if (num_ccs_blocks > NUM_CCS_BLKS_PER_XFER)
> +		return 0;
> +
> +	/*
> +	 * We use logical AND with 1023 since the size field
> +	 * takes values which is in the range of 0 - 1023
> +	 */
> +	b[0] = ((XY_CTRL_SURF_COPY_BLT) |

I've just realized myself this command is not available for gens where
relocations are enabled so all reloc stuff below can be removed.

--
Zbigniew

> +		(src_mem_access << SRC_ACCESS_TYPE_SHIFT) |
> +		(dst_mem_access << DST_ACCESS_TYPE_SHIFT) |
> +		(((num_ccs_blocks - 1) & 1023) << CCS_SIZE_SHIFT));
> +
 
