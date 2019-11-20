Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Summers, Stuart" <stuart.summers@intel.com>
Date: Wed, 20 Nov 2019 17:14:51 +0000
Message-ID: <7a767d5d0cf044fa26759e7d0bd1f1fae4e66a0f.camel@intel.com>
References: <20191120164429.8441-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20191120164429.8441-1-janusz.krzysztofik@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2] tests/prime_vgem: Skip
 basic-read/write subtests if no mappable GGTT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0176911007=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "janusz.krzysztofik@linux.intel.com" <janusz.krzysztofik@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0176911007==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-+j+dWqXSWdBzb5wGAUQ0"

--=-+j+dWqXSWdBzb5wGAUQ0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-11-20 at 17:44 +0100, Janusz Krzysztofik wrote:
> As we've agreed that using I915_GEM_PREAD/PWRITE IOCTLs on dma-buf
> objects doesn't make much sense, we are not going to extend their
> handlers in the i915 driver with new processing paths required for
> them
> to work correctly with dma-buf objects on future hardware with no
> mappable aperture.  When running on that kind of hardware, just skip
> subtests which use those IOCTLs.

How is this handled for other dma-buf capable devices? Is there no
opportunity for a working solution in i915 here?

Also, is this a permanent limitation? Or just a workaround based on our
current implementation?

Thanks,
Stuart

