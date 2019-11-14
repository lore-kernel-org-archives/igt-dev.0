Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 14 Nov 2019 10:29:21 +0000
Message-Id: <20191114102921.22790-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Set the COND_BB_END mask for bdw
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

T24gU2t5bGFrZSssIHRoZSB1c2Ugb2YgdGhlIG1hc2sgZm9yIHRoZSBjb21wYXJlIGFkZHJlc3Mg
aXMgcHJlZGljYXRlZApieSBhbiBpbnN0cnVjdGlvbiBmbGFnLiBPbiBCcm9hZHdlbGwsIGl0IHNl
ZW1zIHRoYXQgc29tZSBlbmdpbmVzIHVzZSB0aGUKbWFzayBhbmQgc29tZSBkbyBub3QuCgpCdWd6
aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEyMjcw
ClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpD
YzogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogbGli
L2lndF9kdW1teWxvYWQuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9kdW1teWxvYWQuYyBiL2xpYi9p
Z3RfZHVtbXlsb2FkLmMKaW5kZXggODBiOTBlMWYyLi4zMmQ0ZDhkM2YgMTAwNjQ0Ci0tLSBhL2xp
Yi9pZ3RfZHVtbXlsb2FkLmMKKysrIGIvbGliL2lndF9kdW1teWxvYWQuYwpAQCAtMjI4LDcgKzIy
OCw4IEBAIGVtaXRfcmVjdXJzaXZlX2JhdGNoKGlndF9zcGluX3QgKnNwaW4sCiAJCSAqIEZvciBz
aW1wbGljaXR5LCB3ZSB0cnkgdG8gc3RpY2sgdG8gYSBvbmUtc2l6ZSBmaXRzIGFsbC4KIAkJICov
CiAJCXNwaW4tPmNvbmRpdGlvbiA9IGJhdGNoICsgQkFUQ0hfU0laRSAvIHNpemVvZigqYmF0Y2gp
IC0gMjsKLQkJKnNwaW4tPmNvbmRpdGlvbiA9IDB4ZmZmZmZmZmY7CisJCXNwaW4tPmNvbmRpdGlv
blswXSA9IDB4ZmZmZmZmZmY7CisJCXNwaW4tPmNvbmRpdGlvblsxXSA9IDB4ZmZmZmZmZmY7CiAK
IAkJci0+cHJlc3VtZWRfb2Zmc2V0ID0gMDsKIAkJci0+dGFyZ2V0X2hhbmRsZSA9IG9ialtCQVRD
SF0uaGFuZGxlOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=
