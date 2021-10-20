Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D306E243
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Oct 2021 10:41:12 +0000 (UTC)
Date: Wed, 20 Oct 2021 13:39:40 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YW/x7BdGc42vgZNM@platvala-desk.ger.corp.intel.com>
References: <20211020101614.4101-1-ville.syrjala@linux.intel.com>
 <20211020101614.4101-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211020101614.4101-3-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/3] lib/crc: Move pipe CRC stuff out
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 20, 2021 at 01:16:14PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> No reason to hide the pipe CRC code inside the debugfs stuff.
> The fact that pipe CRCs are operated through debugfs is just
> an irrelevant implementation detail.
>=20
> Fixed up the few cases that don't include igt.h with this cocci:
> @find@
> identifier ID;
> @@
> igt_crc_t ID;
>=20
> @has_include@
> @@
> (
>  #include "igt_pipe_crc.h"
> |
>  #include "igt.h"
> )
>=20
> @depends on find && !has_include@
> @@
>   #include "igt_kms.h"
> + #include "igt_pipe_crc.h"
>=20
> v2: better cocci to catch lib/igt_chamelium.c
>=20
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt.h                       |   1 +
>  lib/igt_chamelium.c             |   1 +
>  lib/igt_chamelium.h             |   1 +
>  lib/igt_debugfs.c               | 558 -----------------------------
>  lib/igt_debugfs.h               |  57 ---
>  lib/igt_fb.h                    |   1 +
>  lib/igt_pipe_crc.c              | 602 ++++++++++++++++++++++++++++++++
>  lib/igt_pipe_crc.h              |  91 +++++
>  lib/meson.build                 |   1 +
>  tests/i915/kms_mmap_write_crc.c |   1 +
>  tools/intel_display_crc.c       |   1 +
>  11 files changed, 700 insertions(+), 615 deletions(-)
>  create mode 100644 lib/igt_pipe_crc.c
>  create mode 100644 lib/igt_pipe_crc.h
>=20
> diff --git a/lib/igt.h b/lib/igt.h
> index 0bf98aa5d767..014714b92950 100644
> --- a/lib/igt.h
> +++ b/lib/igt.h
> @@ -38,6 +38,7 @@
>  #include "igt_gt.h"
>  #include "igt_kms.h"
>  #include "igt_params.h"
> +#include "igt_pipe_crc.h"
>  #include "igt_pm.h"
>  #include "igt_stats.h"
>  #ifdef HAVE_CHAMELIUM
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index b4d838bbdb29..2b523a6a2c0c 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -43,6 +43,7 @@
>  #include "igt_frame.h"
>  #include "igt_list.h"
>  #include "igt_kms.h"
> +#include "igt_pipe_crc.h"
>  #include "igt_rc.h"
> =20
>  /**
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index f40e848e4f67..af88fec914bd 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -36,6 +36,7 @@
> =20
>  struct igt_fb;
>  struct edid;
> +typedef struct _igt_crc igt_crc_t;
> =20
>  struct chamelium;
>  struct chamelium_port;
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index 5ead8aa55e03..4da05cac1a61 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -53,24 +53,6 @@
>   * basic functions to access debugfs files with e.g. igt_debugfs_open() =
it also
>   * provides higher-level wrappers for some debugfs features.
>   *
> - * # Pipe CRC Support
> - *
> - * This library wraps up the kernel's support for capturing pipe CRCs in=
to a
> - * neat and tidy package. For the detailed usage see all the functions w=
hich
> - * work on #igt_pipe_crc_t. This is supported on all platforms and outpu=
ts.
> - *
> - * Actually using pipe CRCs to write modeset tests is a bit tricky thoug=
h, so
> - * there is no way to directly check a CRC: Both the details of the plane
> - * blending, color correction and other hardware and how exactly the CRC=
 is
> - * computed at each tap point vary by hardware generation and are not di=
sclosed.
> - *
> - * The only way to use #igt_crc_t CRCs therefore is to compare CRCs amon=
g each
> - * another either for equality or difference. Otherwise CRCs must be tre=
ated as
> - * completely opaque values. Note that not even CRCs from different pipe=
s or tap
> - * points on the same platform can be compared. Hence only use
> - * igt_assert_crc_equal() to inspect CRC values captured by the same
> - * #igt_pipe_crc_t object.
> - *
>   * # Other debugfs interface wrappers
>   *
>   * This covers the miscellaneous debugfs interface wrappers:
> @@ -385,175 +367,6 @@ bool igt_debugfs_search(int device, const char *fil=
ename, const char *substring)
>  	return matched;
>  }
> =20
> -/*
> - * Pipe CRC
> - */
> -
> -/**
> - * igt_find_crc_mismatch:
> - * @a: first pipe CRC value
> - * @b: second pipe CRC value
> - * @index: index of the first value that mismatched
> - *
> - * Check if CRC a and CRC b mismatch.
> - *
> - * Returns true if CRC values mismatch, false otherwise;
> - */
> -bool igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int *=
index)
> -{
> -	int nwords =3D min(a->n_words, b->n_words);
> -	int i;
> -
> -	for (i =3D 0; i < nwords; i++) {
> -		if (a->crc[i] !=3D b->crc[i]) {
> -			if (index)
> -				*index =3D i;
> -
> -			return true;
> -		}
> -	}
> -
> -	if (a->n_words !=3D b->n_words) {
> -		if (index)
> -			*index =3D i;
> -		return true;
> -	}
> -
> -	return false;
> -}
> -
> -/**
> - * igt_assert_crc_equal:
> - * @a: first pipe CRC value
> - * @b: second pipe CRC value
> - *
> - * Compares two CRC values and fails the testcase if they don't match wi=
th
> - * igt_fail(). Note that due to CRC collisions CRC based testcase can on=
ly
> - * assert that CRCs match, never that they are different. Otherwise ther=
e might
> - * be random testcase failures when different screen contents end up wit=
h the
> - * same CRC by chance.
> - *
> - * Passing --skip-crc-compare on the command line will force this functi=
on
> - * to always pass, which can be useful in interactive debugging where you
> - * might know the test will fail, but still want the test to keep going =
as if
> - * it had succeeded so that you can see the on-screen behavior.
> - *
> - */
> -void igt_assert_crc_equal(const igt_crc_t *a, const igt_crc_t *b)
> -{
> -	int index;
> -	bool mismatch;
> -
> -	mismatch =3D igt_find_crc_mismatch(a, b, &index);
> -	if (mismatch)
> -		igt_debug("CRC mismatch%s at index %d: 0x%x !=3D 0x%x\n",
> -			  igt_skip_crc_compare ? " (ignored)" : "",
> -			  index, a->crc[index], b->crc[index]);
> -
> -	igt_assert(!mismatch || igt_skip_crc_compare);
> -}
> -
> -/**
> - * igt_check_crc_equal:
> - * @a: first pipe CRC value
> - * @b: second pipe CRC value
> - *
> - * Compares two CRC values and return whether they match.
> - *
> - * Returns: A boolean indicating whether the CRC values match
> - */
> -bool igt_check_crc_equal(const igt_crc_t *a, const igt_crc_t *b)
> -{
> -	int index;
> -	bool mismatch;
> -
> -	mismatch =3D igt_find_crc_mismatch(a, b, &index);
> -	if (mismatch)
> -		igt_debug("CRC mismatch at index %d: 0x%x !=3D 0x%x\n", index,
> -			  a->crc[index], b->crc[index]);
> -
> -	return !mismatch;
> -}
> -
> -/**
> - * igt_crc_to_string_extended:
> - * @crc: pipe CRC value to print
> - * @delimiter: The delimiter to use between crc words
> - * @crc_size: the number of bytes to print per crc word (between 1 and 4)
> - *
> - * This function allocates a string and formats @crc into it, depending =
on
> - * @delimiter and @crc_size.
> - * The caller is responsible for freeing the string.
> - *
> - * This should only ever be used for diagnostic debug output.
> - */
> -char *igt_crc_to_string_extended(igt_crc_t *crc, char delimiter, int crc=
_size)
> -{
> -	int i;
> -	int len =3D 0;
> -	int field_width =3D 2 * crc_size; /* Two chars per byte. */
> -	char *buf =3D malloc((field_width+1) * crc->n_words);
> -
> -	if (!buf)
> -		return NULL;
> -
> -	for (i =3D 0; i < crc->n_words - 1; i++)
> -		len +=3D sprintf(buf + len, "%0*x%c", field_width,
> -			       crc->crc[i], delimiter);
> -
> -	sprintf(buf + len, "%0*x", field_width, crc->crc[i]);
> -
> -	return buf;
> -}
> -
> -/**
> - * igt_crc_to_string:
> - * @crc: pipe CRC value to print
> - *
> - * This function allocates a string and formats @crc into it.
> - * The caller is responsible for freeing the string.
> - *
> - * This should only ever be used for diagnostic debug output.
> - */
> -char *igt_crc_to_string(igt_crc_t *crc)
> -{
> -	return igt_crc_to_string_extended(crc, ' ', 4);
> -}
> -
> -#define MAX_CRC_ENTRIES 10
> -#define MAX_LINE_LEN (10 + 11 * MAX_CRC_ENTRIES + 1)
> -
> -struct _igt_pipe_crc {
> -	int fd;
> -	int dir;
> -	int ctl_fd;
> -	int crc_fd;
> -	int flags;
> -
> -	enum pipe pipe;
> -	char *source;
> -};
> -
> -/**
> - * igt_require_pipe_crc:
> - *
> - * Convenience helper to check whether pipe CRC capturing is supported b=
y the
> - * kernel. Uses igt_skip to automatically skip the test/subtest if this =
isn't
> - * the case.
> - */
> -void igt_require_pipe_crc(int fd)
> -{
> -	int dir;
> -	struct stat stat;
> -
> -	dir =3D igt_debugfs_dir(fd);
> -	igt_require_f(dir >=3D 0, "Could not open debugfs directory\n");
> -	igt_require_f(fstatat(dir, "crtc-0/crc/control", &stat, 0) =3D=3D 0,
> -		      "CRCs not supported on this platform\n");
> -
> -	close(dir);
> -}
> -
>  static void igt_hpd_storm_exit_handler(int sig)
>  {
>  	int fd =3D drm_open_driver(DRIVER_INTEL);
> @@ -675,377 +488,6 @@ void igt_require_hpd_storm_ctl(int drm_fd)
>  	close(fd);
>  }
> =20
> -static igt_pipe_crc_t *
> -pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
> -{
> -	igt_pipe_crc_t *pipe_crc;
> -	char buf[128];
> -	int debugfs;
> -
> -	igt_assert(source);
> -
> -	debugfs =3D igt_debugfs_dir(fd);
> -	igt_assert(debugfs !=3D -1);
> -
> -	pipe_crc =3D calloc(1, sizeof(struct _igt_pipe_crc));
> -	igt_assert(pipe_crc);
> -
> -	sprintf(buf, "crtc-%d/crc/control", pipe);
> -	pipe_crc->ctl_fd =3D openat(debugfs, buf, O_WRONLY);
> -	igt_assert(pipe_crc->ctl_fd !=3D -1);
> -
> -	pipe_crc->crc_fd =3D -1;
> -	pipe_crc->fd =3D fd;
> -	pipe_crc->dir =3D debugfs;
> -	pipe_crc->pipe =3D pipe;
> -	pipe_crc->source =3D strdup(source);
> -	igt_assert(pipe_crc->source);
> -	pipe_crc->flags =3D flags;
> -
> -	return pipe_crc;
> -}
> -
> -/**
> - * igt_pipe_crc_new:
> - * @pipe: display pipe to use as source
> - * @source: CRC tap point to use as source
> - *
> - * This sets up a new pipe CRC capture object for the given @pipe and @s=
ource
> - * in blocking mode.
> - *
> - * Returns: A pipe CRC object for the given @pipe and @source. The libra=
ry
> - * assumes that the source is always available since recent kernels supp=
ort at
> - * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
> - */
> -igt_pipe_crc_t *
> -igt_pipe_crc_new(int fd, enum pipe pipe, const char *source)
> -{
> -	return pipe_crc_new(fd, pipe, source, O_RDONLY);
> -}
> -
> -/**
> - * igt_pipe_crc_new_nonblock:
> - * @pipe: display pipe to use as source
> - * @source: CRC tap point to use as source
> - *
> - * This sets up a new pipe CRC capture object for the given @pipe and @s=
ource
> - * in nonblocking mode.
> - *
> - * Returns: A pipe CRC object for the given @pipe and @source. The libra=
ry
> - * assumes that the source is always available since recent kernels supp=
ort at
> - * least IGT_PIPE_CRC_SOURCE_AUTO everywhere.
> - */
> -igt_pipe_crc_t *
> -igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source)
> -{
> -	return pipe_crc_new(fd, pipe, source, O_RDONLY | O_NONBLOCK);
> -}
> -
> -/**
> - * igt_pipe_crc_free:
> - * @pipe_crc: pipe CRC object
> - *
> - * Frees all resources associated with @pipe_crc.
> - */
> -void igt_pipe_crc_free(igt_pipe_crc_t *pipe_crc)
> -{
> -	if (!pipe_crc)
> -		return;
> -
> -	close(pipe_crc->ctl_fd);
> -	close(pipe_crc->crc_fd);
> -	close(pipe_crc->dir);
> -	free(pipe_crc->source);
> -	free(pipe_crc);
> -}
> -
> -static bool pipe_crc_init_from_string(igt_pipe_crc_t *pipe_crc, igt_crc_=
t *crc,
> -				      const char *line)
> -{
> -	int i;
> -	const char *buf;
> -
> -	if (strncmp(line, "XXXXXXXXXX", 10) =3D=3D 0)
> -		crc->has_valid_frame =3D false;
> -	else {
> -		crc->has_valid_frame =3D true;
> -		crc->frame =3D strtoul(line, NULL, 16);
> -	}
> -
> -	buf =3D line + 10;
> -	for (i =3D 0; *buf !=3D '\n'; i++, buf +=3D 11)
> -		crc->crc[i] =3D strtoul(buf, NULL, 16);
> -
> -	crc->n_words =3D i;
> -
> -	return true;
> -}
> -
> -static int read_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
> -{
> -	ssize_t bytes_read;
> -	char buf[MAX_LINE_LEN + 1];
> -
> -	igt_set_timeout(5, "CRC reading");
> -	bytes_read =3D read(pipe_crc->crc_fd, &buf, MAX_LINE_LEN);
> -	igt_reset_timeout();
> -
> -	if (bytes_read < 0)
> -		bytes_read =3D -errno;
> -	else
> -		buf[bytes_read] =3D '\0';
> -
> -	if (bytes_read > 0 && !pipe_crc_init_from_string(pipe_crc, out, buf))
> -		return -EINVAL;
> -
> -	return bytes_read;
> -}
> -
> -static void read_one_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out)
> -{
> -	int ret;
> -
> -	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags & ~O_NONBLOCK);
> -
> -	do {
> -		ret =3D read_crc(pipe_crc, out);
> -	} while (ret =3D=3D -EINTR);
> -
> -	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags);
> -}
> -
> -/**
> - * igt_pipe_crc_start:
> - * @pipe_crc: pipe CRC object
> - *
> - * Starts the CRC capture process on @pipe_crc.
> - */
> -void igt_pipe_crc_start(igt_pipe_crc_t *pipe_crc)
> -{
> -	const char *src =3D pipe_crc->source;
> -	struct pollfd pfd;
> -	char buf[32];
> -
> -	/* Stop first just to make sure we don't have lingering state left. */
> -	igt_pipe_crc_stop(pipe_crc);
> -
> -	igt_reset_fifo_underrun_reporting(pipe_crc->fd);
> -
> -	igt_assert_eq(write(pipe_crc->ctl_fd, src, strlen(src)), strlen(src));
> -
> -	sprintf(buf, "crtc-%d/crc/data", pipe_crc->pipe);
> -
> -	igt_set_timeout(10, "Opening crc fd, and poll for first CRC.");
> -	pipe_crc->crc_fd =3D openat(pipe_crc->dir, buf, pipe_crc->flags);
> -	igt_assert(pipe_crc->crc_fd !=3D -1);
> -
> -	pfd.fd =3D pipe_crc->crc_fd;
> -	pfd.events =3D POLLIN;
> -	poll(&pfd, 1, -1);
> -
> -	igt_reset_timeout();
> -
> -	errno =3D 0;
> -}
> -
> -/**
> - * igt_pipe_crc_stop:
> - * @pipe_crc: pipe CRC object
> - *
> - * Stops the CRC capture process on @pipe_crc.
> - */
> -void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc)
> -{
> -	close(pipe_crc->crc_fd);
> -	pipe_crc->crc_fd =3D -1;
> -}
> -
> -/**
> - * igt_pipe_crc_get_crcs:
> - * @pipe_crc: pipe CRC object
> - * @n_crcs: number of CRCs to capture
> - * @out_crcs: buffer pointer for the captured CRC values
> - *
> - * Read up to @n_crcs from @pipe_crc. This function does not block, and =
will
> - * return early if not enough CRCs can be captured, if @pipe_crc has been
> - * opened using igt_pipe_crc_new_nonblock(). It will block until @n_crcs=
 are
> - * retrieved if @pipe_crc has been opened using igt_pipe_crc_new(). @out=
_crcs is
> - * alloced by this function and must be released with free() by the call=
er.
> - *
> - * Callers must start and stop the capturing themselves by calling
> - * igt_pipe_crc_start() and igt_pipe_crc_stop(). For one-shot CRC collec=
ting
> - * look at igt_pipe_crc_collect_crc().
> - *
> - * Returns:
> - * The number of CRCs captured. Should be equal to @n_crcs in blocking m=
ode, but
> - * can be less (even zero) in non-blocking mode.
> - */
> -int
> -igt_pipe_crc_get_crcs(igt_pipe_crc_t *pipe_crc, int n_crcs,
> -		      igt_crc_t **out_crcs)
> -{
> -	igt_crc_t *crcs;
> -	int n =3D 0;
> -
> -	crcs =3D calloc(n_crcs, sizeof(igt_crc_t));
> -
> -	do {
> -		igt_crc_t *crc =3D &crcs[n];
> -		int ret;
> -
> -		ret =3D read_crc(pipe_crc, crc);
> -		if (ret =3D=3D -EAGAIN)
> -			break;
> -
> -		if (ret < 0)
> -			continue;
> -
> -		n++;
> -	} while (n < n_crcs);
> -
> -	*out_crcs =3D crcs;
> -	return n;
> -}
> -
> -static void crc_sanity_checks(igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
> -{
> -	int i;
> -	bool all_zero =3D true;
> -
> -	/* Any CRC value can be considered valid on amdgpu hardware. */
> -	if (is_amdgpu_device(pipe_crc->fd))
> -		return;
> -
> -	for (i =3D 0; i < crc->n_words; i++) {
> -		igt_warn_on_f(crc->crc[i] =3D=3D 0xffffffff,
> -			      "Suspicious CRC: it looks like the CRC "
> -			      "read back was from a register in a powered "
> -			      "down well\n");
> -		if (crc->crc[i])
> -			all_zero =3D false;
> -	}
> -
> -	igt_warn_on_f(all_zero, "Suspicious CRC: All values are 0.\n");
> -}
> -
> -/**
> - * igt_pipe_crc_drain:
> - * @pipe_crc: pipe CRC object
> - *
> - * Discards all currently queued CRC values from @pipe_crc. This functio=
n does
> - * not block, and is useful to flush @pipe_crc. Afterwards you can get a=
 fresh
> - * CRC with igt_pipe_crc_get_single().
> - */
> -void igt_pipe_crc_drain(igt_pipe_crc_t *pipe_crc)
> -{
> -	int ret;
> -	igt_crc_t crc;
> -
> -	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags | O_NONBLOCK);
> -
> -	do {
> -		ret =3D read_crc(pipe_crc, &crc);
> -	} while (ret > 0 || ret =3D=3D -EINVAL);
> -
> -	fcntl(pipe_crc->crc_fd, F_SETFL, pipe_crc->flags);
> -}
> -
> -/**
> - * igt_pipe_crc_get_single:
> - * @pipe_crc: pipe CRC object
> - * @crc: buffer pointer for the captured CRC value
> - *
> - * Read a single @crc from @pipe_crc. This function blocks even
> - * when nonblocking CRC is requested.
> - *
> - * Callers must start and stop the capturing themselves by calling
> - * igt_pipe_crc_start() and igt_pipe_crc_stop(). For one-shot CRC collec=
ting
> - * look at igt_pipe_crc_collect_crc().
> - *
> - * If capturing has been going on for a while and a fresh crc is require=
d,
> - * you should use igt_pipe_crc_get_current() instead.
> - */
> -void igt_pipe_crc_get_single(igt_pipe_crc_t *pipe_crc, igt_crc_t *crc)
> -{
> -	read_one_crc(pipe_crc, crc);
> -
> -	crc_sanity_checks(pipe_crc, crc);
> -}
> -
> -/**
> - * igt_pipe_crc_get_current:
> - * @drm_fd: Pointer to drm fd for vblank counter
> - * @pipe_crc: pipe CRC object
> - * @vblank: frame counter value we're looking for
> - * @crc: buffer pointer for the captured CRC value
> - *
> - * Same as igt_pipe_crc_get_single(), but will wait until a CRC has been=
 captured
> - * for frame @vblank.
> - */
> -void
> -igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
> -			   unsigned int vblank, igt_crc_t *crc)
> -{
> -	do {
> -		read_one_crc(pipe_crc, crc);
> -
> -		/* Only works with valid frame counter */
> -		if (!crc->has_valid_frame) {
> -			igt_pipe_crc_drain(pipe_crc);
> -			igt_pipe_crc_get_single(pipe_crc, crc);
> -			return;
> -		}
> -	} while (igt_vblank_before(crc->frame, vblank));
> -
> -	crc_sanity_checks(pipe_crc, crc);
> -}
> -
> -/**
> - * igt_pipe_crc_get_current:
> - * @drm_fd: Pointer to drm fd for vblank counter
> - * @pipe_crc: pipe CRC object
> - * @crc: buffer pointer for the captured CRC value
> - *
> - * Same as igt_pipe_crc_get_single(), but will wait until a new CRC can =
be captured.
> - * This is useful for retrieving the current CRC in a more race free way=
 than
> - * igt_pipe_crc_drain() + igt_pipe_crc_get_single().
> - */
> -void
> -igt_pipe_crc_get_current(int drm_fd, igt_pipe_crc_t *pipe_crc, igt_crc_t=
 *crc)
