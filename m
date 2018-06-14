Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C57F6E72C
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jun 2018 10:54:43 +0000 (UTC)
References: <20180614103252.17866-1-lionel.g.landwerlin@intel.com>
 <20180614103252.17866-3-lionel.g.landwerlin@intel.com>
 <152897289586.18533.3634734823065871791@mail.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <336e8b91-ca57-193f-13df-fb3b97215999@intel.com>
Date: Thu, 14 Jun 2018 11:54:38 +0100
MIME-Version: 1.0
In-Reply-To: <152897289586.18533.3634734823065871791@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/7] tools/aubdump: reuse intel_reg.h
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTQvMDYvMTggMTE6NDEsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIExpb25lbCBM
YW5kd2VybGluICgyMDE4LTA2LTE0IDExOjMyOjQ3KQo+PiBUaGlzIG1ha2VzIGNvbnRleHQgaW1h
Z2VzIGEgYml0IG1vcmUgcmVhZGFibGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IExpb25lbCBMYW5k
d2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KPj4gLS0tCj4+ICAgdG9vbHMv
YXViZHVtcC5jIHwgMjEgKysrKysrKysrKystLS0tLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvdG9v
bHMvYXViZHVtcC5jIGIvdG9vbHMvYXViZHVtcC5jCj4+IGluZGV4IDJkMmI2YzYwLi5jY2Y5YjA2
NCAxMDA2NDQKPj4gLS0tIGEvdG9vbHMvYXViZHVtcC5jCj4+ICsrKyBiL3Rvb2xzL2F1YmR1bXAu
Ywo+PiBAQCAtNDEsNiArNDEsNyBAQAo+PiAgIAo+PiAgICNpbmNsdWRlICJpbnRlbF9hdWIuaCIK
Pj4gICAjaW5jbHVkZSAiaW50ZWxfY2hpcHNldC5oIgo+PiArI2luY2x1ZGUgImludGVsX3JlZy5o
Igo+PiAgIAo+PiAgICNpZm5kZWYgQVJSQVlfU0laRQo+PiAgICNkZWZpbmUgQVJSQVlfU0laRSh4
KSAoc2l6ZW9mKHgpL3NpemVvZigoeClbMF0pKQo+PiBAQCAtMTE3LDcgKzExOCw3IEBACj4+ICAg
c3RhdGljIGNvbnN0IHVpbnQzMl90IHJlbmRlcl9jb250ZXh0X2luaXRbR0VOMTBfTFJfQ09OVEVY
VF9SRU5ERVJfU0laRSAvCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzaXplb2YodWludDMyX3QpXSA9IHsKPj4gICAgICAgICAgMCAvKiBNSV9OT09QICovLAo+
PiAtICAgICAgIDB4MTEwMDEwMUIgLyogTUlfTE9BRF9SRUdJU1RFUl9JTU0gKi8sCj4+ICsgICAg
ICAgTUlfTE9BRF9SRUdJU1RFUl9JTU1fbigxNCksCj4gICB8IE1JX0xSSV9GT1JDRV9QT1NURUQK
Pgo+IC1DaHJpcwo+ClRoYW5rcyBDaHJpcywgZml4ZWQgbG9jYWxseS4KCi1MaW9uZWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
