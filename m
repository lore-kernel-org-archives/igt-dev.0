Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F43E8926E
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 11:24:35 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190410111931.28305-1-maarten.lankhorst@linux.intel.com>
 <20190410111931.28305-3-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20190410111931.28305-3-maarten.lankhorst@linux.intel.com>
Message-ID: <155489546967.3516.16665785841642844899@skylake-alporthouse-com>
Date: Wed, 10 Apr 2019 12:24:29 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_flip: Do not request
 event for flips we expect to fail.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNYWFydGVuIExhbmtob3JzdCAoMjAxOS0wNC0xMCAxMjoxOTozMSkKPiBJZiB3ZSB1
bmV4cGVjdGVkbHkgcGFzcywgd2UgZ2V0IGEgY3J5cHRpYwo+IChrbXNfZmxpcDo5MzUpIENSSVRJ
Q0FMOiBUZXN0IGFzc2VydGlvbiBmYWlsdXJlIGZ1bmN0aW9uIHNldF9mbGFnLCBmaWxlIGttc19m
bGlwLmM6MjcxOgo+IChrbXNfZmxpcDo5MzUpIENSSVRJQ0FMOiBGYWlsZWQgYXNzZXJ0aW9uOiAh
KCp2ICYgZmxhZykKPiAoa21zX2ZsaXA6OTM1KSBDUklUSUNBTDogTGFzdCBlcnJubzogMjUsIElu
YXBwcm9wcmlhdGUgaW9jdGwgZm9yIGRldmljZQo+IAo+IEluc3RlYWQgb2YgYSBtb3JlIGRlc2Ny
aXB0aXZlIGFzc2VydGlvbiBlcnJvciwgY2xlYXIgdGhlIHJlcXVlc3QgZm9yCj4gZXZlbnQgdG8g
Zml4IHRoaXMuCj4gCj4gVGhpcyB3aWxsIGNoYW5nZSB0aGUgZXJyb3IgcmVwb3J0ZWQgaW4gYnVn
ICMxMDMyNTcuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBSZWZlcmVuY2VzOiBodHRwczovL2J1Z3MuZnJl
ZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDMyNTcKPiAtLS0KPiAgdGVzdHMva21zX2Zs
aXAuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mbGlwLmMgYi90ZXN0cy9rbXNf
ZmxpcC5jCj4gaW5kZXggZTUwYzkxZWFkMTJjLi5mOGYzNTgxZWVkMmIgMTAwNzU1Cj4gLS0tIGEv
dGVzdHMva21zX2ZsaXAuYwo+ICsrKyBiL3Rlc3RzL2ttc19mbGlwLmMKPiBAQCAtNjkyLDcgKzY5
Miw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgcnVuX3Rlc3Rfc3RlcChzdHJ1Y3QgdGVzdF9vdXRw
dXQgKm8pCj4gICAgICAgICB9Cj4gIAo+ICAgICAgICAgaWYgKGRvX2ZsaXAgJiYgKG8tPmZsYWdz
ICYgVEVTVF9FSU5WQUwpICYmIG8tPmZsaXBfc3RhdGUuY291bnQgPiAwKQo+IC0gICAgICAgICAg
ICAgICBpZ3RfYXNzZXJ0KGRvX3BhZ2VfZmxpcChvLCBuZXdfZmJfaWQsIHRydWUpID09IGV4cGVj
dGVkX2VpbnZhbCk7Cj4gKyAgICAgICAgICAgICAgIGlndF9hc3NlcnQoZG9fcGFnZV9mbGlwKG8s
IG5ld19mYl9pZCwgZmFsc2UpID09IGV4cGVjdGVkX2VpbnZhbCk7CgpJZiB5b3UgaGF2ZSBhbiBl
eHBlY3RlZCB2YWx1ZSwgdXNlIGlndF9hc3NlcnRfZXEoKSB0byBwcmludCB3aGF0IHdhcwpyZXR1
cm5lZCBpbnN0ZWFkLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2
