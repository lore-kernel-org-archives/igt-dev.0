Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Tue, 11 May 2021 17:51:17 +0100
Message-Id: <20210511165117.428062-13-matthew.auld@intel.com>
In-Reply-To: <20210511165117.428062-1-matthew.auld@intel.com>
References: <20210511165117.428062-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 12/12] tests/i915/gem_exec_basic/dg1:
 Iterate over all memory regions
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
To: igt-dev@lists.freedesktop.org
Cc: Vanshidhar Konda <vanshidhar.r.konda@intel.com>, thomas.hellstrom@linux.intel.com, petri.latvala@intel.com, Janulgue Abdiel <abdiel.janulgue@intel.com>, intel-gfx@lists.freedesktop.org, "Kalamarz, Lukasz" <lukasz.kalamarz@intel.com>, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogIkthbGFtYXJ6LCBMdWthc3oiIDxsdWthc3oua2FsYW1hcnpAaW50ZWwuY29tPgoKQXMg
YSBwYXJ0IG9mIGxvY2FsIG1lbW9yeSBlZmZvcnQgd2UgbmVlZCB0byBtYWtlIHN1cmUsIHRoYXQK
ZXZlcnkgYXZhaWxhYmxlIG1lbW9yeSByZWdpb24gaXMgY292ZXJlZC4gVGhpcyBwYXRjaCBpcyBh
biBhdHRlbXB0CmZvciB0aGlzIHByb2JsZW0uIElmIGl0IHdpbGwgYmUgYWNjZXB0ZWQgaXQgd2ls
bCBiZSByZXBsaWNhdGVkIG9uCmVhY2ggdGVzdCB0aGF0IGNhbiBhY3R1YWxseSBiZW5lZml0IGZy
b20gaXQuCgpTaWduZWQtb2ZmLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdv
cnpla0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEx1a2FzeiBLYWxhbWFyeiA8bHVrYXN6Lmth
bGFtYXJ6QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVmluYXkgQmVsZ2F1bWthciA8dmluYXku
YmVsZ2F1bWthckBpbnRlbC5jb20+CkNjOiBKYW51bGd1ZSBBYmRpZWwgPGFiZGllbC5qYW51bGd1
ZUBpbnRlbC5jb20+CkNjOiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+CkNj
OiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KQ2M6IFZhbnNoaWRoYXIg
S29uZGEgPHZhbnNoaWRoYXIuci5rb25kYUBpbnRlbC5jb20+CkNjOiBTdHVhcnQgU3VtbWVycyA8
c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgpDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymln
bmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZXhlY19iYXNp
Yy5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMgYi90ZXN0cy9pOTE1
L2dlbV9leGVjX2Jhc2ljLmMKaW5kZXggOGJjNGRjNTIuLjg3MmIxZDNiIDEwMDY0NAotLS0gYS90
ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19iYXNp
Yy5jCkBAIC01Niw3ICs1Niw4IEBAIGlndF9tYWluCiAJCWlndF9hc3NlcnQocXVlcnlfaW5mbyk7
CiAKIAkJc2V0ID0gZ2V0X21lbW9yeV9yZWdpb25fc2V0KHF1ZXJ5X2luZm8sCi0JCQkJCSAgICBJ
OTE1X1NZU1RFTV9NRU1PUlkpOworCQkJCQkgICAgSTkxNV9TWVNURU1fTUVNT1JZLAorCQkJCQkg
ICAgSTkxNV9ERVZJQ0VfTUVNT1JZKTsKIAl9CiAKIAlpZ3Rfc3VidGVzdF93aXRoX2R5bmFtaWMo
ImJhc2ljIikgewotLSAKMi4yNi4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
