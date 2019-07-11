Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C669A6E170
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2019 09:09:16 +0000 (UTC)
From: "Vasilev, Oleg" <oleg.vasilev@intel.com>
Date: Thu, 11 Jul 2019 09:09:13 +0000
Message-ID: <d98e878cf1d19c32ffb25f30f665bcdd5d48e802.camel@intel.com>
References: <20190704095604.16589-1-oleg.vasilev@intel.com>
 <20190704095604.16589-2-oleg.vasilev@intel.com>
 <20190710163542.GX15868@phenom.ffwll.local>
In-Reply-To: <20190710163542.GX15868@phenom.ffwll.local>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] tests/prime_generic: add vendor-agnostic
 prime tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1513313854=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1513313854==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-n+Z9LboOeMIwln21pkeR"

--=-n+Z9LboOeMIwln21pkeR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-07-10 at 18:35 +0200, Daniel Vetter wrote:
> On Thu, Jul 04, 2019 at 12:56:04PM +0300, Oleg Vasilev wrote:
> > Currently, we have different sets of prime tests:
> >  - vgem+i915
> >  - amdgpu+i915
> >  - nv+i915
> >=20
> > Those tests use vendor-specific ioctls, therefore, not
> > interchangeable.
> > The idea is to create a set of tests which are expected to work on
> > any
> > prime-compatible driver. It can be run with any combination of
> > exporter+importer, where
> >=20
> > The first test is simple:
> > 1. Exporter creates a framebuffer and fills it with a plain color
> > 2. Fb is transferred to the importer
> > 3. Importer modesets and computes pipe CRC
> > 4. Importer draws the same color through cairo and compares CRC
> >=20
> > The initial motivation comes from the need to test prime support in
> > vkms.
> >=20
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Oleg Vasilev <oleg.vasilev@intel.com>
> > ---
> >  tests/meson.build     |   1 +
> >  tests/prime_generic.c | 238
> > ++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 239 insertions(+)
> >  create mode 100644 tests/prime_generic.c
> >=20
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 34a74025..1c938e95 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -76,6 +76,7 @@ test_progs =3D [
> >  	'prime_self_import',
> >  	'prime_udl',
> >  	'prime_vgem',
> > +	'prime_generic',
> >  	'syncobj_basic',
> >  	'syncobj_wait',
> >  	'template',
> > diff --git a/tests/prime_generic.c b/tests/prime_generic.c
> > new file mode 100644
> > index 00000000..65e48763
> > --- /dev/null
> > +++ b/tests/prime_generic.c
> > @@ -0,0 +1,238 @@
> > +/*
> > + * Copyright =C2=A9 2019 Intel Corporation
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> > obtaining a
> > + * copy of this software and associated documentation files (the
> > "Software"),
> > + * to deal in the Software without restriction, including without
> > limitation
> > + * the rights to use, copy, modify, merge, publish, distribute,
> > sublicense,
> > + * and/or sell copies of the Software, and to permit persons to
> > whom the
> > + * Software is furnished to do so, subject to the following
> > conditions:
> > + *
> > + * The above copyright notice and this permission notice
> > (including the next
> > + * paragraph) shall be included in all copies or substantial
> > portions of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
> > EVENT SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> > DAMAGES OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > ARISING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > OTHER DEALINGS
> > + * IN THE SOFTWARE.
> > + */
> > +
> > +#include "igt.h"
> > +#include "igt_vgem.h"
> > +
> > +#include <sys/ioctl.h>
> > +#include <sys/poll.h>
> > +#include <time.h>
> > +
> > +static struct {
> > +	double r, g, b;
> > +	uint32_t color;
> > +	igt_crc_t prime_crc;
> > +	igt_crc_t direct_crc;
> > +	char *prime_str;
> > +	char *direct_str;
> > +} colors[3] =3D {
> > +	{ .r =3D 0.0, .g =3D 0.0, .b =3D 0.0, .color =3D 0xff000000},
> > +	{ .r =3D 1.0, .g =3D 1.0, .b =3D 1.0, .color =3D 0xffffffff},
> > +	{ .r =3D 1.0, .g =3D 0.0, .b =3D 0.0, .color =3D 0xffff0000},
> > +};
> > +
> > +IGT_TEST_DESCRIPTION("Generic tests, working with any prime
> > device");
> > +
> > +static bool has_prime_import(int fd)
> > +{
> > +	uint64_t value;
> > +
> > +	if (drmGetCap(fd, DRM_CAP_PRIME, &value))
> > +		return false;
> > +
> > +	return value & DRM_PRIME_CAP_IMPORT;
> > +}
> > +
> > +static bool has_prime_export(int fd)
> > +{
> > +	uint64_t value;
> > +
> > +	if (drmGetCap(fd, DRM_CAP_PRIME, &value))
> > +		return false;
> > +
> > +	return value & DRM_PRIME_CAP_EXPORT;
> > +}
> > +
> > +static void prepare_scratch(int exporter, struct vgem_bo *scratch,
> > +			    drmModeModeInfo *mode, uint32_t color)
> > +{
> > +	int i;
> > +	uint32_t *ptr;
> > +
> > +	scratch->width =3D mode->hdisplay;
> > +	scratch->height =3D mode->vdisplay;
> > +	scratch->bpp =3D 32;
> > +	vgem_create(exporter, scratch);
> > +
> > +	ptr =3D vgem_mmap(exporter, scratch, PROT_WRITE);
> > +	for (i =3D 0; i < scratch->size / sizeof(*ptr); ++i)
> > +		ptr[i] =3D color;
> > +
> > +	munmap(ptr, scratch->size);
> > +}
> > +
> > +static void prepare_fb(int importer, struct vgem_bo *scratch,
> > struct igt_fb *fb)
> > +{
> > +	enum igt_color_encoding color_encoding =3D IGT_COLOR_YCBCR_BT709;
> > +	enum igt_color_range color_range =3D
> > IGT_COLOR_YCBCR_LIMITED_RANGE;
> > +
> > +	igt_init_fb(fb, importer, scratch->width, scratch->height,
> > +		    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
> > +		    color_encoding, color_range);
> > +}
> > +
> > +static void import_fb(int importer, struct igt_fb *fb,
> > +		      int dmabuf_fd, uint32_t pitch)
> > +{
> > +	uint32_t offsets[4], pitches[4], handles[4];
> > +	int ret;
> > +
> > +	fb->gem_handle =3D prime_fd_to_handle(importer, dmabuf_fd);
> > +
> > +	handles[0] =3D fb->gem_handle;
> > +	pitches[0] =3D pitch;
> > +	offsets[0] =3D 0;
> > +
> > +	ret =3D drmModeAddFB2(importer, fb->width, fb->height,
> > +			    DRM_FORMAT_XRGB8888,
> > +			    handles, pitches, offsets,
> > +			    &fb->fb_id, 0);
> > +	igt_assert(ret =3D=3D 0);
> > +}
> > +
> > +static void set_fb(struct igt_fb *fb,
> > +		   igt_display_t *display,
> > +		   igt_output_t *output)
> > +{
> > +	igt_plane_t *primary;
> > +	int ret;
> > +
> > +	primary =3D igt_output_get_plane(output, 0);
> > +	igt_plane_set_fb(primary, fb);
> > +	ret =3D igt_display_commit(display);
> > +
> > +	igt_assert(ret =3D=3D 0);
> > +}
> > +
> > +static void test_crc(int exporter, int importer)
> > +{
> > +	enum pipe pipe =3D PIPE_A;
> > +	igt_display_t display;
> > +	igt_output_t *output;
> > +	igt_pipe_crc_t *pipe_crc;
> > +	struct igt_fb fb;
> > +	int dmabuf_fd;
> > +	struct vgem_bo scratch; /* despite the name, it suits for any
> > +				   gem-compatible device */
> > +	int i, j;
> > +	drmModeModeInfo *mode;
> > +
> > +	bool crc_equal;
> > +
> > +	igt_display_require(&display, importer);
> > +	igt_skip_on(pipe >=3D display.n_pipes);
> > +	output =3D igt_get_single_output_for_pipe(&display, pipe);
> > +	igt_require_f(output, "No connector found for pipe %s\n",
> > +		      kmstest_pipe_name(pipe));
> > +
> > +	igt_display_reset(&display);
> > +	igt_output_set_pipe(output, pipe);
> > +
> > +	mode =3D igt_output_get_mode(output);
> > +	pipe_crc =3D igt_pipe_crc_new(importer, pipe,
> > INTEL_PIPE_CRC_SOURCE_AUTO);
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(colors); i++) {
> > +		prepare_scratch(exporter, &scratch, mode,
> > colors[i].color);
> > +		dmabuf_fd =3D prime_handle_to_fd(exporter,
> > scratch.handle);
> > +		gem_close(exporter, scratch.handle);
> > +
> > +		prepare_fb(importer, &scratch, &fb);
> > +		import_fb(importer, &fb, dmabuf_fd, scratch.pitch);
> > +		close(dmabuf_fd);
> > +
> > +		set_fb(&fb, &display, output);
> > +		igt_pipe_crc_collect_crc(pipe_crc,
> > &colors[i].prime_crc);
> > +		colors[i].prime_str =3D
> > igt_crc_to_string(&colors[i].prime_crc);
> > +		igt_debug("Prime CRC for %#08x is %s\n",
> > +			  colors[i].color, colors[i].prime_str);
> > +		igt_remove_fb(importer, &fb);
> > +
> > +		igt_create_color_fb(importer,
> > +				    mode->hdisplay, mode->vdisplay,
> > +				    DRM_FORMAT_XRGB8888,
> > LOCAL_DRM_FORMAT_MOD_NONE,
> > +				    colors[i].r, colors[i].g,
> > colors[i].b,
> > +				    &fb);
> > +
> > +		set_fb(&fb, &display, output);
> > +		igt_pipe_crc_collect_crc(pipe_crc,
> > &colors[i].direct_crc);
> > +		colors[i].direct_str =3D
> > igt_crc_to_string(&colors[i].direct_crc);
> > +		igt_debug("Direct CRC for %#08x is %s\n",
> > +			  colors[i].color, colors[i].direct_str);
> > +		igt_remove_fb(importer, &fb);
> > +	}
> > +	igt_pipe_crc_free(pipe_crc);
> > +
> > +	igt_debug("CRC table:\n");
> > +	igt_debug("Color\t\tPrime\t\tDirect\n");
> > +	for (i =3D 0; i < ARRAY_SIZE(colors); i++) {
> > +		igt_debug("%#08x\t%.8s\t%.8s\n", colors[i].color,
> > +			  colors[i].prime_str, colors[i].direct_str);
> > +	}
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(colors); i++) {
> > +		for (j =3D 0; j < ARRAY_SIZE(colors); j++) {
> > +			if (i =3D=3D j) {
> > +				igt_assert_crc_equal(&colors[i].prime_c
> > rc,
> > +						     &colors[j].direct_
> > crc);
> > +			} else {
> > +				crc_equal =3D
> > igt_check_crc_equal(&colors[i].prime_crc,
> > +								&colors
> > [j].direct_crc);
> > +				igt_assert_f(!crc_equal, "CRC should be
> > different");
> > +			}
> > +		}
> > +	}
> > +}
> > +
> > +static void run_test_crc(int export_chipset, int import_chipset)
> > +{
> > +	int importer =3D -1;
> > +	int exporter =3D -1;
> > +
> > +	exporter =3D drm_open_driver(export_chipset);
> > +	importer =3D drm_open_driver_master(import_chipset);
> > +
> > +	igt_require(has_prime_export(exporter));
> > +	igt_require(has_prime_import(importer));
> > +	igt_require_pipe_crc(importer);
> > +
> > +	test_crc(exporter, importer);
> > +	close(importer);
> > +	close(exporter);
> > +}
> > +
> > +igt_main
> > +{
> > +	igt_fixture {
> > +		kmstest_set_vt_graphics_mode();
> > +	}
> > +	igt_subtest("crc-vgem-vkms")
> > +		run_test_crc(DRIVER_VGEM, DRIVER_VKMS);
> > +	igt_subtest("crc-i915-vkms")
> > +		run_test_crc(DRIVER_INTEL, DRIVER_VKMS);
> > +	igt_subtest("crc-vgem-i915")
> > +		run_test_crc(DRIVER_VGEM, DRIVER_INTEL);
> > +	igt_subtest("crc-amd-i915")
> > +		run_test_crc(DRIVER_AMDGPU, DRIVER_INTEL);
> > +	igt_subtest("crc-i915-amd")
> > +		run_test_crc(DRIVER_INTEL, DRIVER_AMDGPU);
>=20
> This isn't any more generic than what we have e.g. in prime_vgem
> already.

Here non-generic part is only those 10 lines of subtests definitions.
The rest is common code.

I guess, this separate subtest definitions can document the device
pairs the test is expected to work + we can blacklist tests which we
don't have the hardware for.

> The way to do a generic kms testcase is to use DRIVER_ANY (yes some
> of the
> earlier conversion unfortunately used stuff like DRIVER_INTEL |
> DRIVER_AMDGPU). With that you also don't need your library prep
> patch,
> because no need for a DRIVER_VKMS.

But how can we open two different devices with DRIVER_ANY? If I put

fd =3D drm_open_driver(DRIVER_ANY)
fd2 =3D drm_open_driver(DRIVER_ANY)

I get the same device opened two times, do I?

>=20
> Imo best to start out by converting prime_vgem.c for this, and adding
> for
> the i915 specific tests (but _only_ for those) a specific "is this
> i915"
> check, so we skip those tests. And replace DRIVER_INTEL by
> DRIVER_ANY.
> Well, anything except vgem :-)

If I am not mistaken, all tests in prime_vgem are intel-specific :D

Some ideas can be taken from it, but anyway, it probably needs a deep
rewrite.

And prime_vgem use only vgem as an exporter device. Here we can use any
device. Sure, some tests would eventually use vgem-specific features,
but some could remain more generic.

Oleg

>=20
> Also the crc testcases should be 100% generic.
> -Daniel

--=-n+Z9LboOeMIwln21pkeR
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKaDCCBOsw
ggPToAMCAQICEFLpAsoR6ESdlGU4L6MaMLswDQYJKoZIhvcNAQEFBQAwbzELMAkGA1UEBhMCU0Ux
FDASBgNVBAoTC0FkZFRydXN0IEFCMSYwJAYDVQQLEx1BZGRUcnVzdCBFeHRlcm5hbCBUVFAgTmV0
d29yazEiMCAGA1UEAxMZQWRkVHJ1c3QgRXh0ZXJuYWwgQ0EgUm9vdDAeFw0xMzAzMTkwMDAwMDBa
Fw0yMDA1MzAxMDQ4MzhaMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
4LDMgJ3YSVX6A9sE+jjH3b+F3Xa86z3LLKu/6WvjIdvUbxnoz2qnvl9UKQI3sE1zURQxrfgvtP0b
Pgt1uDwAfLc6H5eqnyi+7FrPsTGCR4gwDmq1WkTQgNDNXUgb71e9/6sfq+WfCDpi8ScaglyLCRp7
ph/V60cbitBvnZFelKCDBh332S6KG3bAdnNGB/vk86bwDlY6omDs6/RsfNwzQVwo/M3oPrux6y6z
yIoRulfkVENbM0/9RrzQOlyK4W5Vk4EEsfW2jlCV4W83QKqRccAKIUxw2q/HoHVPbbETrrLmE6RR
Z/+eWlkGWl+mtx42HOgOmX0BRdTRo9vH7yeBowIDAQABo4IBdzCCAXMwHwYDVR0jBBgwFoAUrb2Y
ejS0Jvf6xCZU7wO94CTLVBowHQYDVR0OBBYEFB5pKrTcKP5HGE4hCz+8rBEv8Jj1MA4GA1UdDwEB
/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMDYGA1UdJQQvMC0GCCsGAQUFBwMEBgorBgEEAYI3
CgMEBgorBgEEAYI3CgMMBgkrBgEEAYI3FQUwFwYDVR0gBBAwDjAMBgoqhkiG+E0BBQFpMEkGA1Ud
HwRCMEAwPqA8oDqGOGh0dHA6Ly9jcmwudHJ1c3QtcHJvdmlkZXIuY29tL0FkZFRydXN0RXh0ZXJu
YWxDQVJvb3QuY3JsMDoGCCsGAQUFBwEBBC4wLDAqBggrBgEFBQcwAYYeaHR0cDovL29jc3AudHJ1
c3QtcHJvdmlkZXIuY29tMDUGA1UdHgQuMCygKjALgQlpbnRlbC5jb20wG6AZBgorBgEEAYI3FAID
oAsMCWludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAKcLNo/2So1Jnoi8G7W5Q6FSPq1fmyKW3
sSDf1amvyHkjEgd25n7MKRHGEmRxxoziPKpcmbfXYU+J0g560nCo5gPF78Wd7ZmzcmCcm1UFFfIx
fw6QA19bRpTC8bMMaSSEl8y39Pgwa+HENmoPZsM63DdZ6ziDnPqcSbcfYs8qd/m5d22rpXq5IGVU
tX6LX7R/hSSw/3sfATnBLgiJtilVyY7OGGmYKCAS2I04itvSS1WtecXTt9OZDyNbl7LtObBrgMLh
ZkpJW+pOR9f3h5VG2S5uKkA7Th9NC9EoScdwQCAIw+UWKbSQ0Isj2UFL7fHKvmqWKVTL98sRzvI3
seNC4DCCBXUwggRdoAMCAQICEzMAANF/7HEPN+Xh96oAAAAA0X8wDQYJKoZIhvcNAQEFBQAweTEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMR
SW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vpbmcg
Q0EgNEEwHhcNMTkwNDE3MTYxMzE1WhcNMjAwNDExMTYxMzE1WjA/MRYwFAYDVQQDEw1WYXNpbGV2
LCBPbGVnMSUwIwYJKoZIhvcNAQkBFhZvbGVnLnZhc2lsZXZAaW50ZWwuY29tMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxIxxAmTWhwU/z/xSIjnSYoLHqbo9B24rRkDhTaOaWQprEnPg
e52BaM6UN7JWpoXh1Xue+5kxGoVtVPNy58yYAO/E1Wbl/e8O1Vbpi4jQ1aCK1Y1yBYeE5dmJ8moD
0XFcgQGFZ5KVSyIJ8zmPfPbLyQX6rPw4MhOqWEmvY8Is/HlwLcUlnkzL+FOp5DlhJGVw62cpDSBy
d7HbU+wKZpT19ji161kPStRFN4HGvF0hC/9TpIAVCtQkUhUG4w9nvTQkGhyN039Tax99yrC1noca
DdWSiLBgHgGaO0ThuDGV4bz316/+F4Vy7z9hcMbMJs41eGz9tueMREgDNywNIAdzWQIDAQABo4IC
LjCCAiowHQYDVR0OBBYEFP8BYPvxsk8Ryh4Tt/ZBT5qIg2TiMB8GA1UdIwQYMBaAFB5pKrTcKP5H
GE4hCz+8rBEv8Jj1MGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9z
aXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBDQSUyMDRBLmNy
bDCBngYIKwYBBQUHAQEEgZEwgY4waQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cuaW50ZWwuY29tL3Jl
cG9zaXRvcnkvY2VydGlmaWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3Vpbmcl
MjBDQSUyMDRBLmNydDAhBggrBgEFBQcwAYYVaHR0cDovL29jc3AuaW50ZWwuY29tMAsGA1UdDwQE
AwIHgDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3FQiGw4x1hJnlUYP9gSiFjp9TgpHACWeB3r05
lfBDAgFkAgELMB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEEAYI3CgMMMCkGCSsGAQQBgjcVCgQc
MBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDDDBJBgNVHREEQjBAoCYGCisGAQQBgjcUAgOgGAwW
b2xlZy52YXNpbGV2QGludGVsLmNvbYEWb2xlZy52YXNpbGV2QGludGVsLmNvbTANBgkqhkiG9w0B
AQUFAAOCAQEAffmCWGLFQzB82/D5fYYzYJ3/8uSfKWA4UPCKcqETG1Zb0vl2FPoCjNID1Bw2HNS7
TxYcXvrVDul3vdCQfQhKonJi4ioJJXPPAQBDKKPkVoL9f/maehuXJYjFNsGmHNYADJL+4bDRJJcq
wIQlFVGXvPJFuTSj9HjJAiwH4zehhiEuTTbDhbaaLVrDsEVKCFMj0nvxN4AsYfoBXbscUVLrZs8n
ZIht2nPvz2NlWwxWgl/7+T42CcriuoeLOPWjmaMncOnXaIR/XNpzvCd6N8Xurg9NhzZaCUwLPAX1
fyAyMXRsdpgqKqVNd+jLBGt87zB3FQQOh73i8+vBMqm1BfEoojGCAhcwggITAgEBMIGQMHkxCzAJ
BgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAYBgNVBAoTEUlu
dGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENB
IDRBAhMzAADRf+xxDzfl4feqAAAAANF/MAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA3MTEwOTA5MTJaMCMGCSqGSIb3DQEJBDEWBBRufsY+
JPYgp3XIYbVxEqlJed32aTANBgkqhkiG9w0BAQEFAASCAQBERR2obN4TU82tmRqDWlAi3S+OLoUX
uhgq6K4sL8hCXfwlGZDRpvvndKLWAcuUL/2f8kKF9OEkcOQ1zGz/uyZBYzzgN7k8Nk1SEKfQfHjQ
X54D/adFbzuK9v2aoUyfHUssf2dVH7A8buyNDZXaAh7h4ocfztUIIzdsuby8Gmdca7Hb4BeQQt9z
bZKyujatDplk7Vbmke66F9uHZUGCNpreiZsZRP+BBz8X/e5NRWTlaceBcCBz8h3MZkqXbiZCOlGj
uY9AfcOV4I/q1qqNlU97qKGtLv3uower9yw/yLMW8cWFP9yAwqpuJPur45BnVx0sXwqanS15B6SB
h20iovjNAAAAAAAA


--=-n+Z9LboOeMIwln21pkeR--

--===============1513313854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1513313854==--