>=20
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com
> >
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Joonas Lahtinen <joonas.lahtinen@intel.com>
> ---
>  lib/ioctl_wrappers.c | 2 +-
>  lib/ioctl_wrappers.h | 1 +
>  tests/prime_vgem.c   | 6 ++++++
>  3 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 628f8b83..78b92bd2 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -356,7 +356,7 @@ void gem_write(int fd, uint32_t handle, uint64_t
> offset, const void *buf, uint64
>  	igt_assert_eq(__gem_write(fd, handle, offset, buf, length), 0);
>  }
> =20
> -static int __gem_read(int fd, uint32_t handle, uint64_t offset, void
> *buf, uint64_t length)
> +int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf,
> uint64_t length)
>  {
>  	struct drm_i915_gem_pread gem_pread;
>  	int err;
> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> index f2412d78..97f278ed 100644
> --- a/lib/ioctl_wrappers.h
> +++ b/lib/ioctl_wrappers.h
> @@ -69,6 +69,7 @@ uint32_t gem_open(int fd, uint32_t name);
>  void gem_close(int fd, uint32_t handle);
>  int __gem_write(int fd, uint32_t handle, uint64_t offset, const void
> *buf, uint64_t length);
>  void gem_write(int fd, uint32_t handle, uint64_t offset,  const void
> *buf, uint64_t length);
> +int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf,
> uint64_t length);
>  void gem_read(int fd, uint32_t handle, uint64_t offset, void *buf,
> uint64_t length);
>  int __gem_set_domain(int fd, uint32_t handle, uint32_t read,
> uint32_t write);
>  void gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t
> write);
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 04cc913d..6595818c 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -46,6 +46,8 @@ static void test_read(int vgem, int i915)
>  	handle =3D prime_fd_to_handle(i915, dmabuf);
>  	close(dmabuf);
> =20
> +	igt_skip_on(__gem_read(i915, handle, 0, &i, sizeof(i)));
> +
>  	ptr =3D vgem_mmap(vgem, &scratch, PROT_WRITE);
>  	for (i =3D 0; i < 1024; i++)
>  		ptr[1024*i] =3D i;
> @@ -81,6 +83,8 @@ static void test_fence_read(int i915, int vgem)
>  	handle =3D prime_fd_to_handle(i915, dmabuf);
>  	close(dmabuf);
> =20
> +	igt_skip_on(__gem_read(i915, handle, 0, &i, sizeof(i)));
> +
>  	igt_fork(child, 1) {
>  		close(master[0]);
>  		close(slave[1]);
> @@ -191,6 +195,8 @@ static void test_write(int vgem, int i915)
>  	handle =3D prime_fd_to_handle(i915, dmabuf);
>  	close(dmabuf);
> =20
> +	igt_skip_on(__gem_write(i915, handle, 0, &i, sizeof(i)));
> +
>  	ptr =3D vgem_mmap(vgem, &scratch, PROT_READ);
>  	gem_close(vgem, scratch.handle);
> =20

--=-+j+dWqXSWdBzb5wGAUQ0
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
PwuHX1mRETAlwqXCZa6ba8eraUCltlCb/ZiEk9UFRVLjbLNPh9IYOi+sWkS6n5CovLKAqhMCAwEA
AaOCAjMwggIvMB0GA1UdDgQWBBSgeYqvLV4nBaCUzAXLr0TeMJYR5zAfBgNVHSMEGDAWgBTaQSOc
Wo9xr1eDPiDT42XbDMsL2zBlBgNVHR8EXjBcMFqgWKBWhlRodHRwOi8vd3d3LmludGVsLmNvbS9y
ZXBvc2l0b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIwQ0ElMjA0
Qi5jcmwwgZ8GCCsGAQUFBwEBBIGSMIGPMCIGCCsGAQUFBzABhhZodHRwOi8vb2NzcC5pbnRlbC5j
b20vMGkGCCsGAQUFBzAChl1odHRwOi8vd3d3LmludGVsLmNvbS9yZXBvc2l0b3J5L2NlcnRpZmlj
YXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIwQ0ElMjA0Qi5jcnQwCwYD
VR0PBAQDAgeAMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIbDjHWEmeVRg/2BKIWOn1OCkcAJ
Z4HevTmV8EMCAWQCAQkwHwYDVR0lBBgwFgYIKwYBBQUHAwQGCisGAQQBgjcKAwwwKQYJKwYBBAGC
NxUKBBwwGjAKBggrBgEFBQcDBDAMBgorBgEEAYI3CgMMME0GA1UdEQRGMESgKAYKKwYBBAGCNxQC
A6AaDBhzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb22BGHN0dWFydC5zdW1tZXJzQGludGVsLmNvbTAN
BgkqhkiG9w0BAQUFAAOCAQEAfyIC7rzSi6S8O+sdH384K8zyeMRJnl6vR7whl9PuEat+BkKpoxHn
jQ0SFyF/cyI4lH/n938Pm3/Ctq0Z5GTldX6hhxxcLAR0qbk6AQU0Cq2nYMlZfX4FUz3FRsazbjTW
1qObcvPRUAVScaa7SRGdensvbNV++pN1XqEdc++szxo58UzPaEgDlHIe2sEIVXnFkHnJv0ikRHG3
urcA1bdj7Rac7dJBeQOQMdZEGmrWWmmbJzvk3OmoK9tKN7wcErQSdlqyYOMLesPfa7YNyLFYEJQd
CC/N7V8U9yFZx8akWREb8lJYDl9KypirEsufleiew26CWrwcbmdlldDCFS6/HDGCAhcwggITAgEB
MIGQMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAY
BgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJ
c3N1aW5nIENBIDRCAhMzAAB04Th3owY0UbEUAAAAAHThMAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0B
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTExMjAxNzE0NDlaMCMGCSqGSIb3DQEJ
BDEWBBTuA4fZ2bHtewQWQtO7DoPj7HACLjANBgkqhkiG9w0BAQEFAASCAQAPF7RZueDVhWPqhddI
TBLe7r0J29vUbAm274oQEQqKxx0aM5vD73RkFe+/QqmVzi8j9Wr8o9gTjCIB9JMvnqN6F65QUUIZ
Rgpw1XK1QjoC5PUjsQFuV/MgyalVMP9PMWgdmj1p2WsH2Ta2XDYw6zVLSPaBf22tirYJwnTpLV3w
73KyIPLSE6QVct+WQzO+bOMo1VQu4MIYzPDte5rtOhNEd1lz5w/kYeP7NpuzZr8MR3QaBluQEaDt
isG9S4wR1aQn56jCzSmIJBmWQ5b44/W9V2XpcFiswEMmu9MBvmp1x3zXTnDqC5pss3GQUAmADnDN
4oayg3YM2XGTdj9eQQgDAAAAAAAA


--=-+j+dWqXSWdBzb5wGAUQ0--

--===============0176911007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0176911007==--
