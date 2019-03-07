Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C2F6E227
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 21:52:01 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190307213926.18051-1-ville.syrjala@linux.intel.com>
 <20190307213926.18051-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20190307213926.18051-5-ville.syrjala@linux.intel.com>
Message-ID: <155199551384.27405.6162259249516004249@skylake-alporthouse-com>
Date: Thu, 07 Mar 2019 21:51:54 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] tests/kms_setmode: Validate the vbl
 sequence numbers
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTAzLTA3IDIxOjM5OjI2KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gTWFrZSBzdXJl
IHdlIGhhdmVuJ3QgYWxyZWFkeSBwYXNzZWQgdGhlIHNlcSBudW1iZXJzIHdlJ3JlCj4gcmVxdWVz
dGluZyB3aGVuIGRvaW5nIHRoZSB0cyBjYWxpYnJhdGlvbi4KPiAKPiBTdWdnZXN0ZWQtYnk6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IFNpZ25lZC1vZmYtYnk6IFZp
bGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIHRl
c3RzL2ttc19zZXRtb2RlLmMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19zZXRtb2RlLmMgYi90ZXN0cy9r
bXNfc2V0bW9kZS5jCj4gaW5kZXggYWNkNjA2Y2Q1YjVlLi41Y2UxMzk3Zjk2OGYgMTAwNjQ0Cj4g
LS0tIGEvdGVzdHMva21zX3NldG1vZGUuYwo+ICsrKyBiL3Rlc3RzL2ttc19zZXRtb2RlLmMKPiBA
QCAtNDQ3LDggKzQ0NywxNyBAQCBzdGF0aWMgdm9pZCBjaGVja190aW1pbmdzKGludCBjcnRjX2lk
eCwgY29uc3QgZHJtTW9kZU1vZGVJbmZvICprbW9kZSkKPiAgICAgICAgIHdhaXQucmVxdWVzdC50
eXBlIHw9IERSTV9WQkxBTktfQUJTT0xVVEUgfCBEUk1fVkJMQU5LX0VWRU5UOwo+ICAgICAgICAg
d2FpdC5yZXF1ZXN0LnNlcXVlbmNlID0gbGFzdF9zZXE7Cj4gICAgICAgICBmb3IgKG4gPSAwOyBu
IDwgQ0FMSUJSQVRFX1RTX1NURVBTOyBuKyspIHsKPiArICAgICAgICAgICAgICAgZHJtVkJsYW5r
IGNoZWNrID0ge307Cj4gKwo+ICAgICAgICAgICAgICAgICArK3dhaXQucmVxdWVzdC5zZXF1ZW5j
ZTsKPiAgICAgICAgICAgICAgICAgZG9fb3JfZGllKGRybVdhaXRWQmxhbmsoZHJtX2ZkLCAmd2Fp
dCkpOwo+ICsKPiArICAgICAgICAgICAgICAgLyogRG91YmxlIGNoZWNrIHRoYXQgaGF2ZW4ndCBh
bHJlYWR5IG1pc3NlZCB0aGUgdmJsYW5rICovCj4gKyAgICAgICAgICAgICAgIGNoZWNrLnJlcXVl
c3QudHlwZSA9IGttc3Rlc3RfZ2V0X3ZibF9mbGFnKGNydGNfaWR4KTsKPiArICAgICAgICAgICAg
ICAgY2hlY2sucmVxdWVzdC50eXBlIHw9IERSTV9WQkxBTktfUkVMQVRJVkU7Cj4gKyAgICAgICAg
ICAgICAgIGRvX29yX2RpZShkcm1XYWl0VkJsYW5rKGRybV9mZCwgJmNoZWNrKSk7CgpJJ20gdGhp
bmtpbmcgdGhpcyByZWluZm9yY2VzIHRoZSBORVhUT05NSVNTIGFsaWdubWVudCBhcyBvcHBvc2Vk
IHRvCm1ha2luZyB0aGF0IGFyZ3VtZW50IG1vb3QgOikKLUNocmlzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
