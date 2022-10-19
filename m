Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFF610EB08
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 16:30:39 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Oct 2022 19:30:29 +0300
Message-Id: <20221019163029.19301-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20221019163029.19301-1-ville.syrjala@linux.intel.com>
References: <20221019163029.19301-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/3] lib/crc: Move pipe CRC stuff out
 from igt_debugfs
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

No reason to hide the pipe CRC code inside the debugfs stuff.
The fact that pipe CRCs are operated through debugfs is just
an irrelevant implementation detail.

Fixed up the few cases that don't include igt.h with this cocci:
@find@
identifier ID;
@@
igt_crc_t ID;

@has_include@
@@
(
 #include "igt_pipe_crc.h"
|
 #include "igt.h"
)

@depends on find && !has_include@
@@
  #include "igt_kms.h"
+ #include "igt_pipe_crc.h"

v2: better cocci to catch lib/igt_chamelium.c
v3: Rebase and roll on doc fix from Petri

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/igt.h                                     |   1 +
 lib/igt_chamelium.c                           |   1 +
 lib/igt_chamelium.h                           |   1 +
 lib/igt_debugfs.c                             | 564 ----------------
 lib/igt_debugfs.h                             |  57 --
 lib/igt_fb.h                                  |   1 +
 lib/igt_pipe_crc.c                            | 610 ++++++++++++++++++
 lib/igt_pipe_crc.h                            |  87 +++
 lib/meson.build                               |   1 +
 tests/i915/kms_mmap_write_crc.c               |   1 +
 tools/intel_display_crc.c                     |   1 +
 12 files changed, 705 insertions(+), 621 deletions(-)
 create mode 100644 lib/igt_pipe_crc.c
 create mode 100644 lib/igt_pipe_crc.h

diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
index a19f786e841b..1ce842f45321 100644
--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
@@ -37,6 +37,7 @@
     <xi:include href="xml/igt_list.xml"/>
     <xi:include href="xml/igt_map.xml"/>
     <xi:include href="xml/igt_msm.xml"/>
+    <xi:include href="xml/igt_pipe_crc.xml"/>
     <xi:include href="xml/igt_pm.xml"/>
     <xi:include href="xml/igt_primes.xml"/>
     <xi:include href="xml/igt_rand.xml"/>
diff --git a/lib/igt.h b/lib/igt.h
index 96a368e11bbf..88938109e003 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -37,6 +37,7 @@
 #include "igt_gt.h"
 #include "igt_kms.h"
 #include "igt_params.h"
+#include "igt_pipe_crc.h"
 #include "igt_pm.h"
 #include "igt_stats.h"
 #ifdef HAVE_CHAMELIUM
diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 26244bd5fc97..ea296e027e16 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -44,6 +44,7 @@
 #include "igt_frame.h"
 #include "igt_list.h"
 #include "igt_kms.h"
