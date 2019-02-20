Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAF88932E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Feb 2019 18:21:33 +0000 (UTC)
From: Caz Yokoyama <caz@caz-nuc.ra.intel.com>
Date: Wed, 20 Feb 2019 01:13:15 +0000
Message-Id: <cover.1550624857.git.caz@caz-nuc.ra.intel.com>
Subject: [igt-dev] [igt PATCH 0/1] lib: igt@i915_suspend@shrink faster
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

aWd0QGk5MTVfc3VzcGVuZEBzaHJpbmsgcnVucyAyNSBzZWMgaW5zdGVhZCBvZiA5MCBzZWMgb24g
bXkgTlVDIHdoaWNoIGhhcwoyR0Igb2YgbWVtb3J5LiBUaGUgY2hpbGQgcHJvY2VzcyB3aGljaCBp
cyBjcmVhdGVkIGJ5IGlndF9mb3JrKCkgdXBkYXRlcwpwaW5uYWJsZSBtZW1vcnkgc2l6ZSwgKCpj
YW5fbWxvY2spLiBQYXJlbnQgcHJvY2VzcyBtbG9ja3MgYXQgdGhlIGVuZCBvZgoiZm9yIGxvb3Ai
IHdoZW4gdGhlIGNoaWxkIHByb2Nlc3MgZmluZHMgcGlubmFibGUgbWVtb3J5IHNpemUgaW4gNGti
CmJvdW5kYXJ5LiBUaGlzIHBhdGNoIGFsc28gcmVkdWNlcyB0aGUgY2hhbmNlIG9mIGR5aW5nIGVu
dGlyZSB0ZXN0IHByb2Nlc3MKYmVjYXVzZSB0aGUgcGFyZW50IHByb2Nlc3MgbWNsb2NrcyB0aGUg
bWVtb3J5IHdoZXJlIHdlIGFscmVhZHkga25vdyBpdCBpcwpwaW5uYWJsZS4KCkluY3JlbWVudGFy
eSBtbG9ja2luZyBzbWFsbCBtZW1vcnkgaW4gYWRkaXRpb24gdG8gMy80IG9mIGF2YWlsYWJsZSBt
ZW1vcnkKYnkgdGhlIGNoaWxkIHByb2Nlc3MgZG9lcyBub3Qgd29yayBiZWNhdXNlIGtlcm5lbCBm
aW5kcyB0aGUgcGFyZW50CnByb2Nlc3MgbWxvY2tzIG1vcmUgbWVtb3J5IHRoYW4gdGhlIGNoaWxk
IHByb2Nlc3MgYW5kIGtpbGxzIHRoZSBwYXJlbnQKcHJvY2Vzcy4KCkFub3RoZXIgYmlnIHRpbWUg
Y29uc3VtZXIgaXMgaWd0X3N5c3RlbV9zdXNwZW5kX2F1dG9yZXN1bWUoKS4gMTUgc2VjIG9mCmRl
bGF5IGlzIGhhcmQgY29kZWQuIEl0IGlzIHRvbyBkYW5nZXIgdG8gcmVkdWNlIDE1IHNlYyBiZWNh
dXNlIHNvbWUgb2YKdGVzdCBtYWNoaW5lcyBtYXkgZmFpbCBieSByZWR1Y2luZyBkZWxheSB0aW1l
LgoKImdlbV91c2VycHRyX2JsaXRzQG1sb2NrZWQtKiIgdGVzdCBhbHNvIGNhbGxzCmludGVsX2dl
dF90b3RhbF9waW5uYWJsZV9tZW0oKS4gSSBkbyBub3QgdGVzdCB0aGVtIGJlY2F1c2UgdGhleSBk
byBub3QKZmluaXNoIHdpdGhpbiAzMCBtaW4gb24gbXkgTlVDIHdpdGhvdXQgdGhpcyBwYXRjaC4K
CkNheiBZb2tveWFtYSAoMSk6CiAgaWd0QGk5MTVfc3VzcGVuZEBzaHJpbmsgZmFzdGVyCgogbGli
L2ludGVsX29zLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
