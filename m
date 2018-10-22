Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9C289DC2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Oct 2018 14:58:58 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <1540218229-10693-1-git-send-email-ramalingam.c@intel.com>
In-Reply-To: <1540218229-10693-1-git-send-email-ramalingam.c@intel.com>
Message-ID: <154022033346.18004.2527162657381368877@skylake-alporthouse-com>
Date: Mon, 22 Oct 2018 15:58:53 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/2] lib/debugfs: connector debugfs
 director
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
To: Ramalingam C <ramalingam.c@intel.com>, daniel.vetter@ffwll.ch, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBSYW1hbGluZ2FtIEMgKDIwMTgtMTAtMjIgMTU6MjM6NDgpCj4gRnVuY3Rpb24gdG8g
b3BlbiBhIGRlYnVnZnMgZGlyZWN0b3Igb2YgYSBjb25uZWN0b3IgYXNzb2NpYXRlZCB0bwo+IGEg
ZGV2aWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhbWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGlu
dGVsLmNvbT4KPiAtLS0KPiAgbGliL2lndF9kZWJ1Z2ZzLmMgfCAyNCArKysrKysrKysrKysrKysr
KysrKysrKysKPiAgbGliL2lndF9kZWJ1Z2ZzLmggfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MjUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2RlYnVnZnMuYyBiL2xp
Yi9pZ3RfZGVidWdmcy5jCj4gaW5kZXggYmFlZGMyMjU1YWM5Li5mNTQ1ZThhM2VlYzkgMTAwNjQ0
Cj4gLS0tIGEvbGliL2lndF9kZWJ1Z2ZzLmMKPiArKysgYi9saWIvaWd0X2RlYnVnZnMuYwo+IEBA
IC0yMzcsNiArMjM3LDMwIEBAIGludCBpZ3RfZGVidWdmc19kaXIoaW50IGRldmljZSkKPiAgfQo+
ICAKPiAgLyoqCj4gKyAqIGlndF9kZWJ1Z2ZzX2Nvbm5lY3Rvcl9kaXI6Cj4gKyAqIEBkZXZpY2U6
IGZkIG9mIHRoZSBkZXZpY2UKPiArICogQGNvbm5fbmFtZTogY29uZW5jdG9yIG5hbWUKPiArICoK
PiArICogVGhpcyBvcGVucyB0aGUgZGVidWdmcyBkaXJlY3RvcnkgY29ycmVzcG9uZGluZyB0byBj
b25uZWN0b3Igb24gdGhlIGRldmljZQo+ICsgKiBmb3IgdXNlIHdpdGggaWd0X3N5c2ZzX2dldCgp
IGFuZCByZWxhdGVkIGZ1bmN0aW9ucy4KPiArICoKPiArICogUmV0dXJuczoKPiArICogVGhlIGRp
cmVjdG9yeSBmZCwgb3IgLTEgb24gZmFpbHVyZS4KPiArICovCj4gK2ludCBpZ3RfZGVidWdmc19j
b25uZWN0b3JfZGlyKGludCBkZXZpY2UsIGNoYXIgKmNvbm5fbmFtZSkKPiArewo+ICsgICAgICAg
Y2hhciBwYXRoWzIwMF0sIGJhc2VfcGF0aFsyMDBdOwo+ICsKPiArICAgICAgIGlmICghaWd0X2Rl
YnVnZnNfcGF0aChkZXZpY2UsIGJhc2VfcGF0aCwgc2l6ZW9mKGJhc2VfcGF0aCkpKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gLTE7CgpXaHkgbm90IHVzZSB0aGUgZGVidWdmc19kaXIgYW5kIG9w
ZW5hdD8gU3RyaW5nIG9wcyBub3QgcmVxdWlyZWQuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
