Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0858C6F3A1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2019 12:49:12 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Fri, 13 Sep 2019 14:49:01 +0200
Message-Id: <20190913124903.3643-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] Enabling gpgpu_fill and media_fill on
 TGL
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SSBhbSByZXNlbmRpbmcsIGJlY2F1c2UgcGF0Y2ggaGFzIGxhbmRlZCBvbiBNTCBzb21lIHRpbWUg
YWdvLApidXQgdGhlcmUgd2FzIG5vIHJlc3BvbnNlLgoKQ2M6IERhbmllbGUgQ2VyYW9sbyBTcHVy
aW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+CkNjOiBBbnRvbmlvIEFyZ2Vuemlh
bm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+CkNjOiBMdWthc3ogS2FsYW1hcnogPGx1
a2Fzei5rYWxhbWFyekBpbnRlbC5jb20+CkNjOiBaYmlnbmlldyBLZW1wY3p5bnNraSA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgpDYzogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1h
cmNoaUBpbnRlbC5jb20+CkNjOiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRl
bC5jb20+CgpLYXRhcnp5bmEgRGVjICgyKToKICBsaWIvZ3BncHVfZmlsbC90Z2w6IEltcGxlbWVu
dCBncGdwdV9maWxsZnVuYyBmb3IgVEdMCiAgbGliL21lZGlhX2ZpbGwvdGdsOiBJbXBsZW1lbnQg
bWVkaWFfZmlsbGZ1bmMgZm9yIFRHTAoKIGxpYi9ncGdwdV9maWxsLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDIyICsrKysrKysrKysrKysrKysKIGxpYi9ncGdwdV9maWxsLmggICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKwogbGliL2k5MTUvc2hhZGVycy9S
RUFETUUgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKIC4uLi9zaGFkZXJzL2dwZ3B1L2dl
bjEycDFfZ3BncHVfa2VybmVsLmFzbSAgICB8IDEyICsrKysrKysrKwogLi4uL3NoYWRlcnMvbWVk
aWEvZ2VuMTJwMV9tZWRpYV9rZXJuZWwuYXNtICAgIHwgMTMgKysrKysrKysrKwogbGliL2ludGVs
X2JhdGNoYnVmZmVyLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrKy0KIGxpYi9tZWRp
YV9maWxsLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDI1ICsrKysrKysrKysrKysr
KysrKysKIGxpYi9tZWRpYV9maWxsLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3
ICsrKysrKwogOCBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL2k5MTUvc2hhZGVycy9ncGdwdS9nZW4xMnAxX2dwZ3B1
X2tlcm5lbC5hc20KIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvaTkxNS9zaGFkZXJzL21lZGlhL2dl
bjEycDFfbWVkaWFfa2VybmVsLmFzbQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
