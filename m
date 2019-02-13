Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CBD6E31D
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 20:38:35 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id 10so3116139eds.7
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 12:38:35 -0800 (PST)
Date: Wed, 13 Feb 2019 21:38:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190213203831.GL23159@phenom.ffwll.local>
References: <20190213155341.23435-1-arkadiusz.hiler@intel.com>
 <20190213155341.23435-2-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213155341.23435-2-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] gitlab-ci: Remove autotools from
 corss-compilation containers
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBGZWIgMTMsIDIwMTkgYXQgMDU6NTM6NDFQTSArMDIwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IFdlIG9ubHkgdXNlIG1lc29uIHRoZXJlLgo+IAo+IENjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0
aS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJA
aW50ZWwuY29tPgoKT24gdGhlIHNlcmllczoKCkFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGZmd2xsLmNoPgoKCgo+IC0tLQo+ICBEb2NrZXJmaWxlLmRlYmlhbi1hcm02NCB8
IDggLS0tLS0tLS0KPiAgRG9ja2VyZmlsZS5kZWJpYW4tYXJtaGYgfCA4IC0tLS0tLS0tCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY2tlcmZp
bGUuZGViaWFuLWFybTY0IGIvRG9ja2VyZmlsZS5kZWJpYW4tYXJtNjQKPiBpbmRleCAzNGZiNWFk
NC4uN2IzYTNjN2MgMTAwNjQ0Cj4gLS0tIGEvRG9ja2VyZmlsZS5kZWJpYW4tYXJtNjQKPiArKysg
Yi9Eb2NrZXJmaWxlLmRlYmlhbi1hcm02NAo+IEBAIC0zNiwxMSArMzYsMyBAQCBSVU4gYXB0LWdl
dCBpbnN0YWxsIC10IHN0cmV0Y2gtYmFja3BvcnRzIC15IFwKPiAgCQkJCQlsaWJkcm0tZGV2OmFy
bTY0IFwKPiAgCQkJCQlxZW11LXVzZXIgXAo+ICAJCQkJCXFlbXUtdXNlci1zdGF0aWMKPiAtCj4g
LSMgYXV0b3Rvb2xzIGJ1aWxkIGRlcHMKPiAtUlVOIGFwdC1nZXQgaW5zdGFsbCAteSBcCj4gLQkJ
CWF1dG9jb25mIFwKPiAtCQkJYXV0b21ha2UgXAo+IC0JCQl4dXRpbHMtZGV2IFwKPiAtCQkJbGli
dG9vbCBcCj4gLQkJCW1ha2UKPiBkaWZmIC0tZ2l0IGEvRG9ja2VyZmlsZS5kZWJpYW4tYXJtaGYg
Yi9Eb2NrZXJmaWxlLmRlYmlhbi1hcm1oZgo+IGluZGV4IDgxYWQ1YzYxLi5jNjdhMWUyYSAxMDA2
NDQKPiAtLS0gYS9Eb2NrZXJmaWxlLmRlYmlhbi1hcm1oZgo+ICsrKyBiL0RvY2tlcmZpbGUuZGVi
aWFuLWFybWhmCj4gQEAgLTM2LDExICszNiwzIEBAIFJVTiBhcHQtZ2V0IGluc3RhbGwgLXQgc3Ry
ZXRjaC1iYWNrcG9ydHMgLXkgXAo+ICAJCQkJCWxpYmRybS1kZXY6YXJtaGYgXAo+ICAJCQkJCXFl
bXUtdXNlciBcCj4gIAkJCQkJcWVtdS11c2VyLXN0YXRpYwo+IC0KPiAtIyBhdXRvdG9vbHMgYnVp
bGQgZGVwcwo+IC1SVU4gYXB0LWdldCBpbnN0YWxsIC15IFwKPiAtCQkJYXV0b2NvbmYgXAo+IC0J
CQlhdXRvbWFrZSBcCj4gLQkJCXh1dGlscy1kZXYgXAo+IC0JCQlsaWJ0b29sIFwKPiAtCQkJbWFr
ZQo+IC0tIAo+IDIuMjAuMQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
