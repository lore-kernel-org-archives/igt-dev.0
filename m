Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC2A6E395
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 16:23:11 +0000 (UTC)
From: "Summers, Stuart" <stuart.summers@intel.com>
Date: Tue, 19 Nov 2019 16:23:09 +0000
Message-ID: <3264b32d24d2af78abcebe16d4858d611b4bb045.camel@intel.com>
References: <20191119160223.25283-1-zbigniew.kempczynski@intel.com>
 <20191119160223.25283-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20191119160223.25283-2-zbigniew.kempczynski@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/4] lib/i915/gem_mman: add
 mmap_offset support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1415077560=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1415077560==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-FOmTowoMrXLVsDy+zpeI"

--=-FOmTowoMrXLVsDy+zpeI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-11-19 at 17:02 +0100, Zbigniew Kempczy=C5=84ski wrote:
> From: Lukasz Kalamarz <lukasz.kalamarz@intel.com>
>=20
> With introduction of LMEM concept new IOCTL call were implemented
> - gem_mmap_offset. This patch add support in IGT for it.
>=20
> Signed-off-by: Lukasz Kalamarz <lukasz.kalamarz@intel.com>
> Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> ---
>  lib/i915/gem_mman.c | 178 ++++++++++++++++++++++++++++++++++------
> ----
>  lib/i915/gem_mman.h |  39 +++++++++-
>  2 files changed, 177 insertions(+), 40 deletions(-)
>=20
> diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
> index 6256627b..920f9ca5 100644
> --- a/lib/i915/gem_mman.c
> +++ b/lib/i915/gem_mman.c
> @@ -40,6 +40,44 @@
>  #define VG(x) do {} while (0)
>  #endif
> =20
> +#define LOCAL_I915_PARAM_MMAP_OFFSET_VERSION 54
> +
> +static bool gem_has_mmap_offset(int fd)
> +{
> +	int has_mmap_offset =3D 0;
> +	struct drm_i915_getparam gp;
> +
> +	memset(&gp, 0, sizeof(gp));
> +	gp.param =3D LOCAL_I915_PARAM_MMAP_OFFSET_VERSION;
> +	gp.value =3D &has_mmap_offset;
> +	ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp);
> +
> +	return has_mmap_offset > 0;
> +}
> +
> +void gem_require_mmap_offset(int i915)
> +{
> +	igt_require(gem_has_mmap_offset(i915));
> +}
> +
> +static int gem_mmap_gtt_version(int fd)
> +{
> +	struct drm_i915_getparam gp;
> +	int gtt_version =3D -1;
> +
> +	memset(&gp, 0, sizeof(gp));
> +	gp.param =3D I915_PARAM_MMAP_GTT_VERSION;
> +	gp.value =3D &gtt_version;
> +	ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp);
> +
> +	return gtt_version;
> +}
> +
> +bool gem_mmap_has_gtt(int fd)
> +{
> +	return gem_mmap_gtt_version(fd) > 0;

Chris mentioned this in a patch I had posted over the weekend, but this
isn't going to properly support the legacy platforms which don't have
IOCTL versioning.

What if we pull has_gtt_mmap() in from tests/i915/gem_userptr_blits.c,
and make it a test we can use across the different tests that need it.
I did test this locally and it seems to work, although I haven't done a
full regression.

IMO this can also be separated out in a new patch, since it isn't
specifically required for the mmap_offset changes here.

Thanks,
Stuart

> +}
> +
>  /**
>   * __gem_mmap__gtt:
>   * @fd: open i915 drm file descriptor
> @@ -101,46 +139,63 @@ int gem_munmap(void *ptr, uint64_t size)
>  	return ret;
>  }
> =20
> -bool gem_mmap__has_wc(int fd)
> +bool __gem_mmap__has_wc(int fd)
>  {
> -	static int has_wc =3D -1;
> -
> -	if (has_wc =3D=3D -1) {
> -		struct drm_i915_getparam gp;
> -		int mmap_version =3D -1;
> -		int gtt_version =3D -1;
> -
> -		has_wc =3D 0;
> -
> -		memset(&gp, 0, sizeof(gp));
> -		gp.param =3D I915_PARAM_MMAP_GTT_VERSION;
> -		gp.value =3D &gtt_version;
> -		ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp);
> -
> -		memset(&gp, 0, sizeof(gp));
> -		gp.param =3D I915_PARAM_MMAP_VERSION;
> -		gp.value =3D &mmap_version;
> -		ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp);
> -
> -		/* Do we have the new mmap_ioctl with DOMAIN_WC? */
> -		if (mmap_version >=3D 1 && gtt_version >=3D 2) {
> -			struct drm_i915_gem_mmap arg;
> -
> -			/* Does this device support wc-mmaps ? */
> -			memset(&arg, 0, sizeof(arg));
> -			arg.handle =3D gem_create(fd, 4096);
> -			arg.offset =3D 0;
> -			arg.size =3D 4096;
> -			arg.flags =3D I915_MMAP_WC;
> -			has_wc =3D igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP,
> &arg) =3D=3D 0;
> -			gem_close(fd, arg.handle);
> -		}
> -		errno =3D 0;
> +	int has_wc =3D 0;
> +
> +	struct drm_i915_getparam gp;
> +	int mmap_version =3D -1;
> +
> +	memset(&gp, 0, sizeof(gp));
> +	gp.param =3D I915_PARAM_MMAP_VERSION;
> +	gp.value =3D &mmap_version;
> +	ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp);
> +
> +	/* Do we have the mmap_ioctl with DOMAIN_WC? */
> +	if (mmap_version >=3D 1 && gem_mmap_gtt_version(fd) >=3D 2) {
> +		struct drm_i915_gem_mmap arg;
> +
> +		/* Does this device support wc-mmaps ? */
> +		memset(&arg, 0, sizeof(arg));
> +		arg.handle =3D gem_create(fd, 4096);
> +		arg.offset =3D 0;
> +		arg.size =3D 4096;
> +		arg.flags =3D I915_MMAP_WC;
> +		has_wc =3D igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP, &arg)
> =3D=3D 0;
> +		gem_close(fd, arg.handle);
> +	}
> +	errno =3D 0;
> +
> +	return has_wc > 0;
> +}
> +
> +bool __gem_mmap_offset__has_wc(int fd)
> +{
> +	int has_wc =3D 0;
> +
> +	if (gem_has_mmap_offset(fd)) {
> +		struct local_i915_gem_mmap_offset arg;
> +
> +		/* Does this device support wc-mmaps ? */
> +		memset(&arg, 0, sizeof(arg));
> +		arg.handle =3D gem_create(fd, 4096);
> +		arg.offset =3D 0;
> +		arg.flags =3D LOCAL_I915_MMAP_OFFSET_WC;
> +		has_wc =3D igt_ioctl(fd,
> LOCAL_IOCTL_I915_GEM_MMAP_OFFSET,
> +				   &arg) =3D=3D 0;
> +		gem_close(fd, arg.handle);
>  	}
> =20
> +	errno =3D 0;
> +
>  	return has_wc > 0;
>  }
> =20
> +bool gem_mmap__has_wc(int fd)
> +{
> +	return __gem_mmap_offset__has_wc(fd) || __gem_mmap__has_wc(fd);
> +}
> +
>  /**
>   * __gem_mmap:
>   * @fd: open i915 drm file descriptor
> @@ -157,8 +212,8 @@ bool gem_mmap__has_wc(int fd)
>   *
>   * Returns: A pointer to the created memory mapping, NULL on
> failure.
>   */
> -static void
> -*__gem_mmap(int fd, uint32_t handle, uint64_t offset, uint64_t size,
> unsigned int prot, uint64_t flags)
> +void *__gem_mmap(int fd, uint32_t handle, uint64_t offset, uint64_t
> size,
> +		 unsigned int prot, uint64_t flags)
>  {
>  	struct drm_i915_gem_mmap arg;
> =20
> @@ -177,6 +232,43 @@ static void
>  	return from_user_pointer(arg.addr_ptr);
>  }
> =20
> +/**
> + * __gem_mmap_offset:
> + * @fd: open i915 drm file descriptor
> + * @handle: gem buffer object handle
> + * @offset: offset in the gem buffer of the mmap arena
> + * @size: size of the mmap arena
> + * @prot: memory protection bits as used by mmap()
> + * @flags: flags used to determine caching
> + *
> + * Similar to __gem_mmap but use MMAP_OFFSET IOCTL.
> + *
> + * Returns: A pointer to the created memory mapping, NULL on
> failure.
> + */
> +void *__gem_mmap_offset(int fd, uint32_t handle, uint64_t offset,
> uint64_t size,
> +			unsigned int prot, uint64_t flags)
> +{
> +	struct local_i915_gem_mmap_offset arg;
> +	void *ptr;
> +
> +	memset(&arg, 0, sizeof(arg));
> +	arg.handle =3D handle;
> +	arg.offset =3D offset;
> +	arg.flags =3D flags;
> +
> +	if (igt_ioctl(fd, LOCAL_IOCTL_I915_GEM_MMAP_OFFSET, &arg))
> +		return NULL;
> +
> +	ptr =3D mmap64(0, size, prot, MAP_SHARED, fd, arg.offset);
> +
> +	if (ptr =3D=3D MAP_FAILED)
> +		ptr =3D NULL;
> +	else
> +		errno =3D 0;
> +
> +	return ptr;
> +}
> +
>  /**
>   * __gem_mmap__wc:
>   * @fd: open i915 drm file descriptor
> @@ -205,13 +297,17 @@ void *__gem_mmap__wc(int fd, uint32_t handle,
> uint64_t offset, uint64_t size, un
>   * @size: size of the mmap arena
>   * @prot: memory protection bits as used by mmap()
>   *
> - * Like __gem_mmap__wc() except we assert on failure.
> + * Try to __gem_mmap_offset, then __gem_mmap__wc(). Assert on
> failure.
>   *
>   * Returns: A pointer to the created memory mapping
>   */
>  void *gem_mmap__wc(int fd, uint32_t handle, uint64_t offset,
> uint64_t size, unsigned prot)
>  {
> -	void *ptr =3D __gem_mmap__wc(fd, handle, offset, size, prot);
> +	void *ptr =3D __gem_mmap_offset(fd, handle, offset, size, prot,
> +				       LOCAL_I915_MMAP_OFFSET_WC);
> +	if (!ptr)
> +		ptr =3D __gem_mmap__wc(fd, handle, offset, size, prot);
> +
>  	igt_assert(ptr);
>  	return ptr;
>  }
> @@ -248,7 +344,11 @@ void *__gem_mmap__cpu(int fd, uint32_t handle,
> uint64_t offset, uint64_t size, u
>   */
>  void *gem_mmap__cpu(int fd, uint32_t handle, uint64_t offset,
> uint64_t size, unsigned prot)
>  {
> -	void *ptr =3D __gem_mmap__cpu(fd, handle, offset, size, prot);
> +	void *ptr =3D __gem_mmap_offset(fd, handle, offset, size, prot,
> +				       LOCAL_I915_MMAP_OFFSET_WB);
> +	if (!ptr)
> +		ptr =3D __gem_mmap__cpu(fd, handle, offset, size, prot);
> +
>  	igt_assert(ptr);
>  	return ptr;
>  }
> diff --git a/lib/i915/gem_mman.h b/lib/i915/gem_mman.h
> index 096ff592..e4c954c6 100644
> --- a/lib/i915/gem_mman.h
> +++ b/lib/i915/gem_mman.h
> @@ -25,12 +25,45 @@
>  #ifndef GEM_MMAN_H
>  #define GEM_MMAN_H
> =20
> +#define LOCAL_I915_GEM_MMAP_OFFSET       DRM_I915_GEM_MMAP_GTT
> +#define
> LOCAL_IOCTL_I915_GEM_MMAP_OFFSET         DRM_IOWR(DRM_COMMAND_BASE +
> \
> +	LOCAL_I915_GEM_MMAP_OFFSET, struct local_i915_gem_mmap_offset)
> +
> +struct local_i915_gem_mmap_offset {
> +	/** Handle for the object being mapped. */
> +	__u32 handle;
> +	__u32 pad;
> +	/**
> +	 * Fake offset to use for subsequent mmap call
> +	 *
> +	 * This is a fixed-size type for 32/64 compatibility.
> +	 */
> +	__u64 offset;
> +	/**
> +	 * Flags for extended behaviour.
> +	 *
> +	 * It is mandatory that either one of the _WC/_WB flags
> +	 * should be passed here.
> +	 */
> +	__u64 flags;
> +#define LOCAL_I915_MMAP_OFFSET_WC (1 << 0)
> +#define LOCAL_I915_MMAP_OFFSET_WB (1 << 1)
> +#define LOCAL_I915_MMAP_OFFSET_UC (1 << 2)
> +#define LOCAL_I915_MMAP_OFFSET_FLAGS \
> +	(LOCAL_I915_MMAP_OFFSET_WC | LOCAL_I915_MMAP_OFFSET_WB |
> LOCAL_I915_MMAP_OFFSET_UC)
> +};
> +
> +void gem_require_mmap_offset(int i915);
> +bool gem_mmap_has_gtt(int fd);
> +
>  void *gem_mmap__gtt(int fd, uint32_t handle, uint64_t size, unsigned
> prot);
>  void *gem_mmap__cpu(int fd, uint32_t handle, uint64_t offset,
> uint64_t size, unsigned prot);
> =20
> +bool __gem_mmap__has_wc(int fd);
> +bool __gem_mmap_offset__has_wc(int fd);
>  bool gem_mmap__has_wc(int fd);
>  void *gem_mmap__wc(int fd, uint32_t handle, uint64_t offset,
> uint64_t size, unsigned prot);
> -
> +void *gem_mmap_offset__wc(int fd, uint32_t handle, uint64_t offset,
> uint64_t size, unsigned prot);
>  #ifndef I915_GEM_DOMAIN_WC
>  #define I915_GEM_DOMAIN_WC 0x80
>  #endif
> @@ -38,6 +71,10 @@ void *gem_mmap__wc(int fd, uint32_t handle,
> uint64_t offset, uint64_t size, unsi
>  bool gem_has_mappable_ggtt(int i915);
>  void gem_require_mappable_ggtt(int i915);
> =20
> +void *__gem_mmap(int fd, uint32_t handle, uint64_t offset, uint64_t
> size,
> +		 unsigned int prot, uint64_t flags);
> +void *__gem_mmap_offset(int fd, uint32_t handle, uint64_t offset,
> uint64_t size,
> +			 unsigned int prot, uint64_t flags);
>  void *__gem_mmap__gtt(int fd, uint32_t handle, uint64_t size,
> unsigned prot);
>  void *__gem_mmap__cpu(int fd, uint32_t handle, uint64_t offset,
> uint64_t size, unsigned prot);
>  void *__gem_mmap__wc(int fd, uint32_t handle, uint64_t offset,
> uint64_t size, unsigned prot);

--=-FOmTowoMrXLVsDy+zpeI
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
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTExMTkxNjIzMDVaMCMGCSqGSIb3DQEJ
BDEWBBSAXSEqf4cQndlmcPXkqq2aet5SwDANBgkqhkiG9w0BAQEFAASCAQAIgEknjLnPdu02sGH7
NjKlhq2J7gF0BKb4SxkfJr2b5slcJKtv1SbkgO+DGioUGSvXvP6IEs9Um2VglurBYtXygnPbqBMj
/Hn7g81zdGuTTShyZDiU97WuA2B9zoEi1j/hrVyMfm4PtqqUve6hudk31B49J3AyTLALRxnU2RmN
hvmQzv86YjMNQddGHRGq3aJXMSGqgRGeGr2hZtebKnemfN4yukyz0yABl0zab8xUOhuFcWr+qZ5o
rYDy5XjqqF+ZHa/brhoY2EijC5cIDfpBha5mqhJJba1fTBCOm+/QNv+/fdlPck7zSCJE3NOD3Ya5
73ETinfNT41cKvp5rqFuAAAAAAAA


--=-FOmTowoMrXLVsDy+zpeI--

--===============1415077560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1415077560==--