> -{
> -	unsigned vblank =3D kmstest_get_vblank(drm_fd, pipe_crc->pipe, 0) + 1;
> -
> -	return igt_pipe_crc_get_for_frame(drm_fd, pipe_crc, vblank, crc);
> -}
> -
> -/**
> - * igt_pipe_crc_collect_crc:
> - * @pipe_crc: pipe CRC object
> - * @out_crc: buffer for the captured CRC values
> - *
> - * Read a single CRC from @pipe_crc. This function blocks until the CRC =
is
> - * retrieved, irrespective of whether @pipe_crc has been opened with
> - * igt_pipe_crc_new() or igt_pipe_crc_new_nonblock().  @out_crc must be
> - * allocated by the caller.
> - *
> - * This function takes care of the pipe_crc book-keeping, it will start/=
stop
> - * the collection of the CRC.
> - *
> - * This function also calls the interactive debug with the "crc" domain,=
 so you
> - * can make use of this feature to actually see the screen that is being=
 CRC'd.
> - *
> - * For continuous CRC collection look at igt_pipe_crc_start(),
> - * igt_pipe_crc_get_crcs() and igt_pipe_crc_stop().
> - */
> -void igt_pipe_crc_collect_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out_c=
rc)
> -{
> -	igt_debug_wait_for_keypress("crc");
> -
> -	igt_pipe_crc_start(pipe_crc);
> -	igt_pipe_crc_get_single(pipe_crc, out_crc);
> -	igt_pipe_crc_stop(pipe_crc);
> -}
> -
>  /**
>   * igt_reset_fifo_underrun_reporting:
>   * @drm_fd: drm device file descriptor
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index cef456587641..01d332d72601 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -54,63 +54,6 @@ bool igt_debugfs_search(int fd, const char *filename, =
const char *substring);
>  #define igt_debugfs_read(fd, filename, buf) \
>  		__igt_debugfs_read(fd, (filename), (buf), sizeof(buf))
> =20
> -/*
> - * Pipe CRC
> - */
> -
> -/**
> - * igt_pipe_crc_t:
> - *
> - * Pipe CRC support structure. Needs to be allocated and set up with
> - * igt_pipe_crc_new() for a specific pipe and pipe CRC source value.
> - */
> -typedef struct _igt_pipe_crc igt_pipe_crc_t;
> -
> -#define DRM_MAX_CRC_NR 10
> -/**
> - * igt_crc_t:
> - * @frame: frame number of the capture CRC
> - * @n_words: internal field, don't access
> - * @crc: internal field, don't access
> - *
> - * Pipe CRC value. All other members than @frame are private and should =
not be
> - * inspected by testcases.
> - */
> -typedef struct {
> -	uint32_t frame;
> -	bool has_valid_frame;
> -	int n_words;
> -	uint32_t crc[DRM_MAX_CRC_NR];
> -} igt_crc_t;
> -
> -#define IGT_PIPE_CRC_SOURCE_AUTO "auto"
> -#define AMDGPU_PIPE_CRC_SOURCE_DPRX "dprx"
> -
> -bool igt_find_crc_mismatch(const igt_crc_t *a, const igt_crc_t *b, int *=
index);
> -void igt_assert_crc_equal(const igt_crc_t *a, const igt_crc_t *b);
> -bool igt_check_crc_equal(const igt_crc_t *a, const igt_crc_t *b);
> -char *igt_crc_to_string_extended(igt_crc_t *crc, char delimiter, int crc=
_size);
> -char *igt_crc_to_string(igt_crc_t *crc);
> -
> -void igt_require_pipe_crc(int fd);
> -igt_pipe_crc_t *
> -igt_pipe_crc_new(int fd, enum pipe pipe, const char *source);
> -igt_pipe_crc_t *
> -igt_pipe_crc_new_nonblock(int fd, enum pipe pipe, const char *source);
> -void igt_pipe_crc_free(igt_pipe_crc_t *pipe_crc);
> -void igt_pipe_crc_start(igt_pipe_crc_t *pipe_crc);
> -void igt_pipe_crc_stop(igt_pipe_crc_t *pipe_crc);
> -__attribute__((warn_unused_result))
> -int igt_pipe_crc_get_crcs(igt_pipe_crc_t *pipe_crc, int n_crcs,
> -			  igt_crc_t **out_crcs);
> -void igt_pipe_crc_drain(igt_pipe_crc_t *pipe_crc);
> -void igt_pipe_crc_get_single(igt_pipe_crc_t *pipe_crc, igt_crc_t *out_cr=
c);
> -void igt_pipe_crc_get_current(int drm_fd, igt_pipe_crc_t *pipe_crc, igt_=
crc_t *crc);
> -void igt_pipe_crc_get_for_frame(int drm_fd, igt_pipe_crc_t *pipe_crc,
> -				unsigned int vblank, igt_crc_t *crc);
> -
> -void igt_pipe_crc_collect_crc(igt_pipe_crc_t *pipe_crc, igt_crc_t *out_c=
rc);
> -
>  void igt_hpd_storm_set_threshold(int fd, unsigned int threshold);
>  void igt_hpd_storm_reset(int fd);
>  bool igt_hpd_storm_detected(int fd);
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index c61d9e7219ff..265d1fc448e6 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -41,6 +41,7 @@
>  #include "igt_debugfs.h"
> =20
>  struct buf_ops;
> +typedef struct _igt_crc igt_crc_t;
> =20
>  /*
>   * Internal format to denote a buffer compatible with pixman's
> diff --git a/lib/igt_pipe_crc.c b/lib/igt_pipe_crc.c
> new file mode 100644
> index 000000000000..d78807d6c65c
> --- /dev/null
> +++ b/lib/igt_pipe_crc.c
> @@ -0,0 +1,602 @@
> +/*
> + * Copyright =A9 2013 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#include <inttypes.h>
> +#include <sys/stat.h>
> +#include <sys/mount.h>
> +#include <sys/sysmacros.h>
> +#include <dirent.h>
> +#include <errno.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <limits.h>
> +#include <string.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +#include <poll.h>
> +
> +#include "drmtest.h"
> +#include "igt_aux.h"
> +#include "igt_kms.h"
> +#include "igt_debugfs.h"
> +#include "igt_pipe_crc.h"
> +
> +/**
> + * SECTION:igt_pipe_crc

A new section name, needs to be manually referenced from the main doc
file.

Squash this in:

diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/ref=
erence/igt-gpu-tools/igt-gpu-tools-docs.xml
index 189597c6..281a22de 100644
--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
@@ -35,6 +35,7 @@
     <xi:include href=3D"xml/igt_list.xml"/>
     <xi:include href=3D"xml/igt_map.xml"/>
     <xi:include href=3D"xml/igt_msm.xml"/>
+    <xi:include href=3D"xml/igt_pipe_crc.xml"/>
     <xi:include href=3D"xml/igt_pm.xml"/>
     <xi:include href=3D"xml/igt_primes.xml"/>
     <xi:include href=3D"xml/igt_rand.xml"/>



--=20
Petri Latvala
