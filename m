Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0EA6E997
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Nov 2021 13:23:33 +0000 (UTC)
Date: Tue, 23 Nov 2021 14:23:25 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211123132325.GB12436@zkempczy-mobl2>
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

> +int xy_ctrl_surf_copy_blt(int fd, uint32_t cmd,
> +			  uint32_t *batch_buf,
> +			  uint32_t src, uint32_t dst,
> +			  uint32_t length, bool writetodev,
> +			  struct intel_execution_engine2 *e)

If we pass engine likely it won't be in default context, so it necessary
to pass ctx here.

What I don't like here is to pass cmd and batch_buf here. If you want to
reuse cmd in the caller you need to synchronize on this handle so you
won't achieve pipelining.

> +{
> +	struct drm_i915_gem_relocation_entry reloc[4];
> +	struct drm_i915_gem_exec_object2 exec[3];
> +	struct drm_i915_gem_execbuffer2 execbuf;
> +	int len, src_mem_access, dst_mem_access;
> +	uint64_t ahnd = get_reloc_ahnd(fd, 0);

This is a little bit tricky, if caller will create different allocator on 
same context we would get assert. Better way is to pass ahnd from the caller
and do get_offset/put_offset using strategy it choose.

> +
> +	if (writetodev) {
> +		src_mem_access = DIRECT_ACCESS;
> +		dst_mem_access = INDIRECT_ACCESS;
> +	} else {
> +		src_mem_access = INDIRECT_ACCESS;
> +		dst_mem_access = DIRECT_ACCESS;
> +	}
> +
> +	/* construct batch command buffer */
> +	memset(reloc, 0, sizeof(reloc));
> +	memset(batch_buf, 0, BATCH_SIZE);

So we assume batch_buf at least is BATCH_SIZE length, it will be bigger
we will survive, if smaller heap corruption will occur. I can only guess
cmd is created outside to allow creating it in any memory region.

> +	len = make_ctrl_surf_batch(fd, batch_buf,
> +				   src, dst, length, reloc,
> +				   src_mem_access, dst_mem_access);
> +	igt_assert(len > 0);
> +
> +	/* Copy the batch buff to BO cmd */
> +	gem_write(fd, cmd, 0, batch_buf, len);
> +
> +	/* Execute the batch buffer */
> +	memset(exec, 0, sizeof(exec));
> +	exec[0].handle = src;
> +	exec[1].handle = dst;
> +	exec[2].handle = cmd;
> +	exec[2].relocation_count = !ahnd ? 4 : 0;
> +	exec[2].relocs_ptr = to_user_pointer(reloc);
> +	if (ahnd) {
> +		exec[0].offset = get_offset(ahnd, exec[0].handle, length * CCS_RATIO, 0);
> +		exec[0].flags |= EXEC_OBJECT_PINNED;
> +		exec[1].offset = get_offset(ahnd, exec[1].handle, length * CCS_RATIO, 0);
> +		exec[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
> +		exec[2].offset = get_offset(ahnd, exec[2].handle, BATCH_SIZE, 0);
> +		exec[2].flags |= EXEC_OBJECT_PINNED;
> +	}
> +
> +	memset(&execbuf, 0, sizeof(execbuf));
> +	execbuf.buffers_ptr = to_user_pointer(exec);
> +	execbuf.buffer_count = 3;
> +	execbuf.batch_len = len;
> +	execbuf.flags = I915_EXEC_BLT;
> +	if (e)
> +		execbuf.flags = e->flags;
> +
> +	gem_execbuf(fd, &execbuf);
> +	gem_sync(fd, cmd);
> +
> +	return 0;
> +}

I'm sorry for couple of email regarding same code, but I catched wider
context in third patch (gem_ccs test).

--
Zbigniew 
