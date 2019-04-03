Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4D66E439
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2019 00:47:12 +0000 (UTC)
From: "Chegondi, Harish" <harish.chegondi@intel.com>
Date: Wed, 3 Apr 2019 00:47:09 +0000
Message-ID: <8eb9c24250eb482bda91f1bcc430a21053d16017.camel@intel.com>
References: <36a00595c5083adb40d496ff30ebc820ae770474.1552545177.git.harish.chegondi@intel.com>
 <155254958544.4168.8591390419495126785@skylake-alporthouse-com>
In-Reply-To: <155254958544.4168.8591390419495126785@skylake-alporthouse-com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC i-g-t 1/1] i915/pm_backlight: turn on dpms
 before backlight fade out and fade in
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1123951585=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Cc: "Taylor, Clinton A" <clinton.a.taylor@intel.com>, "Yadav,
 Jyoti R" <jyoti.r.yadav@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1123951585==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-jJdh5sDTMOm9WqYO2pFQ"

--=-jJdh5sDTMOm9WqYO2pFQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-03-14 at 07:46 +0000, Chris Wilson wrote:
> Quoting Harish Chegondi (2019-03-14 06:41:48)
> > backlight fade with suspend test turns off dpms which turns off
> > the edp backlight and panel. Then it does a runtime suspend,
> > system suspend and resume. After resume, it does a fade out and
> > fade in of the backlight brightness. From the dmesg logs of the
> > ci tests it appears that the test is setting the brightness
> > even before the edp panel and backlight are turned on resuilting
> > in the brightness values written and read to be different.
> > Turn on the dpms which turns on the edp panel and backlight
> > before backlight fade out and fade in. With this change the
> > fade_with_suspend test passes.

Chris,

My commit message was confusing. I will redo the commit message in the
next version of my patch.

>=20
> But is it legal for the kernel to that? Is the kernel meant to
> restore
> the previous configuration upon resume or leave it to userspace? What
> about for fbcon?

Yes, the kernel is meant to restore the previous configuration upon
resume. In this test, before system suspend, DPMS is turned off which
sets the crtc state to inactive and edp backlight to off. After system
resume, the crtc state should still be inactive and dpms and edp
backlight should still be off. After system resume, before setting the
backlight brighness, the test should turn on the DPMS. Turning on the
DPMS would set the CRTC state to active and turn on the backlight.

-Harish.

>=20
> If it is meant to leave it to userspace, why is the connector still
> even
> enabled?
> -Chris



--=-jJdh5sDTMOm9WqYO2pFQ
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
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwNDAzMDA0NzA3WjAjBgkqhkiG
9w0BCQQxFgQUbzu5zBMgL2n2M9c+1/RjVTa212kwDQYJKoZIhvcNAQEBBQAEggEAifsu+5e6+oPF
sYQsWqfxYlehcjRhssp7LqlUfOQMogRj6TYZpTzLMYRNOcPqQHkPjd+o+hYBMucXXOZuJjDWAUMw
SmmxtQw4c2duULLCO4NB6/GEKTQMpIQVV9XIEhtJZmnqf/mXnjQhL5fY50wDSgSpSYeM4IkuRKGc
ljN6cPIUo8+VV8Da9d/bmDtO+tHNhl9tLad2NV28Rniwe5xNkrvbA2CfN7QU2LUTrqj0P1gofy0K
zyMk2/Ii/xzR0VKk4ctRE1BpR9CM9J1mEx4RM9zUwInT7Cmzwz/Z4vaS7vzK4x17iWywPYfQAMs1
j+1JHF+R56mU/Dg1kxhljNhs3AAAAAAAAA==


--=-jJdh5sDTMOm9WqYO2pFQ--

--===============1123951585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1123951585==--
