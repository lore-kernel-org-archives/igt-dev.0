Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 31 Dec 2018 09:22:50 +0000
Message-Id: <20181231092250.13844-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_busy: Use a non-preemptible
 hanging batch
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

RW5zdXJlIHRoYXQgdGhlIGhhbmdjaGVjayBub3RpY2VzIHRoZSBoYW5naW5nIGJhdGNoIGJ5IHVz
aW5nIGEKbm9uLXByZWVtcHRpYmxlIHNwaW4gYmF0Y2gsIGFzIHNvbWUgZnV0dXJlIHZlcnNpb25z
IG9mIGhhbmdjaGVjayBtYXkKYWxsb3cgYSBwcmVlbXB0aWJsZSBHUFUgaG9nIHRvIHN1cnZpdmUu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
LS0tCiB0ZXN0cy9pOTE1L2dlbV9idXN5LmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1f
YnVzeS5jIGIvdGVzdHMvaTkxNS9nZW1fYnVzeS5jCmluZGV4IDc2YjQ0YTVkNC4uZWIzZDNlZjJi
IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9idXN5LmMKKysrIGIvdGVzdHMvaTkxNS9nZW1f
YnVzeS5jCkBAIC00MjcsNyArNDI3LDEwIEBAIHN0YXRpYyBib29sIGhhc19leHRlbmRlZF9idXN5
X2lvY3RsKGludCBmZCkKIAogc3RhdGljIHZvaWQgYmFzaWMoaW50IGZkLCB1bnNpZ25lZCByaW5n
LCB1bnNpZ25lZCBmbGFncykKIHsKLQlpZ3Rfc3Bpbl90ICpzcGluID0gaWd0X3NwaW5fYmF0Y2hf
bmV3KGZkLCAuZW5naW5lID0gcmluZyk7CisJaWd0X3NwaW5fdCAqc3BpbiA9CisJCWlndF9zcGlu
X2JhdGNoX25ldyhmZCwKKwkJCQkgICAuZW5naW5lID0gcmluZywKKwkJCQkgICAuZmxhZ3MgPSBJ
R1RfU1BJTl9OT19QUkVFTVBUSU9OKTsKIAlzdHJ1Y3QgdGltZXNwZWMgdHY7CiAJaW50IHRpbWVv
dXQ7CiAJYm9vbCBidXN5OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