+#include "igt_pipe_crc.h"
 #include "igt_rc.h"
 
 /**
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index f40e848e4f67..af88fec914bd 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -36,6 +36,7 @@
 
 struct igt_fb;
 struct edid;
+typedef struct _igt_crc igt_crc_t;
 
 struct chamelium;
 struct chamelium_port;
diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index fc4697b0af4a..85d350d359bd 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -55,24 +55,6 @@
  * basic functions to access debugfs files with e.g. igt_debugfs_open() it also
  * provides higher-level wrappers for some debugfs features.
  *
- * # Pipe CRC Support
- *
- * This library wraps up the kernel's support for capturing pipe CRCs into a
- * neat and tidy package. For the detailed usage see all the functions which
- * work on #igt_pipe_crc_t. This is supported on all platforms and outputs.
- *
- * Actually using pipe CRCs to write modeset tests is a bit tricky though, so
- * there is no way to directly check a CRC: Both the details of the plane
- * blending, color correction and other hardware and how exactly the CRC is
- * computed at each tap point vary by hardware generation and are not disclosed.
- *
- * The only way to use #igt_crc_t CRCs therefore is to compare CRCs among each
- * another either for equality or difference. Otherwise CRCs must be treated as
- * completely opaque values. Note that not even CRCs from different pipes or tap
- * points on the same platform can be compared. Hence only use
- * igt_assert_crc_equal() to inspect CRC values captured by the same
- * #igt_pipe_crc_t object.
- *
  * # Other debugfs interface wrappers
  *
  * This covers the miscellaneous debugfs interface wrappers:
@@ -425,175 +407,6 @@ bool igt_debugfs_search(int device, const char *filename, const char *substring)
 	return matched;
 }
 
-/*
- * Pipe CRC
- */
-
-/**
- * igt_find_crc_mismatch:
- * @a: first pipe CRC value
- * @b: second pipe CRC value
- * @index: index of the first value that mismatched
- *
- * Check if CRC a and CRC b mismatch.
- *
- * Returns true if CRC values mismatch, false otherwise;
- */
-bool igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int *index)
-{
-	int nwords = min(a->n_words, b->n_words);
-	int i;
-
-	for (i = 0; i < nwords; i++) {
-		if (a->crc[i] != b->crc[i]) {
-			if (index)
-				*index = i;
-
-			return true;
-		}
-	}
-
-	if (a->n_words != b->n_words) {
-		if (index)
-			*index = i;
-		return true;
-	}
-
-	return false;
-}
-
-/**
- * igt_assert_crc_equal:
- * @a: first pipe CRC value
- * @b: second pipe CRC value
- *
- * Compares two CRC values and fails the testcase if they don't match with
- * igt_fail(). Note that due to CRC collisions CRC based testcase can only
- * assert that CRCs match, never that they are different. Otherwise there might
- * be random testcase failures when different screen contents end up with the
- * same CRC by chance.
- *
- * Passing --skip-crc-compare on the command line will force this function
- * to always pass, which can be useful in interactive debugging where you
- * might know the test will fail, but still want the test to keep going as if
- * it had succeeded so that you can see the on-screen behavior.
- *
- */
-void igt_assert_crc_equal(const igt_crc_t *a, const igt_crc_t *b)
-{
-	int index;
-	bool mismatch;
-
-	mismatch = igt_find_crc_mismatch(a, b, &index);
-	if (mismatch)
-		igt_debug("CRC mismatch%s at index %d: 0x%x != 0x%x\n",
-			  igt_skip_crc_compare ? " (ignored)" : "",
-			  index, a->crc[index], b->crc[index]);
-
-	igt_assert(!mismatch || igt_skip_crc_compare);
-}
-
-/**
- * igt_check_crc_equal:
- * @a: first pipe CRC value
- * @b: second pipe CRC value
- *
- * Compares two CRC values and return whether they match.
- *
- * Returns: A boolean indicating whether the CRC values match
- */
-bool igt_check_crc_equal(const igt_crc_t *a, const igt_crc_t *b)
-{
-	int index;
-	bool mismatch;
-
-	mismatch = igt_find_crc_mismatch(a, b, &index);
-	if (mismatch)
-		igt_debug("CRC mismatch at index %d: 0x%x != 0x%x\n", index,
-			  a->crc[index], b->crc[index]);
-
-	return !mismatch;
-}
-
-/**
- * igt_crc_to_string_extended:
- * @crc: pipe CRC value to print
- * @delimiter: The delimiter to use between crc words
- * @crc_size: the number of bytes to print per crc word (between 1 and 4)
- *
- * This function allocates a string and formats @crc into it, depending on
- * @delimiter and @crc_size.
- * The caller is responsible for freeing the string.
- *
- * This should only ever be used for diagnostic debug output.
- */
-char *igt_crc_to_string_extended(igt_crc_t *crc, char delimiter, int crc_size)
-{
-	int i;
-	int len = 0;
-	int field_width = 2 * crc_size; /* Two chars per byte. */
-	char *buf = malloc((field_width+1) * crc->n_words);
-
-	if (!buf)
-		return NULL;
-
-	for (i = 0; i < crc->n_words - 1; i++)
-		len += sprintf(buf + len, "%0*x%c", field_width,
-			       crc->crc[i], delimiter);
-
-	sprintf(buf + len, "%0*x", field_width, crc->crc[i]);
-
-	return buf;
-}
-
-/**
- * igt_crc_to_string:
- * @crc: pipe CRC value to print
- *
- * This function allocates a string and formats @crc into it.
- * The caller is responsible for freeing the string.
- *
- * This should only ever be used for diagnostic debug output.
- */
-char *igt_crc_to_string(igt_crc_t *crc)
-{
-	return igt_crc_to_string_extended(crc, ' ', 4);
-}
-
-#define MAX_CRC_ENTRIES 10
-#define MAX_LINE_LEN (10 + 11 * MAX_CRC_ENTRIES + 1)
-
-struct _igt_pipe_crc {
-	int fd;
-	int dir;
-	int ctl_fd;
-	int crc_fd;
-	int flags;
-
-	enum pipe pipe;
-	char *source;
-};
-
-/**
- * igt_require_pipe_crc:
- *
- * Convenience helper to check whether pipe CRC capturing is supported by the
- * kernel. Uses igt_skip to automatically skip the test/subtest if this isn't
- * the case.
- */
-void igt_require_pipe_crc(int fd)
-{
-	int dir;
-	struct stat stat;
-
-	dir = igt_debugfs_dir(fd);
-	igt_require_f(dir >= 0, "Could not open debugfs directory\n");
-	igt_require_f(fstatat(dir, "crtc-0/crc/control", &stat, 0) == 0,
-		      "CRCs not supported on this platform\n");
-
-	close(dir);
-}
-
 static void igt_hpd_storm_exit_handler(int sig)
 {
 	int fd = drm_open_driver(DRIVER_INTEL);
@@ -715,383 +528,6 @@ void igt_require_hpd_storm_ctl(int drm_fd)
 	close(fd);
 }
 
