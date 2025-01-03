Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C29E77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 06:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5B310E278;
	Fri,  3 Jan 2025 06:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNmYNg9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA7610E278
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 06:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735887253; x=1767423253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wvxAkBPxsHxwvQzhMJ/QHbbPPibUZcHoGIHnVaEtys0=;
 b=dNmYNg9NSYJXCyggNg0x+sKGGiFrhHDJQsj5xxjMF6ub8A0QN+ngWlS/
 /F1pEqDCrt04dF1mTgYb3CgUa1UTf3bPHWJwZTdeUxNjfyY0reXPfLqsF
 NLXt/WvRtuK0Dcu5I5uQxGFsddIyumNmt/10sJbtq6FUQUCfgmUcoYyga
 dMzae9oFyfCJBJTMU3m26WfOxs22MGzcm8jl2gKbEcO+Dhj/QaAIHBs/m
 r3Xb2LWenKuDMOiaDBX1VvpeIk29pvn9OyC689CCikuY4JrRMIul00atv
 TurJwbNrPIZ3lgLAGTDWlau4E+aN4pULx2fBHjzlmDVG7zksDkunSlO0m w==;
X-CSE-ConnectionGUID: otxuyLZaTFW8+IblDYEjcQ==
X-CSE-MsgGUID: DJSWdwucQN2Tgb5S0Jy8eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35436314"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="35436314"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 22:54:12 -0800
X-CSE-ConnectionGUID: ivX74+r+RlybLRNsOUlopQ==
X-CSE-MsgGUID: 7qC/cKQxSSebXlLZV0rFfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="132572109"
Received: from desktop-j213chq.iind.intel.com (HELO
 psoham-NUC7i7BNH.iind.intel.com) ([10.227.88.36])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 22:54:10 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, soham.purkait@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH i-g-t] Add single engine busyness stats in GPUTOP
Date: Fri,  3 Jan 2025 12:23:04 +0530
Message-Id: <20250103065304.45781-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add single engine busyness support in GPUTOP. This will use the PMU interface to display the busyness of each engine instances. 

ENGINES         BUSY
Render/3D/0   | 96.5% ███████████████████████████████████████▍|
Blitter/0     | 91.6% █████████████████████████████████████   |
Video/0       | 56.2% ███████████████████████████             |
VideoEnhance/0| 97.7% ████████████████████████████████████████|
Compute/0     | 48.5% ███████████████████████▍                |


---
 tools/gputop.c    | 586 +++++++++++++++++++++++++++++++++++++++++++++-
 tools/meson.build |   2 +-
 2 files changed, 585 insertions(+), 3 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 43b01f566..dccd38d66 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -2,7 +2,6 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
-
 #include <assert.h>
 #include <ctype.h>
 #include <dirent.h>
@@ -31,6 +30,88 @@
 #include "igt_drm_fdinfo.h"
 #include "igt_profiling.h"
 #include "drmtest.h"
