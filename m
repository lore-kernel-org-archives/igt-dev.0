Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371C8606A322
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hf6o1X59
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAFA882D0;
	Wed, 28 Oct 2026 08:32:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FD010E5A4
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793176274; x=1824712274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1mDkUsnTGOnEQGw+wWJi514UbnzRBTkEhA5UhI8eY2s=;
 b=Hf6o1X59jnCfS7WPfhKYuOcPcrjTvyvh2chq7s6hnEY2CQyyr4wjz0B1
 hYVdUXGN6OB6QaiB7belGh4rEUzGzEGQGfpEQ9dF+22uQ3HJiue+08xcB
 EObZnoK8hjekhR3UGuewuu/Lf6iI1N54hvlD3UJTaP+M3RrPWmXm/AmZ5
 g4j1aeI0HKeaHebHfmU23Oap+3YtobqiEjFrOYOntPQwlBEQ249v9vxCC
 q3ReX8AdbnhfezMkES2JxQS/5TOEw+PXaj+MFahBTeGaNEhykkLnFb5A/
 0yj6Tv+x0aoFsMulvjxRe0SWZa/AWeOlAVFwb3qcKh33np9tRBuTwje2S A==;
X-CSE-ConnectionGUID: QUZxnvaBR9qnC2GMYa3aSw==
X-CSE-MsgGUID: Ged6cJKQRFuy31LkKmFWGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1773080"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1773080"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 01:31:13 -0700
X-CSE-ConnectionGUID: Be16IQ3qTFqdf/qZULzvQA==
X-CSE-MsgGUID: tWkEujE0TXCJKoM1QaJ8Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4724553"
Received: from abityuts-desk1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 01:31:10 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_numa: Add multi-device NUMA placement
 tests
Date: Wed, 28 Oct 2026 09:30:45 +0100
Message-ID: <20261028083045.35833-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a new xe_numa test with three subtests:

bo-placement: For each xe device on a distinct NUMA node, create a
system memory BO, share it with the other devices using PRIME and bind
it in every device's LR VM. Use the per-client bo_numa debugfs file to
verify that at least 90% of the BO's pages reside on the creating
device's NUMA node, before and after each import, and after each
importing device has blitted the BO to a CPU-cleared BO and the
pseudo-random content was verified.

userptr-move: Bind a malloc'ed userptr once in every device's LR VM,
fill it with pseudo-random content, move it to every online NUMA node
with move_pages() and verify placement and content after each move.

userptr-move-blit: As userptr-move, but verify the content by having
each device blit the userptr to a CPU-cleared BO after each move,
without rebinding.

bo-placement depends on the xe per-client bo_numa debugfs file, which is
not yet upstream, and skips if it is missing.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Assisted-by: LLM
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_numa.c | 809 ++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build     |   1 +
 2 files changed, 810 insertions(+)
 create mode 100644 tests/intel/xe_numa.c

