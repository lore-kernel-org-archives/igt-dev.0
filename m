Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3866E917
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2019 17:44:01 +0000 (UTC)
From: "Chegondi, Harish" <harish.chegondi@intel.com>
Date: Wed, 3 Apr 2019 17:44:00 +0000
Message-ID: <7006eb837affcb2589225e495418e2b04516e10b.camel@intel.com>
References: <36a00595c5083adb40d496ff30ebc820ae770474.1552545177.git.harish.chegondi@intel.com>
 <155254958544.4168.8591390419495126785@skylake-alporthouse-com>
 <8eb9c24250eb482bda91f1bcc430a21053d16017.camel@intel.com>
 <155427749709.24691.14658564444185406872@skylake-alporthouse-com>
 <20190403143410.GM2665@phenom.ffwll.local>
 <20190403161009.GN2665@phenom.ffwll.local>
In-Reply-To: <20190403161009.GN2665@phenom.ffwll.local>
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
Content-Type: multipart/mixed; boundary="===============0626536090=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Taylor,
 Clinton A" <clinton.a.taylor@intel.com>, "Yadav,
 Jyoti R" <jyoti.r.yadav@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0626536090==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-nTBSQxzWUvAZRb4v4+wD"

--=-nTBSQxzWUvAZRb4v4+wD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-04-03 at 18:10 +0200, Daniel Vetter wrote:
> On Wed, Apr 03, 2019 at 04:34:10PM +0200, Daniel Vetter wrote:
> > On Wed, Apr 03, 2019 at 08:44:57AM +0100, Chris Wilson wrote:
> > > Quoting Chegondi, Harish (2019-04-03 01:47:09)
> > > > On Thu, 2019-03-14 at 07:46 +0000, Chris Wilson wrote:
> > > > > Quoting Harish Chegondi (2019-03-14 06:41:48)
> > > > > > backlight fade with suspend test turns off dpms which turns
> > > > > > off
> > > > > > the edp backlight and panel. Then it does a runtime
> > > > > > suspend,
> > > > > > system suspend and resume. After resume, it does a fade out
> > > > > > and
> > > > > > fade in of the backlight brightness. From the dmesg logs of
> > > > > > the
> > > > > > ci tests it appears that the test is setting the brightness
> > > > > > even before the edp panel and backlight are turned on
> > > > > > resuilting
> > > > > > in the brightness values written and read to be different.
> > > > > > Turn on the dpms which turns on the edp panel and backlight
> > > > > > before backlight fade out and fade in. With this change the
> > > > > > fade_with_suspend test passes.
> > > >=20
> > > > Chris,
> > > >=20
> > > > My commit message was confusing. I will redo the commit message
> > > > in the
> > > > next version of my patch.
> > > >=20
> > > > > But is it legal for the kernel to that? Is the kernel meant
> > > > > to
> > > > > restore
> > > > > the previous configuration upon resume or leave it to
> > > > > userspace? What
> > > > > about for fbcon?
> > > >=20
> > > > Yes, the kernel is meant to restore the previous configuration
> > > > upon
> > > > resume.
> > >=20
> > > Are you sure?
> > >=20
> > > We send a hotplug to userspace to tell them to restore the
> > > configuration
> > > as they see fit (because the configuration will often change). If
> > > fbcon
> > > is active, it restores the fbcon screen which can just be the
> > > consequence
> > > of handling its hotplug event.
> >=20
> > Bunch of comments from irc discussion:
> > - kernel is supposed to restore
> > - but since the test does a dpms off, we do need to do a dpms on
> > - but that's silly, because defacto that means we test nothing
> >=20
> > Worse:
> > - the test doesn't shut up fbcon, so uncontrolled env
> > - it also doesn't set up a mode explicitly, so again uncontrolled
> > env
>=20
> Correction: I was blind, it's all there in the igt_fixture.
> Apologies.
>=20
> > Rodrigo shouldn't have r-b'ed this imo. There's a lot more work
> > needed
> > here than duct-taping a few more commands on top, I think starting
> > with
> > a) what exactly are we trying to test here (testing fancy effects
> > isn't
> > useful in the context of CI, no one is looking)
> > b) have we set up the right starting conditions to actually run
> > that test
>=20
> For the test itself I think we should instead drop the dpms off.
> There's
> not much to test really if we suspend with the display off. Or at
> least we
> should check both ways I think, but suspending with display on is a
> lot
> more interesting. And for that case the kernel should resume the
> display
> for us again, not explicit dpms on needed.
> -Daniel

During my investigation, I already tried removing DPMS off and verified
that the system suspend is turning off the backlight and the system
resume is properly turning on the backlight. I captured the test
changes and the observation in the fdo:

https://bugs.freedesktop.org/show_bug.cgi?id=3D107820#c6

I will send out this patch.

Thanks for your feedback.

-Harish.

--=-nTBSQxzWUvAZRb4v4+wD
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
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTkwNDAzMTc0MzU4WjAjBgkqhkiG
9w0BCQQxFgQUdoV1CzxwsBUym4bxZLyq4IV3NCUwDQYJKoZIhvcNAQEBBQAEggEAXMHusQ0+aJYa
ZIBxyk6Z5hv4QqDJWY5oIIU5UHAWPVi5odOulw7ztnB2/bkG1V3LTZn6XdD97TH6UnhuYpYsWV3T
2WDy3xY5UIw0VquFbxb+f1ma2b7O8l7vCQwOxQh8H7szpeMIAF+b1DD3uXidVJ18P27FeJLQ0fsc
fZSCdKAh+5RWnXKQe6nqFFwmTzmp5D+NHWquKrWOou8GU8gal97aikxNu+zY2IVHXhhxJHsUUdZI
rn2HX+gUkEf+85LTPXhCcwqAU09wIF6LQcjqIb3edh/hgxa7NXCJA65O6mYKRBOz2+NfGMR226D8
Mm3BVouIMo6IGNYd+w3JPMlRIAAAAAAAAA==


--=-nTBSQxzWUvAZRb4v4+wD--

--===============0626536090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0626536090==--
