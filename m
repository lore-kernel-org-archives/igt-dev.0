Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4410C6E2E1
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Nov 2018 17:14:24 +0000 (UTC)
References: <20181102190651.25969-4-ville.syrjala@linux.intel.com>
 <20181102193731.27330-1-ville.syrjala@linux.intel.com>
 <20181105151929.pefmgc7rltfygaif@flea>
 <281c75e8-6f99-50fc-756f-65add07328c0@linux.intel.com>
 <20181105154122.wseakszicqvtsm5j@flea>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <a0045696-f6b9-e92c-5acb-eef9a1a56d5c@linux.intel.com>
Date: Mon, 5 Nov 2018 18:14:21 +0100
MIME-Version: 1.0
In-Reply-To: <20181105154122.wseakszicqvtsm5j@flea>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/4] lib/igt_fb: Generalize the slow
 read from gtt mmap handling
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
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMDUtMTEtMTggb20gMTY6NDEgc2NocmVlZiBNYXhpbWUgUmlwYXJkOgo+IE9uIE1vbiwgTm92
IDA1LCAyMDE4IGF0IDA0OjMzOjI4UE0gKzAxMDAsIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+
PiBPcCAwNS0xMS0xOCBvbSAxNjoxOSBzY2hyZWVmIE1heGltZSBSaXBhcmQ6Cj4+PiBPbiBGcmks
IE5vdiAwMiwgMjAxOCBhdCAwOTozNzozMVBNICswMjAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+
Pj4+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
Cj4+Pj4KPj4+PiBNYWtlIHRoZSBoYW5kbGluZyBvZiBzbG93IGd0dCBtbWFwIHJlYWRzIGdlbmVy
aWMsIGFuZCBleHRlbmQgaXQgdG8KPj4+PiB0aGUgcGl4bWFuIGNvbnZlcnRlci4gTWFrZXMgdGhl
IHBpeG1hbiBwYXRoIGEgYml0IGZhc3Rlci4KPj4+Pgo+Pj4+IFdpdGggdGVzdGluZyBqdXN0IFhS
R0I4ODg4IGFuZCBYQkdSODg4OCBvbiBLQkw6Cj4+Pj4gJCB0aW1lIGttc19wbGFuZSAtLXIgcGl4
ZWwtZm9ybWF0LXBpcGUtQS1wbGFuZXMKPj4+PiAtIHJlYWwJMG0xOCw3NTdzCj4+Pj4gKyByZWFs
CTBtMiw2MzVzCj4+Pj4KPj4+PiB2MjogVXNlIHRoZSBvcmlnaW5hbCBzcmMgYnVmZmVyIGlmIHRo
ZSBtYWxsb2MgZmFpbHMgKENocmlzKQo+Pj4+ICAgICBEcm9wIHRoZSBkdXBsaWNhdGVkIGNvbW1l
bnQgYWJvdXQgdGhpbmdzIGJlaW5nIHNsb3cKPj4+Pgo+Pj4+IENjOiBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az4KPj4+PiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4KPj4+PiBDYzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGls
ZXJAaW50ZWwuY29tPgo+Pj4+IENjOiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVp
a2tpbGFAZ21haWwuY29tPgo+Pj4+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4+PiBGb3IgdGhlIDQgcGF0Y2hlcywK
Pj4+IFJldmlld2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29t
Pgo+Pj4KPj4+IFRoYW5rcyEKPj4+IE1heGltZQo+Pj4KPj4gUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4g
TGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+Cj4+IEkgYWxy
ZWFkeSBoYWQgYSBzaW1pbGFyIGZpeCB0byAxLzQgaW4gbXkgdHJlZSBidXQgZGlkbid0IHNlbmQg
aXQgb3V0IHlldC4gOikKPiBJJ20gY3VyaW91cywgaG93IGRpZCB5b3UgZmluZCB0aGF0IGlzc3Vl
IGluIHRoZSBmaXJzdCBwbGFjZT8KPgo+IEl0IHdlbnQgdGhyb3VnaCBDSSBhbmQgSSBjb3VsZCBy
dW4gdGhlIGttc19wbGFuZSB0ZXN0cyBvbiBteSB0ZXN0Cj4gbGFwdG9wLCBzbyBJJ20gY29uZnVz
ZWQuCj4KPiBNYXhpbWUKPgpJIGhhdmUgc29tZSBwYXRjaGVzIGludGVybmFsbHkgdGhhdCBjb252
ZXJ0ZWQgY29sb3IgZW5jb2RpbmdzIGFuZCB1c2VkIGN2dC0+ZHN0L3NyYy5mYi0+ZHJtX2Zvcm1h
dC4gSXQgZmFpbGVkIHdpdGggdGhlIFJHMjQgdGhlcmUuCgpUb29rIGEgYml0IHRvIGZpZ3VyZSBp
dCBvdXQuIDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
