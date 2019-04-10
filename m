Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83228922E
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 09:21:24 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190410082839.7688-1-daniel.t.mrzyglod@intel.com>
 <20190410082839.7688-3-daniel.t.mrzyglod@intel.com>
In-Reply-To: <20190410082839.7688-3-daniel.t.mrzyglod@intel.com>
Message-ID: <155488807516.3516.12130372007283038920@skylake-alporthouse-com>
Date: Wed, 10 Apr 2019 10:21:20 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] lib/igt_device: add
 igt_map_bar_region
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
To: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgTXJ6eWdsb2QgKDIwMTktMDQtMTAgMDk6Mjg6MzgpCj4gK3ZvaWQgKmln
dF9kZXZpY2VfbWFwX3BjaV9iYXJfcmVnaW9uKGludCBmZCwgaW50ICBtbWlvX2JhciwgaW50IG1t
aW9fc2l6ZSkKPiArewo+ICsgICAgICAgc3RydWN0IGlndF9wY2lfYWRkciBwY2lfYWRkcjsKPiAr
ICAgICAgIGNoYXIgKmZpbGVwYXRoID0gTlVMTDsKPiArICAgICAgIGludCBuZXdmZDsKPiArICAg
ICAgIHZvaWQgKmlndF9tbWlvID0gTlVMTDsKCkNvbnNpZGVyIHdoYXQgZG9lcyBuZWVkIGluaXRp
YWxpc2luZyBhbmQgd2hpdGVzcGFjZSBjYXJlZnVsbHkuCgo+ICsgICAgICAgaWYgKGlndF9kZXZp
Y2VfZ2V0X3BjaV9hZGRyKGZkLCAmcGNpX2FkZHIpKSB7Cj4gKyAgICAgICAgICAgICAgIGlndF93
YXJuKCJVbmFibGUgdG8gZmluZCBkZXZpY2UgUENJIGFkZHJlc3NcbiIpOwo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gTlVMTDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBhc3ByaW50ZigmZmls
ZXBhdGgsICIvc3lzL2RldmljZXMvcGNpJS40eDolLjJ4LyUuNHg6JS4yeDolLjJ4LiUuMXgvcmVz
b3VyY2UlLjF4IiwKPiArICAgICAgICAgICAgICAgIHBjaV9hZGRyLmRvbWFpbiwgcGNpX2FkZHIu
YnVzLCBwY2lfYWRkci5kb21haW4sIHBjaV9hZGRyLmJ1cywKPiArICAgICAgICAgICAgICAgIHBj
aV9hZGRyLmRldmljZSwgcGNpX2FkZHIuZnVuY3Rpb24sIG1taW9fYmFyKTsKPiArCj4gKyAgICAg
ICBuZXdmZCA9IG9wZW4oZmlsZXBhdGgsIE9fUkRXUiB8IE9fU1lOQyk7Cj4gKyAgICAgICBpZ3Rf
bW1pbyA9IG1tYXAoMCwgbW1pb19zaXplLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLCBNQVBfU0hB
UkVELCBuZXdmZCwgMCk7Cj4gKyAgICAgICBmcmVlKGZpbGVwYXRoKTsKPiArICAgICAgIGNsb3Nl
KG5ld2ZkKTsKClN0aWNrIHRvIHRoZSBvbmlvbi4gTWFrZSBpdCBhIGhhYml0LgoKPiArCj4gKyAg
ICAgICBpZ3RfZmFpbF9vbl9mKGlndF9tbWlvID09IE1BUF9GQUlMRUQsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICJDb3VsZG4ndCBtYXAgTU1JTyByZWdpb25cbiIpOwoKQm9udXMgcG9pbnRzIGZv
ciBzYXlpbmcgd2hhdCBjb3VsZG4ndCBiZSBtbWFwcGVkLgoKQnV0IGRvbid0IHVzZSBpZ3RfZmFp
bCBpZiBub3QgaW5zaWRlIGEgdGVzdC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
