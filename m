Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 30 Jan 2019 09:54:53 +0000
Message-Id: <20190130095500.23596-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/8] lib: Skip unused fork helpers
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

U2tpcCB0cnlpbmcgdG8gc3RvcCB1bnVzZWQgZm9yayBoZWxwZXJzIHRvIGF2b2lkIHRoZSB2YXJp
b3VzIGFzc2VydHMKdGhhdCB0aGV5IHdlcmUgcnVubmluZyBhbmQgZGlkbid0IGRpZSBlYXJseS4K
CkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0x
MDk0NjgKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+Ci0tLQogbGliL2lndF9jb3JlLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfY29yZS5jIGIvbGliL2lndF9jb3JlLmMKaW5k
ZXggNDlmYmY3MGRlLi4wNzk0ZTExYTAgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfY29yZS5jCisrKyBi
L2xpYi9pZ3RfY29yZS5jCkBAIC0xNjc4LDYgKzE2NzgsOSBAQCB2b2lkIGlndF9zdG9wX2hlbHBl
cihzdHJ1Y3QgaWd0X2hlbHBlcl9wcm9jZXNzICpwcm9jKQogewogCWludCBzdGF0dXM7CiAKKwlp
ZiAoIXByb2MtPnJ1bm5pbmcpIC8qIG5ldmVyIGV2ZW4gc3RhcnRlZCAqLworCQlyZXR1cm47CisK
IAkvKiBmYWlsdXJlIGhlcmUgbWVhbnMgdGhlIHBpZCBpcyBhbHJlYWR5IGRlYWQgYW5kIHNvIHdh
aXRpbmcgaXMgc2FmZSAqLwogCWtpbGwocHJvYy0+cGlkLCBwcm9jLT51c2VfU0lHS0lMTCA/IFNJ
R0tJTEwgOiBTSUdURVJNKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
