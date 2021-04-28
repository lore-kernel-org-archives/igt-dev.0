Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7196EB4B
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Apr 2021 14:38:40 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d11so5487283wrw.8
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Apr 2021 07:38:40 -0700 (PDT)
References: <20210427222548.1778-1-ville.syrjala@linux.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <37ccb526-04d4-ba4f-9378-d366ca532c8f@gmail.com>
Date: Wed, 28 Apr 2021 17:38:32 +0300
MIME-Version: 1.0
In-Reply-To: <20210427222548.1778-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_async_flips: Fix flip
 timestamp checks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFp
bC5jb20+CgpPbiAyOC40LjIwMjEgMS4yNSwgVmlsbGUgU3lyamFsYSB3cm90ZToKPiBGcm9tOiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IAo+IENoZWNr
IHRoZSBmbGlwIHRpbWVzdGFtcCBmcm9tIHRoZSBldmVudCAobm90IHRoZSB0aW1lIHdlIGdvdCB0
aGUKPiBldmVudCkgYWdhaW5zdCB0aGUgdmJsYW5rIHRpbWVzdGFtcHMuIEFsc28gaWYgdGhpbmdz
IGFyZSBnb2luZwo+IHdlbGwgd2Ugc2hvdWxkIGV4cGVjdCB0aGUgZmxpcCB0aW1lc3RhbXAgdG8g
aW4gZmFjdCBtYXRjaCB0aGUKPiBmaXJzdCB2YmxhbmsgdGltZXN0YW1wLCBzbyBhbGxvdyB0aGVt
IHRvIGJlIGVxdWFsLgo+IAo+IENjOiBLYXJ0aGlrIEIgUyA8a2FydGhpay5iLnNAaW50ZWwuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Cj4gLS0tCj4gICB0ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYyB8IDQgKystLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMgYi90ZXN0cy9rbXNfYXN5bmNfZmxpcHMu
Ywo+IGluZGV4IGUzOTdhNTRiODc0Zi4uYTYwZWFiNjg4MDI0IDEwMDY0NAo+IC0tLSBhL3Rlc3Rz
L2ttc19hc3luY19mbGlwcy5jCj4gKysrIGIvdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMKPiBAQCAt
ODksNyArODksNyBAQCBzdGF0aWMgdm9pZCBmbGlwX2hhbmRsZXIoaW50IGZkXywgdW5zaWduZWQg
aW50IHNlcXVlbmNlLCB1bnNpZ25lZCBpbnQgdHZfc2VjLAo+ICAgCj4gICAJbGFzdF9tcyA9IGN1
cl9tczsKPiAgIAo+IC0JZGF0YS0+ZmxpcF90aW1lc3RhbXBfdXMgPSB0cy50dl9zZWMgKiAxMDAw
MDAwICsgdHMudHZfbnNlYyAvIDEwMDA7Cj4gKwlkYXRhLT5mbGlwX3RpbWVzdGFtcF91cyA9IHR2
X3NlYyAqIDEwMDAwMDBsICsgdHZfdXNlYzsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHZvaWQgd2Fp
dF9mbGlwX2V2ZW50KGRhdGFfdCAqZGF0YSkKPiBAQCAtMjgyLDcgKzI4Miw3IEBAIHN0YXRpYyB2
b2lkIHRlc3RfdGltZXN0YW1wKGRhdGFfdCAqZGF0YSkKPiAgIAlpZ3RfaW5mbygidmJsMV90aW1l
c3RhbXAgPSAlbGR1c1xuZmxpcF90aW1lc3RhbXAgPSAlbGR1c1xudmJsMl90aW1lc3RhbXAgPSAl
bGR1c1xuIiwKPiAgIAkJIHZibF90aW1lLCBkYXRhLT5mbGlwX3RpbWVzdGFtcF91cywgdmJsX3Rp
bWUxKTsKPiAgIAo+IC0JaWd0X2Fzc2VydF9mKHZibF90aW1lIDwgZGF0YS0+ZmxpcF90aW1lc3Rh
bXBfdXMgJiYgdmJsX3RpbWUxID4gZGF0YS0+ZmxpcF90aW1lc3RhbXBfdXMsCj4gKwlpZ3RfYXNz
ZXJ0X2YodmJsX3RpbWUgPD0gZGF0YS0+ZmxpcF90aW1lc3RhbXBfdXMgJiYgdmJsX3RpbWUxID4g
ZGF0YS0+ZmxpcF90aW1lc3RhbXBfdXMsCj4gICAJCSAgICAgIkFzeW5jIGZsaXAgdGltZSBzdGFt
cCBpcyBleHBlY3RlZCB0byBiZSBpbiBiZXR3ZWVuIDIgdmJsYW5rIHRpbWUgc3RhbXBzXG4iKTsK
PiAgIH0KPiAgIAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