-static igt_pipe_crc_t *
-pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
-{
-	igt_pipe_crc_t *pipe_crc;
-	char buf[128];
-	int debugfs;
-	const char *env_source;
-
-	igt_assert(source);
-
-	env_source = getenv("IGT_CRC_SOURCE");
-
-	if (!env_source)
-		env_source = source;
-
-	debugfs = igt_debugfs_dir(fd);
-	igt_assert(debugfs != -1);
-
-	pipe_crc = calloc(1, sizeof(struct _igt_pipe_crc));
-	igt_assert(pipe_crc);
-
-	sprintf(buf, "crtc-%d/crc/control", pipe);
-	pipe_crc->ctl_fd = openat(debugfs, buf, O_WRONLY);
-	igt_assert(pipe_crc->ctl_fd != -1);
-
-	pipe_crc->crc_fd = -1;
-	pipe_crc->fd = fd;
-	pipe_crc->dir = debugfs;
-	pipe_crc->pipe = pipe;
-	pipe_crc->source = strdup(env_source);
-	igt_assert(pipe_crc->source);
-	pipe_crc->flags = flags;
-
-	return pipe_crc;
-}
-
-/**
- * igt_pipe_crc_new:
- * @pipe: display pipe to use as source
- * @source: CRC tap point to use as source
- *
- * This sets up a new pipe CRC capture object for the given @pipe and @source
- * in blocking mode.
- *
- * Returns: A pipe CRC object for the given @pipe and @source. The library
- * assumes that the source is always available since recent kernels support at
- * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
- */
-igt_pipe_crc_t *
-igt_pipe_crc_new(int fd, enum pipe pipe, const char *source)
-{
-	return pipe_crc_new(fd, pipe, source, O_RDONLY);
-}
-
-/**
- * igt_pipe_crc_new_nonblock:
- * @pipe: display pipe to use as source
- * @source: CRC tap point to use as source
- *
- * This sets up a new pipe CRC capture object for the given @pipe and @source
- * in nonblocking mode.
- *
- * Returns: A pipe CRC object for the given @pipe and @source. The library
- * assumes that the source is always available since recent kernels support at
- * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
- */
-igt_pipe_crc_t *
-igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source)
-{
-	return pipe_crc_new(fd, pipe, source, O_RDONLY | O_NONBLOCK);
-}
-
-/**
- * igt_pipe_crc_free:
- * @pipe_crc: pipe CRC object
- *
- * Frees all resources associated with @pipe_crc.
- */
-void igt_pipe_crc_free(igt_pipe_crc_t *pipe_crc)
-{
-	if (!pipe_crc)
-		return;
-
-	close(pipe_crc->ctl_fd);
-	close(pipe_crc->crc_fd);
-	close(pipe_crc->dir);
-	free(pipe_crc->source);
-	free(pipe_crc);
-}
-
-static bool pipe_crc_init_from_string(igt_pipe_crc_t *pipe_crc, igt_crc_t *crc,
-				      const char *line)
-{
-	int i;
-	const char *buf;
-
-	if (strncmp(line, "XXXXXXXXXX", 10) == 0)
-		crc->has_valid_frame = false;
-	else {
-		crc->has_valid_frame = true;
-		crc->frame = strtoul(line, NULL, 16);
-	}
-
-	buf = line + 10;
-	for (i = 0; *buf != '\n'; i++, buf += 11)
-		crc->crc[i] = strtoul(buf, NULL, 16);
-
-	crc->n_words = i;
-
-	return true;
-}
-
-static int read_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
-{
-	ssize_t bytes_read;
-	char buf[MAX_LINE_LEN + 1];
-
-	igt_set_timeout(5, "CRC reading");
-	bytes_read = read(pipe_crc->crc_fd, &buf, MAX_LINE_LEN);
-	igt_reset_timeout();
-
-	if (bytes_read < 0)
-		bytes_read = -errno;
-	else
-		buf[bytes_read] = '\0';
-
-	if (bytes_read > 0 && !pipe_crc_init_from_string(pipe_crc, out, buf))
-		return -EINVAL;
-
-	return bytes_read;
-}
-
-static void read_one_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
-{
-	int ret;
-
-	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags & ~O_NONBLOCK);
-
-	do {
-		ret = read_crc(pipe_crc, out);
-	} while (ret == -EINTR);
-
-	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags);
-}
-
-/**
- * igt_pipe_crc_start:
- * @pipe_crc: pipe CRC object
- *
- * Starts the CRC capture process on @pipe_crc.
- */
-void igt_pipe_crc_start(igt_pipe_crc_t *pipe_crc)
-{
-	const char *src = pipe_crc->source;
-	struct pollfd pfd;
-	char buf[32];
-
-	/* Stop first just to make sure we don't have lingering state left. */
-	igt_pipe_crc_stop(pipe_crc);
-
-	igt_reset_fifo_underrun_reporting(pipe_crc->fd);
-
-	igt_assert_eq(write(pipe_crc->ctl_fd, src, strlen(src)), strlen(src));
-
-	sprintf(buf, "crtc-%d/crc/data", pipe_crc->pipe);
-
-	igt_set_timeout(10, "Opening crc fd, and poll for first CRC.");
-	pipe_crc->crc_fd = openat(pipe_crc->dir, buf, pipe_crc->flags);
-	igt_assert(pipe_crc->crc_fd != -1);
-
-	pfd.fd = pipe_crc->crc_fd;
-	pfd.events = POLLIN;
-	poll(&pfd, 1, -1);
-
-	igt_reset_timeout();
-
-	errno = 0;
-}
-
-/**
- * igt_pipe_crc_stop:
- * @pipe_crc: pipe CRC object
- *
- * Stops the CRC capture process on @pipe_crc.
- */
-void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc)
-{
-	close(pipe_crc->crc_fd);
-	pipe_crc->crc_fd = -1;
-}
-
-/**
- * igt_pipe_crc_get_crcs:
- * @pipe_crc: pipe CRC object
- * @n_crcs: number of CRCs to capture
- * @out_crcs: buffer pointer for the captured CRC values
- *
- * Read up to @n_crcs from @pipe_crc. This function does not block, and will
- * return early if not enough CRCs can be captured, if @pipe_crc has been
- * opened using igt_pipe_crc_new_nonblock(). It will block until @n_crcs are
- * retrieved if @pipe_crc has been opened using igt_pipe_crc_new(). @out_crcs is
- * alloced by this function and must be released with free() by the caller.
- *
- * Callers must start and stop the capturing themselves by calling
- * igt_pipe_crc_start() and igt_pipe_crc_stop(). For one-shot CRC collecting
- * look at igt_pipe_crc_collect_crc().
- *
- * Returns:
- * The number of CRCs captured. Should be equal to @n_crcs in blocking mode, but
- * can be less (even zero) in non-blocking mode.
- */
-int
-igt_pipe_crc_get_crcs(igt_pipe_crc_t *pipe_crc, int n_crcs,
-		      igt_crc_t **out_crcs)
-{
-	igt_crc_t *crcs;
-	int n = 0;
-
-	crcs = calloc(n_crcs, sizeof(igt_crc_t));
-
-	do {
-		igt_crc_t *crc = &crcs[n];
-		int ret;
-
-		ret = read_crc(pipe_crc, crc);
-		if (ret == -EAGAIN)
-			break;
-
-		if (ret < 0)
-			continue;
-
-		n++;
-	} while (n < n_crcs);
-
-	*out_crcs = crcs;
-	return n;
-}
-
-static void crc_sanity_checks(igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
-{
-	int i;
-	bool all_zero = true;
-
-	/* Any CRC value can be considered valid on amdgpu hardware. */
-	if (is_amdgpu_device(pipe_crc->fd))
-		return;
-
-	for (i = 0; i < crc->n_words; i++) {
-		igt_warn_on_f(crc->crc[i] == 0xffffffff,
-			      "Suspicious CRC: it looks like the CRC "
-			      "read back was from a register in a powered "
-			      "down well\n");
-		if (crc->crc[i])
-			all_zero = false;
-	}
-
-	igt_warn_on_f(all_zero, "Suspicious CRC: All values are 0.\n");
-}
-
-/**
- * igt_pipe_crc_drain:
- * @pipe_crc: pipe CRC object
- *
- * Discards all currently queued CRC values from @pipe_crc. This function does
- * not block, and is useful to flush @pipe_crc. Afterwards you can get a fresh
- * CRC with igt_pipe_crc_get_single().
- */
-void igt_pipe_crc_drain(igt_pipe_crc_t *pipe_crc)
-{
-	int ret;
-	igt_crc_t crc;
-
-	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags | O_NONBLOCK);
-
-	do {
-		ret = read_crc(pipe_crc, &crc);
-	} while (ret > 0 || ret == -EINVAL);
-
-	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags);
-}
-
-/**
- * igt_pipe_crc_get_single:
- * @pipe_crc: pipe CRC object
- * @crc: buffer pointer for the captured CRC value
- *
- * Read a single @crc from @pipe_crc. This function blocks even
- * when nonblocking CRC is requested.
- *
- * Callers must start and stop the capturing themselves by calling
- * igt_pipe_crc_start() and igt_pipe_crc_stop(). For one-shot CRC collecting
- * look at igt_pipe_crc_collect_crc().
- *
- * If capturing has been going on for a while and a fresh crc is required,
- * you should use igt_pipe_crc_get_current() instead.
- */
-void igt_pipe_crc_get_single(igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
-{
-	read_one_crc(pipe_crc, crc);
-
-	crc_sanity_checks(pipe_crc, crc);
-}
-
-/**
- * igt_pipe_crc_get_current:
- * @drm_fd: Pointer to drm fd for vblank counter
- * @pipe_crc: pipe CRC object
- * @vblank: frame counter value we're looking for
- * @crc: buffer pointer for the captured CRC value
- *
- * Same as igt_pipe_crc_get_single(), but will wait until a CRC has been captured
- * for frame @vblank.
- */
-void
-igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
-			   unsigned int vblank, igt_crc_t *crc)
-{
-	do {
-		read_one_crc(pipe_crc, crc);
-
-		/* Only works with valid frame counter */
-		if (!crc->has_valid_frame) {
-			igt_pipe_crc_drain(pipe_crc);
-			igt_pipe_crc_get_single(pipe_crc, crc);
-			return;
-		}
-	} while (igt_vblank_before(crc->frame, vblank));
-
-	crc_sanity_checks(pipe_crc, crc);
-}
-
-/**
- * igt_pipe_crc_get_current:
- * @drm_fd: Pointer to drm fd for vblank counter
- * @pipe_crc: pipe CRC object
- * @crc: buffer pointer for the captured CRC value
- *
- * Same as igt_pipe_crc_get_single(), but will wait until a new CRC can be captured.
- * This is useful for retrieving the current CRC in a more race free way than
- * igt_pipe_crc_drain() + igt_pipe_crc_get_single().
- */
-void
-igt_pipe_crc_get_current(int drm_fd, igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
-{
-	unsigned vblank = kmstest_get_vblank(drm_fd, pipe_crc->pipe, 0) + 1;
-
-	return igt_pipe_crc_get_for_frame(drm_fd, pipe_crc, vblank, crc);
-}
-
-/**
- * igt_pipe_crc_collect_crc:
- * @pipe_crc: pipe CRC object
- * @out_crc: buffer for the captured CRC values
- *
- * Read a single CRC from @pipe_crc. This function blocks until the CRC is
- * retrieved, irrespective of whether @pipe_crc has been opened with
- * igt_pipe_crc_new() or igt_pipe_crc_new_nonblock().  @out_crc must be
- * allocated by the caller.
- *
- * This function takes care of the pipe_crc book-keeping, it will start/stop
- * the collection of the CRC.
- *
- * This function also calls the interactive debug with the "crc" domain, so you
- * can make use of this feature to actually see the screen that is being CRC'd.
- *
- * For continuous CRC collection look at igt_pipe_crc_start(),
- * igt_pipe_crc_get_crcs() and igt_pipe_crc_stop().
- */
-void igt_pipe_crc_collect_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out_crc)
-{
-	igt_debug_wait_for_keypress("crc");
-
-	igt_pipe_crc_start(pipe_crc);
-	igt_pipe_crc_get_single(pipe_crc, out_crc);
-	igt_pipe_crc_stop(pipe_crc);
-}
-
 /**
  * igt_reset_fifo_underrun_reporting:
  * @drm_fd: drm device file descriptor
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 05d29f171610..a883e2d4afdb 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -68,63 +68,6 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
 #define igt_debugfs_write(fd, filename, buf) \
 		__igt_debugfs_write(fd, (filename), (buf), sizeof(buf))
 
-/*
- * Pipe CRC
- */
-
-/**
- * igt_pipe_crc_t:
- *
- * Pipe CRC support structure. Needs to be allocated and set up with
- * igt_pipe_crc_new() for a specific pipe and pipe CRC source value.
- */
-typedef struct _igt_pipe_crc igt_pipe_crc_t;
-
-#define DRM_MAX_CRC_NR 10
-/**
- * igt_crc_t:
- * @frame: frame number of the capture CRC
- * @n_words: internal field, don't access
- * @crc: internal field, don't access
- *
- * Pipe CRC value. All other members than @frame are private and should not be
- * inspected by testcases.
- */
-typedef struct {
-	uint32_t frame;
-	bool has_valid_frame;
-	int n_words;
-	uint32_t crc[DRM_MAX_CRC_NR];
-} igt_crc_t;
-
-#define IGT_PIPE_CRC_SOURCE_AUTO "auto"
-#define AMDGPU_PIPE_CRC_SOURCE_DPRX "dprx"
-
-bool igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int *index);
-void igt_assert_crc_equal(const igt_crc_t *a, const igt_crc_t *b);
-bool igt_check_crc_equal(const igt_crc_t *a, const igt_crc_t *b);
-char *igt_crc_to_string_extended(igt_crc_t *crc, char delimiter, int crc_size);
-char *igt_crc_to_string(igt_crc_t *crc);
-
-void igt_require_pipe_crc(int fd);
-igt_pipe_crc_t *
-igt_pipe_crc_new(int fd, enum pipe pipe, const char *source);
-igt_pipe_crc_t *
-igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source);
-void igt_pipe_crc_free(igt_pipe_crc_t *pipe_crc);
-void igt_pipe_crc_start(igt_pipe_crc_t *pipe_crc);
-void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc);
-__attribute__((warn_unused_result))
-int igt_pipe_crc_get_crcs(igt_pipe_crc_t *pipe_crc, int n_crcs,
-			  igt_crc_t **out_crcs);
-void igt_pipe_crc_drain(igt_pipe_crc_t *pipe_crc);
-void igt_pipe_crc_get_single(igt_pipe_crc_t *pipe_crc, igt_crc_t *out_crc);
-void igt_pipe_crc_get_current(int drm_fd, igt_pipe_crc_t *pipe_crc, igt_crc_t *crc);
-void igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
-				unsigned int vblank, igt_crc_t *crc);
-
-void igt_pipe_crc_collect_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out_crc);
-
 void igt_hpd_storm_set_threshold(int fd, unsigned int threshold);
 void igt_hpd_storm_reset(int fd);
 bool igt_hpd_storm_detected(int fd);
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index b3f096fe3837..6995b14b2828 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -41,6 +41,7 @@
 #include "igt_debugfs.h"
 
 struct buf_ops;
