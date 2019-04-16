Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D86889415
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2019 23:26:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CBC40369C4
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2019 23:26:00 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Tue, 16 Apr 2019 19:25:44 -0400
Message-Id: <20190416232548.13755-5-lyude@redhat.com>
In-Reply-To: <20190416232548.13755-1-lyude@redhat.com>
References: <20190416232548.13755-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 4/8] meson: Add .so versioning
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
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCldoaWxlIEknbSBwcmV0dHkgY29u
ZmlkZW50IHRoYXQgbm8gb25lIGNhcmVzIHRvIHVzZSBsaWJpZ3Quc28gb3IKbGliX2F1YmR1bXAu
c28gYW55d2hlcmUgb3V0c2lkZSBvZiBpZ3QsIG1hbnkgZGlzdHJpYnV0aW9ucyBpbmNsdWRpbmcK
RmVkb3JhIGFuZCBEZWJpYW4gc3Ryb25nbHkgc3VnZ2VzdCB0aGF0IHBhY2thZ2VzIGhhdmUgc29t
ZSBzb3J0IG9mIHNvCnZlcnNpb25pbmcsIGV2ZW4gaWYgaXQncyBqdXN0ICcwJy4gU28sIGxldCdz
IGZ1bGZpbGwgdGhhdCBtaW5pbXVtCnJlcXVpcmVtZW50IHRvIG1ha2UgdGhpcyBlYXNpZXIgdG8g
cGFja2FnZS4KClNpZ25lZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0t
LQogbGliL21lc29uLmJ1aWxkICAgfCAzICsrLQogdG9vbHMvbWVzb24uYnVpbGQgfCAzICsrLQog
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvbGliL21lc29uLmJ1aWxkIGIvbGliL21lc29uLmJ1aWxkCmluZGV4IGE4NDYyOTMzLi4y
YWFkOWQ5ZSAxMDA2NDQKLS0tIGEvbGliL21lc29uLmJ1aWxkCisrKyBiL2xpYi9tZXNvbi5idWls
ZApAQCAtMTMyLDcgKzEzMiw4IEBAIGxpYl9pZ3RfYnVpbGQgPSBzaGFyZWRfbGlicmFyeSgnaWd0
JywKICAgICBbJ2R1bW15LmMnXSwKICAgICBsaW5rX3dob2xlOiBsaWJfaW50ZXJtZWRpYXRlcywK
ICAgICBkZXBlbmRlbmNpZXM6IGxpYl9kZXBzLAotICAgIGluc3RhbGwgOiB0cnVlCisgICAgaW5z
dGFsbCA6IHRydWUsCisgICAgc292ZXJzaW9uIDogJzAnLAogKQogCiBsaWJfaWd0ID0gZGVjbGFy
ZV9kZXBlbmRlbmN5KGxpbmtfd2l0aCA6IGxpYl9pZ3RfYnVpbGQsCmRpZmYgLS1naXQgYS90b29s
cy9tZXNvbi5idWlsZCBiL3Rvb2xzL21lc29uLmJ1aWxkCmluZGV4IDVkMDBmMmUzLi5kZmFlZDgy
YSAxMDA2NDQKLS0tIGEvdG9vbHMvbWVzb24uYnVpbGQKKysrIGIvdG9vbHMvbWVzb24uYnVpbGQK
QEAgLTkzLDcgKzkzLDggQEAgaW5zdGFsbF9zdWJkaXIoJ3JlZ2lzdGVycycsIGluc3RhbGxfZGly
IDogZGF0YWRpciwKIHNoYXJlZF9saWJyYXJ5KCdpbnRlbF9hdWJkdW1wJywgJ2F1YmR1bXAuYycs
CiAJICAgICAgIGRlcGVuZGVuY2llcyA6IFsgbGliX2lndF9jaGlwc2V0LCBkbHN5bSBdLAogCSAg
ICAgICBuYW1lX3ByZWZpeCA6ICcnLAotCSAgICAgICBpbnN0YWxsIDogdHJ1ZSkKKwkgICAgICAg
aW5zdGFsbCA6IHRydWUsCisJICAgICAgIHNvdmVyc2lvbiA6ICcwJykKIAogZXhlY3V0YWJsZSgn
aW50ZWxfZ3B1X3RvcCcsICdpbnRlbF9ncHVfdG9wLmMnLAogCSAgIGluc3RhbGwgOiB0cnVlLAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
