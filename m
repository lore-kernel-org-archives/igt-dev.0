Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 22 May 2018 12:00:43 +0100
Message-Id: <20180522110044.26439-2-chris@chris-wilson.co.uk>
In-Reply-To: <20180522110044.26439-1-chris@chris-wilson.co.uk>
References: <20180522110044.26439-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH i-g-t 2/3] benchmarks/gem_syslatency: Allow
 limiting to just 1 CPU hog
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Tm9ybWFsbHkgd2UgdXNlIGEgaG9nIHBlciBDUFUgdG8gZW5zdXJlIHRoYXQgdGhlIHN5c3RlbSBp
cyBmdWxseQpsb2FkZWQgdG8gc2VlIGhvdyBtdWNoIGxhdGVuY3kgd2UgY2F1c2UuIEZvciBzaW1w
bGUgc2FuaXR5Y2hlY2tpbmcsIGFsbG93Cm91cnNlbHZlcyB0byBsaW1pdCBpdCB0byBqdXN0IG9u
ZSBDUFUgaG9nLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Ci0tLQogYmVuY2htYXJrcy9nZW1fc3lzbGF0ZW5jeS5jIHwgNSArKysrLQogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2JlbmNobWFya3MvZ2VtX3N5c2xhdGVuY3kuYyBiL2JlbmNobWFya3MvZ2VtX3N5c2xhdGVuY3ku
YwppbmRleCA5MTYwZTIxOTkuLmQxMDU2NzczYSAxMDA2NDQKLS0tIGEvYmVuY2htYXJrcy9nZW1f
c3lzbGF0ZW5jeS5jCisrKyBiL2JlbmNobWFya3MvZ2VtX3N5c2xhdGVuY3kuYwpAQCAtMzExLDgg
KzMxMSwxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJYm9vbCBpbnRlcnJ1
cHRzID0gZmFsc2U7CiAJaW50IG4sIGM7CiAKLQl3aGlsZSAoKGMgPSBnZXRvcHQoYXJnYywgYXJn
diwgInQ6ZjpibW5pIikpICE9IC0xKSB7CisJd2hpbGUgKChjID0gZ2V0b3B0KGFyZ2MsIGFyZ3Ys
ICJ0OmY6Ym1uaTEiKSkgIT0gLTEpIHsKIAkJc3dpdGNoIChjKSB7CisJCWNhc2UgJzEnOgorCQkJ
bmNwdXMgPSAxOworCQkJYnJlYWs7CiAJCWNhc2UgJ24nOiAvKiBkcnkgcnVuLCBtZWFzdXJlIGJh
c2VsaW5lIHN5c3RlbSBsYXRlbmN5ICovCiAJCQllbmFibGVfZ2VtX3N5c2J1c3kgPSAwOwogCQkJ
YnJlYWs7Ci0tIAoyLjE3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWdmeAo=
