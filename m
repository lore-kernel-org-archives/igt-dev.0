Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2EE89155
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2019 16:06:01 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 29 Apr 2019 18:05:53 +0200
Message-Id: <20190429160557.17889-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/4] kms_cursor_crc test improvements and
 cleanups.
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

VGhlIHRlc3RzIHdlcmUgcnVubmluZyBvbiBlYWNoIG91dHB1dCBvbiBlYWNoIHBpcGUsIGFuZCBk
aWQgc29tZSBjbGVhbnVwCnRoYXQgc2hvdWxkIGJlIGRvbmUgaW4gaWd0X2Rpc3BsYXlfcmVzZXQo
KS4gRml4IHRoZSB0ZXN0IHRvIHVzZSBpZ3Rfa21zCmNhbGxzIGFsbCB0aGUgdGltZSwgYW5kIHJl
bW92ZSBhbGwgaGFuZC1yb2xsZWQgY2xlYW51cC4KCkFzIGEgYm9udXMsIHdlIGNhbiBub3cgcnVu
IHRoZSBzYW1lIHRlc3Qgb24gYW4gb3ZlcmxheSBwbGFuZSB3aXRoIGEKcy9DVVJTT1IvT1ZFUkxB
WS8gYXMgYSBzYW5pdHkgY2hlY2sgdGhhdCB0aGUgdGVzdCB0aGVtc2VsdmVzIGFyZSBjb3JyZWN0
LgoKTWFhcnRlbiBMYW5raG9yc3QgKDQpOgogIHRlc3RzL2ttc19jdXJzb3JfY3JjOiBSdW4gdGVz
dHMgb25jZSBwZXIgcGlwZQogIHRlc3RzL2ttc19jdXJzb3JfY3JjOiBIYW5kbGUgZGlzcGxheSBj
bGVhbnVwIGluIGluaXQKICBsaWIvaWd0X2ttczogVXBkYXRlIGN1cnNvciB3aGVuIGZiIHdpZHRo
L2hlaWdodCBjaGFuZ2VzIHRvby4KICB0ZXN0cy9rbXNfY3Vyc29yX2NyYzogVXNlIGlndF9rbXMg
Y2FsbHMgZm9yIGV2ZXJ5dGhpbmcuCgogbGliL2lndF9rbXMuYyAgICAgICAgICB8ICAgNCArLQog
dGVzdHMva21zX2N1cnNvcl9jcmMuYyB8IDIzOCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMTQgaW5zZXJ0aW9ucygrKSwgMTI4IGRl
bGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2
