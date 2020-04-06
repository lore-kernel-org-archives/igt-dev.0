Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066B96E087
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2020 13:57:13 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Mon,  6 Apr 2020 16:57:09 +0300
Message-Id: <20200406135709.569315-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200406135709.569315-1-lionel.g.landwerlin@intel.com>
References: <20200406135709.569315-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 2/2] tests/perf: add tests for multi
 context filtering
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Iris is using 2 GEM contexts for 3D & compute.

v2: Check higher number of contexts

v3: Test unmapped memory pointers (Chris)

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/perf.c | 538 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 538 insertions(+)

diff --git a/tests/perf.c b/tests/perf.c
index b959f552..013fdf04 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -3351,6 +3351,42 @@ hsw_test_single_ctx_counters(void)
 	igt_waitchildren();
 }
 
+/* HSW hardware produces untagged reports and either listen to the
+ * entire system or a given context. As a result it cannot support
+ * multi context filtering.
+ */
+static void
+hsw_test_multi_ctx_counters(void)
+{
+	uint32_t context_ids[] = {
+		0,
+		0,
+		0,
+	};
+	uint64_t properties[] = {
+		/* Note: we have to specify at least one sample property even
+		 * though we aren't interested in samples in this case
+		 */
+		DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+		/* OA unit configuration */
+		DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+		DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+
+		/* Note: no OA exponent specified in this case */
+
+		DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY, to_user_pointer(&context_ids),
+		DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY_LENGTH, ARRAY_SIZE(context_ids),
+	};
+	struct drm_i915_perf_open_param param = {
+		.flags = I915_PERF_FLAG_FD_CLOEXEC,
+		.num_properties = sizeof(properties) / 16,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, ENODEV);
+}
+
 /* Tests the INTEL_performance_query use case where an unprivileged process
  * should be able to configure the OA unit for per-context metrics (for a
  * context associated with that process' drm file descriptor) and the counters
@@ -3797,6 +3833,348 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 	} while (WEXITSTATUS(child_ret) == EAGAIN);
 }
 
+/* Tests the INTEL_performance_query use case for Iris which uses 2
+ * GEM contexts for 3D & compute commands.
+ */
+static void
+gen8_test_multi_ctx_render_target_writes_a_counter(int n_filtered_context_handles)
+{
+	int child_ret;
+	struct igt_helper_process child = {};
+
+	igt_debug("Filtering with %d contexts\n", n_filtered_context_handles);
+
+	/* should be default, but just to be sure... */
+	write_u64_file("/proc/sys/dev/i915/perf_stream_paranoid", 1);
+
+	do {
+
+		igt_fork_helper(&child) {
+			int oa_exponent = max_oa_exponent_for_period_lte(1000000);
+			/*
+			 * Use twice the amount of GEM context to
+			 * generate some noise in the reports.
+			 */
+			uint32_t n_context_handles = 2 * n_filtered_context_handles;
+			uint32_t *filtered_context_handles;
+			uint64_t properties[] = {
+				/* Note: we have to specify at least one sample
+				 * property even though we aren't interested in
+				 * samples in this case
+				 */
+				DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+				/* OA unit configuration */
+				DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+				DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+				DRM_I915_PERF_PROP_OA_EXPONENT, oa_exponent,
+
+				/* Note: no OA exponent specified in this case */
+
+				DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY, 0,
+				DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY_LENGTH, n_filtered_context_handles,
+			};
+			struct drm_i915_perf_open_param param = {
+				.flags = I915_PERF_FLAG_FD_CLOEXEC,
+				.num_properties = ARRAY_SIZE(properties) / 2,
+				.properties_ptr = to_user_pointer(properties),
+			};
+			size_t format_size = get_oa_format(test_set->perf_oa_format).size;
+			size_t sample_size = (sizeof(struct drm_i915_perf_record_header) +
+					      format_size);
+			uint32_t max_reports = MAX_OA_BUF_SIZE / format_size;
+			uint32_t buf_size = sample_size * max_reports * 1.5;
+			drm_intel_bufmgr *bufmgr;
+			struct intel_batchbuffer *batch;
+			struct igt_buf src[3], dst[3];
+			drm_intel_bo *mi_rpc_bo;
+			int width = 800;
+			int height = 600;
+			int ret, last_context_idx = -1, matching_context_idx;
+			uint8_t *buf = malloc(buf_size);
+			ssize_t len;
+			struct drm_i915_perf_record_header *header;
+			struct {
+				drm_intel_context *context;
+				uint32_t hw_id;
+				uint32_t *report0_32;
+				uint32_t *report1_32;
+				uint64_t timestamp0_64, timestamp1_64;
+				struct accumulator accumulator;
+				bool accumulate_started;
+				bool accumulate_done;
+			} *ctxs;
+			uint32_t *prev_report32;
+			bool all_accumlate_valid;
+
+			bufmgr = drm_intel_bufmgr_gem_init(drm_fd, 4096);
+			drm_intel_bufmgr_gem_enable_reuse(bufmgr);
+
+			for (int i = 0; i < ARRAY_SIZE(src); i++) {
+				scratch_buf_init(bufmgr, &src[i], width, height, 0xff0000ff);
+				scratch_buf_init(bufmgr, &dst[i], width, height, 0x00ff00ff);
+			}
+
+			batch = intel_batchbuffer_alloc(bufmgr, devid);
+
+			filtered_context_handles = calloc(n_context_handles, sizeof(*filtered_context_handles));
+			igt_assert(filtered_context_handles);
+
+			properties[9] = to_user_pointer(filtered_context_handles);
+
+			ctxs = calloc(n_context_handles, sizeof(*ctxs));
+			igt_assert(ctxs);
+
+			for (int i = 0; i < n_context_handles; i++) {
+				ctxs[i].context = drm_intel_gem_context_create(bufmgr);
+				igt_assert(ctxs[i].context);
+
+				ret = drm_intel_gem_context_get_id(ctxs[i].context,
+								   &filtered_context_handles[i]);
+				igt_assert_eq(ret, 0);
+				igt_assert_neq(ctxs[i].hw_id, 0xffffffff);
+
+				memset(&ctxs[i].accumulator, 0, sizeof(ctxs[i].accumulator));
+				ctxs[i].accumulator.format = test_set->perf_oa_format;
+				ctxs[i].accumulate_started = false;
+				ctxs[i].accumulate_done = false;
+			}
+
+			scratch_buf_memset(src[0].bo, width, height, 0xff0000ff);
+			scratch_buf_memset(dst[0].bo, width, height, 0x00ff00ff);
+
+			igt_debug("opening i915-perf stream\n");
+			stream_fd = __perf_open(drm_fd, &param, false);
+
+			mi_rpc_bo = drm_intel_bo_alloc(bufmgr, "mi_rpc dest bo", 4096 * n_context_handles, 64);
+
+			ret = drm_intel_bo_map(mi_rpc_bo, true /* write enable */);
+			igt_assert_eq(ret, 0);
+
+			memset(mi_rpc_bo->virtual, 0x80, mi_rpc_bo->size);
+			drm_intel_bo_unmap(mi_rpc_bo);
+
+			/**/
+			for (int i = 0; i < n_context_handles; i++) {
+				uint32_t context_offset = i * 4096;
+
+				emit_stall_timestamp_and_rpc(batch,
+							     mi_rpc_bo,
+							     512 + context_offset /* timestamp offset */,
+							     context_offset, /* report dst offset */
+							     0xdeadbeef + i); /* report id */
+
+				/* Explicitly flush here (even though the render_copy() call
+				 * will itself flush before/after the copy) to clarify that
+				 * that the PIPE_CONTROL + MI_RPC commands will be in a
+				 * separate batch from the copy.
+				 */
+				intel_batchbuffer_flush_with_context(batch, ctxs[i].context);
+
+				render_copy(batch,
+					    ctxs[i].context,
+					    &src[0], 0, 0, width, height,
+					    &dst[0], 0, 0);
+
+				/* Another redundant flush to clarify batch bo is free to reuse */
+				intel_batchbuffer_flush_with_context(batch, ctxs[i].context);
+
+				emit_stall_timestamp_and_rpc(batch,
+							     mi_rpc_bo,
+							     520 + context_offset /* timestamp offset */,
+							     256 + context_offset, /* report dst offset */
+							     0xbeefbeef + i); /* report id */
+
+				intel_batchbuffer_flush_with_context(batch, ctxs[i].context);
+			}
+
+			ret = drm_intel_bo_map(mi_rpc_bo, false /* write enable */);
+			igt_assert_eq(ret, 0);
+
+			/* Collect the data written by MI_RPC commands. */
+			for (int i = 0; i < n_context_handles; i++) {
+				uint32_t context_offset = i * 4096;
+
+				ctxs[i].report0_32 = mi_rpc_bo->virtual + context_offset;
+				ctxs[i].report1_32 = mi_rpc_bo->virtual + context_offset + 256;
+				ctxs[i].hw_id = ctxs[i].report0_32[2];
+
+				igt_debug("context%i: rpt_id=0x%x/0x%x ts=0x%x/0x%x hw_id=0x%x/0x%x\n",
+					  i,
+					  ctxs[i].report0_32[0], ctxs[i].report1_32[0],
+					  ctxs[i].report0_32[1], ctxs[i].report1_32[1],
+					  ctxs[i].report0_32[2], ctxs[i].report1_32[2]);
+
+				/* We can only guarantee the report
+				 * IDs to match on pinned contexts.
+				 */
+				if (i < n_filtered_context_handles)
+					igt_assert_eq(ctxs[i].report0_32[2], ctxs[i].report1_32[2]);
+
+				igt_assert_eq(ctxs[i].report0_32[0], 0xdeadbeef + i); /* report ID */
+				igt_assert_eq(ctxs[i].report1_32[0], 0xbeefbeef + i); /* report ID */
+
+				ctxs[i].timestamp0_64 = *(uint64_t *)(mi_rpc_bo->virtual + context_offset + 512);
+				ctxs[i].timestamp1_64 = *(uint64_t *)(mi_rpc_bo->virtual + context_offset + 520);
+			}
+
+			if (ctxs[n_context_handles - 1].report1_32[1] < ctxs[0].report0_32[1]) {
+				igt_debug("32bit timestamp rollover, trying again\n");
+				exit(EAGAIN);
+			}
+
+			/* Read the entire OA buffer from first to last MI_RPC timestamp. */
+			len = i915_read_reports_until_timestamp(test_set->perf_oa_format,
+								buf, buf_size,
+								ctxs[0].report0_32[1],
+								ctxs[n_context_handles - 1].report1_32[1]);
+
+			igt_assert(len > 0);
+			igt_debug("read %d bytes\n", (int)len);
+
+			/* Go through the OA buffer reports and assign data to
+			 * each context.
+			 */
+			for (size_t offset = 0; offset < len; offset += header->size) {
+				uint32_t *report32;
+
+				header = (void *)(buf + offset);
+
+				igt_assert_eq(header->pad, 0); /* Reserved */
+
+				/* Currently the only test that should ever expect to
+				 * see a _BUFFER_LOST error is the buffer_fill test,
+				 * otherwise something bad has probably happened...
+				 */
+				igt_assert_neq(header->type, DRM_I915_PERF_RECORD_OA_BUFFER_LOST);
+
+				/* Loosing a timer report should not be an
+				 * issue. We should have all the details we need
+				 * just out of context switch reports.
+				 */
+				if (header->type == DRM_I915_PERF_RECORD_OA_REPORT_LOST)
+					continue;
+
+				/* Given how we've configured the i915-perf
+				 * stream, we should be left with only this type
+				 * of reports of the expected size.
+				 */
+				igt_assert_eq(header->type, DRM_I915_PERF_RECORD_SAMPLE);
+				igt_assert_eq(header->size, sample_size);
+
+				report32 = (void *)(header + 1);
+
+
+				matching_context_idx = -1;
+				for (int i = 0; i < n_filtered_context_handles; i++) {
+					if (ctxs[i].report0_32[1] < report32[1] &&
+					    ctxs[i].report1_32[1] > report32[1]) {
+						matching_context_idx = i;
+						break;
+					}
+				}
+
+				igt_debug("report hw_id=0x%08x(valid=%i) ts=0x%08x reason=%s matching_ctx=%i\n",
+					  report32[2], oa_report_ctx_is_valid(report32), report32[1],
+					  gen8_read_report_reason(report32), matching_context_idx);
+
+				/* Go through each context and try to attribute
+				 * the delta between this report and the
+				 * previous one to a particular context.
+				 */
+				if (last_context_idx != -1) {
+					uint32_t *acc_prev_report32 = prev_report32;
+					uint32_t *acc_report32 = report32;
+
+					/* Before this context's time, skip. */
+					if (ctxs[last_context_idx].report0_32[1] < acc_report32[1]) {
+
+						if (!ctxs[last_context_idx].accumulate_started)
+							acc_prev_report32 = ctxs[last_context_idx].report0_32;
+
+						if (ctxs[last_context_idx].report1_32[1] < acc_report32[1]) {
+							if (!ctxs[last_context_idx].accumulate_done) {
+								acc_report32 = ctxs[last_context_idx].report1_32;
+								ctxs[last_context_idx].accumulate_done = true;
+							} else {
+								acc_report32 = NULL;
+							}
+						}
+
+						if (acc_report32) {
+							igt_debug("   attributed to context=%i (last accumulation: %i)\n",
+								  last_context_idx,
+								  acc_report32 == ctxs[last_context_idx].report1_32);
+							accumulate_reports(&ctxs[last_context_idx].accumulator,
+									   acc_prev_report32, acc_report32);
+							ctxs[last_context_idx].accumulate_started = true;
+						}
+					}
+				}
+
+				if (oa_report_ctx_is_valid(report32)) {
+					int next_context_idx = -1;
+
+					for (int i = 0; i < n_filtered_context_handles; i++) {
+						if (ctxs[i].hw_id == report32[2]) {
+							next_context_idx = i;
+							break;
+						}
+					}
+					igt_debug("   update last_context_idx=%i->%i\n",
+						  last_context_idx, next_context_idx);
+					/* We shouldn't find any context ID that
+					 * matches one of the context we didn't
+					 * pass to i915-perf.
+					 */
+					igt_assert(next_context_idx < n_filtered_context_handles);
+					last_context_idx = next_context_idx;
+				}
+
+				prev_report32 = report32;
+			}
+
+			all_accumlate_valid = true;
+			for (int i = 0; i < n_context_handles; i++) {
+				igt_debug("context%i written pixel=%lu\n",
+					  i, ctxs[i].accumulator.deltas[2 + 26]);
+
+				if (i < n_filtered_context_handles) {
+					if (ctxs[i].accumulator.deltas[2 + 26] != width * height)
+						all_accumlate_valid = false;
+				} else {
+					if (ctxs[i].accumulator.deltas[2 + 26] != 0)
+						all_accumlate_valid = false;
+				}
+			}
+			igt_assert(all_accumlate_valid);
+
+
+			drm_intel_bo_unmap(src[0].bo);
+			drm_intel_bo_unmap(dst[0].bo);
+
+			for (int i = 0; i < ARRAY_SIZE(src); i++) {
+				drm_intel_bo_unreference(src[i].bo);
+				drm_intel_bo_unreference(dst[i].bo);
+			}
+
+			drm_intel_bo_unmap(mi_rpc_bo);
+			drm_intel_bo_unreference(mi_rpc_bo);
+			intel_batchbuffer_free(batch);
+			for (int i = 0; i < n_context_handles; i++)
+				drm_intel_gem_context_destroy(ctxs[i].context);
+			drm_intel_bufmgr_destroy(bufmgr);
+			__perf_close(stream_fd);
+		}
+
+		child_ret = igt_wait_helper(&child);
+
+		igt_assert(WEXITSTATUS(child_ret) == EAGAIN ||
+			   WEXITSTATUS(child_ret) == 0);
+
+	} while (WEXITSTATUS(child_ret) == EAGAIN);
+}
+
 static void gen12_single_ctx_helper(void)
 {
 	uint64_t properties[] = {
@@ -4204,6 +4582,137 @@ test_stress_open_close(void)
 	load_helper_fini();
 }
 
+static void
+gen8_test_invalid_multi_ctx_params(void)
+{
+	/* Invalid context handle */
+	{
+		uint32_t context_ids[] = {
+			0xffffffff,
+			0,
+			0xdeadbeef,
+		};
+		uint64_t properties[] = {
+			/* Note: we have to specify at least one sample property even
+			 * though we aren't interested in samples in this case
+			 */
+			DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+			/* OA unit configuration */
+			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+
+			/* Note: no OA exponent specified in this case */
+
+			DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY, to_user_pointer(&context_ids),
+			DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY_LENGTH, ARRAY_SIZE(context_ids),
+		};
+		struct drm_i915_perf_open_param param = {
+			.flags = I915_PERF_FLAG_FD_CLOEXEC,
+			.num_properties = sizeof(properties) / 16,
+			.properties_ptr = to_user_pointer(properties),
+		};
+
+		do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, ENOENT);
+	}
+
+	/* Both DRM_I915_PERF_PROP_CTX_HANDLE &
+	 * DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY are invalid.
+	 */
+	{
+		uint32_t context_ids[] = {
+			0,
+			0,
+		};
+		uint64_t properties[] = {
+			DRM_I915_PERF_PROP_CTX_HANDLE, 0,
+
+			/* Note: we have to specify at least one sample property even
+			 * though we aren't interested in samples in this case
+			 */
+			DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+			/* OA unit configuration */
+			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+
+			/* Note: no OA exponent specified in this case */
+
+			DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY, to_user_pointer(&context_ids),
+			DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY_LENGTH, ARRAY_SIZE(context_ids),
+		};
+		struct drm_i915_perf_open_param param = {
+			.flags = I915_PERF_FLAG_FD_CLOEXEC,
+			.num_properties = sizeof(properties) / 16,
+			.properties_ptr = to_user_pointer(properties),
+		};
+
+		do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EINVAL);
+	}
+
+	/* Missing DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY. */
+	{
+		uint32_t context_ids[] = {
+			0,
+			0,
+		};
+		uint64_t properties[] = {
+			/* Note: we have to specify at least one sample property even
+			 * though we aren't interested in samples in this case
+			 */
+			DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+			/* OA unit configuration */
+			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+
+			/* Note: no OA exponent specified in this case */
+
+			DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY_LENGTH, ARRAY_SIZE(context_ids),
+		};
+		struct drm_i915_perf_open_param param = {
+			.flags = I915_PERF_FLAG_FD_CLOEXEC,
+			.num_properties = sizeof(properties) / 16,
+			.properties_ptr = to_user_pointer(properties),
+		};
+
+		do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EFAULT);
+	}
+
+	/* Unmapped DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY. */
+	{
+		uint32_t *context_ids =
+			mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+		uint64_t properties[] = {
+			/* Note: we have to specify at least one sample property even
+			 * though we aren't interested in samples in this case
+			 */
+			DRM_I915_PERF_PROP_SAMPLE_OA, true,
+
+			/* OA unit configuration */
+			DRM_I915_PERF_PROP_OA_METRICS_SET, test_set->perf_oa_metrics_set,
+			DRM_I915_PERF_PROP_OA_FORMAT, test_set->perf_oa_format,
+
+			/* Note: no OA exponent specified in this case */
+
+			DRM_I915_PERF_PROP_CTX_HANDLE_ARRAY_LENGTH, 1,
+		};
+		struct drm_i915_perf_open_param param = {
+			.flags = I915_PERF_FLAG_FD_CLOEXEC,
+			.num_properties = sizeof(properties) / 16,
+			.properties_ptr = to_user_pointer(properties),
+		};
+
+		igt_assert(context_ids != MAP_FAILED);
+
+		context_ids[0] = 0;
+
+		munmap(context_ids, 4096);
+
+		do_ioctl_err(drm_fd, DRM_IOCTL_I915_PERF_OPEN, &param, EFAULT);
+	}
+}
+
 static uint64_t mask_minus_one(uint64_t mask)
 {
 	unsigned int i;
@@ -5062,6 +5571,35 @@ igt_main
 			test_global_sseu_config();
 	}
 
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(i915_perf_revision(drm_fd) >= 6);
+		}
+
+		igt_describe("Verify that multi context filtering does not work on HSW");
+		igt_subtest("unprivileged-multi-ctx-counters") {
+			igt_require(IS_HASWELL(devid));
+			hsw_test_multi_ctx_counters();
+		}
+
+		igt_describe("Verify invalid multi context parameters are rejected");
+		igt_subtest("invalid-multi-ctx-params") {
+			igt_require(intel_gen(devid) >= 8);
+			gen8_test_invalid_multi_ctx_params();
+		}
+
+		igt_describe("Measure performance for a set of contexts");
+		igt_subtest("gen8-unprivileged-multi-ctx-counters") {
+			uint32_t n_contexts[] = {
+				1, 2, 4, 7, 13, 30,
+			};
+			igt_require(intel_gen(devid) >= 8);
+
+			for (int i = 0; i < ARRAY_SIZE(n_contexts); i++)
+				gen8_test_multi_ctx_render_target_writes_a_counter(n_contexts[i]);
+		}
+	}
+
 	igt_subtest("invalid-create-userspace-config")
 		test_invalid_create_userspace_config();
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
