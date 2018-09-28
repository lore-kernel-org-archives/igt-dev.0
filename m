Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180928004350.2346-4-drawat@vmware.com>
References: <20180928004350.2346-1-drawat@vmware.com>
 <20180928004350.2346-4-drawat@vmware.com>
Message-ID: <153813357703.11401.15015610101863102251@skylake-alporthouse-com>
Date: Fri, 28 Sep 2018 12:19:37 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 4/7] lib/igt_fb: Don't call
 gem_set_domain() for dumb buffer
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
To: Deepak Rawat <drawat@vmware.com>, igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, syeh@vmware.com, thellstrom@vmware.com
Cc: Deepak Rawat <drawat@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEZWVwYWsgUmF3YXQgKDIwMTgtMDktMjggMDE6NDM6NDcpCj4gZ2VtX3NldF9kb21h
aW4oKSBpcyBnZW0gc3BlY2lmaWMgYW5kIG5vdCBuZWVkZWQgZm9yIGR1bWIgYnVmZmVycy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdhcmUuY29tPgo+IC0tLQo+
ICBsaWIvaWd0X2ZiLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xp
Yi9pZ3RfZmIuYwo+IGluZGV4IDA0ODU3MDhiLi43NGE0YjUwMSAxMDA2NDQKPiAtLS0gYS9saWIv
aWd0X2ZiLmMKPiArKysgYi9saWIvaWd0X2ZiLmMKPiBAQCAtMTM1NiwxNSArMTM1NiwxNSBAQCBz
dGF0aWMgdm9pZCBjcmVhdGVfY2Fpcm9fc3VyZmFjZV9fZ3R0KGludCBmZCwgc3RydWN0IGlndF9m
YiAqZmIpCj4gIHsKPiAgICAgICAgIHZvaWQgKnB0cjsKPiAgCj4gLSAgICAgICBnZW1fc2V0X2Rv
bWFpbihmZCwgZmItPmdlbV9oYW5kbGUsCj4gLSAgICAgICAgICAgICAgICAgICAgICBJOTE1X0dF
TV9ET01BSU5fR1RULCBJOTE1X0dFTV9ET01BSU5fR1RUKTsKPiAtCj4gICAgICAgICBpZiAoZmIt
PmlzX2R1bWIpCktlcm5lbCBDT0RJTkdfU1RZTEU6IGlmIG9uZSBicmFuY2ggbmVlZCBicmFjZXMs
IGFwcGx5IHRoZW0gdG8gYWxsLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
