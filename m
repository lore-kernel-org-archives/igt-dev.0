Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7FE6EA5A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2019 18:31:22 +0000 (UTC)
From: "Summers, Stuart" <stuart.summers@intel.com>
Date: Tue, 3 Dec 2019 18:31:20 +0000
Message-ID: <bf737c5467e9fbcd2d505491525207b39e6950af.camel@intel.com>
References: <20191203051154.13734-1-stuart.summers@intel.com>
 <157535298927.4659.15576122299106271997@emeril.freedesktop.org>
In-Reply-To: <157535298927.4659.15576122299106271997@emeril.freedesktop.org>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=3A_Use_engine_query_interface_for_gem=5Fctx=5Fisolation/pe?=
 =?utf-8?q?rsistence?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0044574361=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0044574361==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-Q74PBbLJxIoKLXBohTQV"

--=-Q74PBbLJxIoKLXBohTQV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-12-03 at 06:03 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: tests/i915: Use engine query interface for
> gem_ctx_isolation/persistence
> URL   : https://patchwork.freedesktop.org/series/70329/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from CI_DRM_7467 -> IGTPW_3799
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
>   **FAILURE**
>=20
>   Serious unknown changes coming with IGTPW_3799 absolutely need to
> be
>   verified manually.
>  =20
>   If you think the reported changes have nothing to do with the
> changes
>   introduced in IGTPW_3799, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false
> positives in CI.
>=20
>   External URL:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/index.html
>=20
> Possible new issues
> -------------------
>=20
>   Here are the unknown changes that may have been introduced in
> IGTPW_3799:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
>   * igt@i915_selftest@live_blt:
>     - fi-hsw-4770r:       [PASS][1] -> [DMESG-FAIL][2]
>    [1]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7467/fi-hsw-4770r/igt@i91=
5_selftest@live_blt.html
>    [2]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/fi-hsw-4770r/igt@i915=
_selftest@live_blt.html

Not sure how this is related to the changes I made.

-Stuart

