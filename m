Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C8789F24
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2019 08:51:13 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190819223137.3605-1-antonio.argenziano@intel.com>
References: <20190819223137.3605-1-antonio.argenziano@intel.com>
Message-ID: <156629106028.1374.13852420105577002712@skylake-alporthouse-com>
Date: Tue, 20 Aug 2019 09:51:00 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] tests/igt_command_line.sh: Add new
 selftest for special handling
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDgtMTkgMjM6MzE6MzcpCj4gZG1hYnVm
X3NlbGZ0ZXN0cyBoYXMgYmVlbiByZWNlbnRseSBhZGRlZCB0byB0aGUgdGVzdCBsaXN0IGJ1dCBu
b3QgYWRkZWQKPiB0byB0aGUgc3BlY2lhbCBoYW5kbGluZyBpbiBpZ3RfY29tbWFuZF9saW5lLnNo
IGFuZCB0aGVyZWZvcmUgYnVpbGQKPiB0ZXN0aW5nIHdvdWxkIGZhaWwuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwuY29tPgo+
IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAtLS0KPiAgdGVz
dHMvaWd0X2NvbW1hbmRfbGluZS5zaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2lndF9jb21tYW5k
X2xpbmUuc2ggYi90ZXN0cy9pZ3RfY29tbWFuZF9saW5lLnNoCj4gaW5kZXggOTI2NDNjNGQuLmVh
ZWMxYjRmIDEwMDc1NQo+IC0tLSBhL3Rlc3RzL2lndF9jb21tYW5kX2xpbmUuc2gKPiArKysgYi90
ZXN0cy9pZ3RfY29tbWFuZF9saW5lLnNoCj4gQEAgLTkwLDcgKzkwLDcgQEAgY2hlY2tfdGVzdCAo
KQo+ICAgICAgICAgICAgICAgICAjIFN1YnRlc3QgZW51bWVyYXRpb24gb2Yga2VybmVsIHNlbGZ0
ZXN0IGxhdW5jaGVycyBkZXBlbmRzCj4gICAgICAgICAgICAgICAgICMgb24gdGhlIHJ1bm5pbmcg
a2VybmVsLiBJZiBzZWxmdGVzdHMgYXJlIG5vdCBlbmFibGVkLAo+ICAgICAgICAgICAgICAgICAj
IHRoZXkgd2lsbCBvdXRwdXQgbm90aGluZyBhbmQgZXhpdCB3aXRoIDAuCj4gLSAgICAgICAgICAg
ICAgIGlmIFsgIiR0ZXN0bmFtZSIgIT0gImk5MTVfc2VsZnRlc3QiIC1hICIkdGVzdG5hbWUiICE9
ICJkcm1fbW0iIC1hICIkdGVzdG5hbWUiICE9ICJrbXNfc2VsZnRlc3QiIF07IHRoZW4KPiArICAg
ICAgICAgICAgICAgaWYgWyAiJHRlc3RuYW1lIiAhPSAiaTkxNV9zZWxmdGVzdCIgLWEgIiR0ZXN0
bmFtZSIgIT0gImRybV9tbSIgLWEgIiR0ZXN0bmFtZSIgIT0gImttc19zZWxmdGVzdCIgLWEgIiR0
ZXN0bmFtZSIgIT0gImRtYWJ1Zl9zZWxmdGVzdHMiXTsgdGhlbgoKVGhlIG5hbWUgaXMganVzdCAi
ZG1hYnVmIgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
