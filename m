Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com
 [IPv6:2a00:1450:400c:c09::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD3189C83
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2018 08:01:18 +0000 (UTC)
Received: by mail-wm0-x234.google.com with SMTP id b21so38494969wme.4
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2018 00:01:18 -0800 (PST)
Date: Tue, 30 Jan 2018 09:01:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20180130080114.GN2759@phenom.ffwll.local>
References: <20180124102500.71999-1-maarten.lankhorst@linux.intel.com>
 <151679208421.13096.6619668340989603229@mail.alporthouse.com>
 <891fc5fe-db82-16d3-970e-18eff5d32b2a@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <891fc5fe-db82-16d3-970e-18eff5d32b2a@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_render: Rewrite test to take
 advantage of igt_display.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMTI6MjI6MDdQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gT3AgMjQtMDEtMTggb20gMTI6MDggc2NocmVlZiBDaHJpcyBXaWxzb246Cj4g
PiBRdW90aW5nIE1hYXJ0ZW4gTGFua2hvcnN0ICgyMDE4LTAxLTI0IDEwOjI1OjAwKQo+ID4+IFRo
aXMgdGVzdCB3YXMgdGFraW5nIH4xMDBzIGZvciBlYWNoIHN1YnRlc3QsIGFuZCBib3RoIHRlc3Rz
IHdlcmUgdGhlIHNhbWUsCj4gPj4gYnV0IHJlcXVpcmVkIHRoZSB1c2VyIHRvIHBheSBhdHRlbnRp
b24uIEkndmUgY2hhbmdlZCBpdCB0byBhdXRvbWF0ZWQKPiA+PiBjaGVja2luZyB3aXRoIENSQywg
YW5kIHJlbW92ZWQgdGhlIHN1YnRlc3RzLgo+ID4gV2hhdCBkbyB3ZSBkbyBoZXJlIHRoYXQgaXNu
J3QgY292ZXJlZCBieSBrbXNfZnJvbnRidWZmZXIqPyBNeSBndWVzcwo+ID4gd291bGQgYmUgZG8g
c2ltcGxlIHRlc3Rpbmcgb2YgbW9yZSBjb25maWd1cmF0aW9ucyAoYXMgb3Bwb3NlZCB0bwo+ID4g
a21zX2Zyb250YnVmZmVyIHRoYXQgZG9lcyBsb3RzIG9mIGRpZmZlcmVudCBkcmF3aW5nIHRvIHRo
ZSBzYW1lCj4gPiBjb25maWd1cmF0aW9uKS4KPiBIbSBwcm9iYWJseSByaWdodC4gSSB3b3VsZG4n
dCBtaW5kIHJlbW92aW5nIGl0IHRvbywgdG8gYmUgaG9uZXN0Li4KCk9yaWdpbmFsbHkgYWRkZWQg
YnkgSW1yZSBhbmQgcmV2aWV3ZWQgYnkgUm9kcmlnbywgYnV0IG5vIG1lbnRpb24gd2h5IHdlCm5l
ZWQgdGhpcyB0ZXN0Y2FzZToKCmNvbW1pdCA1MjhiMWYzODFjNGU2N2MyZTYzZTIzYjU1OTcwNzBm
ZmZlODAzM2Q2CkF1dGhvcjogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpEYXRlOiAg
IFRodSBNYXkgMzAgMjI6NTk6NTkgMjAxMyArMDMwMAoKICAgIHRlc3RzOiBhZGQga21zX3JlbmRl
cgogICAgCiAgICBBZGQgYSB0ZXN0IGdvaW5nIHRocm91Z2ggYWxsIGNvbm5lY3RvcnMvY3J0Y3Mv
bW9kZXMvZm9ybWF0cyBwYWludGluZyB0bwogICAgYSBmcm9udCBGQiB3aXRoIENQVSBvciBwYWlu
dGluZyB0byBhIGJhY2sgRkIgd2l0aCBDUFUgYW5kIGJsaXR0aW5nIGl0CiAgICB0byB0aGUgZnJv
bnQgRkIuCiAgICAKICAgIE9ubHkgZm9ybWF0cyB1bmRlcnN0b29kIGJ5IGNhaXJvIGFyZSBzdXBw
b3J0ZWQgZm9yIG5vdy4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogSW1yZSBEZWFrIDxpbXJlLmRl
YWtAaW50ZWwuY29tPgogICAgUmV2aWV3ZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZp
QGdtYWlsLmNvbT4KCkknbSB2b3RpbmcgZm9yIHJlbW92YWwgdG9vLCBhc3N1bWluZyBJbXJlIGRv
ZXNuJ3QgY29tZSB1cCB3aXRoIGEgdmVyeSBnb29kCnJlYXNvbiBmb3Igd2h5IHdlIG5lZWQgaXQu
Ci1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