>=20
>  =20
> #### Suppressed ####
>=20
>   The following results come from untrusted machines, tests, or
> statuses.
>   They do not affect the overall result.
>=20
>   * igt@i915_module_load@reload-no-display:
>     - {fi-kbl-7560u}:     [PASS][3] -> [DMESG-WARN][4]
>    [3]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7467/fi-kbl-7560u/igt@i91=
5_module_load@reload-no-display.html
>    [4]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/fi-kbl-7560u/igt@i915=
_module_load@reload-no-display.html
>=20
>  =20
> Known issues
> ------------
>=20
>   Here are the changes found in IGTPW_3799 that come from known
> issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
>   * igt@i915_pm_rpm@module-reload:
>     - fi-skl-lmem:        [PASS][5] -> [DMESG-WARN][6] ([i915#592])
>    [5]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7467/fi-skl-lmem/igt@i915=
_pm_rpm@module-reload.html
>    [6]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/fi-skl-lmem/igt@i915_=
pm_rpm@module-reload.html
>=20
>   * igt@i915_selftest@live_blt:
>     - fi-bwr-2160:        [PASS][7] -> [INCOMPLETE][8] ([i915#695])
>    [7]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7467/fi-bwr-2160/igt@i915=
_selftest@live_blt.html
>    [8]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/fi-bwr-2160/igt@i915_=
selftest@live_blt.html
>=20
>   * igt@kms_chamelium@dp-crc-fast:
>     - fi-icl-u2:          [PASS][9] -> [FAIL][10] ([fdo#109635] /
> [i915#262])
>    [9]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7467/fi-icl-u2/igt@kms_ch=
amelium@dp-crc-fast.html
>    [10]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/fi-icl-u2/igt@kms_cha=
melium@dp-crc-fast.html
>=20
>  =20
> #### Possible fixes ####
>=20
>   * igt@i915_pm_rpm@module-reload:
>     - fi-skl-6770hq:      [DMESG-WARN][11] ([i915#592]) -> [PASS][12]
>    [11]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7467/fi-skl-6770hq/igt@i9=
15_pm_rpm@module-reload.html
>    [12]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/fi-skl-6770hq/igt@i91=
5_pm_rpm@module-reload.html
>=20
>   * igt@i915_selftest@live_blt:
>     - fi-ivb-3770:        [DMESG-FAIL][13] ([i915#563]) -> [PASS][14]
>    [13]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7467/fi-ivb-3770/igt@i915=
_selftest@live_blt.html
>    [14]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/fi-ivb-3770/igt@i915_=
selftest@live_blt.html
>     - fi-hsw-4770:        [DMESG-FAIL][15] ([i915#563]) -> [PASS][16]
>    [15]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7467/fi-hsw-4770/igt@i915=
_selftest@live_blt.html
>    [16]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/fi-hsw-4770/igt@i915_=
selftest@live_blt.html
>=20
>   * igt@i915_selftest@live_gem_contexts:
>     - fi-hsw-peppy:       [DMESG-FAIL][17] ([fdo#111692]) ->
> [PASS][18]
>    [17]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7467/fi-hsw-peppy/igt@i91=
5_selftest@live_gem_contexts.html
>    [18]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/fi-hsw-peppy/igt@i915=
_selftest@live_gem_contexts.html
>=20
>   * igt@kms_frontbuffer_tracking@basic:
>     - fi-icl-guc:         [FAIL][19] ([i915#49]) -> [PASS][20]
>    [19]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7467/fi-icl-guc/igt@kms_f=
rontbuffer_tracking@basic.html
>    [20]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/fi-icl-guc/igt@kms_fr=
ontbuffer_tracking@basic.html
>=20
>  =20
> #### Warnings ####
>=20
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - fi-kbl-x1275:       [DMESG-WARN][21] ([i915#62] / [i915#92]) ->
> [DMESG-WARN][22] ([i915#62] / [i915#92] / [i915#95]) +7 similar
> issues
>    [21]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7467/fi-kbl-x1275/igt@kms=
_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>    [22]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/fi-kbl-x1275/igt@kms_=
cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>=20
>   * igt@kms_flip@basic-flip-vs-modeset:
>     - fi-kbl-x1275:       [DMESG-WARN][23] ([i915#62] / [i915#92] /
> [i915#95]) -> [DMESG-WARN][24] ([i915#62] / [i915#92]) +8 similar
> issues
>    [23]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7467/fi-kbl-x1275/igt@kms=
_flip@basic-flip-vs-modeset.html
>    [24]:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/fi-kbl-x1275/igt@kms_=
flip@basic-flip-vs-modeset.html
>=20
>  =20
>   {name}: This element is suppressed. This means it is ignored when
> computing
>           the status of the difference (SUCCESS, WARNING, or
> FAILURE).
>=20
>   [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=3D109635
>   [fdo#111692]: https://bugs.freedesktop.org/show_bug.cgi?id=3D111692
>   [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
>   [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
>   [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
>   [i915#592]: https://gitlab.freedesktop.org/drm/intel/issues/592
>   [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
>   [i915#695]: https://gitlab.freedesktop.org/drm/intel/issues/695
>   [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
>   [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
>=20
>=20
> Participating hosts (50 -> 45)
> ------------------------------
>=20
>   Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600
> fi-byt-clapper=20
>=20
>=20
> Build changes
> -------------
>=20
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5321 -> IGTPW_3799
>=20
>   CI-20190529: 20190529
>   CI_DRM_7467: 14954f24e7251b067b2081aaa09a7da6840da0d5 @
> git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_3799:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/index.html
>   IGT_5321: 9df50aef49e0da4413609d9866b41b82b725f2a0 @
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:=20
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3799/index.html

--=-Q74PBbLJxIoKLXBohTQV
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKcTCCBOsw
ggPToAMCAQICEDabxALowUBS+21KC0JI8fcwDQYJKoZIhvcNAQEFBQAwbzELMAkGA1UEBhMCU0Ux
FDASBgNVBAoTC0FkZFRydXN0IEFCMSYwJAYDVQQLEx1BZGRUcnVzdCBFeHRlcm5hbCBUVFAgTmV0
d29yazEiMCAGA1UEAxMZQWRkVHJ1c3QgRXh0ZXJuYWwgQ0EgUm9vdDAeFw0xMzEyMTEwMDAwMDBa
Fw0yMDA1MzAxMDQ4MzhaMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRCMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
yzuW/y/g0bznz8BD48M94luFzqHaqY9yGN9H/W0J7hOVBpl0rTQJ6kZ7z7hyDb9kf2UW4ZU25alC
i+q5m6NwHg+z9pcN7bQ84SSBueaYF7cXlAg7z3XyZbzSEYP7raeuWRf5fYvYzq8/uI7VNR8o/43w
PtDP10YDdO/0J5xrHxnC/9/aU+wTFSVsPqxsd7C58mnu7G4VRJ0n9PG4SfmYNC0h/5fLWuOWhxAv
6MuiK7MmvTPHLMclULgJqVSqG1MbBs0FbzoRHne4Cx0w6rtzPTrzo+bTRqhruaU18lQkzBk6OnyJ
UthtaDQIlfyGy2IlZ5F6QEyjItbdKcHHdjBX8wIDAQABo4IBdzCCAXMwHwYDVR0jBBgwFoAUrb2Y
ejS0Jvf6xCZU7wO94CTLVBowHQYDVR0OBBYEFNpBI5xaj3GvV4M+INPjZdsMywvbMA4GA1UdDwEB
/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMDYGA1UdJQQvMC0GCCsGAQUFBwMEBgorBgEEAYI3
CgMEBgorBgEEAYI3CgMMBgkrBgEEAYI3FQUwFwYDVR0gBBAwDjAMBgoqhkiG+E0BBQFpMEkGA1Ud
HwRCMEAwPqA8oDqGOGh0dHA6Ly9jcmwudHJ1c3QtcHJvdmlkZXIuY29tL0FkZFRydXN0RXh0ZXJu
YWxDQVJvb3QuY3JsMDoGCCsGAQUFBwEBBC4wLDAqBggrBgEFBQcwAYYeaHR0cDovL29jc3AudHJ1
c3QtcHJvdmlkZXIuY29tMDUGA1UdHgQuMCygKjALgQlpbnRlbC5jb20wG6AZBgorBgEEAYI3FAID
oAsMCWludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAp9XGgH85hk/3IuN8F4nrFd24MAoau7Uq
M/of09XtyYg2dV0TIPqtxPZw4813r78WwsGIbvtO8VQ18dNktIxaq6+ym2zebqDh0z6Bvo63jKE/
HMj8oNV3ovnuo+7rGpCppcda4iVBG2CetB3WXbUVr82EzECN+wxmC4H9Rup+gn+t+qeBTaXulQfV
TYOvZ0eZPO+DyC2pVv5q5+xHljyUsVqpzsw89utuO8ZYaMsQGBRuFGOncRLEOhCtehy5B5aCI571
i4dDAv9LPODrEzm3PBfrNhlp8C0skak15VXWFzNuHd00AsxXxWSUT4TG8RiAH61Ua5GXsP1BIZwl
4WjK8DCCBX4wggRmoAMCAQICEzMAAHThOHejBjRRsRQAAAAAdOEwDQYJKoZIhvcNAQEFBQAweTEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMR
SW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vpbmcg
Q0EgNEIwHhcNMTkwMTIzMTcxMTA0WhcNMjAwMTE4MTcxMTA0WjBDMRgwFgYDVQQDEw9TdW1tZXJz
LCBTdHVhcnQxJzAlBgkqhkiG9w0BCQEWGHN0dWFydC5zdW1tZXJzQGludGVsLmNvbTCCASIwDQYJ
KoZIhvcNAQEBBQADggEPADCCAQoCggEBAL7LpY79h4eyLdxekwAblnyPAHSCaXvVTUmnPKxWXs9g
VCcf7gjGg8qg/HLCwvgGKGqtVkn2EaCKd85rqklaTp07JciV6a77qodO0yOgyz96hRVuSFAIP0UQ
TXP+PuVIfYuqNSSgh2x2HzJy2DzpG12ZMldy6r2zAa6ypWevjFp5+3/mscAVNAmSHnyj838uukd/
YwrFtEG2j5l/EoijzGMRFUD0tS5eD2y0WmRfmc4xkv1Qjr8AN3ogZr4arGr+rF2F4aakLmoDUCZk
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
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTEyMDMxODMxMTZaMCMGCSqGSIb3DQEJ
BDEWBBSeQLCL5BlFIm+0ntFQYdqR+pF3jjANBgkqhkiG9w0BAQEFAASCAQB/GGu9zcMUBIGtUi4P
WI59FIwcXw3nw6pVnevswPW2AC3iYCch5y/YleHirN55I4QYR+xxws1IAe0S3sMgbo6Rsno2XUvM
eA7UZClh1apJcNgomoQhp+F7hjYjjPkiHOZjl2jGDil/X248muWDVH+xDkHAhBrb/A6MPKXP0ka9
Pxayp1XBh2wHrusTSzwhevuJKN0+IxJHlGIBQuV7o4uP0k8vCrWB8uqO2I0M/iwWFc0zfzpoSOX2
TKP2FF8pwAap6e24oSuBkp/7R/BaxQZUzMoKp5yqz9o1wEDQtvLbEX/6z71X222BX1CUGhgLFMxv
UVeEcJnWvmV3XOprOL5hAAAAAAAA


--=-Q74PBbLJxIoKLXBohTQV--

--===============0044574361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0044574361==--