+typedef struct _igt_crc igt_crc_t;
 
 /*
  * Internal format to denote a buffer compatible with pixman's
diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
new file mode 100644
index 000000000000..14fe7331f0b0
--- /dev/null
+++ b/lib/igt_pipe_crc.c
@@ -0,0 +1,610 @@
+/*
+ * Copyright © 2013 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#include <inttypes.h>
+#include <sys/stat.h>
+#include <sys/mount.h>
+#ifdef __linux__
+#include <sys/sysmacros.h>
+#endif
+#include <dirent.h>
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <limits.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <poll.h>
+
+#include "drmtest.h"
+#include "igt_aux.h"
+#include "igt_kms.h"
+#include "igt_debugfs.h"
+#include "igt_pipe_crc.h"
+
+/**
+ * SECTION:igt_pipe_crc
+ * @short_description: Pipe CRC support
+ * @title: pipe_crc
+ * @include: igt_pipe_crc.h
+ *
+ * This library wraps up the kernel's support for capturing pipe CRCs into a
+ * neat and tidy package. For the detailed usage see all the functions which
+ * work on #igt_pipe_crc_t. This is supported on all platforms and outputs.
+ *
+ * Actually using pipe CRCs to write modeset tests is a bit tricky though, so
+ * there is no way to directly check a CRC: Both the details of the plane
+ * blending, color correction and other hardware and how exactly the CRC is
+ * computed at each tap point vary by hardware generation and are not disclosed.
+ *
+ * The only way to use #igt_crc_t CRCs therefore is to compare CRCs among each
+ * another either for equality or difference. Otherwise CRCs must be treated as
+ * completely opaque values. Note that not even CRCs from different pipes or tap
+ * points on the same platform can be compared. Hence only use
+ * igt_assert_crc_equal() to inspect CRC values captured by the same
+ * #igt_pipe_crc_t object.
+ */
+
+/**
+ * igt_find_crc_mismatch:
+ * @a: first pipe CRC value
+ * @b: second pipe CRC value
+ * @index: index of the first value that mismatched
+ *
+ * Check if CRC a and CRC b mismatch.
+ *
+ * Returns true if CRC values mismatch, false otherwise;
+ */
+bool igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int *index)
+{
+	int nwords = min(a->n_words, b->n_words);
+	int i;
+
+	for (i = 0; i < nwords; i++) {
+		if (a->crc[i] != b->crc[i]) {
+			if (index)
+				*index = i;
+
+			return true;
+		}
+	}
+
+	if (a->n_words != b->n_words) {
+		if (index)
+			*index = i;
+		return true;
+	}
+
+	return false;
+}
+
+/**
+ * igt_assert_crc_equal:
+ * @a: first pipe CRC value
+ * @b: second pipe CRC value
+ *
+ * Compares two CRC values and fails the testcase if they don't match with
+ * igt_fail(). Note that due to CRC collisions CRC based testcase can only
+ * assert that CRCs match, never that they are different. Otherwise there might
+ * be random testcase failures when different screen contents end up with the
+ * same CRC by chance.
+ *
+ * Passing --skip-crc-compare on the command line will force this function
+ * to always pass, which can be useful in interactive debugging where you
+ * might know the test will fail, but still want the test to keep going as if
+ * it had succeeded so that you can see the on-screen behavior.
+ *
+ */
+void igt_assert_crc_equal(const igt_crc_t *a, const igt_crc_t *b)
+{
+	int index;
+	bool mismatch;
+
+	mismatch = igt_find_crc_mismatch(a, b, &index);
+	if (mismatch)
+		igt_debug("CRC mismatch%s at index %d: 0x%x != 0x%x\n",
+			  igt_skip_crc_compare ? " (ignored)" : "",
+			  index, a->crc[index], b->crc[index]);
+
+	igt_assert(!mismatch || igt_skip_crc_compare);
+}
+
+/**
+ * igt_check_crc_equal:
+ * @a: first pipe CRC value
+ * @b: second pipe CRC value
+ *
+ * Compares two CRC values and return whether they match.
+ *
+ * Returns: A boolean indicating whether the CRC values match
+ */
+bool igt_check_crc_equal(const igt_crc_t *a, const igt_crc_t *b)
+{
+	int index;
+	bool mismatch;
+
+	mismatch = igt_find_crc_mismatch(a, b, &index);
+	if (mismatch)
+		igt_debug("CRC mismatch at index %d: 0x%x != 0x%x\n", index,
+			  a->crc[index], b->crc[index]);
+
+	return !mismatch;
+}
+
+/**
+ * igt_crc_to_string_extended:
+ * @crc: pipe CRC value to print
+ * @delimiter: The delimiter to use between crc words
+ * @crc_size: the number of bytes to print per crc word (between 1 and 4)
+ *
+ * This function allocates a string and formats @crc into it, depending on
+ * @delimiter and @crc_size.
+ * The caller is responsible for freeing the string.
+ *
+ * This should only ever be used for diagnostic debug output.
+ */
+char *igt_crc_to_string_extended(igt_crc_t *crc, char delimiter, int crc_size)
+{
+	int i;
+	int len = 0;
+	int field_width = 2 * crc_size; /* Two chars per byte. */
+	char *buf = malloc((field_width+1) * crc->n_words);
+
+	if (!buf)
+		return NULL;
+
+	for (i = 0; i < crc->n_words - 1; i++)
+		len += sprintf(buf + len, "%0*x%c", field_width,
+			       crc->crc[i], delimiter);
+
+	sprintf(buf + len, "%0*x", field_width, crc->crc[i]);
+
+	return buf;
+}
+
+/**
+ * igt_crc_to_string:
+ * @crc: pipe CRC value to print
+ *
+ * This function allocates a string and formats @crc into it.
+ * The caller is responsible for freeing the string.
+ *
+ * This should only ever be used for diagnostic debug output.
+ */
+char *igt_crc_to_string(igt_crc_t *crc)
+{
+	return igt_crc_to_string_extended(crc, ' ', 4);
+}
+
+#define MAX_CRC_ENTRIES 10
+#define MAX_LINE_LEN (10 + 11 * MAX_CRC_ENTRIES + 1)
+
+struct _igt_pipe_crc {
+	int fd;
+	int dir;
+	int ctl_fd;
+	int crc_fd;
+	int flags;
+
+	enum pipe pipe;
+	char *source;
+};
+
+/**
+ * igt_require_pipe_crc:
+ *
+ * Convenience helper to check whether pipe CRC capturing is supported by the
+ * kernel. Uses igt_skip to automatically skip the test/subtest if this isn't
+ * the case.
+ */
+void igt_require_pipe_crc(int fd)
+{
+	int dir;
+	struct stat stat;
+
+	dir = igt_debugfs_dir(fd);
+	igt_require_f(dir >= 0, "Could not open debugfs directory\n");
+	igt_require_f(fstatat(dir, "crtc-0/crc/control", &stat, 0) == 0,
+		      "CRCs not supported on this platform\n");
+
+	close(dir);
+}
+
+static igt_pipe_crc_t *
+pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
+{
+	igt_pipe_crc_t *pipe_crc;
+	char buf[128];
+	int debugfs;
+	const char *env_source;
+
+	igt_assert(source);
+
+	env_source = getenv("IGT_CRC_SOURCE");
+
+	if (!env_source)
+		env_source = source;
+
+	debugfs = igt_debugfs_dir(fd);
+	igt_assert(debugfs != -1);
+
+	pipe_crc = calloc(1, sizeof(struct _igt_pipe_crc));
+	igt_assert(pipe_crc);
+
+	sprintf(buf, "crtc-%d/crc/control", pipe);
+	pipe_crc->ctl_fd = openat(debugfs, buf, O_WRONLY);
+	igt_assert(pipe_crc->ctl_fd != -1);
+
+	pipe_crc->crc_fd = -1;
+	pipe_crc->fd = fd;
+	pipe_crc->dir = debugfs;
+	pipe_crc->pipe = pipe;
+	pipe_crc->source = strdup(env_source);
+	igt_assert(pipe_crc->source);
+	pipe_crc->flags = flags;
+
+	return pipe_crc;
+}
+
+/**
+ * igt_pipe_crc_new:
+ * @pipe: display pipe to use as source
+ * @source: CRC tap point to use as source
+ *
+ * This sets up a new pipe CRC capture object for the given @pipe and @source
+ * in blocking mode.
+ *
+ * Returns: A pipe CRC object for the given @pipe and @source. The library
+ * assumes that the source is always available since recent kernels support at
+ * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
+ */
+igt_pipe_crc_t *
+igt_pipe_crc_new(int fd, enum pipe pipe, const char *source)
+{
+	return pipe_crc_new(fd, pipe, source, O_RDONLY);
+}
+
+/**
+ * igt_pipe_crc_new_nonblock:
+ * @pipe: display pipe to use as source
+ * @source: CRC tap point to use as source
+ *
+ * This sets up a new pipe CRC capture object for the given @pipe and @source
+ * in nonblocking mode.
+ *
+ * Returns: A pipe CRC object for the given @pipe and @source. The library
+ * assumes that the source is always available since recent kernels support at
+ * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
+ */
+igt_pipe_crc_t *
+igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source)
+{
+	return pipe_crc_new(fd, pipe, source, O_RDONLY | O_NONBLOCK);
+}
+
+/**
+ * igt_pipe_crc_free:
+ * @pipe_crc: pipe CRC object
+ *
+ * Frees all resources associated with @pipe_crc.
+ */
+void igt_pipe_crc_free(igt_pipe_crc_t *pipe_crc)
+{
+	if (!pipe_crc)
+		return;
+
+	close(pipe_crc->ctl_fd);
+	close(pipe_crc->crc_fd);
+	close(pipe_crc->dir);
+	free(pipe_crc->source);
+	free(pipe_crc);
+}
+
+static bool pipe_crc_init_from_string(igt_pipe_crc_t *pipe_crc, igt_crc_t *crc,
+				      const char *line)
+{
+	int i;
+	const char *buf;
+
+	if (strncmp(line, "XXXXXXXXXX", 10) == 0)
+		crc->has_valid_frame = false;
+	else {
+		crc->has_valid_frame = true;
+		crc->frame = strtoul(line, NULL, 16);
+	}
+
+	buf = line + 10;
+	for (i = 0; *buf != '\n'; i++, buf += 11)
+		crc->crc[i] = strtoul(buf, NULL, 16);
+
+	crc->n_words = i;
+
+	return true;
+}
+
+static int read_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
+{
+	ssize_t bytes_read;
+	char buf[MAX_LINE_LEN + 1];
+
+	igt_set_timeout(5, "CRC reading");
+	bytes_read = read(pipe_crc->crc_fd, &buf, MAX_LINE_LEN);
+	igt_reset_timeout();
+
+	if (bytes_read < 0)
+		bytes_read = -errno;
+	else
+		buf[bytes_read] = '\0';
+
+	if (bytes_read > 0 && !pipe_crc_init_from_string(pipe_crc, out, buf))
+		return -EINVAL;
+
+	return bytes_read;
+}
+
+static void read_one_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
+{
+	int ret;
+
+	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags & ~O_NONBLOCK);
+
+	do {
+		ret = read_crc(pipe_crc, out);
+	} while (ret == -EINTR);
+
+	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags);
+}
+
+/**
+ * igt_pipe_crc_start:
+ * @pipe_crc: pipe CRC object
+ *
+ * Starts the CRC capture process on @pipe_crc.
+ */
+void igt_pipe_crc_start(igt_pipe_crc_t *pipe_crc)
+{
+	const char *src = pipe_crc->source;
+	struct pollfd pfd;
+	char buf[32];
+
+	/* Stop first just to make sure we don't have lingering state left. */
+	igt_pipe_crc_stop(pipe_crc);
+
+	igt_reset_fifo_underrun_reporting(pipe_crc->fd);
+
+	igt_assert_eq(write(pipe_crc->ctl_fd, src, strlen(src)), strlen(src));
+
+	sprintf(buf, "crtc-%d/crc/data", pipe_crc->pipe);
+
+	igt_set_timeout(10, "Opening crc fd, and poll for first CRC.");
+	pipe_crc->crc_fd = openat(pipe_crc->dir, buf, pipe_crc->flags);
+	igt_assert(pipe_crc->crc_fd != -1);
+
+	pfd.fd = pipe_crc->crc_fd;
+	pfd.events = POLLIN;
+	poll(&pfd, 1, -1);
+
+	igt_reset_timeout();
+
+	errno = 0;
+}
+
+/**
+ * igt_pipe_crc_stop:
+ * @pipe_crc: pipe CRC object
+ *
+ * Stops the CRC capture process on @pipe_crc.
+ */
+void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc)
+{
+	close(pipe_crc->crc_fd);
+	pipe_crc->crc_fd = -1;
+}
+
+/**
+ * igt_pipe_crc_get_crcs:
+ * @pipe_crc: pipe CRC object
+ * @n_crcs: number of CRCs to capture
+ * @out_crcs: buffer pointer for the captured CRC values
+ *
+ * Read up to @n_crcs from @pipe_crc. This function does not block, and will
+ * return early if not enough CRCs can be captured, if @pipe_crc has been
+ * opened using igt_pipe_crc_new_nonblock(). It will block until @n_crcs are
+ * retrieved if @pipe_crc has been opened using igt_pipe_crc_new(). @out_crcs is
+ * alloced by this function and must be released with free() by the caller.
+ *
+ * Callers must start and stop the capturing themselves by calling
+ * igt_pipe_crc_start() and igt_pipe_crc_stop(). For one-shot CRC collecting
+ * look at igt_pipe_crc_collect_crc().
+ *
+ * Returns:
+ * The number of CRCs captured. Should be equal to @n_crcs in blocking mode, but
+ * can be less (even zero) in non-blocking mode.
+ */
+int
+igt_pipe_crc_get_crcs(igt_pipe_crc_t *pipe_crc, int n_crcs,
+		      igt_crc_t **out_crcs)
+{
+	igt_crc_t *crcs;
+	int n = 0;
+
+	crcs = calloc(n_crcs, sizeof(igt_crc_t));
+
+	do {
+		igt_crc_t *crc = &crcs[n];
+		int ret;
+
+		ret = read_crc(pipe_crc, crc);
+		if (ret == -EAGAIN)
+			break;
+
+		if (ret < 0)
+			continue;
+
+		n++;
+	} while (n < n_crcs);
+
+	*out_crcs = crcs;
+	return n;
+}
+
+static void crc_sanity_checks(igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
+{
+	int i;
+	bool all_zero = true;
+
+	/* Any CRC value can be considered valid on amdgpu hardware. */
+	if (is_amdgpu_device(pipe_crc->fd))
+		return;
+
+	for (i = 0; i < crc->n_words; i++) {
+		igt_warn_on_f(crc->crc[i] == 0xffffffff,
+			      "Suspicious CRC: it looks like the CRC "
+			      "read back was from a register in a powered "
+			      "down well\n");
+		if (crc->crc[i])
+			all_zero = false;
+	}
+
+	igt_warn_on_f(all_zero, "Suspicious CRC: All values are 0.\n");
+}
+
+/**
+ * igt_pipe_crc_drain:
+ * @pipe_crc: pipe CRC object
+ *
+ * Discards all currently queued CRC values from @pipe_crc. This function does
+ * not block, and is useful to flush @pipe_crc. Afterwards you can get a fresh
+ * CRC with igt_pipe_crc_get_single().
+ */
+void igt_pipe_crc_drain(igt_pipe_crc_t *pipe_crc)
+{
+	int ret;
+	igt_crc_t crc;
+
+	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags | O_NONBLOCK);
+
+	do {
+		ret = read_crc(pipe_crc, &crc);
+	} while (ret > 0 || ret == -EINVAL);
+
+	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags);
+}
+
+/**
+ * igt_pipe_crc_get_single:
+ * @pipe_crc: pipe CRC object
+ * @crc: buffer pointer for the captured CRC value
+ *
+ * Read a single @crc from @pipe_crc. This function blocks even
+ * when nonblocking CRC is requested.
+ *
+ * Callers must start and stop the capturing themselves by calling
+ * igt_pipe_crc_start() and igt_pipe_crc_stop(). For one-shot CRC collecting
+ * look at igt_pipe_crc_collect_crc().
+ *
+ * If capturing has been going on for a while and a fresh crc is required,
+ * you should use igt_pipe_crc_get_current() instead.
+ */
+void igt_pipe_crc_get_single(igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
+{
+	read_one_crc(pipe_crc, crc);
+
+	crc_sanity_checks(pipe_crc, crc);
+}
+
+/**
+ * igt_pipe_crc_get_current:
+ * @drm_fd: Pointer to drm fd for vblank counter
+ * @pipe_crc: pipe CRC object
+ * @vblank: frame counter value we're looking for
+ * @crc: buffer pointer for the captured CRC value
+ *
+ * Same as igt_pipe_crc_get_single(), but will wait until a CRC has been captured
+ * for frame @vblank.
+ */
+void
+igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
+			   unsigned int vblank, igt_crc_t *crc)
+{
+	do {
+		read_one_crc(pipe_crc, crc);
+
+		/* Only works with valid frame counter */
+		if (!crc->has_valid_frame) {
+			igt_pipe_crc_drain(pipe_crc);
+			igt_pipe_crc_get_single(pipe_crc, crc);
+			return;
+		}
+	} while (igt_vblank_before(crc->frame, vblank));
+
+	crc_sanity_checks(pipe_crc, crc);
+}
+
+/**
+ * igt_pipe_crc_get_current:
+ * @drm_fd: Pointer to drm fd for vblank counter
+ * @pipe_crc: pipe CRC object
+ * @crc: buffer pointer for the captured CRC value
+ *
+ * Same as igt_pipe_crc_get_single(), but will wait until a new CRC can be captured.
+ * This is useful for retrieving the current CRC in a more race free way than
+ * igt_pipe_crc_drain() + igt_pipe_crc_get_single().
+ */
+void
+igt_pipe_crc_get_current(int drm_fd, igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
+{
+	unsigned vblank = kmstest_get_vblank(drm_fd, pipe_crc->pipe, 0) + 1;
+
+	return igt_pipe_crc_get_for_frame(drm_fd, pipe_crc, vblank, crc);
+}
+
+/**
+ * igt_pipe_crc_collect_crc:
+ * @pipe_crc: pipe CRC object
+ * @out_crc: buffer for the captured CRC values
+ *
+ * Read a single CRC from @pipe_crc. This function blocks until the CRC is
+ * retrieved, irrespective of whether @pipe_crc has been opened with
+ * igt_pipe_crc_new() or igt_pipe_crc_new_nonblock().  @out_crc must be
+ * allocated by the caller.
+ *
+ * This function takes care of the pipe_crc book-keeping, it will start/stop
+ * the collection of the CRC.
+ *
+ * This function also calls the interactive debug with the "crc" domain, so you
+ * can make use of this feature to actually see the screen that is being CRC'd.
+ *
+ * For continuous CRC collection look at igt_pipe_crc_start(),
+ * igt_pipe_crc_get_crcs() and igt_pipe_crc_stop().
+ */
+void igt_pipe_crc_collect_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out_crc)
+{
+	igt_debug_wait_for_keypress("crc");
+
+	igt_pipe_crc_start(pipe_crc);
+	igt_pipe_crc_get_single(pipe_crc, out_crc);
+	igt_pipe_crc_stop(pipe_crc);
+}
diff --git a/lib/igt_pipe_crc.h b/lib/igt_pipe_crc.h
new file mode 100644
index 000000000000..2e1d3f918bf2
--- /dev/null
+++ b/lib/igt_pipe_crc.h
@@ -0,0 +1,87 @@
+/*
+ * Copyright © 2013 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __IGT_PIPE_CRC_H__
+#define __IGT_PIPE_CRC_H__
+
+#include <stdbool.h>
+#include <stdint.h>
+
+enum pipe;
+
+/**
+ * igt_pipe_crc_t:
+ *
+ * Pipe CRC support structure. Needs to be allocated and set up with
+ * igt_pipe_crc_new() for a specific pipe and pipe CRC source value.
+ */
+typedef struct _igt_pipe_crc igt_pipe_crc_t;
+
+#define DRM_MAX_CRC_NR 10
+/**
+ * igt_crc_t:
+ * @frame: frame number of the capture CRC
+ * @n_words: internal field, don't access
+ * @crc: internal field, don't access
+ *
+ * Pipe CRC value. All other members than @frame are private and should not be
+ * inspected by testcases.
+ */
+struct _igt_crc {
+	uint32_t frame;
+	bool has_valid_frame;
+	int n_words;
+	uint32_t crc[DRM_MAX_CRC_NR];
+};
+typedef struct _igt_crc igt_crc_t;
+
+#define IGT_PIPE_CRC_SOURCE_AUTO "auto"
+#define AMDGPU_PIPE_CRC_SOURCE_DPRX "dprx"
+
+bool igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int *index);
+void igt_assert_crc_equal(const igt_crc_t *a, const igt_crc_t *b);
+bool igt_check_crc_equal(const igt_crc_t *a, const igt_crc_t *b);
+char *igt_crc_to_string_extended(igt_crc_t *crc, char delimiter, int crc_size);
+char *igt_crc_to_string(igt_crc_t *crc);
+
+void igt_require_pipe_crc(int fd);
+igt_pipe_crc_t *
+igt_pipe_crc_new(int fd, enum pipe pipe, const char *source);
+igt_pipe_crc_t *
+igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source);
+void igt_pipe_crc_free(igt_pipe_crc_t *pipe_crc);
+void igt_pipe_crc_start(igt_pipe_crc_t *pipe_crc);
+void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc);
+__attribute__((warn_unused_result))
+int igt_pipe_crc_get_crcs(igt_pipe_crc_t *pipe_crc, int n_crcs,
+			  igt_crc_t **out_crcs);
+void igt_pipe_crc_drain(igt_pipe_crc_t *pipe_crc);
+void igt_pipe_crc_get_single(igt_pipe_crc_t *pipe_crc, igt_crc_t *out_crc);
+void igt_pipe_crc_get_current(int drm_fd, igt_pipe_crc_t *pipe_crc, igt_crc_t *crc);
+void igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
+				unsigned int vblank, igt_crc_t *crc);
+
+void igt_pipe_crc_collect_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out_crc);
+
+#endif /* __IGT_PIPE_CRC_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index 8d6c8a244afe..56d6a41fa612 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -30,6 +30,7 @@ lib_sources = [
 	'igt_os.c',
 	'igt_params.c',
 	'igt_perf.c',
+	'igt_pipe_crc.c',
 	'igt_power.c',
 	'igt_primes.c',
 	'igt_rand.c',
diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index c36547fced9c..96ddac116378 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -33,6 +33,7 @@
 #include "drmtest.h"
 #include "igt_debugfs.h"
 #include "igt_kms.h"
+#include "igt_pipe_crc.h"
 #include "intel_chipset.h"
 #include "ioctl_wrappers.h"
 #include "igt_aux.h"
diff --git a/tools/intel_display_crc.c b/tools/intel_display_crc.c
index 61291fc2aa88..357ffb8229f6 100644
--- a/tools/intel_display_crc.c
+++ b/tools/intel_display_crc.c
@@ -32,6 +32,7 @@
 #include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_kms.h"
+#include "igt_pipe_crc.h"
 
 typedef struct {
 	int fd;
-- 
2.35.1