diff --git a/tests/intel/xe_numa.c b/tests/intel/xe_numa.c
new file mode 100644
index 000000000..2f7e564af
--- /dev/null
+++ b/tests/intel/xe_numa.c
@@ -0,0 +1,809 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: Multi-device NUMA tests
+ * Description: Exercise system memory buffer objects shared between xe
+ *		devices attached to different NUMA nodes
+ * Category: Core
+ * Mega feature: MultiGPU
+ * Functionality: NUMA
+ * Test category: functionality test
+ *
+ * SUBTEST: bo-placement
+ * Sub-category: dmabuf
+ * Functionality: NUMA, prime sharing
+ * Description:
+ *	For each xe device on a distinct NUMA node, create a system memory
+ *	BO, share it with the other devices using PRIME and bind it to every
+ *	device's LR VM. Use the xe per-client bo_numa debugfs file to verify
+ *	that at least 90% of the BO's pages are on the creating device's
+ *	NUMA node. Check this before the import and after each import.
+ *	Then fill the BO with pseudo-random content, have each importing
+ *	device blit it to a CPU-cleared BO and verify the content. Finally
+ *	check the placement again. Requires a kernel providing the bo_numa
+ *	debugfs file.
+ *
+ * SUBTEST: userptr-move
+ * Sub-category: userptr
+ * Description:
+ *	Bind malloc'ed memory as a userptr once in the LR VM of every xe
+ *	device, write pseudo-random content to it and move it to every
+ *	online NUMA node in turn. After each move verify that at least 90% of
+ *	the pages reside on the target node and that the content is intact
+ *	when read with the CPU.
+ *
+ * SUBTEST: userptr-move-blit
+ * Sub-category: userptr
+ * Description:
+ *	As userptr-move, but after each move clear a BO with the CPU and have
+ *	each device blit the userptr content to it, without rebinding. Verify
+ *	the pseudo-random content of the BO.
+ */
+
+/*
+ * Running the tests
+ *
+ * The tests need at least two xe devices on distinct NUMA nodes, and at
+ * least two online NUMA nodes. They need root access, and bo-placement
+ * needs a kernel providing the xe per-client bo_numa debugfs file.
+ *
+ * On a machine without real NUMA nodes, fake nodes can be created with a
+ * kernel built with CONFIG_NUMA_EMU=y, by booting with "numa=fake=2U" on
+ * the kernel command line. This divides each physical node into two
+ * emulated nodes. Check the result with
+ * "cat /sys/devices/system/node/online".
+ *
+ * The xe driver captures a device's NUMA node when it probes the device,
+ * so the devices need to be redistributed across the nodes while the
+ * driver is unloaded:
+ *
+ * - Unload xe: "xe_module_load --r unload"
+ * - Assign each device a node, for example
+ *   "echo 0 > /sys/bus/pci/devices/0000:03:00.0/numa_node" and
+ *   "echo 1 > /sys/bus/pci/devices/0000:08:00.0/numa_node".
+ *   Writing numa_node taints the kernel.
+ * - Load xe again: "xe_module_load --r load"
+ *
+ * The devices are then probed with the new nodes, which can be verified
+ * with "cat /sys/bus/pci/devices/<BDF>/numa_node".
+ */
+
+#include <linux/mempolicy.h>
+#include <sys/random.h>
+#include <sys/syscall.h>
+
+#include "igt.h"
+#include "igt_debugfs.h"
+#include "igt_device.h"
+#include "igt_drm_fdinfo.h"
+#include "igt_rand.h"
+#include "intel_mocs.h"
+#include "igt_sysfs.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define MAX_NUMA_DEVS	16
+#define BO_SIZE		SZ_2M
+#define BO_BASE_ADDR	0x100000000ull
+#define MIN_LOCAL_PCT	90
+#define USERPTR_SIZE	SZ_2M
+#define USERPTR_ADDR	0x200000000ull
+#define USERPTR_FENCE	0xdeadbeefull
+#define BLIT_DST_ADDR	0x300000000ull
+#define BLIT_BB_ADDR	0x400000000ull
+#define BLIT_PITCH	SZ_4K
+#define BLIT_SIZE	SZ_2M
+#define BLIT_FENCE_ADDR	0x500000000ull
+#define MAX_NUMA_NODES	64
+
+/**
+ * struct numa_dev - An xe device on a distinct NUMA node
+ * @fd: DRM device file descriptor.
+ * @node: NUMA node the device is attached to, -1 if unknown.
+ * @vm: LR VM created on the device.
+ * @pci_slot: PCI slot name of the device.
+ */
+struct numa_dev {
+	int fd;
+	int node;
+	uint32_t vm;
+	char pci_slot[NAME_MAX];
+};
+
+/**
+ * struct numa_bo_ref - A device's view of a shared BO
+ * @dev: The device holding the handle.
+ * @handle: GEM handle of the BO on @dev.
+ */
+struct numa_bo_ref {
+	struct numa_dev *dev;
+	uint32_t handle;
+};
+
+/**
+ * struct numa_aware_bo - A shared BO and all its handles
+ * @exporter: The device that created and exported the BO.
+ * @importers: The devices that imported the BO.
+ * @num_importers: Number of valid entries in @importers.
+ * @dmabuf: dma-buf file descriptor exported from @exporter.
+ * @size: Size of the BO.
+ * @addr: GPU virtual address the BO is bound at in all VMs.
+ */
+struct numa_aware_bo {
+	struct numa_bo_ref exporter;
+	struct numa_bo_ref importers[MAX_NUMA_DEVS - 1];
+	unsigned int num_importers;
+	int dmabuf;
+	uint64_t size;
+	uint64_t addr;
+};
+
+static int device_numa_node(int fd)
+{
+	int32_t node = -1;
+	int dir;
+
+	dir = igt_sysfs_open(fd);
+	igt_assert_f(dir >= 0, "Failed to open sysfs dir\n");
+	if (!__igt_sysfs_get_s32(dir, "device/numa_node", &node))
+		node = -1;
+	close(dir);
+
+	return node;
+}
+
+static bool node_taken(const struct numa_dev *devs, int num_devs, int node)
+{
+	for (int i = 0; i < num_devs; i++)
+		if (devs[i].node == node)
+			return true;
+
+	return false;
+}
+
+/*
+ * Open all xe devices, keeping only the first device found on each
+ * NUMA node. A node of -1 (unknown) is treated as a node of its own.
+ */
+static int open_numa_devs(struct numa_dev *devs, int max_devs)
+{
+	int num_devs = 0;
+	int fd;
+
+	for (int i = 0; num_devs < max_devs; i++) {
+		int node;
+
+		fd = __drm_open_driver_another(i, DRIVER_XE);
+		if (fd < 0)
+			break;
+
+		node = device_numa_node(fd);
+		if (node_taken(devs, num_devs, node)) {
+			igt_info("Skipping xe device %d on already used NUMA node %d\n",
+				 i, node);
+			drm_close_driver(fd);
+			continue;
+		}
+
+		devs[num_devs].fd = fd;
+		devs[num_devs].node = node;
+		igt_device_get_pci_slot_name(fd, devs[num_devs].pci_slot);
+		igt_info("Using xe device %s on NUMA node %d\n",
+			 devs[num_devs].pci_slot, node);
+		num_devs++;
+	}
+
+	return num_devs;
+}
+
+static void close_numa_devs(struct numa_dev *devs, int num_devs)
+{
+	for (int i = 0; i < num_devs; i++)
+		drm_close_driver(devs[i].fd);
+}
+
+static void create_vms(struct numa_dev *devs, int num_devs)
+{
+	for (int i = 0; i < num_devs; i++)
+		devs[i].vm = xe_vm_create(devs[i].fd,
+					  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+}
+
+static void destroy_vms(struct numa_dev *devs, int num_devs)
+{
+	for (int i = 0; i < num_devs; i++)
+		xe_vm_destroy(devs[i].fd, devs[i].vm);
+}
+
+struct bo_numa_info {
+	unsigned long nodes[MAX_NUMA_NODES];
+	unsigned long total;
+	unsigned long backed_up;
+	bool pages_unknown;
+};
+
+static int open_bo_numa(int fd)
+{
+	struct drm_client_fdinfo info = {};
+	char path[PATH_MAX];
+
+	if (!igt_debugfs_mount() ||
+	    !igt_parse_drm_fdinfo(fd, &info, NULL, 0, NULL, 0))
+		return -1;
+
+	snprintf(path, sizeof(path), "%s/dri/client-%lu/bo_numa",
+		 igt_debugfs_mount(), info.id);
+
+	return open(path, O_RDWR);
+}
+
+/*
+ * Request the NUMA page distribution of @handle through the
+ * bo_numa debugfs file @bo_numa_fd and parse the response.
+ */
+static void read_bo_numa(int bo_numa_fd, uint32_t handle,
+			 struct bo_numa_info *info)
+{
+	char req[16], buf[4096], *line, *save = NULL;
+	ssize_t len, n;
+
+	memset(info, 0, sizeof(*info));
+	snprintf(req, sizeof(req), "%u", handle);
+	igt_assert_eq(write(bo_numa_fd, req, strlen(req)), strlen(req));
+
+	for (len = 0; len < sizeof(buf) - 1; len += n) {
+		n = read(bo_numa_fd, buf + len, sizeof(buf) - 1 - len);
+		igt_assert(n >= 0);
+		if (!n)
+			break;
+	}
+	buf[len] = 0;
+
+	for (line = strtok_r(buf, "\n", &save); line;
+	     line = strtok_r(NULL, "\n", &save)) {
+		unsigned int node;
+		unsigned long val;
+
+		if (!strncmp(line, "pages: unknown", strlen("pages: unknown"))) {
+			info->pages_unknown = true;
+		} else if (sscanf(line, "node%u: %lu", &node, &val) == 2) {
+			igt_assert_lt(node, MAX_NUMA_NODES);
+			info->nodes[node] = val;
+		} else if (sscanf(line, "total: %lu", &val) == 1) {
+			info->total = val;
+		} else if (sscanf(line, "backed_up: %lu", &val) == 1) {
+			info->backed_up = val;
+		}
+	}
+}
+
+/*
+ * Record the NUMA node holding most of the BO's pages and the percentage
+ * of pages on that node, and verify that at least MIN_LOCAL_PCT percent of
+ * the pages are on the creating device's NUMA node. If the device's node
+ * is unknown, only report. @stage describes when the check is made.
+ */
+static void check_bo_placement(const struct numa_aware_bo *bo,
+			       const char *stage)
+{
+	struct numa_dev *dev = bo->exporter.dev;
+	struct bo_numa_info info;
+	unsigned int best = 0;
+	int bo_numa_fd;
+
+	bo_numa_fd = open_bo_numa(dev->fd);
+	igt_assert_f(bo_numa_fd >= 0, "Failed to open bo_numa for %s\n",
+		     dev->pci_slot);
+	read_bo_numa(bo_numa_fd, bo->exporter.handle, &info);
+	close(bo_numa_fd);
+
+	igt_assert_f(!info.pages_unknown,
+		     "BO at 0x%" PRIx64 " pages not inspectable (imported BO?)\n",
+		     bo->addr);
+	igt_assert_f(info.total, "BO at 0x%" PRIx64 " has no populated pages (%lu backed up)\n",
+		     bo->addr, info.backed_up);
+
+	for (unsigned int i = 1; i < MAX_NUMA_NODES; i++)
+		if (info.nodes[i] > info.nodes[best])
+			best = i;
+
+	igt_info("BO 0x%" PRIx64 " created on %s (node %d), %s: dominant node %u, %lu%% of %lu pages\n",
+		 bo->addr, dev->pci_slot, dev->node, stage, best,
+		 info.nodes[best] * 100 / info.total, info.total);
+
+	if (dev->node < 0)
+		return;
+
+	igt_assert_f(dev->node < MAX_NUMA_NODES &&
+		     info.nodes[dev->node] * 100 >= info.total * MIN_LOCAL_PCT,
+		     "Only %lu of %lu pages on NUMA node %d, need %d%%\n",
+		     dev->node < MAX_NUMA_NODES ? info.nodes[dev->node] : 0,
+		     info.total, dev->node, MIN_LOCAL_PCT);
+}
+
+/*
+ * Create a system memory BO on @exporter, which gives it the exporter's
+ * NUMA affinity, export it and import it into all other devices. Bind
+ * the BO at the same address in all devices' VMs. Check the exporter's
+ * placement before the first import and after each import, to verify that
+ * importing doesn't change it.
+ */
+static void numa_aware_bo_create_dev(struct numa_aware_bo *bo,
+				     struct numa_dev *devs, int num_devs,
+				     struct numa_dev *exporter,
+				     uint64_t size, uint64_t addr)
+{
+	memset(bo, 0, sizeof(*bo));
+	bo->size = size;
+	bo->addr = addr;
+	bo->exporter.dev = exporter;
+	bo->exporter.handle = xe_bo_create(exporter->fd, 0, size,
+					   system_memory(exporter->fd), 0);
+	bo->dmabuf = prime_handle_to_fd(exporter->fd, bo->exporter.handle);
+	xe_vm_bind_lr_sync(exporter->fd, exporter->vm, bo->exporter.handle,
+			   0, addr, size, 0);
+	check_bo_placement(bo, "before import");
+
+	for (int i = 0; i < num_devs; i++) {
+		struct numa_bo_ref *imp;
+
+		if (&devs[i] == exporter)
+			continue;
+
+		imp = &bo->importers[bo->num_importers++];
+		imp->dev = &devs[i];
+		imp->handle = prime_fd_to_handle(imp->dev->fd, bo->dmabuf);
+		xe_vm_bind_lr_sync(imp->dev->fd, imp->dev->vm, imp->handle,
+				   0, addr, size, 0);
+		check_bo_placement(bo, "after import");
+	}
+}
+
+static void numa_aware_bo_destroy(struct numa_aware_bo *bo)
+{
+	for (unsigned int i = 0; i < bo->num_importers; i++) {
+		struct numa_bo_ref *imp = &bo->importers[i];
+
+		xe_vm_unbind_lr_sync(imp->dev->fd, imp->dev->vm, 0,
+				     bo->addr, bo->size);
+		gem_close(imp->dev->fd, imp->handle);
+	}
+
+	close(bo->dmabuf);
+	xe_vm_unbind_lr_sync(bo->exporter.dev->fd, bo->exporter.dev->vm, 0,
+			     bo->addr, bo->size);
+	gem_close(bo->exporter.dev->fd, bo->exporter.handle);
+}
+
+/*
+ * Parse the online NUMA nodes from sysfs, a range list such as "0-1,3".
+ */
+static int online_numa_nodes(int *nodes, int max_nodes)
+{
+	char buf[128], *p = buf;
+	int num = 0;
+	FILE *f;
+
+	f = fopen("/sys/devices/system/node/online", "r");
+	igt_require_f(f, "No NUMA node information in sysfs\n");
+	igt_assert(fgets(buf, sizeof(buf), f));
+	fclose(f);
+
+	while (*p && *p != '\n') {
+		long first, last;
+		char *end;
+
+		first = strtol(p, &end, 10);
+		last = first;
+		igt_assert(end != p);
+		if (*end == '-')
+			last = strtol(end + 1, &end, 10);
+
+		for (; first <= last; first++) {
+			igt_assert_lt(num, max_nodes);
+			nodes[num++] = first;
+		}
+
+		p = *end == ',' ? end + 1 : end;
+	}
+
+	return num;
+}
+
+static long numa_move_pages(void **pages, unsigned long count,
+			    const int *nodes, int *status)
+{
+	return syscall(SYS_move_pages, 0, count, pages, nodes, status,
+		       MPOL_MF_MOVE);
+}
+
+/*
+ * Record the NUMA node holding most of the pages and the percentage of
+ * pages on that node. Return the number of pages on @node.
+ */
+static unsigned long userptr_placement(void *ptr, uint64_t size, int node)
+{
+	unsigned long count = size / SZ_4K, per_node[MAX_NUMA_NODES] = {};
+	void **pages = calloc(count, sizeof(*pages));
+	int *status = calloc(count, sizeof(*status));
+	unsigned int best = 0;
+
+	igt_assert(pages && status);
+	for (unsigned long i = 0; i < count; i++)
+		pages[i] = ptr + i * SZ_4K;
+
+	igt_assert_eq(numa_move_pages(pages, count, NULL, status), 0);
+
+	for (unsigned long i = 0; i < count; i++)
+		if (status[i] >= 0 && status[i] < MAX_NUMA_NODES)
+			per_node[status[i]]++;
+
+	for (unsigned int i = 1; i < MAX_NUMA_NODES; i++)
+		if (per_node[i] > per_node[best])
+			best = i;
+
+	igt_info("Userptr: dominant node %u, %lu%% of %lu pages\n", best,
+		 per_node[best] * 100 / count, count);
+
+	free(pages);
+	free(status);
+
+	return per_node[node];
+}
+
+static void move_userptr(void *ptr, uint64_t size, int node)
+{
+	unsigned long count = size / SZ_4K;
+	void **pages = calloc(count, sizeof(*pages));
+	int *nodes = calloc(count, sizeof(*nodes));
+	int *status = calloc(count, sizeof(*status));
+
+	igt_assert(pages && nodes && status);
+	for (unsigned long i = 0; i < count; i++) {
+		pages[i] = ptr + i * SZ_4K;
+		nodes[i] = node;
+	}
+
+	/* Pages not moved are caught by the placement check. */
+	igt_assert_f(numa_move_pages(pages, count, nodes, status) >= 0,
+		     "move_pages() failed: %m\n");
+
+	free(pages);
+	free(nodes);
+	free(status);
+}
+
+static void fill_random(uint32_t *map, uint64_t size, uint32_t seed)
+{
+	uint32_t prng = seed;
+
+	for (uint64_t i = 0; i < size / sizeof(*map); i++)
+		map[i] = hars_petruska_f54_1_random(&prng);
+}
+
+static void verify_random(const uint32_t *map, uint64_t size, uint32_t seed)
+{
+	uint32_t prng = seed;
+
+	for (uint64_t i = 0; i < size / sizeof(*map); i++) {
+		uint32_t val = hars_petruska_f54_1_random(&prng);
+
+		igt_assert_f(map[i] == val,
+			     "Content not preserved at offset 0x%016" PRIx64
+			     ". Failed value is 0x%08x, recorded 0x%08x.\n",
+			     i * sizeof(*map), map[i], val);
+	}
+}
+
+/**
+ * struct numa_blit - Per-device resources for blitting system memory
+ * @fence: User fence memory for exec completion.
+ * @queue: Copy engine exec queue.
+ * @dst: Destination BO bound at BLIT_DST_ADDR.
+ * @dst_map: CPU mapping of @dst.
+ * @bb: Batch buffer BO bound at BLIT_BB_ADDR.
+ */
+struct numa_blit {
+	uint64_t *fence;
+	uint32_t queue;
+	uint32_t dst;
+	uint32_t bb;
+	uint32_t *dst_map;
+};
+
+static_assert(BO_SIZE == BLIT_SIZE && USERPTR_SIZE == BLIT_SIZE,
+	      "Blits copy whole BOs and userptrs");
+
+/*
+ * Emit an XY_FAST_COPY_BLT blitting BLIT_SIZE bytes of system memory
+ * from @src to BLIT_DST_ADDR, using explicit VM addresses.
+ */
+static void emit_blit(int fd, uint32_t *batch, uint64_t src)
+{
+	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
+	uint32_t width = BLIT_PITCH / sizeof(uint32_t);
+	uint32_t height = BLIT_SIZE / BLIT_PITCH;
+	uint32_t depth_32bit = 3, mem_system = 1;
+	int i = 0;
+
+	batch[i++] = 0x2 << 29 | 0x42 << 22 | 8;
+	if (ip_ver >= IP_VER(20, 0))
+		batch[i++] = BLIT_PITCH | intel_get_wb_mocs_index(fd) << 20 |
+			depth_32bit << 24 | 1u << 30 | 1u << 31;
+	else
+		batch[i++] = BLIT_PITCH | depth_32bit << 24 |
+			mem_system << 28 | mem_system << 29;
+	batch[i++] = 0;
+	batch[i++] = width | height << 16;
+	batch[i++] = lower_32_bits(BLIT_DST_ADDR);
+	batch[i++] = upper_32_bits(BLIT_DST_ADDR);
+	batch[i++] = 0;
+	if (ip_ver >= IP_VER(20, 0))
+		batch[i++] = BLIT_PITCH | intel_get_wb_mocs_index(fd) << 20;
+	else
+		batch[i++] = BLIT_PITCH;
+	batch[i++] = lower_32_bits(src);
+	batch[i++] = upper_32_bits(src);
+	batch[i++] = MI_BATCH_BUFFER_END;
+}
+
+/*
+ * Set up a copy queue, a destination BO and a batch in @dev's LR VM that
+ * blits from VM address @src.
+ */
+static void numa_blit_init(struct numa_dev *dev, struct numa_blit *blit,
+			   uint64_t src)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USERPTR_FENCE,
+	};
+	uint64_t *bind_fence;
+	uint32_t *batch;
+
+	blit->fence = aligned_alloc(SZ_4K, SZ_4K);
+	igt_assert(blit->fence);
+
+	blit->queue = xe_exec_queue_create_class(dev->fd, dev->vm,
+						 DRM_XE_ENGINE_CLASS_COPY);
+	blit->dst = xe_bo_create(dev->fd, 0, BLIT_SIZE,
+				 system_memory(dev->fd), 0);
+	blit->dst_map = xe_bo_map(dev->fd, blit->dst, BLIT_SIZE);
+	blit->bb = xe_bo_create(dev->fd, 0, SZ_4K, system_memory(dev->fd), 0);
+
+	batch = xe_bo_map(dev->fd, blit->bb, SZ_4K);
+	emit_blit(dev->fd, batch, src);
+	munmap(batch, SZ_4K);
+
+	xe_vm_bind_lr_sync(dev->fd, dev->vm, blit->dst, 0, BLIT_DST_ADDR,
+			   BLIT_SIZE, 0);
+	xe_vm_bind_lr_sync(dev->fd, dev->vm, blit->bb, 0, BLIT_BB_ADDR,
+			   SZ_4K, 0);
+
+	/*
+	 * The GPU signals the exec user fence through the VM, so map the
+	 * fence memory at BLIT_FENCE_ADDR.
+	 */
+	bind_fence = aligned_alloc(sizeof(*bind_fence), sizeof(*bind_fence));
+	igt_assert(bind_fence);
+	*bind_fence = 0;
+	sync.addr = to_user_pointer(bind_fence);
+	xe_vm_bind_userptr_async(dev->fd, dev->vm, 0,
+				 to_user_pointer(blit->fence),
+				 BLIT_FENCE_ADDR, SZ_4K,
+				 &sync, 1);
+	xe_wait_ufence(dev->fd, bind_fence, USERPTR_FENCE, 0,
+		       NSEC_PER_SEC * 10);
+	free(bind_fence);
+}
+
+static void numa_blit_fini(struct numa_dev *dev, struct numa_blit *blit)
+{
+	xe_vm_unbind_lr_sync(dev->fd, dev->vm, 0, BLIT_DST_ADDR, BLIT_SIZE);
+	xe_vm_unbind_lr_sync(dev->fd, dev->vm, 0, BLIT_BB_ADDR, SZ_4K);
+	xe_vm_unbind_lr_sync(dev->fd, dev->vm, 0, BLIT_FENCE_ADDR, SZ_4K);
+	munmap(blit->dst_map, BLIT_SIZE);
+	gem_close(dev->fd, blit->dst);
+	gem_close(dev->fd, blit->bb);
+	xe_exec_queue_destroy(dev->fd, blit->queue);
+	free(blit->fence);
+}
+
+/* The only userptr bind, it is never redone. */
+static void numa_userptr_bind(struct numa_dev *dev, void *userptr)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USERPTR_FENCE,
+	};
+	uint64_t *fence = aligned_alloc(SZ_4K, SZ_4K);
+
+	igt_assert(fence);
+	*fence = 0;
+	sync.addr = to_user_pointer(fence);
+	xe_vm_bind_userptr_async(dev->fd, dev->vm, 0, to_user_pointer(userptr),
+				 USERPTR_ADDR, USERPTR_SIZE, &sync, 1);
+	xe_wait_ufence(dev->fd, fence, USERPTR_FENCE, 0, NSEC_PER_SEC * 10);
+	free(fence);
+}
+
+/* Clear the destination BO with the CPU, blit the userptr to it and verify. */
+static void blit_and_verify(struct numa_dev *dev, struct numa_blit *blit,
+			    uint32_t seed)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.addr = BLIT_FENCE_ADDR,
+		.timeline_value = USERPTR_FENCE,
+	};
+	struct drm_xe_exec exec = {
+		.exec_queue_id = blit->queue,
+		.syncs = to_user_pointer(&sync),
+		.num_syncs = 1,
+		.address = BLIT_BB_ADDR,
+		.num_batch_buffer = 1,
+	};
+
+	memset(blit->dst_map, 0, BLIT_SIZE);
+	*blit->fence = 0;
+	xe_exec(dev->fd, &exec);
+	xe_wait_ufence(dev->fd, blit->fence, USERPTR_FENCE, blit->queue,
+		       NSEC_PER_SEC * 10);
+	verify_random(blit->dst_map, BLIT_SIZE, seed);
+}
+
+static void test_bo_placement(struct numa_dev *devs, int num_devs)
+{
+	struct numa_aware_bo bos[MAX_NUMA_DEVS];
+	int num_bos = 0;
+	uint32_t seed;
+
+	for (int i = 0; i < num_devs; i++) {
+		int fd = open_bo_numa(devs[i].fd);
+
+		igt_require_f(fd >= 0,
+			      "No bo_numa debugfs file for device %s\n",
+			      devs[i].pci_slot);
+		close(fd);
+	}
+
+	igt_assert_eq(getrandom(&seed, sizeof(seed), 0), sizeof(seed));
+	igt_info("Random seed is 0x%08x.\n", seed);
+
+	create_vms(devs, num_devs);
+
+	for (int i = 0; i < num_devs; i++, num_bos++)
+		numa_aware_bo_create_dev(&bos[num_bos], devs, num_devs,
+					 &devs[i], BO_SIZE,
+					 BO_BASE_ADDR + num_bos * BO_SIZE);
+
+	for (int i = 0; i < num_bos; i++) {
+		uint32_t *map = xe_bo_map(bos[i].exporter.dev->fd,
+					  bos[i].exporter.handle, BO_SIZE);
+
+		fill_random(map, BO_SIZE, seed);
+		munmap(map, BO_SIZE);
+	}
+
+	/*
+	 * Access each BO from every importer, then verify that the
+	 * exporter's placement is unchanged.
+	 */
+	for (int i = 0; i < num_bos; i++) {
+		struct numa_aware_bo *bo = &bos[i];
+
+		for (unsigned int j = 0; j < bo->num_importers; j++) {
+			struct numa_dev *dev = bo->importers[j].dev;
+			struct numa_blit blit;
+
+			igt_info("Device %s: blitting BO 0x%" PRIx64 "\n",
+				 dev->pci_slot, bo->addr);
+			numa_blit_init(dev, &blit, bo->addr);
+			blit_and_verify(dev, &blit, seed);
+			numa_blit_fini(dev, &blit);
+		}
+
+		check_bo_placement(bo, "after blit");
+	}
+
+	for (int i = 0; i < num_bos; i++)
+		numa_aware_bo_destroy(&bos[i]);
+
+	destroy_vms(devs, num_devs);
+}
+
+/*
+ * Bind a malloc'ed userptr once in every device's LR VM and move it across
+ * all online NUMA nodes. After each move, verify the placement and the
+ * content, either with the CPU or, in @blit mode, by having each device
+ * blit the userptr to a CPU-cleared BO. The userptr is never rebound.
+ */
+static void test_userptr_move(struct numa_dev *devs, int num_devs, bool blit)
+{
+	struct numa_blit blits[MAX_NUMA_DEVS];
+	int nodes[MAX_NUMA_NODES];
+	int num_nodes = online_numa_nodes(nodes, ARRAY_SIZE(nodes));
+	unsigned long count = USERPTR_SIZE / SZ_4K;
+	uint32_t seed;
+	void *ptr;
+
+	igt_require_f(num_nodes >= 2, "Need at least 2 online NUMA nodes\n");
+	igt_assert_eq(getrandom(&seed, sizeof(seed), 0), sizeof(seed));
+	igt_info("Random seed is 0x%08x.\n", seed);
+
+	create_vms(devs, num_devs);
+	igt_assert_eq(posix_memalign(&ptr, SZ_4K, USERPTR_SIZE), 0);
+	fill_random(ptr, USERPTR_SIZE, seed);
+
+	for (int d = 0; d < num_devs; d++) {
+		if (blit)
+			numa_blit_init(&devs[d], &blits[d], USERPTR_ADDR);
+		numa_userptr_bind(&devs[d], ptr);
+	}
+
+	for (int n = 0; n < num_nodes; n++) {
+		unsigned long local;
+
+		igt_info("Moving userptr to node %d\n", nodes[n]);
+		move_userptr(ptr, USERPTR_SIZE, nodes[n]);
+		local = userptr_placement(ptr, USERPTR_SIZE, nodes[n]);
+		igt_assert_f(local * 100 >= count * MIN_LOCAL_PCT,
+			     "Only %lu of %lu pages on NUMA node %d, need %d%%\n",
+			     local, count, nodes[n], MIN_LOCAL_PCT);
+
+		if (!blit) {
+			verify_random(ptr, USERPTR_SIZE, seed);
+			continue;
+		}
+
+		for (int d = 0; d < num_devs; d++) {
+			igt_info("Device %s: blitting userptr\n",
+				 devs[d].pci_slot);
+			blit_and_verify(&devs[d], &blits[d], seed);
+		}
+	}
+
+	for (int d = 0; d < num_devs; d++) {
+		xe_vm_unbind_lr_sync(devs[d].fd, devs[d].vm, 0, USERPTR_ADDR,
+				     USERPTR_SIZE);
+		if (blit)
+			numa_blit_fini(&devs[d], &blits[d]);
+	}
+
+	free(ptr);
+	destroy_vms(devs, num_devs);
+}
+
+int igt_main()
+{
+	struct numa_dev devs[MAX_NUMA_DEVS];
+	int num_devs = 0;
+
+	igt_fixture() {
+		num_devs = open_numa_devs(devs, ARRAY_SIZE(devs));
+		igt_require_f(num_devs >= 2,
+			      "Need xe devices on at least 2 NUMA nodes, found %d\n",
+			      num_devs);
+	}
+
+	igt_describe("Verify that BO pages are placed on the creating device's NUMA node");
+	igt_subtest("bo-placement")
+		test_bo_placement(devs, num_devs);
+
+	igt_describe("Move userptr memory across NUMA nodes and verify placement and content");
+	igt_subtest("userptr-move")
+		test_userptr_move(devs, num_devs, false);
+
+	igt_describe("Move userptr memory across NUMA nodes and blit it to a BO on each device");
+	igt_subtest("userptr-move-blit")
+		test_userptr_move(devs, num_devs, true);
+
+	igt_fixture()
+		close_numa_devs(devs, num_devs);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 519a9e727..4a097bdd0 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -325,6 +325,7 @@ intel_xe_progs = [
         'xe_module_load',
         'xe_multigpu_svm',
 	'xe_noexec_ping_pong',
+	'xe_numa',
 	'xe_oa',
 	'xe_page_reclaim',
 	'xe_pat',
-- 
2.56.0

