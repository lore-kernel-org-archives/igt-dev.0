Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAE16E5B9
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 00:35:56 +0000 (UTC)
From: "Chegondi, Harish" <harish.chegondi@intel.com>
Date: Fri, 5 Apr 2019 00:35:53 +0000
Message-ID: <acd613f7524e55f184479e5bba3964db55cd8205.camel@intel.com>
References: <36a00595c5083adb40d496ff30ebc820ae770474.1552545177.git.harish.chegondi@intel.com>
 <f4808a400a4111da36ab2f30a20ec6c5170ae53c.1554339208.git.harish.chegondi@intel.com>
 <20190404081200.GR2665@phenom.ffwll.local>
In-Reply-To: <20190404081200.GR2665@phenom.ffwll.local>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 1/1] i915/pm_backlight: Do not turn off
 DPMS before system suspend
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0434823779=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0434823779==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-4PiR6F/KyevijmxGTvrV"

--=-4PiR6F/KyevijmxGTvrV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-04-04 at 10:12 +0200, Daniel Vetter wrote:
> On Wed, Apr 03, 2019 at 06:26:30PM -0700, Harish Chegondi wrote:
> > backlight fade with suspend test turns off dpms which turns off the
> > edp
> > backlight. Then it does a system suspend and resume. After resume,
> > the edp backlight would still be off, but the test sets the
> > brightness
> > value and reads it back. Since the edp backlight is off, the
> > brightness
> > values written and read are different causing the test to fail.
> >=20
> > Do not turn off the DPMS before suspend so that after system
> > resume,
> > the edp backlight would be on and setting the brightness value
> > would
> > be successful.
> >=20
> > v2: Remove "DPMS off" before system suspend instead of adding
> >     "DPMS on" after system resume.
> >=20
> > Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Clinton Taylor <clinton.a.taylor@intel.com>
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > References: https://bugs.freedesktop.org/show_bug.cgi?id=3D107820
> > Fixes: 377752242995 ("Brightness test with DPMS and System
> > suspend.")
>=20
> I think this makes sense. Still not sure what exactly the test tries
> to
> verify ...
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
Thanks for the review !

I pasted few lines of the commit message from the commit that added
this test which may explain the intention of the test author.

BIOS programs few of PWM related registers during initial boot.
But during System suspend those registers are cleared.
This test aim to check whether display programs those registers
properly after system resume.

> ---
> >  tests/i915/i915_pm_backlight.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >=20
> > diff --git a/tests/i915/i915_pm_backlight.c
> > b/tests/i915/i915_pm_backlight.c
> > index 054300f6..4c1bff5b 100644
> > --- a/tests/i915/i915_pm_backlight.c
> > +++ b/tests/i915/i915_pm_backlight.c
> > @@ -175,13 +175,6 @@ test_fade_with_dpms(struct context *context,
> > igt_output_t *output)
> >  static void
> >  test_fade_with_suspend(struct context *context, igt_output_t
> > *output)
> >  {
> > -	igt_require(igt_setup_runtime_pm());
> > -
> > -	kmstest_set_connector_dpms(output->display->drm_fd,
> > -				   output->config.connector,
> > -				   DRM_MODE_DPMS_OFF);
> > -	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPEN
> > DED));
> > -
> >  	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > SUSPEND_TEST_NONE);
> > =20
> >  	test_fade(context);
> > --=20
> > 2.20.1
> >=20
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev

--=-4PiR6F/KyevijmxGTvrV
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
pa1ausuXsLhFnEAQm7EbCn0GOK8YkRAvq711pGt9sOjlRA2C1yOc0LrRBAkcQOKpRaACiGOG9wID
AQABo4ICNTCCAjEwHQYDVR0OBBYEFNacPWXxGVks3jE3ImmfltCEZ0SIMB8GA1UdIwQYMBaAFB5p
KrTcKP5HGE4hCz+8rBEv8Jj1MGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly93d3cuaW50ZWwuY29t
L3JlcG9zaXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBDQSUy
MDRBLmNybDCBnwYIKwYBBQUHAQEEgZIwgY8waQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cuaW50ZWwu
Y29tL3JlcG9zaXRvcnkvY2VydGlmaWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElz
c3VpbmclMjBDQSUyMDRBLmNydDAiBggrBgEFBQcwAYYWaHR0cDovL29jc3AuaW50ZWwuY29tLzAL
BgNVHQ8EBAMCB4AwPAYJKwYBBAGCNxUHBC8wLQYlKwYBBAGCNxUIhsOMdYSZ5VGD/YEohY6fU4KR
wAlngd69OZXwQwIBZAIBCTAfBgNVHSUEGDAWBggrBgEFBQcDBAYKKwYBBAGCNwoDDDApBgkrBgEE
AYI3FQoEHDAaMAoGCCsGAQUFBwMEMAwGCisGAQQBgjcKAwwwTwYDVR0RBEgwRqApBgorBgEEAYI3
FAIDoBsMGWhhcmlzaC5jaGVnb25kaUBpbnRlbC5jb22BGWhhcmlzaC5jaGVnb25kaUBpbnRlbC5j
b20wDQYJKoZIhvcNAQEFBQADggEBAG02NF7cxsPDRuJ9jinTAbR5R/FNaTDO2vkUSPfRJwPyckCT
wNZpZIuP8af2n0BLAcGFgiIVIU/gkEI9JQzCgauU6yc4ufu4yZmK8BwxOKXELu7uUeGUM8w/WiNG
uH0j2MYTIYBl6bsg2sBrWDQxAfpCYlAnLu9RyS8Czc+v+n7o5yYoIAaCRXlHgvfbNk1Ik7nXdp3o
bpKE0lYtbNVS6eL4TerSkH/fq71PQ/zOgUjKwAI6i3rInDoRFb2+L87/BR2/IDVbUuEAFwdt25Rg
qe9jVbbWnO6+p5vpOTW0JuUW87wn/Ft9N7NTJn7z+hrgS5AJUKDkCFlWS1R0yPjhIakxggIXMIIC
EwIBATCBkDB5MQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFDASBgNVBAcTC1NhbnRhIENsYXJh
MRowGAYDVQQKExFJbnRlbCBDb3Jwb3JhdGlvbjErMCkGA1UEAxMiSW50ZWwgRXh0ZXJuYWwgQmFz
aWMgSXNzdWluZyBDQSA0QQITMwAAzfoMBMjqQlWHOgAAAADN+jAJBgUrDgMCGgUAoF0wGAYJKoZI
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwNDA1MDAzNTUxWjAjBgkqhkiG
9w0BCQQxFgQU/HPNI2L9Xy3iStSkNXb/6iLSME8wDQYJKoZIhvcNAQEBBQAEggEAmbwcQAnItmWc
ToNvMU7jAMEWaILbNMsGHSZ4gImBkS3PROuEMloxxT+koOrbzn8a0HNBw40VynrovlUF8wqR9K4z
E9Vs1g9BElLwIs+A1yTSx9h9oPiGInh7WVLAcRa0/HVDagHYSc5Nwaiek7uppv56TM+DIPjvZ2UI
Az8RaRAHNLSZ3wG89sXc1NopPH4jx8IFKT6uAMU0so/9keHxwsKZeg0paOVNWEHAJOyrWLIJTsom
16W7hSHYmbTz2NdKcL0ITDW6q6qOViOFIOppsE9rGpzkKpagf/fLZevF0CbT8tEZzFyh/O5S0hyG
llUjRtsM3/1sRXMB80CG89KupAAAAAAAAA==


--=-4PiR6F/KyevijmxGTvrV--

--===============0434823779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0434823779==--
