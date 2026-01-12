Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94276C9EC82
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4726C10E3C7;
	Mon, 12 Jan 2026 13:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ibrJKf6e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F02B10E3C7
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222838; x=1799758838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=31HRYqTihnYTQYGNXvN4d/piRtF+0fi5cneg4N3fPWY=;
 b=ibrJKf6eSDOTHTK/Vy2MmsFivOi9bhUWAUDcigFQItodHUzMQaIykVJz
 ITiJ2NIVPsIZPs+0zaee3vg4KuWa6rknR5WPvFJIYzm01pGxLavuquLlH
 dmc4sUcbMjP84EpVU1ajtSriQazgdr5WtDGbnSuoJb8t3g53S/+BdDEoq
 zQScabEbnYa+GgFwQs/xi8tg0bQLeiLCRL37R5Vv9fpbWfk9k9GxxDklM
 ag/UI1S6N+MXaUMSLw+wkinptCijZW8Elsflk2nujTBIs7w4imLXdZwOI
 QgUngwmuWfRijbgJEFJ56/V3rYhzEsFU6WRPILWQo/MJARoKsQSByPsoq Q==;
X-CSE-ConnectionGUID: YBv6E2ZWSEuObWXCwjHVwQ==
X-CSE-MsgGUID: 6rfxiVeERhCO3nVttXnSDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545528"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545528"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:37 -0800
X-CSE-ConnectionGUID: XdykrEyrTsu24hTSRO9uMA==
X-CSE-MsgGUID: 3jVUK1BrRqyQKqhmnP9WTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204094952"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:34 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 06/21] eudebug: Remove EVENT_OPEN and adjust tests
Date: Mon, 12 Jan 2026 14:59:52 +0200
Message-ID: <20260112130008.1649357-7-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
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

eudebug connections are against drm client filedescriptor
instead of the whole process (pid). This simplifies
access control as in order to gain access to the drm clients
file descriptor, the debugger either has delivered fd through
pipe or gone through proc/<pid>/fs to find it.

Start with removing client_handles from all events.
Put client->fd into the xe_eudebug_client structure as it is
singleton and immutable through client lifetime now.

The discovery tests have strong assumption how connection works,
disable them now until lib/xe_eudebug.c can accommodate.

With this in place basic-connect/basic-close/basic-client works.

v2: __xe_eudebug_connect helper (Christoph)

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 .../drm-uapi-experimental/xe_drm_eudebug.h    |  46 +-
 lib/xe/xe_eudebug.c                           | 462 ++++++++++--------
 lib/xe/xe_eudebug.h                           |  26 +-
 tests/intel/xe_eudebug.c                      | 390 +++++++--------
 tests/intel/xe_eudebug_online.c               | 151 ++----
 5 files changed, 496 insertions(+), 579 deletions(-)

diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
index 73e4f418f5..a9aa87f564 100644
--- a/include/drm-uapi-experimental/xe_drm_eudebug.h
+++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
@@ -19,19 +19,13 @@ extern "C" {
  */
 
 /* XXX: BEGIN section moved from xe_drm.h as temporary solution */
-#define DRM_XE_EUDEBUG_CONNECT		0x0e
-#define DRM_XE_DEBUG_METADATA_CREATE	0x0f
-#define DRM_XE_DEBUG_METADATA_DESTROY	0x10
-
-/* ... */
 
+#define DRM_XE_EUDEBUG_CONNECT		0x0f
 #define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)
-#define DRM_IOCTL_XE_DEBUG_METADATA_CREATE	 DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_CREATE, struct drm_xe_debug_metadata_create)
-#define DRM_IOCTL_XE_DEBUG_METADATA_DESTROY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_DEBUG_METADATA_DESTROY, struct drm_xe_debug_metadata_destroy)
 
 /* ... */
 
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		3
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		6
 #define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
 
 /* ... */
@@ -47,7 +41,7 @@ struct drm_xe_eudebug_connect {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	__u64 pid; /* input: Target process ID */
+	__u64 fd; /* Target drm client fd */
 	__u32 flags; /* MBZ */
 
 	__u32 version; /* output: current ABI (ioctl / events) version */
@@ -73,16 +67,15 @@ struct drm_xe_eudebug_event {
 	__u16 type;
 #define DRM_XE_EUDEBUG_EVENT_NONE		0
 #define DRM_XE_EUDEBUG_EVENT_READ		1
-#define DRM_XE_EUDEBUG_EVENT_OPEN		2
-#define DRM_XE_EUDEBUG_EVENT_VM			3
-#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		4
-#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
-#define DRM_XE_EUDEBUG_EVENT_METADATA		9
-#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 10
-#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		11
+#define DRM_XE_EUDEBUG_EVENT_VM			2
+#define DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE		3
+#define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	4
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND		5
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		6
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	7
+#define DRM_XE_EUDEBUG_EVENT_METADATA		8
+#define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 9
+#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		10
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
@@ -94,23 +87,15 @@ struct drm_xe_eudebug_event {
 	__u64 reserved;
 };
 
-struct drm_xe_eudebug_event_client {
-	struct drm_xe_eudebug_event base;
-
-	__u64 client_handle; /* This is unique per debug connection */
-};
-
 struct drm_xe_eudebug_event_vm {
 	struct drm_xe_eudebug_event base;
 
-	__u64 client_handle;
 	__u64 vm_handle;
 };
 
 struct drm_xe_eudebug_event_exec_queue {
 	struct drm_xe_eudebug_event base;
 
-	__u64 client_handle;
 	__u64 vm_handle;
 	__u64 exec_queue_handle;
 	__u32 engine_class;
@@ -121,7 +106,6 @@ struct drm_xe_eudebug_event_exec_queue {
 struct drm_xe_eudebug_event_eu_attention {
 	struct drm_xe_eudebug_event base;
 
-	__u64 client_handle;
 	__u64 exec_queue_handle;
 	__u64 lrc_handle;
 	__u32 flags;
@@ -130,7 +114,6 @@ struct drm_xe_eudebug_event_eu_attention {
 };
 
 struct drm_xe_eudebug_eu_control {
-	__u64 client_handle;
 
 #define DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL	0
 #define DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED		1
@@ -191,7 +174,6 @@ struct drm_xe_eudebug_eu_control {
 struct drm_xe_eudebug_event_vm_bind {
 	struct drm_xe_eudebug_event base;
 
-	__u64 client_handle;
 	__u64 vm_handle;
 
 	__u32 flags;
@@ -224,9 +206,6 @@ struct drm_xe_eudebug_vm_open {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @client_handle: id of client */
-	__u64 client_handle;
-
 	/** @vm_handle: id of vm */
 	__u64 vm_handle;
 
@@ -241,7 +220,6 @@ struct drm_xe_eudebug_vm_open {
 struct drm_xe_eudebug_event_pagefault {
 	struct drm_xe_eudebug_event base;
 
-	__u64 client_handle;
 	__u64 exec_queue_handle;
 	__u64 lrc_handle;
 	__u32 flags;
diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 0583ce8f31..2f2e82a65c 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -4,6 +4,7 @@
  */
 
 #include <fcntl.h>
+#include <dirent.h>
 #include <poll.h>
 #include <signal.h>
 #include <sys/select.h>
@@ -32,7 +33,6 @@ struct seqno_list_entry {
 struct match_dto {
 	struct drm_xe_eudebug_event *target;
 	struct igt_list_head *seqno_list;
-	uint64_t client_handle;
 	uint32_t filter;
 
 	/* store latest 'EVENT_VM_BIND' seqno */
@@ -43,17 +43,19 @@ struct match_dto {
 
 #define TOKEN_NONE  0
 #define CLIENT_PID  1
-#define CLIENT_RUN  2
-#define CLIENT_FINI 3
-#define CLIENT_STOP 4
-#define CLIENT_STAGE 5
-#define DEBUGGER_STAGE 6
+#define CLIENT_FD   2
+#define CLIENT_RUN  3
+#define CLIENT_FINI 4
+#define CLIENT_STOP 5
+#define CLIENT_STAGE 6
+#define DEBUGGER_STAGE 7
 
 static const char *token_to_str(uint64_t token)
 {
 	static const char * const s[] = {
 		"none",
 		"client pid",
+		"client fd",
 		"client run",
 		"client fini",
 		"client stop",
@@ -78,20 +80,18 @@ static const char *type_to_str(unsigned int type)
 		return "none";
 	case DRM_XE_EUDEBUG_EVENT_READ:
 		return "read";
-	case DRM_XE_EUDEBUG_EVENT_OPEN:
-		return "client";
 	case DRM_XE_EUDEBUG_EVENT_VM:
 		return "vm";
 	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE:
 		return "exec_queue";
-	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
-		return "attention";
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND:
 		return "vm_bind";
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP:
 		return "vm_bind_op";
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE:
 		return "vm_bind_ufence";
+	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION:
+		return "attention";
 	case DRM_XE_EUDEBUG_EVENT_PAGEFAULT:
 		return "pagefault";
 	}
@@ -128,42 +128,26 @@ static const char *flags_to_str(unsigned int flags)
 static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *buf)
 {
 	switch (e->type) {
-	case DRM_XE_EUDEBUG_EVENT_OPEN: {
-		struct drm_xe_eudebug_event_client *ec = igt_container_of(e, ec, base);
-
-		sprintf(buf, "handle=%llu", ec->client_handle);
-		break;
-	}
 	case DRM_XE_EUDEBUG_EVENT_VM: {
 		struct drm_xe_eudebug_event_vm *evm = igt_container_of(e, evm, base);
 
-		sprintf(buf, "client_handle=%llu, handle=%llu",
-			evm->client_handle, evm->vm_handle);
+		sprintf(buf, "vm_handle=%llu", evm->vm_handle);
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
 		struct drm_xe_eudebug_event_exec_queue *ee = igt_container_of(e, ee, base);
 
-		sprintf(buf, "client_handle=%llu, vm_handle=%llu, "
+		sprintf(buf, "vm_handle=%llu, "
 			"exec_queue_handle=%llu, engine_class=%d, exec_queue_width=%d",
-			ee->client_handle, ee->vm_handle,
+			ee->vm_handle,
 			ee->exec_queue_handle, ee->engine_class, ee->width);
 		break;
 	}
-	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION: {
-		struct drm_xe_eudebug_event_eu_attention *ea = igt_container_of(e, ea, base);
-
-		sprintf(buf, "client_handle=%llu, exec_queue_handle=%llu, "
-			"lrc_handle=%llu, bitmask_size=%d",
-			ea->client_handle, ea->exec_queue_handle,
-			ea->lrc_handle, ea->bitmask_size);
-		break;
-	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
 		struct drm_xe_eudebug_event_vm_bind *evmb = igt_container_of(e, evmb, base);
 
-		sprintf(buf, "client_handle=%llu, vm_handle=%llu, flags=0x%x, num_binds=%u",
-			evmb->client_handle, evmb->vm_handle, evmb->flags, evmb->num_binds);
+		sprintf(buf, "vm_handle=%llu, flags=0x%x, num_binds=%u",
+			evmb->vm_handle, evmb->flags, evmb->num_binds);
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
@@ -179,12 +163,21 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
 		sprintf(buf, "vm_bind_ref_seqno=%lld", f->vm_bind_ref_seqno);
 		break;
 	}
+	case DRM_XE_EUDEBUG_EVENT_EU_ATTENTION: {
+		struct drm_xe_eudebug_event_eu_attention *ea = igt_container_of(e, ea, base);
+
+		sprintf(buf, "exec_queue_handle=%llu, "
+			"lrc_handle=%llu, bitmask_size=%d",
+			ea->exec_queue_handle,
+			ea->lrc_handle, ea->bitmask_size);
+		break;
+	}
 	case DRM_XE_EUDEBUG_EVENT_PAGEFAULT: {
 		struct drm_xe_eudebug_event_pagefault *pf = igt_container_of(e, pf, base);
 
-		sprintf(buf, "client_handle=%llu, exec_queue_handle=%llu, "
+		sprintf(buf, "exec_queue_handle=%llu, "
 			"lrc_handle=%llu, bitmask_size=%d, pagefault_address=0x%llx",
-			pf->client_handle, pf->exec_queue_handle, pf->lrc_handle,
+			pf->exec_queue_handle, pf->lrc_handle,
 			pf->bitmask_size, pf->pagefault_address);
 		break;
 	}
@@ -372,15 +365,143 @@ static void client_signal(struct xe_eudebug_client *c,
 	token_signal(c->p_out, token, value);
 }
 
-static int __xe_eudebug_connect(int fd, pid_t pid, uint32_t flags, uint64_t events)
+static int open_pidfd(int tgid)
+{
+	int pidfd;
+
+	pidfd = syscall(SYS_pidfd_open, tgid, 0);
+	if (pidfd < 0) {
+		igt_warn("Failed to open pidfd for tgid=%d: %s\n", tgid, strerror(errno));
+		return -1;
+	}
+
+	return pidfd;
+}
+
+/* Helper function to acquire a file descriptor from a target process using pidfd_getfd */
+static int pidfd_getfd(int pidfd, int target_fd)
+{
+	int my_fd;
+
+	my_fd = syscall(SYS_pidfd_getfd, pidfd, target_fd, 0);
+	if (my_fd < 0) {
+		igt_warn("failed to get fd=%d for pidfd=%d: %s\n", target_fd, pidfd,
+			 strerror(errno));
+		return -1;
+	}
+
+	return my_fd;
+}
+
+static int is_drm_fd(const char *path, const char *fname)
+{
+	char line[256];
+	char fullname[4096];
+	FILE *file;
+	int is_xe = 0;
+
+	snprintf(fullname, sizeof(fullname), "%s/%s", path, fname);
+
+	file = fopen(fullname, "r");
+	if (!file) {
+		igt_debug("cannot open %s: %s\n", fullname, strerror(errno));
+		return 0;
+	}
+
+	while (fgets(line, sizeof(line), file)) {
+		if (strstr(line, "drm-driver:\txe")) {
+			is_xe = 1;
+			break;
+		}
+	}
+
+	fclose(file);
+
+	return is_xe;
+}
+
+static int scan_fdinfo_for_xe_client(pid_t pid)
+{
+	char fdinfo_dir[64];
+	DIR *dir;
+	struct dirent *entry;
+	int fd = -1;
+	int drm_fd = -1;
+
+	snprintf(fdinfo_dir, sizeof(fdinfo_dir), "/proc/%d/fdinfo", pid);
+
+	dir = opendir(fdinfo_dir);
+	if (!dir) {
+		igt_debug("failed to open %s: %s\n", fdinfo_dir, strerror(errno));
+		return -1;
+	}
+
+	/* XXX we want last fd as it is most recent */
+	while ((entry = readdir(dir))) {
+		char *endptr;
+
+		if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
+			continue;
+
+		fd = strtol(entry->d_name, &endptr, 10);
+		if (*endptr != '\0' || fd < 0) {
+			continue;
+		}
+
+		if (is_drm_fd(fdinfo_dir, entry->d_name)) {
+			igt_debug("%s is drm fd\n", entry->d_name);
+			drm_fd = fd;
+		}
+	}
+
+	closedir(dir);
+
+	return drm_fd;
+}
+
+/* Get fd for this process for pid:target_fd */
+static int get_fd_for_target(pid_t pid, int targetfd)
+{
+	int pidfd;
+	int myfd;
+
+	pidfd = open_pidfd(pid);
+	if (pidfd < 0)
+		return pidfd;
+
+	myfd = pidfd_getfd(pidfd, targetfd);
+	if (myfd < 0) {
+		close(pidfd);
+		return myfd;
+	}
+
+	igt_debug("my pid %d:%d now mapped to remote %d:%d\n",
+		  getpid(), myfd,
+		  pid, targetfd);
+
+	return myfd;
+}
+
+int xe_eudebug_fd_for_pid(pid_t pid)
+{
+	int client_fd;
+
+	client_fd = scan_fdinfo_for_xe_client(pid);
+	if (client_fd < 0)
+		return client_fd;
+
+	return get_fd_for_target(pid, client_fd);
+}
+
+static int __xe_eudebug_connect_fd(int my_fd, int target_fd, uint32_t flags)
 {
 	struct drm_xe_eudebug_connect param = {
-		.pid = pid,
 		.flags = flags,
+		.fd = target_fd,
 	};
 	int debugfd;
 
-	debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
+	debugfd = igt_ioctl(my_fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
 
 	if (debugfd < 0)
 		return -errno;
@@ -500,40 +621,20 @@ static int match_client_handle(struct drm_xe_eudebug_event *e, void *data)
 	struct match_dto *md = data;
 	uint64_t *bind_seqno = md->bind_seqno;
 	uint64_t *bind_op_seqno = md->bind_op_seqno;
-	uint64_t h = md->client_handle;
 
 	if (XE_EUDEBUG_EVENT_IS_FILTERED(e->type, md->filter))
 		return 0;
 
 	switch (e->type) {
-	case DRM_XE_EUDEBUG_EVENT_OPEN: {
-		struct drm_xe_eudebug_event_client *client = igt_container_of(e, client, base);
-
-		if (client->client_handle == h)
-			return 1;
-		break;
-	}
-	case DRM_XE_EUDEBUG_EVENT_VM: {
-		struct drm_xe_eudebug_event_vm *vm = igt_container_of(e, vm, base);
-
-		if (vm->client_handle == h)
-			return 1;
-		break;
-	}
-	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE: {
-	struct drm_xe_eudebug_event_exec_queue *ee = igt_container_of(e, ee, base);
+	case DRM_XE_EUDEBUG_EVENT_VM:
+	case DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE:
+		return 1;
 
-		if (ee->client_handle == h)
-			return 1;
-		break;
-	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND: {
 		struct drm_xe_eudebug_event_vm_bind *evmb = igt_container_of(e, evmb, base);
 
-		if (evmb->client_handle == h) {
-			*bind_seqno = evmb->base.seqno;
-			return 1;
-		}
+		*bind_seqno = evmb->base.seqno;
+		return 1;
 		break;
 	}
 	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP: {
@@ -574,14 +675,6 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 		return 0;
 
 	switch (e->type) {
-	case DRM_XE_EUDEBUG_EVENT_OPEN: {
-		struct drm_xe_eudebug_event_client *client = igt_container_of(e, client, base);
-		struct drm_xe_eudebug_event_client *filter = data;
-
-		if (client->client_handle == filter->client_handle)
-			return 1;
-		break;
-	}
 	case DRM_XE_EUDEBUG_EVENT_VM: {
 		struct drm_xe_eudebug_event_vm *vm = igt_container_of(e, vm, base);
 		struct drm_xe_eudebug_event_vm *filter = data;
@@ -625,7 +718,6 @@ static int match_opposite_resource(struct drm_xe_eudebug_event *e, void *data)
 static int match_full(struct drm_xe_eudebug_event *e, void *data)
 {
 	struct seqno_list_entry *sl;
-
 	struct match_dto *md = (void *)data;
 	int ret = 0;
 
@@ -655,14 +747,12 @@ event_type_match(struct xe_eudebug_event_log *l,
 
 static struct drm_xe_eudebug_event *
 client_match(struct xe_eudebug_event_log *l,
-	     uint64_t client_handle,
 	     struct drm_xe_eudebug_event *current,
 	     uint32_t filter,
 	     uint64_t *bind_seqno,
 	     uint64_t *bind_op_seqno)
 {
 	struct match_dto md = {
-		.client_handle = client_handle,
 		.filter = filter,
 		.bind_seqno = bind_seqno,
 		.bind_op_seqno = bind_op_seqno,
@@ -682,14 +772,12 @@ opposite_event_match(struct xe_eudebug_event_log *l,
 static struct drm_xe_eudebug_event *
 event_match(struct xe_eudebug_event_log *l,
 	    struct drm_xe_eudebug_event *target,
-	    uint64_t client_handle,
 	    struct igt_list_head *seqno_list,
 	    uint64_t *bind_seqno,
 	    uint64_t *bind_op_seqno)
 {
 	struct match_dto md = {
 		.target = target,
-		.client_handle = client_handle,
 		.seqno_list = seqno_list,
 		.bind_seqno = bind_seqno,
 		.bind_op_seqno = bind_op_seqno,
@@ -698,40 +786,32 @@ event_match(struct xe_eudebug_event_log *l,
 	return event_cmp(l, NULL, match_full, &md);
 }
 
-static void compare_client(struct xe_eudebug_event_log *log1, struct drm_xe_eudebug_event *ev1,
-			   struct xe_eudebug_event_log *log2, struct drm_xe_eudebug_event *ev2,
+static void compare_client(struct xe_eudebug_event_log *log1,
+			   struct xe_eudebug_event_log *log2,
 			   uint32_t filter)
 {
-	struct drm_xe_eudebug_event_client *ev1_client = igt_container_of(ev1, ev1_client, base);
-	struct drm_xe_eudebug_event_client *ev2_client = igt_container_of(ev2, ev2_client, base);
 	uint64_t cbs = 0, dbs = 0, cbso = 0, dbso = 0;
 
 	struct igt_list_head matched_seqno_list;
 	struct drm_xe_eudebug_event *evptr1, *evptr2;
 	struct seqno_list_entry *entry, *tmp;
 
-	igt_assert(ev1_client);
-	igt_assert(ev2_client);
-
-	igt_debug("client: %llu -> %llu\n", ev1_client->client_handle, ev2_client->client_handle);
-
 	evptr1 = NULL;
 	evptr2 = NULL;
 	IGT_INIT_LIST_HEAD(&matched_seqno_list);
 
 	do {
-		evptr1 = client_match(log1, ev1_client->client_handle, evptr1, filter, &cbs, &cbso);
+		evptr1 = client_match(log1, evptr1, filter, &cbs, &cbso);
 		if (!evptr1)
 			break;
 
-		evptr2 = event_match(log2, evptr1, ev2_client->client_handle, &matched_seqno_list,
+		evptr2 = event_match(log2, evptr1, &matched_seqno_list,
 				     &dbs, &dbso);
 
-		igt_assert_f(evptr2, "%s (%llu): no matching event type %u found for client %llu\n",
+		igt_assert_f(evptr2, "%s (%llu): no matching event type %u found for client\n",
 			     log1->name,
 			     evptr1->seqno,
-			     evptr1->type,
-			     ev1_client->client_handle);
+			     evptr1->type);
 
 		igt_debug("comparing %s %llu vs %s %llu\n",
 			  log1->name, evptr1->seqno, log2->name, evptr2->seqno);
@@ -828,26 +908,6 @@ static void event_log_sort(struct xe_eudebug_event_log *l)
 	xe_eudebug_event_log_destroy(tmp);
 }
 
-/**
- * xe_eudebug_connect:
- * @fd: Xe file descriptor
- * @pid: client PID
- * @flags: connection flags
- *
- * Opens the xe eu debugger connection to the process described by @pid
- *
- * Returns: 0 if the debugger was successfully attached, -errno otherwise.
- */
-int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags)
-{
-	int ret;
-	uint64_t events = 0; /* events filtering not supported yet! */
-
-	ret = __xe_eudebug_connect(fd, pid, flags, events);
-
-	return ret;
-}
-
 /**
  * xe_eudebug_event_log_create:
  * @name: event log identifier
@@ -944,8 +1004,7 @@ xe_eudebug_event_log_print(struct xe_eudebug_event_log *l, bool debug)
  * @a: event log pointer
  * @b: event log pointer
  * @filter: mask that represents events to be skipped during comparison, useful
- * for events like 'VM_BIND' since they can be asymmetric. Note that
- * 'DRM_XE_EUDEBUG_EVENT_OPEN' will always be matched.
+ * for events like 'VM_BIND' since they can be asymmetric.
  *
  * Compares and asserts event logs @a, @b if the event
  * sequence matches.
@@ -955,7 +1014,6 @@ void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *log1,
 				  uint32_t filter)
 {
 	struct drm_xe_eudebug_event *ev1 = NULL;
-	struct drm_xe_eudebug_event *ev2 = NULL;
 
 	igt_assert(log1);
 	igt_assert(log2);
@@ -966,21 +1024,20 @@ void xe_eudebug_event_log_compare(struct xe_eudebug_event_log *log1,
 	}
 
 	xe_eudebug_for_each_event(ev1, log1) {
+		struct drm_xe_eudebug_event *ev2 = NULL;
+
 		if (XE_EUDEBUG_EVENT_IS_FILTERED(ev1->type, filter))
 			continue;
 
-		if (ev1->type == DRM_XE_EUDEBUG_EVENT_OPEN &&
-		    ev1->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
-			ev2 = event_type_match(log2, ev1, ev2);
-			if (!ev2)
-				igt_debug("match failed to find type %d, seqno %llu\n",
-					  ev1->type, ev1->seqno);
+		ev2 = event_type_match(log2, ev1, ev2);
+		if (!ev2)
+			igt_debug("match failed to find type %d, seqno %llu\n",
+				  ev1->type, ev1->seqno);
 
-			igt_assert(ev2);
+		igt_assert(ev2);
 
-			compare_client(log1, ev1, log2, ev2, filter);
-			compare_client(log2, ev2, log1, ev1, filter);
-		}
+		compare_client(log1, log2, filter);
+		compare_client(log2, log1, filter);
 	}
 }
 
@@ -1164,9 +1221,10 @@ out:
  */
 bool xe_eudebug_debugger_available(int fd)
 {
-	struct drm_xe_eudebug_connect param = { .pid = getpid() };
+	struct drm_xe_eudebug_connect param = { 0, };
 	int debugfd;
 
+	param.fd = fd;
 	debugfd = igt_ioctl(fd, DRM_IOCTL_XE_EUDEBUG_CONNECT, &param);
 	if (debugfd >= 0)
 		close(debugfd);
@@ -1237,12 +1295,35 @@ void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d)
 	free(d);
 }
 
+/**
+ * xe_eudebug_connect:
+ * @master_fd: Xe client used to open the debugger connection
+ * @target_fd: fd of the Xe client to connect to
+ * @target_pid: pid of the owner of target_fd
+ * @flags: optional connection flags
+ *
+ * Opens a Xe EU debugger connection to the Xe client described by target_pid and target_fd.
+ *
+ * Returns: a valid debugger fd if the debugger was successfully attached, -errno otherwise.
+ */
+int __xe_eudebug_connect(int master_fd, int target_fd, pid_t target_pid, int flags)
+{
+	int myfd;
+
+	myfd = get_fd_for_target(target_pid, target_fd);
+	igt_assert(myfd > 0);
+
+	return __xe_eudebug_connect_fd(master_fd, myfd, flags);
+}
+
 /**
  * xe_eudebug_debugger_attach:
  * @d: pointer to the debugger
  * @c: pointer to the client
  *
- * Opens the xe eu debugger connection to the process described by @c (c->pid)
+ * Opens a Xe EU debugger connection to the Xe client described by @c. Asserts that the debugger
+ * pointed by @d has no active session and that @c is valid. Logically associates the debugger
+ * instance pointed by @d with the client pointed by @c.
  *
  * Returns: 0 if the debugger was successfully attached, -errno otherwise.
  */
@@ -1253,13 +1334,14 @@ int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d,
 
 	igt_assert_eq(d->fd, -1);
 	igt_assert_neq(c->pid, 0);
-	ret = xe_eudebug_connect(d->master_fd, c->pid, 0);
+	igt_assert(c->fd > 0);
 
-	if (ret < 0)
-		return ret;
+	ret = __xe_eudebug_connect(d->master_fd, c->fd, c->pid, 0);
+	igt_assert(ret > 0);
 
 	d->fd = ret;
 	d->target_pid = c->pid;
+	d->target_fd = c->fd;
 	d->p_client[0] = c->p_in[0];
 	d->p_client[1] = c->p_in[1];
 
@@ -1280,6 +1362,7 @@ void xe_eudebug_debugger_detach(struct xe_eudebug_debugger *d)
 	igt_assert(d->target_pid);
 	close(d->fd);
 	d->target_pid = 0;
+	d->target_fd = -1;
 	d->fd = -1;
 }
 
@@ -1487,8 +1570,15 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
 		close(c->p_in[1]);
 		c->p_in[1] = -1;
 
+		/* XXX drm_open_driver dont allow skips from fork */
+		c->fd = drm_open_driver(DRIVER_XE);
+		igt_assert(c->fd > 0);
+
+		xe_device_get(c->fd);
+
 		mypid = getpid();
 		client_signal(c, CLIENT_PID, mypid);
+		client_signal(c, CLIENT_FD, c->fd);
 
 		c->pid = client_wait_token(c, CLIENT_RUN);
 		igt_assert_eq(c->pid, mypid);
@@ -1498,6 +1588,7 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
 		work(c);
 		igt_debug("client: work end\n");
 
+		xe_device_put(c->fd);
 		client_signal(c, CLIENT_FINI, c->seqno);
 
 		event_log_write_to_fd(c->log, c->p_out[1]);
@@ -1512,8 +1603,9 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
 	c->p_in[0] = -1;
 
 	c->pid = wait_from_client(c, CLIENT_PID);
+	c->fd = wait_from_client(c, CLIENT_FD);
 
-	igt_info("client running with pid %d\n", c->pid);
+	igt_info("client %d with running with pid %d\n", c->fd, c->pid);
 
 	return c;
 }
@@ -1746,31 +1838,19 @@ static void base_event(struct xe_eudebug_client *c,
 	e->len = size;
 }
 
-static void client_event(struct xe_eudebug_client *c, uint32_t flags, int client_fd)
-{
-	struct drm_xe_eudebug_event_client ec;
-
-	base_event(c, to_base(ec), DRM_XE_EUDEBUG_EVENT_OPEN, flags, sizeof(ec));
-
-	ec.client_handle = client_fd;
-
-	xe_eudebug_event_log_write(c->log, (void *)&ec);
-}
-
-static void vm_event(struct xe_eudebug_client *c, uint32_t flags, int client_fd, uint32_t vm_id)
+static void vm_event(struct xe_eudebug_client *c, uint32_t flags, uint32_t vm_id)
 {
 	struct drm_xe_eudebug_event_vm evm;
 
 	base_event(c, to_base(evm), DRM_XE_EUDEBUG_EVENT_VM, flags, sizeof(evm));
 
-	evm.client_handle = client_fd;
 	evm.vm_handle = vm_id;
 
 	xe_eudebug_event_log_write(c->log, (void *)&evm);
 }
 
 static void exec_queue_event(struct xe_eudebug_client *c, uint32_t flags,
-			     int client_fd, uint32_t vm_id,
+			     uint32_t vm_id,
 			     uint32_t exec_queue_handle, uint16_t class,
 			     uint16_t width)
 {
@@ -1779,7 +1859,6 @@ static void exec_queue_event(struct xe_eudebug_client *c, uint32_t flags,
 	base_event(c, to_base(ee), DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 		   flags, sizeof(ee));
 
-	ee.client_handle = client_fd;
 	ee.vm_handle = vm_id;
 	ee.exec_queue_handle = exec_queue_handle;
 	ee.engine_class = class;
@@ -1863,47 +1942,9 @@ bool xe_eudebug_enable(int fd, bool enable)
 	return old;
 }
 
-/* Eu debugger wrappers around resource creating xe ioctls. */
-
-/**
- * xe_eudebug_client_open_driver:
- * @c: pointer to xe_eudebug_client structure
- *
- * Calls drm_open_client(DRIVER_XE) and logs the corresponding
- * event in client's event log.
- *
- * Returns: valid DRM file descriptor
- */
-int xe_eudebug_client_open_driver(struct xe_eudebug_client *c)
-{
-	int fd;
-
-	igt_assert(c);
-	fd = drm_reopen_driver(c->master_fd);
-	client_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd);
-
-	return fd;
-}
-
-/**
- * xe_eudebug_client_close_driver:
- * @c: pointer to xe_eudebug_client structure
- * @fd: xe client
- *
- * Calls close driver and logs the corresponding event in
- * client's event log.
- */
-void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd)
-{
-	igt_assert(c);
-	client_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd);
-	drm_close_driver(fd);
-}
-
 /**
  * xe_eudebug_client_vm_create:
  * @c: pointer to xe_eudebug_client structure
- * @fd: xe client
  * @flags: vm bind flags
  * @ext: pointer to the first user extension
  *
@@ -1911,14 +1952,14 @@ void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd)
  *
  * Returns: valid vm handle
  */
-uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
+uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c,
 				     uint32_t flags, uint64_t ext)
 {
 	uint32_t vm;
 
 	igt_assert(c);
-	vm = xe_vm_create(fd, flags, ext);
-	vm_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, vm);
+	vm = xe_vm_create(c->fd, flags, ext);
+	vm_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, vm);
 
 	return vm;
 }
@@ -1926,23 +1967,21 @@ uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
 /**
  * xe_eudebug_client_vm_destroy:
  * @c: pointer to xe_eudebug_client structure
- * fd: xe client
  * vm: vm handle
  *
  * Calls xe_vm_destroy() and logs the corresponding event in
  * client's event log.
  */
-void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, int fd, uint32_t vm)
+void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, uint32_t vm)
 {
 	igt_assert(c);
-	xe_vm_destroy(fd, vm);
-	vm_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, vm);
+	xe_vm_destroy(c->fd, vm);
+	vm_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, vm);
 }
 
 /**
  * xe_eudebug_client_exec_queue_create:
  * @c: pointer to xe_eudebug_client structure
- * @fd: xe client
  * @create: exec_queue create drm struct
  *
  * Calls xe exec queue create ioctl and logs the corresponding event in
@@ -1950,7 +1989,7 @@ void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, int fd, uint32_t
  *
  * Returns: valid exec queue handle
  */
-uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd,
+uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c,
 					     struct drm_xe_exec_queue_create *create)
 {
 	struct drm_xe_engine_class_instance *instances;
@@ -1964,7 +2003,7 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
 	instances = from_user_pointer(create->instances);
 	class = instances[0].engine_class;
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, create), 0);
+	igt_assert_eq(igt_ioctl(c->fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, create), 0);
 
 	for (ext = from_user_pointer(create->extensions); ext;
 	     ext = from_user_pointer(ext->base.next_extension))
@@ -1974,7 +2013,7 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
 			send = true;
 
 	if (send)
-		exec_queue_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, fd, create->vm_id,
+		exec_queue_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, create->vm_id,
 				 create->exec_queue_id, class, create->width);
 
 	return create->exec_queue_id;
@@ -1983,13 +2022,12 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
 /**
  * xe_eudebug_client_exec_queue_destroy:
  * @c: pointer to xe_eudebug_client structure
- * @fd: xe client
  * @create: exec_queue create drm struct which was used for creation
  *
  * Calls xe exec_queue destroy ioctl and logs the corresponding event in
  * client's event log.
  */
-void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
+void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c,
 					  struct drm_xe_exec_queue_create *create)
 {
 	struct drm_xe_engine_class_instance *instances;
@@ -2013,17 +2051,16 @@ void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
 			send = true;
 
 	if (send)
-		exec_queue_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, fd, create->vm_id,
+		exec_queue_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, create->vm_id,
 				 create->exec_queue_id, class, create->width);
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy), 0);
+	igt_assert_eq(igt_ioctl(c->fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy), 0);
 }
 
 /**
  * xe_eudebug_client_vm_bind_event:
  * @c: pointer to xe_eudebug_client structure
  * @event_flags: base event flags
- * @fd: xe client
  * @vm: vm handle
  * @bind_flags: bind flags of vm_bind_event
  * @num_binds: number of bind (operations) for event
@@ -2031,7 +2068,7 @@ void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
  * Logs vm bind event in client's event log.
  */
 void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c,
-				     uint32_t event_flags, int fd,
+				     uint32_t event_flags,
 				     uint32_t vm, uint32_t bind_flags,
 				     uint32_t num_binds, u64 *ref_seqno)
 {
@@ -2042,7 +2079,6 @@ void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c,
 
 	base_event(c, to_base(evmb), DRM_XE_EUDEBUG_EVENT_VM_BIND,
 		   event_flags, sizeof(evmb));
-	evmb.client_handle = fd;
 	evmb.vm_handle = vm;
 	evmb.flags = bind_flags;
 	evmb.num_binds = num_binds;
@@ -2118,7 +2154,7 @@ static bool has_user_fence(const struct drm_xe_sync *sync, uint32_t num_syncs)
 }
 
 static int  __xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
-					int fd, uint32_t vm, uint32_t exec_queue,
+					uint32_t vm, uint32_t exec_queue,
 					uint32_t bo, uint64_t offset,
 					uint64_t addr, uint64_t size,
 					uint32_t op, uint32_t flags,
@@ -2148,7 +2184,7 @@ static int  __xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
 		break;
 	}
 
-	ret = ___xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
+	ret = ___xe_vm_bind(c->fd, vm, exec_queue, bo, offset, addr, size,
 			    op, flags, sync, num_syncs, prefetch_region,
 			    pat_index, 0, op_ext);
 
@@ -2159,7 +2195,7 @@ static int  __xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
 		return -EINVAL;
 
 	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
-					fd, vm, bind_flags, 1, &seqno);
+					vm, bind_flags, 1, &seqno);
 	xe_eudebug_client_vm_bind_op_event(c, bind_base_flags,
 					   seqno, &op_seqno, addr, size, 0);
 
@@ -2170,7 +2206,7 @@ static int  __xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
 	return ret;
 }
 
-static void _xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd,
+static void _xe_eudebug_client_vm_bind(struct xe_eudebug_client *c,
 				       uint32_t vm, uint32_t bo,
 				       uint64_t offset, uint64_t addr, uint64_t size,
 				       uint32_t op,
@@ -2182,7 +2218,7 @@ static void _xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd,
 	const uint32_t exec_queue_id = 0;
 	const uint32_t prefetch_region = 0;
 
-	igt_assert_eq(__xe_eudebug_client_vm_bind(c, fd, vm, exec_queue_id, bo, offset,
+	igt_assert_eq(__xe_eudebug_client_vm_bind(c, vm, exec_queue_id, bo, offset,
 						  addr, size, op, flags,
 						  sync, num_syncs, prefetch_region,
 						  DEFAULT_PAT_INDEX, op_ext),
@@ -2192,7 +2228,6 @@ static void _xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd,
 /**
  * xe_eudebug_client_vm_bind_flags
  * @c: pointer to xe_eudebug_client structure
- * @fd: xe client
  * @vm: vm handle
  * @bo: buffer object handle
  * @offset: offset within buffer object
@@ -2205,14 +2240,14 @@ static void _xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd,
  *
  * Calls xe vm_bind ioctl and logs the corresponding event in client's event log.
  */
-void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd, uint32_t vm,
+void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, uint32_t vm,
 				     uint32_t bo, uint64_t offset,
 				     uint64_t addr, uint64_t size, uint32_t flags,
 				     struct drm_xe_sync *sync, uint32_t num_syncs,
 				     uint64_t op_ext)
 {
 	igt_assert(c);
-	_xe_eudebug_client_vm_bind(c, fd, vm, bo, offset, addr, size,
+	_xe_eudebug_client_vm_bind(c, vm, bo, offset, addr, size,
 				   DRM_XE_VM_BIND_OP_MAP, flags,
 				   sync, num_syncs, op_ext);
 }
@@ -2220,7 +2255,6 @@ void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd, uint32
 /**
  * xe_eudebug_client_vm_bind
  * @c: pointer to xe_eudebug_client structure
- * @fd: xe client
  * @vm: vm handle
  * @bo: buffer object handle
  * @offset: offset within buffer object
@@ -2229,7 +2263,7 @@ void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd, uint32
  *
  * Calls xe vm_bind ioctl and logs the corresponding event in client's event log.
  */
-void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd, uint32_t vm,
+void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, uint32_t vm,
 			       uint32_t bo, uint64_t offset,
 			       uint64_t addr, uint64_t size)
 {
@@ -2238,14 +2272,13 @@ void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd, uint32_t vm,
 	const uint32_t num_syncs = 0;
 	const uint64_t op_ext = 0;
 
-	xe_eudebug_client_vm_bind_flags(c, fd, vm, bo, offset, addr, size, flags, sync, num_syncs,
+	xe_eudebug_client_vm_bind_flags(c, vm, bo, offset, addr, size, flags, sync, num_syncs,
 					op_ext);
 }
 
 /**
  * xe_eudebug_client_vm_unbind_flags
  * @c: pointer to xe_eudebug_client structure
- * @fd: xe client
  * @vm: vm handle
  * @offset: offset
  * @addr: ppgtt address
@@ -2256,13 +2289,13 @@ void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd, uint32_t vm,
  *
  * Calls xe vm_unbind ioctl and logs the corresponding event in client's event log.
  */
-void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int fd,
+void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c,
 				       uint32_t vm, uint64_t offset,
 				       uint64_t addr, uint64_t size, uint32_t flags,
 				       struct drm_xe_sync *sync, uint32_t num_syncs)
 {
 	igt_assert(c);
-	_xe_eudebug_client_vm_bind(c, fd, vm, 0, offset, addr, size,
+	_xe_eudebug_client_vm_bind(c, vm, 0, offset, addr, size,
 				   DRM_XE_VM_BIND_OP_UNMAP, flags,
 				   sync, num_syncs, 0);
 }
@@ -2270,7 +2303,6 @@ void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int fd,
 /**
  * xe_eudebug_client_vm_unbind
  * @c: pointer to xe_eudebug_client structure
- * @fd: xe client
  * @vm: vm handle
  * @offset: offset
  * @addr: ppgtt address
@@ -2278,14 +2310,14 @@ void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int fd,
  *
  * Calls xe vm_unbind ioctl and logs the corresponding event in client's event log.
  */
-void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd, uint32_t vm,
+void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, uint32_t vm,
 				 uint64_t offset, uint64_t addr, uint64_t size)
 {
 	const uint32_t flags = 0;
 	struct drm_xe_sync *sync = NULL;
 	const uint32_t num_syncs = 0;
 
-	xe_eudebug_client_vm_unbind_flags(c, fd, vm, offset, addr, size,
+	xe_eudebug_client_vm_unbind_flags(c, vm, offset, addr, size,
 					  flags, sync, num_syncs);
 }
 
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 0706023121..ea7b320a27 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -38,6 +38,7 @@ struct xe_eudebug_debugger {
 	uint64_t event_count;
 
 	uint64_t target_pid;
+	int target_fd;
 
 	struct igt_list_head triggers;
 
@@ -54,6 +55,7 @@ struct xe_eudebug_debugger {
 };
 
 struct xe_eudebug_client {
+	int fd;
 	int pid;
 	uint64_t seqno;
 	uint64_t flags;
@@ -162,7 +164,6 @@ next_event(struct drm_xe_eudebug_event *e, struct xe_eudebug_event_log *l)
 
 #define XE_EUDEBUG_FILTER_EVENT_NONE			BIT(DRM_XE_EUDEBUG_EVENT_NONE)
 #define XE_EUDEBUG_FILTER_EVENT_READ			BIT(DRM_XE_EUDEBUG_EVENT_READ)
-#define XE_EUDEBUG_FILTER_EVENT_OPEN			BIT(DRM_XE_EUDEBUG_EVENT_OPEN)
 #define XE_EUDEBUG_FILTER_EVENT_VM			BIT(DRM_XE_EUDEBUG_EVENT_VM)
 #define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE		BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
 #define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE_PLACEMENTS	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS)
@@ -174,7 +175,7 @@ next_event(struct drm_xe_eudebug_event *e, struct xe_eudebug_event_log *l)
 #define XE_EUDEBUG_FILTER_ALL				GENMASK(DRM_XE_EUDEBUG_EVENT_PAGEFAULT, 0)
 #define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)		((1UL << (_e)) & (_f))
 
-int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags);
+int xe_eudebug_fd_for_pid(pid_t pid);
 const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e, char *buf, size_t len);
 struct drm_xe_eudebug_event *
 xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t seqno);
@@ -191,6 +192,7 @@ bool xe_eudebug_debugger_available(int fd);
 struct xe_eudebug_debugger *
 xe_eudebug_debugger_create(int xe, uint64_t flags, void *data);
 void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d);
+int __xe_eudebug_connect(int master_fd, int target_fd, pid_t target_pid, int flags);
 int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, struct xe_eudebug_client *c);
 void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d);
 void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d);
@@ -219,16 +221,14 @@ void xe_eudebug_client_set_data(struct xe_eudebug_client *c, void *ptr);
 int __xe_eudebug_enable_getset(int fd, bool *old, bool *new);
 bool xe_eudebug_enable(int fd, bool enable);
 
-int xe_eudebug_client_open_driver(struct xe_eudebug_client *c);
-void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd);
-uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
+uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c,
 				     uint32_t flags, uint64_t ext);
-void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, int fd, uint32_t vm);
-uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd,
+void xe_eudebug_client_vm_destroy(struct xe_eudebug_client *c, uint32_t vm);
+uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c,
 					     struct drm_xe_exec_queue_create *create);
-void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
+void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c,
 					  struct drm_xe_exec_queue_create *create);
-void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c, uint32_t event_flags, int fd,
+void xe_eudebug_client_vm_bind_event(struct xe_eudebug_client *c, uint32_t event_flags,
 				     uint32_t vm, uint32_t bind_flags,
 				     uint32_t num_ops, uint64_t *ref_seqno);
 void xe_eudebug_client_vm_bind_op_event(struct xe_eudebug_client *c, uint32_t event_flags,
@@ -240,19 +240,19 @@ void xe_eudebug_client_vm_bind_ufence_event(struct xe_eudebug_client *c, uint32_
 void xe_eudebug_ack_ufence(int debugfd,
 			   const struct drm_xe_eudebug_event_vm_bind_ufence *f);
 
-void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, int fd, uint32_t vm,
+void xe_eudebug_client_vm_bind_flags(struct xe_eudebug_client *c, uint32_t vm,
 				     uint32_t bo, uint64_t offset,
 				     uint64_t addr, uint64_t size, uint32_t flags,
 				     struct drm_xe_sync *sync, uint32_t num_syncs,
 				     uint64_t op_ext);
-void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, int fd, uint32_t vm,
+void xe_eudebug_client_vm_bind(struct xe_eudebug_client *c, uint32_t vm,
 			       uint32_t bo, uint64_t offset,
 			       uint64_t addr, uint64_t size);
-void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c, int fd,
+void xe_eudebug_client_vm_unbind_flags(struct xe_eudebug_client *c,
 				       uint32_t vm, uint64_t offset,
 				       uint64_t addr, uint64_t size, uint32_t flags,
 				       struct drm_xe_sync *sync, uint32_t num_syncs);
-void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, int fd, uint32_t vm,
+void xe_eudebug_client_vm_unbind(struct xe_eudebug_client *c, uint32_t vm,
 				 uint64_t offset, uint64_t addr, uint64_t size);
 
 struct xe_eudebug_session *xe_eudebug_session_create(int fd,
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 55539638f0..8d673b68bb 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -71,17 +71,17 @@ static void test_sysfs_toggle(int fd)
 
 #define BO_ADDR 0x1a0000
 
-static void basic_vm_bind_client(int fd, struct xe_eudebug_client *c)
+static void basic_vm_bind_client(struct xe_eudebug_client *c)
 {
 	struct drm_xe_vm_bind_op_ext_attach_debug *ext = NULL;
-	uint32_t vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-	size_t bo_size = xe_get_default_alignment(fd);
+	uint32_t vm = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	size_t bo_size = xe_get_default_alignment(c->fd);
 	bool test_discovery = c->flags & TEST_DISCOVERY;
-	uint32_t bo = xe_bo_create(fd, 0, bo_size,
-				   system_memory(fd), 0);
+	uint32_t bo = xe_bo_create(c->fd, 0, bo_size,
+				   system_memory(c->fd), 0);
 	uint64_t addr = 0x1a0000;
 
-	xe_eudebug_client_vm_bind_flags(c, fd, vm, bo, 0, addr,
+	xe_eudebug_client_vm_bind_flags(c, vm, bo, 0, addr,
 					bo_size, 0, NULL, 0, to_user_pointer(ext));
 
 	if (test_discovery) {
@@ -89,37 +89,37 @@ static void basic_vm_bind_client(int fd, struct xe_eudebug_client *c)
 		xe_eudebug_client_wait_stage(c, STAGE_DISCOVERY_DONE);
 	}
 
-	xe_eudebug_client_vm_unbind(c, fd, vm, 0, addr, bo_size);
+	xe_eudebug_client_vm_unbind(c, vm, 0, addr, bo_size);
 
-	gem_close(fd, bo);
-	xe_eudebug_client_vm_destroy(c, fd, vm);
+	gem_close(c->fd, bo);
+	xe_eudebug_client_vm_destroy(c, vm);
 }
 
-static void basic_vm_bind_vm_destroy_client(int fd, struct xe_eudebug_client *c)
+static void basic_vm_bind_vm_destroy_client(struct xe_eudebug_client *c)
 {
-	uint32_t vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-	size_t bo_size = xe_get_default_alignment(fd);
+	uint32_t vm = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	size_t bo_size = xe_get_default_alignment(c->fd);
 	bool test_discovery = c->flags & TEST_DISCOVERY;
-	uint32_t bo = xe_bo_create(fd, 0, bo_size,
-				   system_memory(fd), 0);
+	uint32_t bo = xe_bo_create(c->fd, 0, bo_size,
+				   system_memory(c->fd), 0);
 	uint64_t addr = 0x1a0000;
 
 	if (test_discovery) {
-		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+		vm = xe_vm_create(c->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 
-		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, NULL, 0);
+		xe_vm_bind_async(c->fd, vm, 0, bo, 0, addr, bo_size, NULL, 0);
 
-		xe_vm_destroy(fd, vm);
+		xe_vm_destroy(c->fd, vm);
 
 		xe_eudebug_client_signal_stage(c, STAGE_PRE_DEBUG_RESOURCES_DONE);
 		xe_eudebug_client_wait_stage(c, STAGE_DISCOVERY_DONE);
 	} else {
-		vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-		xe_eudebug_client_vm_bind(c, fd, vm, bo, 0, addr, bo_size);
-		xe_eudebug_client_vm_destroy(c, fd, vm);
+		vm = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+		xe_eudebug_client_vm_bind(c, vm, bo, 0, addr, bo_size);
+		xe_eudebug_client_vm_destroy(c, vm);
 	}
 
-	gem_close(fd, bo);
+	gem_close(c->fd, bo);
 }
 
 #define BO_ITEMS 4096
@@ -131,7 +131,6 @@ union buf_id {
 };
 
 struct bind_list {
-	int fd;
 	uint32_t vm;
 	union buf_id *bo;
 	struct drm_xe_vm_bind_op *bind_ops;
@@ -217,7 +216,6 @@ static struct bind_list *create_bind_list(int fd, uint32_t bo_placement,
 	struct bind_list *bl;
 
 	bl = malloc(sizeof(*bl));
-	bl->fd = fd;
 	bl->vm = vm;
 	bl->bo = vm_create_objects(fd, bo_placement, vm, bo_size, n);
 	bl->n = n;
@@ -263,16 +261,16 @@ static void do_bind_list(struct xe_eudebug_client *c,
 	int i;
 
 	if (sync) {
-		fence_data = aligned_alloc(xe_get_default_alignment(bl->fd),
+		fence_data = aligned_alloc(xe_get_default_alignment(c->fd),
 					   sizeof(*fence_data));
 		igt_assert(fence_data);
 		uf_sync.addr = to_user_pointer(fence_data);
 		memset(fence_data, 0, sizeof(*fence_data));
 	}
 
-	xe_vm_bind_array(bl->fd, bl->vm, 0, bl->bind_ops, bl->n, &uf_sync, sync ? 1 : 0);
+	xe_vm_bind_array(c->fd, bl->vm, 0, bl->bind_ops, bl->n, &uf_sync, sync ? 1 : 0);
 	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
-					bl->fd, bl->vm, 0, bl->n, &ref_seqno);
+					bl->vm, 0, bl->n, &ref_seqno);
 	for (i = 0; i < bl->n; i++)
 		xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_CREATE,
 						   ref_seqno,
@@ -282,7 +280,7 @@ static void do_bind_list(struct xe_eudebug_client *c,
 						   0);
 
 	if (sync) {
-		xe_wait_ufence(bl->fd, fence_data, uf_sync.timeline_value, 0,
+		xe_wait_ufence(c->fd, fence_data, uf_sync.timeline_value, 0,
 			       XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC);
 		free(fence_data);
 	}
@@ -295,10 +293,10 @@ static void free_bind_list(struct xe_eudebug_client *c, struct bind_list *bl)
 	for (i = 0; i < bl->n; i++) {
 		igt_debug("%d: checking 0x%llx (%lld)\n",
 			  i, bl->bind_ops[i].addr, bl->bind_ops[i].addr);
-		bo_check(bl->fd, &bl->bind_ops[i]);
+		bo_check(c->fd, &bl->bind_ops[i]);
 		if (bl->bind_ops[i].op == DRM_XE_VM_BIND_OP_MAP_USERPTR)
 			free(bl->bo[i].userptr);
-		xe_eudebug_client_vm_unbind(c, bl->fd, bl->vm, 0,
+		xe_eudebug_client_vm_unbind(c, bl->vm, 0,
 					    bl->bind_ops[i].addr,
 					    bl->bind_ops[i].range);
 	}
@@ -308,38 +306,38 @@ static void free_bind_list(struct xe_eudebug_client *c, struct bind_list *bl)
 	free(bl);
 }
 
-static void vm_bind_client(int fd, struct xe_eudebug_client *c)
+static void vm_bind_client(struct xe_eudebug_client *c)
 {
 	uint64_t op_ref_seqno, ref_seqno;
 	struct bind_list *bl;
 	bool test_discovery = c->flags & TEST_DISCOVERY;
-	size_t bo_size = 3 * xe_get_default_alignment(fd);
+	size_t bo_size = 3 * xe_get_default_alignment(c->fd);
 	uint32_t bo[2] = {
-		xe_bo_create(fd, 0, bo_size, system_memory(fd), 0),
-		xe_bo_create(fd, 0, bo_size, system_memory(fd), 0),
+		xe_bo_create(c->fd, 0, bo_size, system_memory(c->fd), 0),
+		xe_bo_create(c->fd, 0, bo_size, system_memory(c->fd), 0),
 	};
-	uint32_t vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	uint32_t vm = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	uint64_t addr[] = {0x2a0000, 0x3a0000};
 	uint64_t rebind_bo_offset = 2 * bo_size / 3;
 	uint64_t size = bo_size / 3;
 	int i = 0;
 
 	if (test_discovery) {
-		xe_vm_bind_async(fd, vm, 0, bo[0], 0, addr[0], bo_size, NULL, 0);
+		xe_vm_bind_async(c->fd, vm, 0, bo[0], 0, addr[0], bo_size, NULL, 0);
 
-		xe_vm_unbind_async(fd, vm, 0, 0, addr[0] + size, size, NULL, 0);
+		xe_vm_unbind_async(c->fd, vm, 0, 0, addr[0] + size, size, NULL, 0);
 
-		xe_vm_bind_async(fd, vm, 0, bo[1], 0, addr[1], bo_size, NULL, 0);
+		xe_vm_bind_async(c->fd, vm, 0, bo[1], 0, addr[1], bo_size, NULL, 0);
 
-		xe_vm_bind_async(fd, vm, 0, bo[1], rebind_bo_offset, addr[1], size, NULL, 0);
+		xe_vm_bind_async(c->fd, vm, 0, bo[1], rebind_bo_offset, addr[1], size, NULL, 0);
 
-		bl = create_bind_list(fd, system_memory(fd), vm, 4, 0);
-		xe_vm_bind_array(bl->fd, bl->vm, 0, bl->bind_ops, bl->n, NULL, 0);
+		bl = create_bind_list(c->fd, system_memory(c->fd), vm, 4, 0);
+		xe_vm_bind_array(c->fd, bl->vm, 0, bl->bind_ops, bl->n, NULL, 0);
 
-		xe_vm_unbind_all_async(fd, vm, 0, bo[0], NULL, 0);
+		xe_vm_unbind_all_async(c->fd, vm, 0, bo[0], NULL, 0);
 
 		xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
-						bl->fd, bl->vm, 0, bl->n + 2, &ref_seqno);
+						bl->vm, 0, bl->n + 2, &ref_seqno);
 
 		xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_CREATE, ref_seqno,
 						   &op_ref_seqno, addr[1], size, 0);
@@ -355,33 +353,31 @@ static void vm_bind_client(int fd, struct xe_eudebug_client *c)
 		xe_eudebug_client_signal_stage(c, STAGE_PRE_DEBUG_RESOURCES_DONE);
 		xe_eudebug_client_wait_stage(c, STAGE_DISCOVERY_DONE);
 	} else {
-		xe_eudebug_client_vm_bind(c, fd, vm, bo[0], 0, addr[0], bo_size);
-		xe_eudebug_client_vm_unbind(c, fd, vm, 0, addr[0] + size, size);
+		xe_eudebug_client_vm_bind(c, vm, bo[0], 0, addr[0], bo_size);
+		xe_eudebug_client_vm_unbind(c, vm, 0, addr[0] + size, size);
 
-		xe_eudebug_client_vm_bind(c, fd, vm, bo[1], 0, addr[1], bo_size);
-		xe_eudebug_client_vm_bind(c, fd, vm, bo[1], rebind_bo_offset, addr[1], size);
+		xe_eudebug_client_vm_bind(c, vm, bo[1], 0, addr[1], bo_size);
+		xe_eudebug_client_vm_bind(c, vm, bo[1], rebind_bo_offset, addr[1], size);
 
-		bl = create_bind_list(fd, system_memory(fd), vm, 4, 0);
+		bl = create_bind_list(c->fd, system_memory(c->fd), vm, 4, 0);
 		do_bind_list(c, bl, false);
 	}
 
-	xe_vm_unbind_all_async(fd, vm, 0, bo[1], NULL, 0);
+	xe_vm_unbind_all_async(c->fd, vm, 0, bo[1], NULL, 0);
 
-	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, fd, vm, 0,
+	xe_eudebug_client_vm_bind_event(c, DRM_XE_EUDEBUG_EVENT_STATE_CHANGE, vm, 0,
 					1, &ref_seqno);
 	xe_eudebug_client_vm_bind_op_event(c, DRM_XE_EUDEBUG_EVENT_DESTROY, ref_seqno,
 					   &op_ref_seqno, 0, 0, 0);
 
-	gem_close(fd, bo[0]);
-	gem_close(fd, bo[1]);
-	xe_eudebug_client_vm_destroy(c, fd, vm);
+	gem_close(c->fd, bo[0]);
+	gem_close(c->fd, bo[1]);
+	xe_eudebug_client_vm_destroy(c, vm);
 }
 
 static void run_basic_client(struct xe_eudebug_client *c)
 {
-	int fd, i;
-
-	fd = xe_eudebug_client_open_driver(c);
+	int i;
 
 	if (c->flags & CREATE_VMS) {
 		const uint32_t flags[] = {
@@ -391,10 +387,10 @@ static void run_basic_client(struct xe_eudebug_client *c)
 		uint32_t vms[ARRAY_SIZE(flags)];
 
 		for (i = 0; i < ARRAY_SIZE(flags); i++)
-			vms[i] = xe_eudebug_client_vm_create(c, fd, flags[i], 0);
+			vms[i] = xe_eudebug_client_vm_create(c, flags[i], 0);
 
 		for (i--; i >= 0; i--)
-			xe_eudebug_client_vm_destroy(c, fd, vms[i]);
+			xe_eudebug_client_vm_destroy(c, vms[i]);
 	}
 
 	if (c->flags & CREATE_EXEC_QUEUES) {
@@ -407,36 +403,34 @@ static void run_basic_client(struct xe_eudebug_client *c)
 		};
 		uint32_t vm;
 
-		create = calloc(xe_number_engines(fd), sizeof(*create));
+		create = calloc(xe_number_engines(c->fd), sizeof(*create));
 
-		vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+		vm = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 
 		i = 0;
-		xe_eudebug_for_each_engine(fd, hwe) {
+		xe_eudebug_for_each_engine(c->fd, hwe) {
 			create[i].instances = to_user_pointer(hwe);
 			create[i].vm_id = vm;
 			create[i].width = 1;
 			create[i].num_placements = 1;
 			create[i].extensions = to_user_pointer(&eq_ext);
-			xe_eudebug_client_exec_queue_create(c, fd, &create[i++]);
+			xe_eudebug_client_exec_queue_create(c, &create[i++]);
 		}
 
 		while (--i >= 0)
-			xe_eudebug_client_exec_queue_destroy(c, fd, &create[i]);
+			xe_eudebug_client_exec_queue_destroy(c, &create[i]);
 
-		xe_eudebug_client_vm_destroy(c, fd, vm);
+		xe_eudebug_client_vm_destroy(c, vm);
 	}
 
 	if (c->flags & VM_BIND)
-		basic_vm_bind_client(fd, c);
+		basic_vm_bind_client(c);
 
 	if (c->flags & VM_BIND_EXTENDED)
-		vm_bind_client(fd, c);
+		vm_bind_client(c);
 
 	if (c->flags & VM_BIND_VM_DESTROY)
-		basic_vm_bind_vm_destroy_client(fd, c);
-
-	xe_eudebug_client_close_driver(c, fd);
+		basic_vm_bind_vm_destroy_client(c);
 }
 
 static int read_event(int debugfd, struct drm_xe_eudebug_event *event)
@@ -514,19 +508,19 @@ static void test_connect(int fd)
 		*pid = getpid();
 
 	igt_waitchildren();
-	param.pid = *pid;
+	param.fd = xe_eudebug_fd_for_pid(*pid);
 	munmap(pid, sizeof(pid_t));
 
 	ret = __debug_connect(fd, &debugfd, &param);
 	igt_assert(debugfd == -1);
-	igt_assert_eq(ret, param.pid ? -ENOENT : -EINVAL);
+	igt_assert_eq(ret, -EBADFD);
 
-	param.pid = 0;
+	param.fd = 0;
 	ret = __debug_connect(fd, &debugfd, &param);
 	igt_assert(debugfd == -1);
 	igt_assert_eq(ret, -EINVAL);
 
-	param.pid = getpid();
+	param.fd = xe_eudebug_fd_for_pid(getpid());
 	param.version = -1;
 	ret = __debug_connect(fd, &debugfd, &param);
 	igt_assert(debugfd == -1);
@@ -687,7 +681,7 @@ static void test_connect_user(int fd)
 					switch_user(test[i].u[P_GDB], test[i].g[P_GDB]);
 
 				igt_assert(read(p1[0], &pid, sizeof(pid)) == sizeof(pid));
-				param.pid = pid;
+				param.fd = xe_eudebug_fd_for_pid(pid);
 
 				newfd = drm_open_driver(DRIVER_XE);
 				ret = __debug_connect(newfd, &debugfd, &param);
@@ -722,9 +716,30 @@ static void test_close(int fd)
 	struct drm_xe_eudebug_connect param = { 0,  };
 	int debug_fd1, debug_fd2;
 	int fd2;
+	pid_t *pid;
+
+	pid = mmap(NULL, sizeof(pid_t), PROT_WRITE,
+		   MAP_SHARED | MAP_ANON, -1, 0);
+
+	*pid = 0;
+
+	/* get fresh unrelated pid */
+	igt_fork(child, 1) {
+		close(fd);
+
+		fd = drm_open_driver(DRIVER_XE);
+		*pid = getpid();
+	}
 
-	param.pid = getpid();
+	igt_until_timeout(3) {
+		if (!*pid)
+			continue;
+
+		param.fd = xe_eudebug_fd_for_pid(*pid);
+		break;
+	}
 
+	igt_assert(param.fd);
 	igt_assert_eq(__debug_connect(fd, &debug_fd1, &param), 0);
 	igt_assert(debug_fd1 >= 0);
 	igt_assert_eq(__debug_connect(fd, &debug_fd2, &param), -EBUSY);
@@ -733,11 +748,15 @@ static void test_close(int fd)
 	close(debug_fd1);
 	fd2 = drm_open_driver(DRIVER_XE);
 
+	/* XXX FIXME the debugger is still on client so we get EBUSY */
+	/* Try to close all refs for earlier disconnect */
 	igt_assert_eq(__debug_connect(fd2, &debug_fd2, &param), 0);
 	igt_assert(debug_fd2 >= 0);
 	close(fd2);
 	close(debug_fd2);
 	close(debug_fd1);
+
+	igt_waitchildren();
 }
 
 /**
@@ -773,7 +792,6 @@ static void test_read_event(int fd)
 	igt_assert_eq(poll_event(d->fd, 500), 1);
 	event->type = DRM_XE_EUDEBUG_EVENT_READ;
 	igt_assert_eq(read_event(d->fd, event), 0);
-	igt_assert_eq(event->type, DRM_XE_EUDEBUG_EVENT_OPEN);
 	igt_assert_eq(event->flags, DRM_XE_EUDEBUG_EVENT_CREATE);
 
 	igt_assert_eq(poll_event(d->fd, 500), 1);
@@ -810,7 +828,6 @@ static void test_read_event(int fd)
 
 	/* Positive read event - client destroy */
 	igt_assert_eq(read_event(d->fd, event), 0);
-	igt_assert_eq(event->type, DRM_XE_EUDEBUG_EVENT_OPEN);
 	igt_assert_eq(event->flags, DRM_XE_EUDEBUG_EVENT_DESTROY);
 
 	fcntl(d->fd, F_SETFL, fcntl(d->fd, F_GETFL) | O_NONBLOCK);
@@ -987,10 +1004,8 @@ static void run_discovery_client(struct xe_eudebug_client *c)
 	for (i = 0; i < RESOURCE_COUNT; i++) {
 		struct drm_xe_engine_class_instance *hwe = NULL;
 
-		fd[i] = xe_eudebug_client_open_driver(c);
-
 		/* Get first */
-		xe_eudebug_for_each_engine(fd[i], hwe)
+		xe_eudebug_for_each_engine(c->fd, hwe)
 			break;
 
 		igt_assert(hwe);
@@ -1003,7 +1018,7 @@ static void run_discovery_client(struct xe_eudebug_client *c)
 			sleep(1);
 
 		for (int j = 0; j < RESOURCE_COUNT; j++) {
-			uint32_t vm = xe_eudebug_client_vm_create(c, fd[i],
+			uint32_t vm = xe_eudebug_client_vm_create(c,
 								  DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 			struct drm_xe_ext_set_property eq_ext = {
 				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
@@ -1018,26 +1033,26 @@ static void run_discovery_client(struct xe_eudebug_client *c)
 				.extensions = to_user_pointer(&eq_ext),
 			};
 			const unsigned int bo_size = max_t(bo_size,
-							   xe_get_default_alignment(fd[i]),
+							   xe_get_default_alignment(c->fd),
 							   MIN_BO_SIZE);
-			uint32_t bo = xe_bo_create(fd[i], 0, bo_size, system_memory(fd[i]), 0);
+			uint32_t bo = xe_bo_create(fd[i], 0, bo_size, system_memory(c->fd), 0);
 
-			xe_eudebug_client_exec_queue_create(c, fd[i], &create);
+			xe_eudebug_client_exec_queue_create(c, &create);
 
 			if (c->flags & DISCOVERY_VM_BIND) {
-				xe_eudebug_client_vm_bind(c, fd[i], vm, bo, 0, addr, bo_size);
+				xe_eudebug_client_vm_bind(c, vm, bo, 0, addr, bo_size);
 				addr += bo_size;
 			}
 
 			if (c->flags & DISCOVERY_DESTROY_RESOURCES) {
-				xe_eudebug_client_exec_queue_destroy(c, fd[i], &create);
-				xe_eudebug_client_vm_destroy(c, fd[i], create.vm_id);
-				gem_close(fd[i], bo);
+				xe_eudebug_client_exec_queue_destroy(c, &create);
+				xe_eudebug_client_vm_destroy(c, create.vm_id);
+				gem_close(c->fd, bo);
 			}
 		}
 
 		if (c->flags & DISCOVERY_CLOSE_CLIENT)
-			xe_eudebug_client_close_driver(c, fd[i]);
+			close(c->fd);
 	}
 }
 
@@ -1106,28 +1121,6 @@ static void *discovery_race_thread(void *data)
 			igt_debug("Resources discovered: %" PRIu64 "\n", s->debugger->event_count);
 			if (!s->client->done) {
 				xe_eudebug_for_each_event(e, s->debugger->log) {
-					if (e->type == DRM_XE_EUDEBUG_EVENT_OPEN) {
-						struct drm_xe_eudebug_event_client *eo = (void *)e;
-
-						if (i >= 0) {
-							igt_assert_eq(clients[i].vm_count,
-								      RESOURCE_COUNT);
-
-							igt_assert_eq(clients[i].exec_queue_count,
-								      RESOURCE_COUNT);
-
-							if (s->client->flags & DISCOVERY_VM_BIND)
-								igt_assert_eq(clients[i].vm_bind_op_count,
-									      RESOURCE_COUNT);
-						}
-
-						igt_assert(++i < RESOURCE_COUNT);
-						clients[i].client_handle = eo->client_handle;
-						clients[i].vm_count = 0;
-						clients[i].exec_queue_count = 0;
-						clients[i].vm_bind_op_count = 0;
-					}
-
 					if (e->type == DRM_XE_EUDEBUG_EVENT_VM)
 						clients[i].vm_count++;
 
@@ -1140,14 +1133,6 @@ static void *discovery_race_thread(void *data)
 
 				igt_assert_lte(0, i);
 			}
-			for (int j = 0; j < i; j++)
-				for (int k = 0; k < i; k++) {
-					if (k == j)
-						continue;
-
-					igt_assert_neq(clients[j].client_handle,
-						       clients[k].client_handle);
-				}
 
 			if (s->debugger->event_count >= expected)
 				done = true;
@@ -1345,7 +1330,6 @@ static void test_client_with_trigger(int fd, unsigned int flags, int count,
 
 struct thread_fn_args {
 	struct xe_eudebug_client *client;
-	int fd;
 };
 
 static void *basic_client_th(void *data)
@@ -1353,10 +1337,9 @@ static void *basic_client_th(void *data)
 	struct thread_fn_args *f = data;
 	struct xe_eudebug_client *c = f->client;
 	uint32_t *vms;
-	int fd, i, num_vms;
+	int i, num_vms;
 
-	fd = f->fd;
-	igt_assert(fd);
+	igt_assert(c->fd);
 
 	num_vms = 2 + rand() % 16;
 	vms = calloc(num_vms, sizeof(*vms));
@@ -1364,10 +1347,10 @@ static void *basic_client_th(void *data)
 	igt_debug("Create %d client vms\n", num_vms);
 
 	for (i = 0; i < num_vms; i++)
-		vms[i] = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+		vms[i] = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 
 	for (i = 0; i < num_vms; i++)
-		xe_eudebug_client_vm_destroy(c, fd, vms[i]);
+		xe_eudebug_client_vm_destroy(c, vms[i]);
 
 	free(vms);
 
@@ -1377,7 +1360,7 @@ static void *basic_client_th(void *data)
 static void run_basic_client_th(struct xe_eudebug_client *c)
 {
 	struct thread_fn_args *args;
-	int i, num_threads, fd;
+	int i, num_threads;
 	pthread_t *threads;
 
 	args = calloc(1, sizeof(*args));
@@ -1388,9 +1371,7 @@ static void run_basic_client_th(struct xe_eudebug_client *c)
 	threads = calloc(num_threads, sizeof(*threads));
 	igt_assert(threads);
 
-	fd = xe_eudebug_client_open_driver(c);
 	args->client = c;
-	args->fd = fd;
 
 	for (i = 0; i < num_threads; i++)
 		pthread_create(&threads[i], NULL, basic_client_th, args);
@@ -1398,7 +1379,6 @@ static void run_basic_client_th(struct xe_eudebug_client *c)
 	for (i = 0; i < num_threads; i++)
 		pthread_join(threads[i], NULL);
 
-	xe_eudebug_client_close_driver(c, fd);
 	free(args);
 	free(threads);
 }
@@ -1416,24 +1396,22 @@ static void vm_access_client(struct xe_eudebug_client *c)
 	uint32_t bo_placement;
 	struct bind_list *bl;
 	uint32_t vm;
-	int fd, i, j;
+	int i, j;
 
 	igt_debug("Using %s\n", xe_engine_class_string(hwe->engine_class));
 
-	fd = xe_eudebug_client_open_driver(c);
-
 	vm_flags |= (c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
-	vm = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
+	vm = xe_eudebug_client_vm_create(c, vm_flags, 0);
 
 	if (c->flags & VM_BIND_OP_MAP_USERPTR)
 		bo_placement = 0;
 	else
-		bo_placement = vram_if_possible(fd, hwe->gt_id);
+		bo_placement = vram_if_possible(c->fd, hwe->gt_id);
 
 	for (j = 0; j < 5; j++) {
 		unsigned int target_size = MIN_BO_SIZE * (1 << j);
 
-		bl = create_bind_list(fd, bo_placement, vm, 4, target_size);
+		bl = create_bind_list(c->fd, bo_placement, vm, 4, target_size);
 		do_bind_list(c, bl, true);
 
 		for (i = 0; i < bl->n; i++)
@@ -1441,13 +1419,10 @@ static void vm_access_client(struct xe_eudebug_client *c)
 
 		free_bind_list(c, bl);
 	}
-	xe_eudebug_client_vm_destroy(c, fd, vm);
-
-	xe_eudebug_client_close_driver(c, fd);
+	xe_eudebug_client_vm_destroy(c, vm);
 }
 
 static void debugger_test_vma(struct xe_eudebug_debugger *d,
-			      uint64_t client_handle,
 			      uint64_t vm_handle,
 			      uint64_t va_start,
 			      uint64_t va_length)
@@ -1464,7 +1439,6 @@ static void debugger_test_vma(struct xe_eudebug_debugger *d,
 	v2 = malloc(va_length);
 	igt_assert(v2);
 
-	vo.client_handle = client_handle;
 	vo.vm_handle = vm_handle;
 
 	fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
@@ -1523,7 +1497,7 @@ static void vm_trigger(struct xe_eudebug_debugger *d,
 			xe_eudebug_event_log_find_seqno(d->log, eo->vm_bind_ref_seqno);
 		igt_assert(eb);
 
-		debugger_test_vma(d, eb->client_handle, eb->vm_handle,
+		debugger_test_vma(d, eb->vm_handle,
 				  eo->addr, eo->range);
 		xe_eudebug_debugger_signal_stage(d, eo->addr);
 	}
@@ -1572,7 +1546,6 @@ static void test_vm_access(int fd, unsigned int flags, int num_clients)
 }
 
 static void debugger_test_vma_parameters(struct xe_eudebug_debugger *d,
-					 uint64_t client_handle,
 					 uint64_t vm_handle,
 					 uint64_t va_start,
 					 uint64_t va_length)
@@ -1586,20 +1559,12 @@ static void debugger_test_vma_parameters(struct xe_eudebug_debugger *d,
 	v = malloc(va_length);
 	igt_assert(v);
 
-	/* Negative VM open - bad client handle */
-	vo.client_handle = client_handle + 123;
-	vo.vm_handle = vm_handle;
-	fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
-	igt_assert_lt(fd, 0);
-
 	/* Negative VM open - bad vm handle */
-	vo.client_handle = client_handle;
 	vo.vm_handle = vm_handle + 123;
 	fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
 	igt_assert_lt(fd, 0);
 
 	/* Positive VM open */
-	vo.client_handle = client_handle;
 	vo.vm_handle = vm_handle;
 	fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
 	igt_assert_lte(0, fd);
@@ -1688,7 +1653,7 @@ static void vm_trigger_access_parameters(struct xe_eudebug_debugger *d,
 			xe_eudebug_event_log_find_seqno(d->log, eo->vm_bind_ref_seqno);
 		igt_assert(eb);
 
-		debugger_test_vma_parameters(d, eb->client_handle, eb->vm_handle, eo->addr,
+		debugger_test_vma_parameters(d, eb->vm_handle, eo->addr,
 					     eo->range);
 		xe_eudebug_debugger_signal_stage(d, eo->addr);
 	}
@@ -1749,7 +1714,7 @@ struct ufence_bind {
 };
 
 static void client_wait_ufences(struct xe_eudebug_client *c,
-				int fd, struct ufence_bind *binds, int count)
+				struct ufence_bind *binds, int count)
 {
 	const int64_t default_fence_timeout_ns = 500 * NSEC_PER_MSEC;
 	int64_t timeout_ns;
@@ -1760,7 +1725,8 @@ static void client_wait_ufences(struct xe_eudebug_client *c,
 		struct ufence_bind *b = &binds[i];
 
 		timeout_ns = default_fence_timeout_ns;
-		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
+		err = __xe_wait_ufence(c->fd,
+				       &b->fence_data->vm_sync, b->f.timeline_value,
 				       0, &timeout_ns);
 		igt_assert_eq(err, -ETIME);
 		igt_assert_neq(b->fence_data->vm_sync, b->f.timeline_value);
@@ -1775,7 +1741,8 @@ static void client_wait_ufences(struct xe_eudebug_client *c,
 		struct ufence_bind *b = &binds[i];
 
 		timeout_ns = XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC;
-		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
+		err = __xe_wait_ufence(c->fd, &b->fence_data->vm_sync,
+				       b->f.timeline_value,
 				       0, &timeout_ns);
 		igt_assert_eq(err, 0);
 		igt_assert_eq(b->fence_data->vm_sync, b->f.timeline_value);
@@ -1820,32 +1787,30 @@ static void destroy_binds_with_ufence(struct ufence_bind *binds, int count)
 static void basic_ufence_client(struct xe_eudebug_client *c)
 {
 	const unsigned int n = UFENCE_EVENT_COUNT_EXPECTED;
-	int fd = xe_eudebug_client_open_driver(c);
-	uint32_t vm = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-	size_t bo_size = n * xe_get_default_alignment(fd);
-	uint32_t bo = xe_bo_create(fd, 0, bo_size,
-				   system_memory(fd), 0);
-	struct ufence_bind *binds = create_binds_with_ufence(fd, n);
+	uint32_t vm = xe_eudebug_client_vm_create(c, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	size_t bo_size = n * xe_get_default_alignment(c->fd);
+	uint32_t bo = xe_bo_create(c->fd, 0, bo_size,
+				   system_memory(c->fd), 0);
+	struct ufence_bind *binds = create_binds_with_ufence(c->fd, n);
 
 	for (int i = 0; i < n; i++) {
 		struct ufence_bind *b = &binds[i];
 
-		xe_eudebug_client_vm_bind_flags(c, fd, vm, bo, 0, b->addr, b->range, 0,
+		xe_eudebug_client_vm_bind_flags(c, vm, bo, 0, b->addr, b->range, 0,
 						&b->f, 1, 0);
 	}
 
-	client_wait_ufences(c, fd, binds, n);
+	client_wait_ufences(c, binds, n);
 
 	for (int i = 0; i < n; i++) {
 		struct ufence_bind *b = &binds[i];
 
-		xe_eudebug_client_vm_unbind(c, fd, vm, 0, b->addr, b->range);
+		xe_eudebug_client_vm_unbind(c, vm, 0, b->addr, b->range);
 	}
 
 	destroy_binds_with_ufence(binds, n);
-	gem_close(fd, bo);
-	xe_eudebug_client_vm_destroy(c, fd, vm);
-	xe_eudebug_client_close_driver(c, fd);
+	gem_close(c->fd, bo);
+	xe_eudebug_client_vm_destroy(c, vm);
 }
 
 struct ufence_priv {
@@ -1992,8 +1957,7 @@ static void test_basic_ufence(int fd, unsigned int flags)
 		c->pid = 0;
 		c->done = 1;
 	} else if (flags & VM_BIND_UFENCE_RECONNECT) {
-		filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
-				XE_EUDEBUG_FILTER_EVENT_OPEN;
+		filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM;
 		xe_eudebug_debugger_detach(d);
 		xe_eudebug_client_wait_done(c);
 		igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
@@ -2052,19 +2016,19 @@ static void *vm_bind_clear_thread(void *data)
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	};
 	struct vm_bind_clear_thread_priv *priv = data;
-	int fd = xe_eudebug_client_open_driver(priv->c);
-	uint32_t gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
+	struct xe_eudebug_client *c = priv->c;
+	uint32_t gtt_size = 1ull << min_t(uint32_t, xe_va_bits(c->fd), 48);
 	uint32_t vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
-	size_t bo_size = xe_bb_size(fd, batch_size);
+	size_t bo_size = xe_bb_size(c->fd, batch_size);
 	unsigned long count = 0;
 	uint64_t *fence_data;
 	uint32_t vm;
 
 	vm_flags |= (priv->c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
-	vm = xe_eudebug_client_vm_create(priv->c, fd, vm_flags, 0);
+	vm = xe_eudebug_client_vm_create(c, vm_flags, 0);
 
 	/* init uf_sync */
-	fence_data = aligned_alloc(xe_get_default_alignment(fd), sizeof(*fence_data));
+	fence_data = aligned_alloc(xe_get_default_alignment(c->fd), sizeof(*fence_data));
 	igt_assert(fence_data);
 	uf_sync.timeline_value = 1337;
 
@@ -2104,24 +2068,24 @@ static void *vm_bind_clear_thread(void *data)
 
 		uf_sync.addr = to_user_pointer(fence_data);
 		/* prepare clean bo */
-		clean_bo = xe_bo_create(fd, vm, bo_size, priv->region,
+		clean_bo = xe_bo_create(c->fd, vm, bo_size, priv->region,
 					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		memset(fence_data, 0, sizeof(*fence_data));
-		xe_eudebug_client_vm_bind_flags(priv->c, fd, vm, clean_bo, 0, clean_offset, bo_size,
+		xe_eudebug_client_vm_bind_flags(c, vm, clean_bo, 0, clean_offset, bo_size,
 						0, &uf_sync, 1, 0);
-		xe_wait_ufence(fd, fence_data, uf_sync.timeline_value, 0,
+		xe_wait_ufence(c->fd, fence_data, uf_sync.timeline_value, 0,
 			       XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC);
 
 		/* prepare batch bo */
-		batch_bo = xe_bo_create(fd, vm, bo_size, priv->region,
+		batch_bo = xe_bo_create(c->fd, vm, bo_size, priv->region,
 					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		memset(fence_data, 0, sizeof(*fence_data));
-		xe_eudebug_client_vm_bind_flags(priv->c, fd, vm, batch_bo, 0, batch_offset, bo_size,
+		xe_eudebug_client_vm_bind_flags(c, vm, batch_bo, 0, batch_offset, bo_size,
 						0, &uf_sync, 1, 0);
-		xe_wait_ufence(fd, fence_data, uf_sync.timeline_value, 0,
+		xe_wait_ufence(c->fd, fence_data, uf_sync.timeline_value, 0,
 			       XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC);
 
-		map = xe_bo_map(fd, batch_bo, bo_size);
+		map = xe_bo_map(c->fd, batch_bo, bo_size);
 
 		cs = map;
 		*cs++ = MI_NOOP | 0xc5a3;
@@ -2141,24 +2105,24 @@ static void *vm_bind_clear_thread(void *data)
 		eq_create.vm_id = vm;
 		eq_create.instances = to_user_pointer(priv->hwe);
 		eq_create.extensions = to_user_pointer(&eq_ext);
-		exec_queue = xe_eudebug_client_exec_queue_create(priv->c, fd, &eq_create);
+		exec_queue = xe_eudebug_client_exec_queue_create(c, &eq_create);
 
 		uf_sync.addr = (cs - map) * 4 + batch_offset;
-		xe_exec_sync(fd, exec_queue, batch_offset, &uf_sync, 1);
-		xe_wait_ufence(fd, (uint64_t *)cs, uf_sync.timeline_value, exec_queue,
+		xe_exec_sync(c->fd, exec_queue, batch_offset, &uf_sync, 1);
+		xe_wait_ufence(c->fd, (uint64_t *)cs, uf_sync.timeline_value, exec_queue,
 			       XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC);
 
 		igt_assert_eq(*map, 0);
 
 		/* cleanup */
-		xe_eudebug_client_exec_queue_destroy(priv->c, fd, &eq_create);
+		xe_eudebug_client_exec_queue_destroy(c, &eq_create);
 		munmap(map, bo_size);
 
-		xe_eudebug_client_vm_unbind(priv->c, fd, vm, 0, batch_offset, bo_size);
-		gem_close(fd, batch_bo);
+		xe_eudebug_client_vm_unbind(c, vm, 0, batch_offset, bo_size);
+		gem_close(c->fd, batch_bo);
 
-		xe_eudebug_client_vm_unbind(priv->c, fd, vm, 0, clean_offset, bo_size);
-		gem_close(fd, clean_bo);
+		xe_eudebug_client_vm_unbind(c, vm, 0, clean_offset, bo_size);
+		gem_close(c->fd, clean_bo);
 
 		count++;
 	}
@@ -2166,16 +2130,15 @@ static void *vm_bind_clear_thread(void *data)
 	priv->sum = count;
 
 	free(fence_data);
-	xe_eudebug_client_close_driver(priv->c, fd);
+
 	return NULL;
 }
 
 static void vm_bind_clear_client(struct xe_eudebug_client *c)
 {
-	int fd = xe_eudebug_client_open_driver(c);
-	struct xe_device *xe_dev = xe_device_get(fd);
-	int count = xe_number_engines(fd) * xe_dev->mem_regions->num_mem_regions;
-	uint64_t memreg = all_memory_regions(fd);
+	struct xe_device *xe_dev = xe_device_get(c->fd);
+	int count = xe_number_engines(c->fd) * xe_dev->mem_regions->num_mem_regions;
+	uint64_t memreg = all_memory_regions(c->fd);
 	struct vm_bind_clear_priv *priv = c->ptr;
 	int current = 0;
 	struct drm_xe_engine_class_instance *engine;
@@ -2187,7 +2150,7 @@ static void vm_bind_clear_client(struct xe_eudebug_client *c)
 	priv->sum = 0;
 
 	xe_for_each_mem_region(fd, memreg, region) {
-		xe_eudebug_for_each_engine(fd, engine) {
+		xe_eudebug_for_each_engine(c->fd, engine) {
 			threads[current].c = c;
 			threads[current].hwe = engine;
 			threads[current].region = region;
@@ -2213,8 +2176,7 @@ static void vm_bind_clear_client(struct xe_eudebug_client *c)
 	}
 
 	free(threads);
-	xe_device_put(fd);
-	xe_eudebug_client_close_driver(c, fd);
+	xe_device_put(c->fd);
 }
 
 static void vm_bind_clear_test_trigger(struct xe_eudebug_debugger *d,
@@ -2238,7 +2200,6 @@ static void vm_bind_clear_test_trigger(struct xe_eudebug_debugger *d,
 				xe_eudebug_event_log_find_seqno(d->log, eo->vm_bind_ref_seqno);
 			igt_assert(eb);
 
-			vo.client_handle = eb->client_handle;
 			vo.vm_handle = eb->vm_handle;
 
 			fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
@@ -2312,22 +2273,21 @@ static void test_vm_bind_clear(int fd, uint32_t flags)
 static void vma_ufence_client(struct xe_eudebug_client *c)
 {
 	const unsigned int n = UFENCE_EVENT_COUNT_EXPECTED;
-	int fd = xe_eudebug_client_open_driver(c);
-	struct ufence_bind *binds = create_binds_with_ufence(fd, n);
+	struct ufence_bind *binds = create_binds_with_ufence(c->fd, n);
 	uint32_t vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
-	size_t bo_size = xe_get_default_alignment(fd);
+	size_t bo_size = xe_get_default_alignment(c->fd);
 	uint64_t items = bo_size / sizeof(uint32_t);
 	uint32_t bo[UFENCE_EVENT_COUNT_EXPECTED];
 	uint32_t *ptr[UFENCE_EVENT_COUNT_EXPECTED];
 	uint32_t vm;
 
 	vm_flags |= (c->flags & TEST_FAULTABLE) ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
-	vm = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
+	vm = xe_eudebug_client_vm_create(c, vm_flags, 0);
 
 	for (int i = 0; i < n; i++) {
-		bo[i] = xe_bo_create(fd, 0, bo_size,
-				     system_memory(fd), 0);
-		ptr[i] = xe_bo_map(fd, bo[i], bo_size);
+		bo[i] = xe_bo_create(c->fd, 0, bo_size,
+				     system_memory(c->fd), 0);
+		ptr[i] = xe_bo_map(c->fd, bo[i], bo_size);
 		igt_assert(ptr[i]);
 		memset(ptr[i], UFENCE_CLIENT_VM_TEST_VAL_START, bo_size);
 	}
@@ -2335,7 +2295,7 @@ static void vma_ufence_client(struct xe_eudebug_client *c)
 	for (int i = 0; i < n; i++) {
 		struct ufence_bind *b = &binds[i];
 
-		xe_eudebug_client_vm_bind_flags(c, fd, vm, bo[i], 0, b->addr, b->range, 0,
+		xe_eudebug_client_vm_bind_flags(c, vm, bo[i], 0, b->addr, b->range, 0,
 						&b->f, 1, 0);
 	}
 
@@ -2346,7 +2306,8 @@ static void vma_ufence_client(struct xe_eudebug_client *c)
 		struct ufence_bind *b = &binds[i];
 
 		timeout_ns = XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC;
-		err = __xe_wait_ufence(fd, &b->fence_data->vm_sync, b->f.timeline_value,
+		err = __xe_wait_ufence(c->fd,
+				       &b->fence_data->vm_sync, b->f.timeline_value,
 				       0, &timeout_ns);
 		igt_assert_eq(err, 0);
 		igt_assert_eq(b->fence_data->vm_sync, b->f.timeline_value);
@@ -2359,22 +2320,20 @@ static void vma_ufence_client(struct xe_eudebug_client *c)
 	for (int i = 0; i < n; i++) {
 		struct ufence_bind *b = &binds[i];
 
-		xe_eudebug_client_vm_unbind(c, fd, vm, 0, b->addr, b->range);
+		xe_eudebug_client_vm_unbind(c, vm, 0, b->addr, b->range);
 	}
 
 	destroy_binds_with_ufence(binds, n);
 
 	for (int i = 0; i < n; i++) {
 		munmap(ptr[i], bo_size);
-		gem_close(fd, bo[i]);
+		gem_close(c->fd, bo[i]);
 	}
 
-	xe_eudebug_client_vm_destroy(c, fd, vm);
-	xe_eudebug_client_close_driver(c, fd);
+	xe_eudebug_client_vm_destroy(c, vm);
 }
 
 static void debugger_test_vma_ufence(struct xe_eudebug_debugger *d,
-				     uint64_t client_handle,
 				     uint64_t vm_handle,
 				     uint64_t va_start,
 				     uint64_t va_length)
@@ -2390,7 +2349,6 @@ static void debugger_test_vma_ufence(struct xe_eudebug_debugger *d,
 	v2 = malloc(va_length);
 	igt_assert(v2);
 
-	vo.client_handle = client_handle;
 	vo.vm_handle = vm_handle;
 
 	fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
@@ -2486,7 +2444,7 @@ static void vma_ufence_trigger(struct xe_eudebug_debugger *d,
 			  ef->vm_bind_ref_seqno,
 			  addr,
 			  range);
-		debugger_test_vma_ufence(d, eb->client_handle, eb->vm_handle,
+		debugger_test_vma_ufence(d, eb->vm_handle,
 					 addr, range);
 
 		xe_eudebug_ack_ufence(d->fd, ef);
@@ -2634,11 +2592,10 @@ int igt_main()
 		test_read_event(fd);
 
 	igt_subtest("basic-client")
-		test_basic_sessions(fd, 0, 1, true);
+		test_basic_sessions(fd, CREATE_VMS, 1, true);
 
 	igt_subtest("basic-client-th")
-		test_basic_sessions_th(fd, 0, 1, true);
-
+		test_basic_sessions_th(fd, CREATE_VMS, 1, true);
 
 	igt_subtest_group() {
 		uint32_t flags[] = {0, TEST_FAULTABLE};
@@ -2668,9 +2625,6 @@ int igt_main()
 	igt_subtest("multiple-sessions")
 		test_basic_sessions(fd, CREATE_VMS | CREATE_EXEC_QUEUES, 4, true);
 
-	igt_subtest("basic-vms")
-		test_basic_sessions(fd, CREATE_VMS, 1, true);
-
 	igt_subtest("basic-exec-queues-enable")
 		test_basic_exec_queues_enable(fd);
 
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 9b1e010d2a..c4e9ff2fce 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -151,7 +151,6 @@ struct online_debug_data {
 	/* client out */
 	int thread_hit_count;
 	/* debugger internals */
-	uint64_t client_handle;
 	uint64_t exec_queue_handle;
 	uint64_t lrc_handle;
 	uint64_t target_offset;
@@ -353,13 +352,12 @@ static const char *td_ctl_cmd_to_str(uint32_t cmd)
 	}
 }
 
-static int __eu_ctl(int debugfd, uint64_t client,
+static int __eu_ctl(int debugfd,
 		    uint64_t exec_queue, uint64_t lrc,
 		    uint8_t *bitmask, uint32_t *bitmask_size,
 		    uint32_t cmd, uint64_t *seqno)
 {
 	struct drm_xe_eudebug_eu_control control = {
-		.client_handle = lower_32_bits(client),
 		.exec_queue_handle = exec_queue,
 		.lrc_handle = lrc,
 		.cmd = cmd,
@@ -386,13 +384,13 @@ static int __eu_ctl(int debugfd, uint64_t client,
 	return 0;
 }
 
-static uint64_t eu_ctl(int debugfd, uint64_t client,
+static uint64_t eu_ctl(int debugfd,
 		       uint64_t exec_queue, uint64_t lrc,
 		       uint8_t *bitmask, uint32_t *bitmask_size, uint32_t cmd)
 {
 	uint64_t seqno;
 
-	igt_assert_eq(__eu_ctl(debugfd, client, exec_queue, lrc, bitmask,
+	igt_assert_eq(__eu_ctl(debugfd, exec_queue, lrc, bitmask,
 			       bitmask_size, cmd, &seqno), 0);
 
 	return seqno;
@@ -405,7 +403,7 @@ static bool intel_gen_needs_resume_wa(int fd)
 	return intel_gen(id) == 12 && intel_graphics_ver(id) < IP_VER(12, 55);
 }
 
-static uint64_t eu_ctl_resume(int fd, int debugfd, uint64_t client,
+static uint64_t eu_ctl_resume(int fd, int debugfd,
 			      uint64_t exec_queue, uint64_t lrc,
 			      uint8_t *bitmask, uint32_t bitmask_size)
 {
@@ -421,22 +419,22 @@ static uint64_t eu_ctl_resume(int fd, int debugfd, uint64_t client,
 		}
 	}
 
-	return eu_ctl(debugfd, client, exec_queue, lrc, bitmask, &bitmask_size,
+	return eu_ctl(debugfd, exec_queue, lrc, bitmask, &bitmask_size,
 		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME);
 }
 
-static inline uint64_t eu_ctl_stopped(int debugfd, uint64_t client,
+static inline uint64_t eu_ctl_stopped(int debugfd,
 				      uint64_t exec_queue, uint64_t lrc,
 				      uint8_t *bitmask, uint32_t *bitmask_size)
 {
-	return eu_ctl(debugfd, client, exec_queue, lrc, bitmask, bitmask_size,
+	return eu_ctl(debugfd, exec_queue, lrc, bitmask, bitmask_size,
 		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED);
 }
 
-static inline uint64_t eu_ctl_interrupt_all(int debugfd, uint64_t client,
+static inline uint64_t eu_ctl_interrupt_all(int debugfd,
 					    uint64_t exec_queue, uint64_t lrc)
 {
-	return eu_ctl(debugfd, client, exec_queue, lrc, NULL, 0,
+	return eu_ctl(debugfd, exec_queue, lrc, NULL, 0,
 		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL);
 }
 
@@ -454,7 +452,6 @@ online_debug_data_create(int drm_fd, struct drm_xe_engine_class_instance *hwe, u
 	data->flags = flags;
 	data->thread_count = get_number_of_threads(data);
 	pthread_mutex_init(&data->mutex, NULL);
-	data->client_handle = -1ULL;
 	data->exec_queue_handle = -1ULL;
 	data->lrc_handle = -1ULL;
 	data->vm_fd = -1;
@@ -477,10 +474,11 @@ static void eu_attention_debug_trigger(struct xe_eudebug_debugger *d,
 	uint32_t *ptr = (uint32_t *)att->bitmask;
 
 	igt_debug("EVENT[%llu] eu-attenttion; threads=%d "
-		 "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d]\n",
-		 att->base.seqno, igt_bitmap_hweight(att->bitmask, att->bitmask_size * 8),
-				att->client_handle, att->exec_queue_handle,
-				att->lrc_handle, att->bitmask_size);
+		  "exec_queue[%llu], lrc[%llu], bitmask_size[%d]\n",
+		  att->base.seqno,
+		  igt_bitmap_hweight(att->bitmask, att->bitmask_size * 8),
+		  att->exec_queue_handle,
+		  att->lrc_handle, att->bitmask_size);
 
 	for (uint32_t i = 0; i < att->bitmask_size / 4; i += 2)
 		igt_debug("bitmask[%d] = 0x%08x%08x\n", i / 2, ptr[i], ptr[i + 1]);
@@ -494,10 +492,11 @@ static void eu_attention_reset_trigger(struct xe_eudebug_debugger *d,
 	struct online_debug_data *data = d->ptr;
 
 	igt_debug("EVENT[%llu] eu-attention with reset; threads=%d "
-		 "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d]\n",
-		 att->base.seqno, igt_bitmap_hweight(att->bitmask, att->bitmask_size * 8),
-				att->client_handle, att->exec_queue_handle,
-				att->lrc_handle, att->bitmask_size);
+		  "exec_queue[%llu], lrc[%llu], bitmask_size[%d]\n",
+		  att->base.seqno,
+		  igt_bitmap_hweight(att->bitmask, att->bitmask_size * 8),
+		  att->exec_queue_handle,
+		  att->lrc_handle, att->bitmask_size);
 
 	for (uint32_t i = 0; i < att->bitmask_size / 4; i += 2)
 		igt_debug("bitmask[%d] = 0x%08x%08x\n", i / 2, ptr[i], ptr[i + 1]);
@@ -676,7 +675,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 	bitmask = calloc(1, att->bitmask_size);
 	igt_assert(bitmask);
 
-	eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
+	eu_ctl_stopped(d->fd, att->exec_queue_handle,
 		       att->lrc_handle, bitmask, &bitmask_size);
 	igt_assert(bitmask_size == att->bitmask_size);
 
@@ -732,7 +731,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 	}
 	pthread_mutex_unlock(&data->mutex);
 
-	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
+	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd,
 						    att->exec_queue_handle, att->lrc_handle,
 						    bitmask, att->bitmask_size);
 
@@ -825,7 +824,7 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
 			     data->target_offset + steering_offset(threads)), sz);
 	fsync(data->vm_fd);
 
-	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
+	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd,
 						    att->exec_queue_handle, att->lrc_handle,
 						    att->bitmask, att->bitmask_size);
 
@@ -834,20 +833,6 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
 			data->single_step_bitmask[i] &= ~att->bitmask[i];
 }
 
-static void open_trigger(struct xe_eudebug_debugger *d,
-			 struct drm_xe_eudebug_event *e)
-{
-	struct drm_xe_eudebug_event_client *client = (void *)e;
-	struct online_debug_data *data = d->ptr;
-
-	if (e->flags & DRM_XE_EUDEBUG_EVENT_DESTROY)
-		return;
-
-	pthread_mutex_lock(&data->mutex);
-	data->client_handle = client->client_handle;
-	pthread_mutex_unlock(&data->mutex);
-}
-
 static void exec_queue_trigger(struct xe_eudebug_debugger *d,
 			       struct drm_xe_eudebug_event *e)
 {
@@ -869,7 +854,6 @@ static void vm_open_trigger(struct xe_eudebug_debugger *d,
 	struct drm_xe_eudebug_event_vm *vm = (void *)e;
 	struct online_debug_data *data = d->ptr;
 	struct drm_xe_eudebug_vm_open vo = {
-		.client_handle = vm->client_handle,
 		.vm_handle = vm->vm_handle,
 	};
 	int fd;
@@ -995,7 +979,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 				     "Poison value found at %04d!\n", i);
 		}
 
-	ret = __eu_ctl(d->fd, att->client_handle, att->exec_queue_handle, att->lrc_handle,
+	ret = __eu_ctl(d->fd, att->exec_queue_handle, att->lrc_handle,
 		       att->bitmask, &att->bitmask_size, DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME,
 		       &seqno);
 
@@ -1071,25 +1055,23 @@ static void run_online_client(struct xe_eudebug_client *c)
 	struct intel_bb *ibb;
 	struct intel_buf *buf;
 	uint32_t *ptr;
-	int fd, vm_flags;
-
-	fd = xe_eudebug_client_open_driver(c);
+	int vm_flags;
 
 	threads = data->thread_count;
 	w_dim = walker_dimensions(threads);
 	s_dim = surface_dimensions(threads);
 
 	shader = get_shader(data);
-	bb_size = get_bb_size(fd, shader);
+	bb_size = get_bb_size(c->fd, shader);
 
 	/* Additional memory for steering control */
 	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c->flags & SHADER_PAGEFAULT)
 		s_dim.y++;
 	/* Additional memory for caching check */
 	if ((c->flags & SHADER_CACHING_SRAM) || (c->flags & SHADER_CACHING_VRAM))
-		s_dim.y += caching_get_instruction_count(fd, s_dim.x, c->flags);
-	buf = create_uc_buf(fd, s_dim.x, s_dim.y,
-			    get_memory_region(fd, c->flags, TARGET_REGION_BITMASK));
+		s_dim.y += caching_get_instruction_count(c->fd, s_dim.x, c->flags);
+	buf = create_uc_buf(c->fd, s_dim.x, s_dim.y,
+			    get_memory_region(c->fd, c->flags, TARGET_REGION_BITMASK));
 
 	buf->addr.offset = target_offset;
 
@@ -1097,12 +1079,13 @@ static void run_online_client(struct xe_eudebug_client *c)
 	vm_flags |= c->flags & (SHADER_PAGEFAULT | FAULTABLE_VM) ?
 			DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
 
-	create.vm_id = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
+	create.vm_id = xe_eudebug_client_vm_create(c, vm_flags, 0);
 
-	xe_eudebug_client_exec_queue_create(c, fd, &create);
+	xe_eudebug_client_exec_queue_create(c, &create);
 
-	ibb = xe_bb_create_on_offset(fd, create.exec_queue_id, create.vm_id, bb_offset, bb_size,
-				     get_memory_region(fd, c->flags, BB_REGION_BITMASK));
+	ibb = xe_bb_create_on_offset(c->fd,
+				     create.exec_queue_id, create.vm_id, bb_offset, bb_size,
+				     get_memory_region(c->fd, c->flags, BB_REGION_BITMASK));
 	intel_bb_set_lr_mode(ibb, true);
 
 	sip = get_sip(data);
@@ -1122,10 +1105,9 @@ static void run_online_client(struct xe_eudebug_client *c)
 		igt_assert(igt_nsec_elapsed(&ts) < XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC);
 
 	if (!(c->flags & DO_NOT_EXPECT_CANARIES)) {
-		ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size, PROT_READ);
+		ptr = xe_bo_mmap_ext(c->fd, buf->handle, buf->size, PROT_READ);
 		data->thread_hit_count = count_canaries_neq(ptr, w_dim, 0);
 		igt_assert_f(data->thread_hit_count, "No canaries found, nothing executed?\n");
-
 		if ((c->flags & SHADER_BREAKPOINT || c->flags & TRIGGER_RESUME_SET_BP ||
 		     c->flags & SHADER_N_NOOP_BREAKPOINT) && !(c->flags & DISABLE_DEBUG_MODE)) {
 			uint32_t aip = ptr[0];
@@ -1143,12 +1125,10 @@ static void run_online_client(struct xe_eudebug_client *c)
 
 	intel_bb_destroy(ibb);
 
-	xe_eudebug_client_exec_queue_destroy(c, fd, &create);
-	xe_eudebug_client_vm_destroy(c, fd, create.vm_id);
+	xe_eudebug_client_exec_queue_destroy(c, &create);
+	xe_eudebug_client_vm_destroy(c, create.vm_id);
 
 	intel_buf_destroy(buf);
-
-	xe_eudebug_client_close_driver(c, fd);
 }
 
 static bool intel_gen_has_lockstep_eus(int fd)
@@ -1221,9 +1201,6 @@ match_attention_with_exec_queue(struct xe_eudebug_event_log *log,
 			if (ee->exec_queue_handle != ea->exec_queue_handle)
 				continue;
 
-			if (ee->client_handle != ea->client_handle)
-				continue;
-
 			for (lrc_idx = 0; lrc_idx < ee->width; lrc_idx++) {
 				if (ee->lrc_handle[lrc_idx] == ea->lrc_handle)
 					break;
@@ -1388,10 +1365,10 @@ static void pagefault_trigger(struct xe_eudebug_debugger *d,
 
 	igt_debug("EVENT[%llu] pagefault; threads[before=%d, after=%d, "
 		  "resolved=%d, pagefault=%d] "
-		  "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d], "
+		  "exec_queue[%llu], lrc[%llu], bitmask_size[%d], "
 		  "pagefault_address[0x%llx]\n",
 		  pf->base.seqno, threads[0], threads[1], threads[2],
-		  pagefault_threads, pf->client_handle, pf->exec_queue_handle,
+		  pagefault_threads, pf->exec_queue_handle,
 		  pf->lrc_handle, pf->bitmask_size,
 		  pf->pagefault_address);
 
@@ -1513,8 +1490,6 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
 
 	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
-					open_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
@@ -1575,8 +1550,7 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 		data = online_debug_data_create(fd, hwe, flags);
 		s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 		s->client->allow_dead_client = true;
-		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
-						open_trigger);
+
 		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 						exec_queue_trigger);
 		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM,
@@ -1698,8 +1672,6 @@ static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *h
 	}
 	s = xe_eudebug_session_create(fd, run_online_client, data->flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
-					open_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
@@ -1835,8 +1807,6 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
-					open_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
@@ -1863,9 +1833,8 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	}
 
 	pthread_mutex_lock(&data->mutex);
-	igt_assert(data->client_handle != -1);
 	igt_assert(data->exec_queue_handle != -1);
-	eu_ctl_interrupt_all(s->debugger->fd, data->client_handle,
+	eu_ctl_interrupt_all(s->debugger->fd,
 			     data->exec_queue_handle, data->lrc_handle);
 	pthread_mutex_unlock(&data->mutex);
 
@@ -1924,7 +1893,6 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN, open_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
@@ -1961,14 +1929,13 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	}
 
 	pthread_mutex_lock(&debugee_data->mutex);
-	igt_assert(debugee_data->client_handle != -1);
 	igt_assert(debugee_data->exec_queue_handle != -1);
 
 	/*
 	 * Interrupting the other client should return invalid state
 	 * as it is running in runalone mode
 	 */
-	igt_assert_eq(__eu_ctl(s->debugger->fd, debugee_data->client_handle,
+	igt_assert_eq(__eu_ctl(s->debugger->fd,
 		      debugee_data->exec_queue_handle, debugee_data->lrc_handle, NULL, 0,
 		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL), -EINVAL);
 	pthread_mutex_unlock(&debugee_data->mutex);
@@ -2013,8 +1980,6 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
-					open_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
@@ -2041,34 +2006,27 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 	}
 
 	pthread_mutex_lock(&data->mutex);
-	igt_assert(data->client_handle != -1);
 	igt_assert(data->exec_queue_handle != -1);
 	igt_assert(data->lrc_handle != -1);
 
 	/* fail on invalid lrc_handle */
-	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle,
+	igt_assert(__eu_ctl(s->debugger->fd,
 			    data->exec_queue_handle, data->lrc_handle + 1,
 			    attention_bitmask, &bitmask_size,
 			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL) == -EINVAL);
 
 	/* fail on invalid exec_queue_handle */
-	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle,
+	igt_assert(__eu_ctl(s->debugger->fd,
 			    data->exec_queue_handle + 1, data->lrc_handle,
 			    attention_bitmask, &bitmask_size,
 			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL) == -EINVAL);
 
-	/* fail on invalid client */
-	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle + 1,
-			    data->exec_queue_handle, data->lrc_handle,
-			    attention_bitmask, &bitmask_size,
-			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL) == -EINVAL);
-
 	/*
 	 * bitmask size must be aligned to sizeof(u32) for all commands
 	 * and be zero for interrupt all
 	 */
 	bitmask_size = sizeof(uint32_t) - 1;
-	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle,
+	igt_assert(__eu_ctl(s->debugger->fd,
 			    data->exec_queue_handle, data->lrc_handle,
 			    attention_bitmask, &bitmask_size,
 			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED, NULL) == -EINVAL);
@@ -2076,13 +2034,13 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 
 	/* fail on invalid command */
 	random_command = random() | (DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME + 1);
-	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle,
+	igt_assert(__eu_ctl(s->debugger->fd,
 			    data->exec_queue_handle, data->lrc_handle,
 			    attention_bitmask, &bitmask_size, random_command, NULL) == -EINVAL);
 
 	free(attention_bitmask);
 
-	eu_ctl_interrupt_all(s->debugger->fd, data->client_handle,
+	eu_ctl_interrupt_all(s->debugger->fd,
 			     data->exec_queue_handle, data->lrc_handle);
 	pthread_mutex_unlock(&data->mutex);
 
@@ -2104,9 +2062,10 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
 {
 	struct online_debug_data *data = d->ptr;
 	uint64_t c_pid;
-	int ret;
+	int ret, c_fd;
 
 	c_pid = d->target_pid;
+	c_fd = d->target_fd;
 
 	/* Reset VM data so the re-triggered VM open handler works properly */
 	data->vm_fd = -1;
@@ -2124,10 +2083,11 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
 	 */
 	reset_debugger_log(d);
 
-	ret = xe_eudebug_connect(d->master_fd, c_pid, 0);
+	ret = __xe_eudebug_connect(d->master_fd, c_fd, c_pid, 0);
 	igt_assert(ret >= 0);
 	d->fd = ret;
 	d->target_pid = c_pid;
+	d->target_fd = c_fd;
 
 	/* Discovery worker will replay events that have occurred, which leads to
 	 * a vm event being sent and vm_open_trigger being re-run, which would lead
@@ -2161,8 +2121,6 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
-					open_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
@@ -2189,9 +2147,8 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 	}
 
 	pthread_mutex_lock(&data->mutex);
-	igt_assert(data->client_handle != -1);
 	igt_assert(data->exec_queue_handle != -1);
-	eu_ctl_interrupt_all(s->debugger->fd, data->client_handle,
+	eu_ctl_interrupt_all(s->debugger->fd,
 			     data->exec_queue_handle, data->lrc_handle);
 	pthread_mutex_unlock(&data->mutex);
 
@@ -2238,8 +2195,6 @@ static void test_single_step(int fd, struct drm_xe_engine_class_instance *hwe, i
 	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
-					open_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
@@ -2337,8 +2292,6 @@ static void test_caching(int fd, struct drm_xe_engine_class_instance *hwe, int f
 	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
-					open_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
@@ -2496,7 +2449,7 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
 				usleep(WORKLOAD_DELAY_US);
 				eus = (struct drm_xe_eudebug_event_eu_attention *)data[i]->exception_event;
 				eu_ctl_resume(s[i]->debugger->master_fd, s[i]->debugger->fd,
-					      eus->client_handle, eus->exec_queue_handle,
+					      eus->exec_queue_handle,
 					      eus->lrc_handle, eus->bitmask, eus->bitmask_size);
 				free(eus);
 
-- 
2.43.0

