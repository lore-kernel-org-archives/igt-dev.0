Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190228141828.2567-5-tvrtko.ursulin@linux.intel.com>
References: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
 <20190228141828.2567-5-tvrtko.ursulin@linux.intel.com>
Message-ID: <155136438087.5847.12673828758236657477@skylake-alporthouse-com>
Date: Thu, 28 Feb 2019 14:33:06 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] tests/i915/pm_rc6_residency: Fix
 linking
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wMi0yOCAxNDoxODoyOCkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFByb2JhYmx5IGEgbGVm
dG92ZXIgZnJvbSB0ZXN0IHJlbmFtZXM6Cj4gCj4gICB0ZXN0cy9NYWtlZmlsZS5hbToxMzQ6IHdh
cm5pbmc6IHZhcmlhYmxlICdwbV9yYzZfcmVzaWRlbmN5X0xEQUREJyBpcyBkZWZpbmVkIGJ1dCBu
byBwcm9ncmFtIG9yCj4gICB0ZXN0cy9NYWtlZmlsZS5hbToxMzQ6IGxpYnJhcnkgaGFzICdwbV9y
YzZfcmVzaWRlbmN5JyBhcyBjYW5vbmljYWwgbmFtZSAocG9zc2libGUgdHlwbykKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IC0t
LQo+ICB0ZXN0cy9NYWtlZmlsZS5hbSB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2VmaWxlLmFt
IGIvdGVzdHMvTWFrZWZpbGUuYW0KPiBpbmRleCBjNWRkMjEwYzcxNjMuLjgwYmM1ZjkyYTEzYiAx
MDA2NDQKPiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5hbQo+ICsrKyBiL3Rlc3RzL01ha2VmaWxlLmFt
Cj4gQEAgLTEzMSw3ICsxMzEsNyBAQCBwZXJmX3BtdV9MREFERCA9ICQoTERBREQpICQodG9wX2J1
aWxkZGlyKS9saWIvbGliaWd0X3BlcmYubGEKPiAgZ2VtX2Vpb19MREFERCA9ICQoTERBREQpIC1s
cnQKPiAgZ2VtX3dhaXRfTERBREQgPSAkKExEQUREKSAtbHJ0Cj4gIGttc19mbGlwX0xEQUREID0g
JChMREFERCkgLWxydCAtbHB0aHJlYWQKPiAtcG1fcmM2X3Jlc2lkZW5jeV9MREFERCA9ICQoTERB
REQpIC1scnQKPiAraTkxNV9wbV9yYzZfcmVzaWRlbmN5X0xEQUREID0gJChMREFERCkgLWxydAoK
SGF2ZSB3ZSBub3Qgc251Y2sgLWxydCBpbnRvIHRoZSBjb3JlIGxpYnJhcnkgeWV0LCBwcmV0dHkg
c3VyZSBsaWJpZ3QubGEKbm93IGluY2x1ZGVzIGNsb2NrX2dldHRpbWUoKSBhbmQgc28gbXVzdCBi
ZSBwdWxsaW5nIGl0IGluIGFscmVhZHk/CgppLmUuIGNhbiB3ZSBqdXN0IGRyb3AgdGhlIGFib3Zl
IGxpbmU/Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
