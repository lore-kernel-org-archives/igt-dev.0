Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4305F6E56E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Feb 2019 18:06:46 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190211180208.29406-4-daniel.vetter@ffwll.ch>
References: <20190211180208.29406-1-daniel.vetter@ffwll.ch>
 <20190211180208.29406-4-daniel.vetter@ffwll.ch>
Message-ID: <154990839554.15715.15844169571332551691@skylake-alporthouse-com>
Date: Mon, 11 Feb 2019 18:06:35 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 4/9] tests/gem_exec_reuse: Don't leak
 the hang detector
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTAyLTExIDE4OjAyOjAzKQo+IE15IG5ldyAiYXJl
IHRoZXJlIGFueSBjaGlsZCBwcm9jZXNzZXMgbGVmdD8iIGNoZWNrIGluIGlndF9leGl0IGNhdGNo
ZWQKPiB0aGlzIG9uZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvaTkxNS9nZW1fZXhlY19yZXVzZS5jIHwg
MyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS90ZXN0cy9pOTE1L2dlbV9leGVjX3JldXNlLmMgYi90ZXN0cy9pOTE1L2dlbV9leGVjX3JldXNl
LmMKPiBpbmRleCBkZjIyMGJlN2JhYjguLjU1OTA0NzE4OGZiZCAxMDA2NDQKPiAtLS0gYS90ZXN0
cy9pOTE1L2dlbV9leGVjX3JldXNlLmMKPiArKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX3JldXNl
LmMKPiBAQCAtMjEzLDQgKzIxMyw3IEBAIGlndF9tYWluCj4gICAgICAgICAgICAgICAgIGZvciAo
biA9IDA7IG4gPCBuY29udGV4dHM7IG4rKykKPiAgICAgICAgICAgICAgICAgICAgICAgICBnZW1f
Y29udGV4dF9kZXN0cm95KG5vLmZkLCBjb250ZXh0c1tuXSk7Cj4gICAgICAgICB9Cj4gKwo+ICsg
ICAgICAgaWd0X2ZpeHR1cmUKPiArICAgICAgICAgICAgICAgaWd0X3N0b3BfaGFuZ19kZXRlY3Rv
cigpOwoKQmV0dGVyIHRoYW4gbXkgYXR0ZW1wdCB3aGljaCBkaWRuJ3QgcmVtZW1iZXIgaXQgdG9v
ayB2b2lkLgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