+#include "xe/xe_query.h"
+#include "igt_perf.h"
+#include "igt_device_scan.h"
+
+struct pmu_pair {
+	uint64_t cur;
+	uint64_t prev;
+};
+
+struct pmu_counter {
+	uint64_t type;
+	uint64_t config;
+	unsigned int idx;
+	struct pmu_pair val;
+	//double scale;
+	//const char *units;
+	bool present;
+};
+
+// struct engine_class {
+// 	unsigned int engine_class;
+// 	const char *name;
+// 	unsigned int num_engines;
+// };
+
+struct engine {
+	const char *name;
+	char *display_name;
+	char *short_name;
+
+	// unsigned int class;
+	// unsigned int instance;
+	struct drm_xe_engine_class_instance xe_engine;
+
+	unsigned int num_counters;
+
+	struct pmu_counter busy;
+	struct pmu_counter total;
+	//struct pmu_counter wait;
+	//struct pmu_counter sema;
+};
+
+#define MAX_GTS 4
+struct engines {
+	unsigned int num_engines;
+	unsigned int num_classes;
+	//struct engine_class *class;
+	unsigned int num_counters;
+	DIR *root;
+	int fd;
+	struct pmu_pair ts;
+
+	// int rapl_fd;
+	// struct pmu_counter r_gpu, r_pkg;
+	// unsigned int num_rapl;
+
+	// int imc_fd;
+	// struct pmu_counter imc_reads;
+	// struct pmu_counter imc_writes;
+	// unsigned int num_imc;
+
+	// struct pmu_counter freq_req;
+	// struct pmu_counter freq_req_gt[MAX_GTS];
+	// struct pmu_counter freq_act;
+	// struct pmu_counter freq_act_gt[MAX_GTS];
+	// struct pmu_counter irq;
+	// struct pmu_counter rc6;
+	// struct pmu_counter rc6_gt[MAX_GTS];
+
+	bool discrete;
+	char *device;
+
+	int num_gts;
+
+	/* Do not edit below this line.
+	 * This structure is reallocated every time a new engine is
+	 * found and size is increased by sizeof (engine).
+	 */
+
+	struct engine engine;
+
+};
 
 enum utilization_type {
 	UTILIZATION_TYPE_ENGINE_TIME,
@@ -39,9 +120,39 @@ enum utilization_type {
 
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
 
+static const char *engine_event[] = {"rcs", "bcs", "vcs", "vecs", "ccs"};
+
+#define engine_ptr(engines, n) (&engines->engine + (n))
+
+#define is_igpu(x) (strcmp(x, "xe") == 0)
+
+#define IGPU_PCI "0000:00:02.0"
+#define is_igpu_pci(x) (strcmp(x, IGPU_PCI) == 0)
+
 #define ANSI_HEADER "\033[7m"
 #define ANSI_RESET "\033[0m"
 
+#define CLEAN_UP() 		\
+	do {     		\
+		free(engines);  \
+		return NULL;    \
+	} while (0)
+
+#define _open_pmu(type, cnt, pmu, fd) \
+({ \
+	int fd__; \
+\
+	fd__ = igt_perf_open_group((type), (pmu)->config, (fd)); \
+	if (fd__ >= 0) { \
+		if ((fd) == -1) \
+			(fd) = fd__; \
+		(pmu)->present = true; \
+		(pmu)->idx = (cnt)++; \
+	} \
+\
+	fd__; \
+})
+
 static void n_spaces(const unsigned int n)
 {
 	unsigned int i;
@@ -403,6 +514,414 @@ static void sigint_handler(int sig)
 	stop_top = true;
 }
 
+static double pmu_calc_total(struct pmu_pair *p)
+{
+	double v;
+	v = (p->cur - p->prev)/1e9;
+	return v;
+}
+
+static double pmu_calc(struct pmu_pair *p, double total_tick)
+{
+    	double bz = (p->cur - p->prev)/1e9;
+	double total;
+	total = (bz*100)/total_tick;
+	return total;
+}
+
+static int
+print_engines_header(struct engines *engines,
+		     int lines, int con_w, int con_h)
+{
+	const char *a;
+	for (unsigned int i = 0;
+	     i < engines->num_engines && lines < con_h;
+	     i++) {
+		struct engine *engine = engine_ptr(engines, i);
+
+		if (!engine->num_counters)
+			continue;		
+
+				
+		a = "            ENGINES   BUSY  "; // 
+
+		printf("\033[7m%s%*s\033[0m\n",
+			       a, (int)(con_w - strlen(a)), " ");
+
+		lines++;
+		
+
+		break;
+	}
+
+	return lines;
+}
+
+static int
+print_engine(struct engines *engines, unsigned int i,
+	     int lines, int con_w, int con_h)
+{
+	struct engine *engine = engine_ptr(engines, i);
+	double total_tick = pmu_calc_total(&(engine->total.val));
+	double percentage = pmu_calc(&(engine->busy.val), total_tick);
+
+	printf("%*s",(int)(strlen("            ENGINES")),engine->display_name);
+	//printf("  %5.1f", percentage);
+	print_percentage_bar(percentage, con_w - strlen("            ENGINES"));
+	printf("\n");
+	
+	return ++lines;
+	
+}
+
+static int
+print_engines_footer(struct engines *engines,
+		     int lines, int con_w, int con_h)
+{
+	
+	if (lines++ < con_h)
+		printf("\n");
+
+	return lines;
+}
+
+static int
+print_engines(struct engines *engines, int lines, int w, int h)
+{
+	struct engines *show;
+
+	show = engines;
+
+	lines = print_engines_header(show, lines, w,  h);
+
+	for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
+		lines = print_engine(show, i, lines, w, h);
+
+	lines = print_engines_footer(show, lines, w, h);
+
+	return lines;
+}
+
+static uint64_t
+get_pmu_config(int dirfd, const char *name, const char *counter, const unsigned int gt)
+{
+	char buf[128], *p;
+	int fd, ret;
+
+	ret = snprintf(buf, sizeof(buf), "%s%s%u", name, counter, gt);
+	if (ret < 0 || ret == sizeof(buf))
+		return -1;
+
+	fd = openat(dirfd, buf, O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	ret = read(fd, buf, sizeof(buf));
+	close(fd);
+	if (ret <= 0)
+		return -1;
+
+	p = strchr(buf, '0');
+	if (!p)
+		return -1;
+
+	return strtoul(p, NULL, 0);
+}
+
+
+
+static int engine_cmp(const void *__a, const void *__b)
+{
+	const struct engine *a = (struct engine *)__a;
+	const struct engine *b = (struct engine *)__b;
+
+	if (a->xe_engine.engine_class != b->xe_engine.engine_class)
+		return a->xe_engine.engine_class - b->xe_engine.engine_class;
+	else
+		return a->xe_engine.engine_instance - b->xe_engine.engine_instance;
+}
+
+static void free_engines(struct engines *engines)
+{
+	
+	unsigned int i;
+
+	if (!engines)
+		return;
+
+	
+
+	for (i = 0; i < engines->num_engines; i++) {
+		struct engine *engine = engine_ptr(engines, i);
+
+		free((char *)engine->name);
+		free((char *)engine->short_name);
+		free((char *)engine->display_name);
+	}
+
+	closedir(engines->root);
+	free(engines);
+}
+
+static const char *class_display_name(unsigned int class)
+{
+	switch (class) {
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		return "Render/3D";
+	case DRM_XE_ENGINE_CLASS_COPY:
+		return "Blitter";
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+		return "Video";
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return "VideoEnhance";
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		return "Compute";
+	default:
+		return "[unknown]";
+	}
+}
+
+static const char *class_short_name(unsigned int class)
+{
+	switch (class) {
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		return "RCS";
+	case DRM_XE_ENGINE_CLASS_COPY:
+		return "BCS";
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+		return "VCS";
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return "VECS";
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		return "CCS";
+	default:
+		return "UNKN";
+	}
+}
+
+
+static struct engines *discover_engines(char *device, struct igt_device_card *card)
+{
+	char sysfs_root[PATH_MAX];
+	struct engines *engines;
+	//struct dirent *dent;
+	int ret = 0;
+	DIR *d;
+	struct drm_xe_engine_class_instance *hwe;
+	const char *busy_end = "-busy-ticks-gt";
+	const char *total_end = "-total-ticks-gt";
+	int card_fd;
+
+	if (!card || !strlen(card->card) || !strlen(card->render))
+	{
+		return NULL;
+	}
+
+	if (strlen(card->card)) 
+	{
+		card_fd = igt_open_card(card); //open(card->card, O_RDWR);	
+	} 
+	else if (strlen(card->render)) 
+	{
+		card_fd = igt_open_render(card);
+	} 
+	else 
+	{
+		fprintf( stderr, "Failed to detect device!\n" );
+		CLEAN_UP() ;
+	}
+
+	xe_device_get(card_fd);
+	
+
+	snprintf(sysfs_root, sizeof(sysfs_root),
+		 "/sys/devices/%s/events", device);
+
+	engines = malloc(sizeof(struct engines));
+	if (!engines)
+		return NULL;
+
+	memset(engines, 0, sizeof(*engines));
+
+	engines->num_engines = 0;
+	engines->device = device;
+	engines->discrete = !is_igpu(device);
+
+	xe_for_each_engine(card_fd, hwe)
+	{
+		struct engine *engine = engine_ptr(engines, engines->num_engines);
+		engine->xe_engine = *hwe;
+		engines->num_engines++;
+		engines = realloc(engines, sizeof(struct engines) +
+				  engines->num_engines * sizeof(struct engine));
+		if (!engines) {
+			ret = errno;
+			break;
+		}
+	}
+
+	d = opendir(sysfs_root);
+	if (!d)
+		CLEAN_UP();
+
+	for (unsigned int i = 0; i < engines->num_engines; i++) 
+	{		
+		struct engine *engine = engine_ptr(engines, i);
+		asprintf((char**)&(engine->name),"%s%u",engine_event[engine->xe_engine.engine_class],engine->xe_engine.engine_instance);
+		
+		memset(&(engine->busy), 0, sizeof(struct pmu_counter));
+		memset(&(engine->total), 0, sizeof(struct pmu_counter));
+
+		engine->busy.config = get_pmu_config(dirfd(d), engine->name, busy_end, engine->xe_engine.gt_id);
+		engine->total.config = get_pmu_config(dirfd(d), engine->name, total_end, engine->xe_engine.gt_id);
+		
+		if (engine->busy.config == -1 || engine->total.config == -1) 
+		{
+			ret = ENOENT;
+			break;
+		}
+		
+		ret = asprintf(&engine->display_name, "%s/%u",
+			       class_display_name(engine->xe_engine.engine_class),
+			       engine->xe_engine.engine_instance);
+		
+		if (ret <= 0) {
+			ret = errno;
+			break;
+		}
+		
+		ret = asprintf(&engine->short_name, "%s/%u",
+			       class_short_name(engine->xe_engine.engine_class),
+			       engine->xe_engine.engine_instance);
+		
+		if (ret <= 0) {
+			ret = errno;
+			break;
+		}
+		
+	}
+	
+
+	if (!ret) {
+		errno = ret;
+		CLEAN_UP();
+	}
+
+	qsort(engine_ptr(engines, 0), engines->num_engines,
+	      sizeof(struct engine), engine_cmp);
+
+	engines->root = d;
+
+	return engines;
+}
+
+static int pmu_init(struct engines *engines)
+{
+	unsigned int i;
+	int fd;
+	struct engine *engine;
+	uint64_t type = igt_perf_type_id(engines->device);
+
+	engines->fd = -1;
+	engines->num_counters = 0;
+	
+	engine = engine_ptr(engines, 0);
+	fd = _open_pmu(type, engines->num_counters, &(engine->busy), engines->fd);
+	if (fd < 0)
+		return -1;
+	fd = _open_pmu(type, engines->num_counters, &(engine->total), engines->fd);
+	if (fd < 0)
+		return -1;	
+
+	for (i = 1; i < engines->num_engines; i++) 
+	{
+		engine = engine_ptr(engines, i);
+		fd = _open_pmu(type, engines->num_counters, &(engine->busy), engines->fd);
+		if (fd < 0)
+			return -1;
+		fd = _open_pmu(type, engines->num_counters, &(engine->total), engines->fd);
+		if (fd < 0)
+			return -1;
+		
+	}
+
+	return 0;
+}
+
+static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
+{
+	uint64_t buf[2 + num];
+	unsigned int i;
+	ssize_t len;
+
+	memset(buf, 0, sizeof(buf));
+
+	len = read(fd, buf, sizeof(buf));
+	assert(len == sizeof(buf));
+
+	for (i = 0; i < num; i++)
+		val[i] = buf[2 + i];
+
+	return buf[1];
+}
+
+static void __update_sample(struct pmu_counter *counter, uint64_t val)
+{
+	counter->val.prev = counter->val.cur;
+	counter->val.cur = val;
+}
+
+static void update_sample(struct pmu_counter *counter, uint64_t *val)
+{
+	if (counter->present)
+		__update_sample(counter, val[counter->idx]);
+}
+
+static void pmu_sample(struct engines *engines)
+{
+	const int num_val = engines->num_counters;
+	uint64_t val[2 + num_val];
+	unsigned int i;
+
+	engines->ts.prev = engines->ts.cur;
+	engines->ts.cur = pmu_read_multi(engines->fd, num_val, val);
+
+	for (i = 0; i < engines->num_engines; i++) {
+		struct engine *engine = engine_ptr(engines, i);
+
+		update_sample(&(engine->busy), val);
+		update_sample(&(engine->total), val);
+	}
+
+}
+
+/* tr_pmu_name()
+ *
+ * Transliterate pci_slot_id to sysfs device name entry for discrete GPU.
+ * Discrete GPU PCI ID   ("xxxx:yy:zz.z")       device = "xe_xxxx_yy_zz.z".
+ */
+static char *tr_pmu_name(struct igt_device_card *card)
+{
+	int ret;
+	const int bufsize = 16;
+	char *buf, *device = NULL;
+
+	assert(card->pci_slot_name[0]);
+
+	device = malloc(bufsize);
+	assert(device);
+
+	ret = snprintf(device, bufsize, "xe_%s", card->pci_slot_name);
+	assert(ret == (bufsize-1));
+
+	buf = device;
+	for (; *buf; buf++)
+		if (*buf == ':')
+			*buf = '_';
+
+	return device;
+}
+
 int main(int argc, char **argv)
 {
 	struct gputop_args args;
@@ -412,6 +931,9 @@ int main(int argc, char **argv)
 	int con_w = -1, con_h = -1;
 	int ret;
 	long n;
+	struct igt_device_card card;
+	char *pmu_device ;
+	struct engines *engines;
 
 	ret = parse_args(argc, argv, &args);
 	if (ret < 0)
@@ -422,6 +944,62 @@ int main(int argc, char **argv)
 	n = args.n_iter;
 	period_us = args.delay_usec;
 
+	igt_devices_scan(false);
+
+	//Yet to implement the device filter
+
+	ret = igt_device_find_first_xe_discrete_card(&card); 
+	if (!ret)
+		ret = igt_device_find_xe_integrated_card(&card);
+	if (!ret)
+		fprintf(stderr, "No discrete/integrated xe devices found\n");
+
+	if (!ret) {
+		ret = EXIT_FAILURE;
+		igt_devices_free();
+		return ret;
+	}
+	
+	if (card.pci_slot_name[0] ) //&& !is_igpu_pci(card.pci_slot_name)
+		pmu_device = tr_pmu_name(&card);
+	else
+		pmu_device = strdup("xe");
+
+
+	engines = discover_engines(pmu_device, &card);
+	
+	if (!engines) {
+		fprintf(stderr,
+			"Failed to discover engines! (%s)\n",
+			strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	ret = pmu_init(engines);
+
+	if (ret) {
+		fprintf(stderr,
+			"Failed to initialize PMU! (%s)\n", strerror(errno));
+		if (errno == EACCES && geteuid())
+			fprintf(stderr,
+"\n"
+"When running as a normal user CAP_PERFMON is required to access performance\n"
+"monitoring. See \"man 7 capabilities\", \"man 8 setcap\", or contact your\n"
+"distribution vendor for assistance.\n"
+"\n"
+"More information can be found at 'Perf events and tool security' document:\n"
+"https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
+		
+		free_engines(engines);
+		free(pmu_device);
+		igt_devices_free();
+		return EXIT_FAILURE;
+	}
+
+	ret = EXIT_SUCCESS;	
+
+	pmu_sample(engines);
+
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
 		exit(1);
@@ -450,6 +1028,10 @@ int main(int argc, char **argv)
 		update_console_size(&con_w, &con_h);
 		clrscr();
 
+		pmu_sample(engines);
+		lines = print_engines(engines, lines, con_w, con_h);
+
+
 		if (!clients->num_clients) {
 			const char *msg = " (No GPU clients yet. Start workload to see stats)";
 
@@ -488,4 +1070,4 @@ int main(int argc, char **argv)
 	}
 
 	return 0;
-}
+}
\ No newline at end of file
diff --git a/tools/meson.build b/tools/meson.build
index 511aec69e..8a3290d39 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -71,7 +71,7 @@ endif
 executable('gputop', 'gputop.c',
            install : true,
            install_rpath : bindir_rpathdir,
-           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
+           dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
 
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
-- 
2.34.1

