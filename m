Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE576E0B4
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 12:33:54 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190313120641.7350-3-petri.latvala@intel.com>
References: <20190313120641.7350-1-petri.latvala@intel.com>
 <20190313120641.7350-3-petri.latvala@intel.com>
Message-ID: <155248042775.30003.13353197120871486151@skylake-alporthouse-com>
Date: Wed, 13 Mar 2019 12:33:48 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] gem_exec_latency: Initialize
 variance to zero
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTAzLTEzIDEyOjA2OjQwKQo+IEl0J3MganVzdCBh
ZGRlZCB0byBpbiBhIGxvb3AgbGF0ZXIgd2l0aG91dCBhbnkgaW5pdGlhbGl6YXRpb24gb3IKPiBk
aXJlY3QgYXNzaWdubWVudC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRy
aS5sYXR2YWxhQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvaTkxNS9nZW1fZXhlY19sYXRlbmN5
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9leGVjX2xhdGVuY3kuYyBiL3Rlc3Rz
L2k5MTUvZ2VtX2V4ZWNfbGF0ZW5jeS5jCj4gaW5kZXggNmRkMTkxZWMuLjFiMDIyZGY1IDEwMDY0
NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfbGF0ZW5jeS5jCj4gKysrIGIvdGVzdHMvaTkx
NS9nZW1fZXhlY19sYXRlbmN5LmMKPiBAQCAtNTk3LDcgKzU5Nyw3IEBAIHJ0aG9nX2xhdGVuY3lf
b25fcmluZyhpbnQgZmQsIHVuc2lnbmVkIGludCBlbmdpbmUsIGNvbnN0IGNoYXIgKm5hbWUsIHVu
c2lnbmVkIGluCj4gICAgICAgICBmb3IgKHVuc2lnbmVkIGludCBjaGlsZCA9IDA7IGNoaWxkIDwg
bmVuZ2luZTsgY2hpbGQrKykgewo+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcnRfcGt0IG5vcm1h
bCA9IHJlc3VsdHNbTlBBU1MgKiBjaGlsZCArIDFdOwo+ICAgICAgICAgICAgICAgICBpZ3Rfc3Rh
dHNfdCBzdGF0czsKPiAtICAgICAgICAgICAgICAgZG91YmxlIHZhcmlhbmNlOwo+ICsgICAgICAg
ICAgICAgICBkb3VibGUgdmFyaWFuY2UgPSAwLjA7CgpKdXN0ID0gMDsgd291bGQgZG8uClJldmll
d2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
