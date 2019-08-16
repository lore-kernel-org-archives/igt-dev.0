Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F346E441
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2019 14:21:50 +0000 (UTC)
From: "Vasilev, Oleg" <oleg.vasilev@intel.com>
Date: Fri, 16 Aug 2019 14:21:46 +0000
Message-ID: <e52563c18687eea965a4707ca6cfb7e8d4f4a374.camel@intel.com>
References: <20190712141618.7110-1-oleg.vasilev@intel.com>
 <20190712141618.7110-2-oleg.vasilev@intel.com>
 <03468d86c479d38c77fc3e119b97098618bc86bd.camel@intel.com>
In-Reply-To: <03468d86c479d38c77fc3e119b97098618bc86bd.camel@intel.com>
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
Content-Type: multipart/mixed; boundary="===============2030048682=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ser,
 Simon" <simon.ser@intel.com>
Cc: "daniel@ffwll.ch" <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2030048682==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-A+3azctjjnpdGdWH8sKp"

--=-A+3azctjjnpdGdWH8sKp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-16 at 11:07 +0100, Ser, Simon wrote:
> Hi,
>=20
> Overall this looks good. Here are a few comments.
>=20
> I agree with Chris and Daniel regarding naming.
>=20
> On Fri, 2019-07-12 at 17:16 +0300, Oleg Vasilev wrote:
> > +static bool has_prime_import(int fd)
> > +{
> > +	uint64_t value;
> > +
> > +	if (drmGetCap(fd, DRM_CAP_PRIME, &value))
> > +		return false;
> > +
> > +	return value & DRM_PRIME_CAP_IMPORT;
>=20
> This returns a non-zero value when import is supported, but doesn't
> return true. This can lead to strange bugs.
>=20
> It's common to use !! to convert to a bool.

Hi,

As discussed, this should be still a valid stdbool.

> > +	vgem_create(exporter, scratch);
>=20
> The return value should be checked.

Actually, it is already checked inside the function. AFAIU, in IGT
helpers usually call their __underscored siblings and assert return
value.
=20
>=20
> > +	ptr =3D vgem_mmap(exporter, scratch, PROT_WRITE);
>=20
> Ditto, we should check that ptr !=3D NULL.

Same.

>=20
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
>=20
> Maybe we could populate fb->strides[0] here, so that we don't need to
> pass it around in import_fb.
>=20
> > +}
> >=20
> > +		dmabuf_fd =3D prime_handle_to_fd(exporter,
> > scratch.handle);
>=20
> We should check dmabuf_fd >=3D 0.

Same, it is asserted internally.

> > +		gem_close(exporter, scratch.handle);
> > +
> > +		prepare_fb(importer, &scratch, &fb);
> > +		import_fb(importer, &fb, dmabuf_fd, scratch.pitch);
>=20
> We should release this FB after we're done.

You mean remove fb? It is done in collect_crc, which I renamed to
collect_crc_for_fb to make it more clear.

> > +		close(dmabuf_fd);
> > +
> > +		colors[i].prime_crc.name =3D "prime";
> > +		collect_crc(importer, &fb, &display, output,
> > +			    pipe_crc, colors[i].color,
> > &colors[i].prime_crc);
> > +
> > +		igt_create_color_fb(importer,
> > +				    mode->hdisplay, mode->vdisplay,
> > +				    DRM_FORMAT_XRGB8888,
> > LOCAL_DRM_FORMAT_MOD_NONE,
> > +				    colors[i].r, colors[i].g,
> > colors[i].b,
> > +				    &fb);
>=20
> Ditto, we should release this FB after we're done.

Same

>=20
> > +
> > +		colors[i].direct_crc.name =3D "direct";
> > +		collect_crc(importer, &fb, &display, output,
> > +			    pipe_crc, colors[i].color,
> > &colors[i].direct_crc);
> > +	}
> > +	igt_pipe_crc_free(pipe_crc);
> > +
> > +	igt_debug("CRC table:\n");
> > +	igt_debug("Color\t\tPrime\t\tDirect\n");
> > +	for (i =3D 0; i < ARRAY_SIZE(colors); i++) {
> > +		igt_debug("%#08x\t%.8s\t%.8s\n", colors[i].color,
> > +			  colors[i].prime_crc.str,
> > colors[i].direct_crc.str);
> > +		free(colors[i].prime_crc.str);
> > +		free(colors[i].direct_crc.str);
> > +	}
...
> > +
> > +igt_main
> > +{
> > +	igt_fixture {
> > +		kmstest_set_vt_graphics_mode();
>=20
> Is this really needed?

Yeah, it is necessary for every KMS test.

The rest is fixed, thanks for the review. New version is sent.

Oleg

>=20
> > +	}
> > +	igt_subtest("crc")
>=20
> Please add a subtest description. See:
> https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#i=
gt-describe
>=20
> > +		run_test_crc(DRIVER_VGEM, DRIVER_ANY);
> > +}

--=-A+3azctjjnpdGdWH8sKp
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
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
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA4MTYxNDIxNDVaMCMGCSqGSIb3DQEJBDEWBBT63E8o
rb5d2qO9b97wMrbrdUwnsTANBgkqhkiG9w0BAQEFAASCAQBabgweoaL3ntaGO++Q4r0maGj1EWG/
iD6lOuk+xpje2MgxKavRA3tIOXqY9YhJi3uuqqhw/E3SICLw1KzMw0ZFj0l8MFy9w90RdR4UDgvJ
UsRQrxEKgS1z9RDvrDjimk8jZlpiF9qQycti6v/+zwkeZbZqVZEzULoALRRGqhGOHHd2i4QlvRoQ
MYk9jCWa8blx2fsijeOclyKtlF2o/t7ADSe215/x2UJpRPFQpCd7fGsTpDJIEiQ+8HKdvb3UuItF
h6d72bg1uLngqgnmfz9+TDiO8aY9X3/R98gMcGT9Bj8YnfKYn0K7OGU2sZO9guM0ggt50N3QTOxR
zRKMRB/+AAAAAAAA


--=-A+3azctjjnpdGdWH8sKp--

--===============2030048682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============2030048682==--
