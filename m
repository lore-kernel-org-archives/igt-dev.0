Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC476E11C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2018 21:33:23 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180227212120.25501-1-ville.syrjala@linux.intel.com>
 <20180227212120.25501-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20180227212120.25501-5-ville.syrjala@linux.intel.com>
Message-ID: <151976719317.21577.16909839422802919294@mail.alporthouse.com>
Date: Tue, 27 Feb 2018 21:33:13 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 5/8] lib: Add igt_matrix
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE4LTAyLTI3IDIxOjIxOjE3KQo+ICsjaW5jbHVkZSAi
aWd0X2NvcmUuaCIKPiArI2luY2x1ZGUgImlndF9tYXRyaXguaCIKPiArCj4gKy8qKgo+ICsgKiBT
RUNUSU9OOmlndF9tYXRyaXgKPiArICogQHNob3J0X2Rlc2NyaXB0aW9uOiBNYXRyaXggbWF0aCBs
aWJyYXJ5Cj4gKyAqIEB0aXRsZTogTWF0cml4Cj4gKyAqIEBpbmNsdWRlOiBpZ3QuaAo+ICsgKgo+
ICsgKiBUaGlzIGxpYnJhcnkgY29udGFpbnMgaGVscGVyIGZ1bmN0aW9ucyBmb3IgYmFzaWMgbWF0
cml4IG1hdGguCj4gKyAqIFRoZSBsaWJyYXJ5IG9wZXJhdGVzIG9uICNpZ3RfbWF0NCBhbmQgI2ln
dF92ZWM0IHN0cnVjdHVyZXMuCj4gKyAqLwo+ICsKPiArLyoqCj4gKyAqIGlndF9tYXRyaXhfcHJp
bnQ6Cj4gKyAqIEBtOiB0aGUgbWF0cml4Cj4gKyAqCj4gKyAqIFByaW50IG91dCB0aGUgbWF0cml4
IGVsZW1lbnRzLgo+ICsgKi8KPiArdm9pZCBpZ3RfbWF0cml4X3ByaW50KGNvbnN0IHN0cnVjdCBp
Z3RfbWF0NCAqbSkKPiArewo+ICsgICAgICAgZm9yIChpbnQgcm93ID0gMDsgcm93IDwgNDsgcm93
KyspIHsKPiArICAgICAgICAgICAgICAgaWd0X2luZm8oInwiKTsKPiArICAgICAgICAgICAgICAg
Zm9yIChpbnQgY29sID0gMDsgY29sIDwgNDsgY29sKyspIHsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBpZ3RfaW5mbygiJTQuNGYsIiwgbS0+ZFtjb2wgKiA0ICsgcm93XSk7CgojZGVmaW5lIG0o
cm93LCBjb2wpICgoY29sKSAqIDQgKyAocm93KSkgPwoKPiArICAgICAgICAgICAgICAgfQo+ICsg
ICAgICAgICAgICAgICBpZ3RfaW5mbygifFxuIik7Cj4gKyAgICAgICB9Cj4gK30KPiArCj4gKy8q
Kgo+ICsgKiBpZ3RfbWF0cml4X2lkZW50aXR5Ogo+ICsgKgo+ICsgKiBSZXR1cm5zOgo+ICsgKiBB
biBpZGVudGl0eSBtYXRyaXguCj4gKyAqLwo+ICtzdHJ1Y3QgaWd0X21hdDQgaWd0X21hdHJpeF9p
ZGVudGl0eSh2b2lkKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgaWd0X21hdDQgcmV0ID0gewo+ICsg
ICAgICAgICAgICAgICAuZFswICogNCArIDBdID0gMS4wZiwKPiArICAgICAgICAgICAgICAgLmRb
MSAqIDQgKyAxXSA9IDEuMGYsCj4gKyAgICAgICAgICAgICAgIC5kWzIgKiA0ICsgMl0gPSAxLjBm
LAo+ICsgICAgICAgICAgICAgICAuZFszICogNCArIDNdID0gMS4wZiwKPiArICAgICAgIH07Cgpz
dGF0aWMgPwoKRGlkbid0IHNwb3QgYW55IHR5cG9zLgotQ2hyaXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
