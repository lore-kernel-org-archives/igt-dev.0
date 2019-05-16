Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB16A896AF
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2019 14:39:59 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu, 16 May 2019 15:39:45 +0100
Message-Id: <20190516143950.2379-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/5] tests: Add timeline syncobj tests
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

TmV3IGlvY3RscyBoYXZlIGJlZW4gYWRkZWQgdG8gZHJtLXN5bmNvYmogdG8gaW1wbGVtZW50IFZ1
bGthbiB0aW1lbGluZQpzZW1hcGhvcmVzLiBUaGlzIHNlcmllcyBhZGRzIHRlc3RzIGZvciB0aGlz
IG5ldyBmZWF0dXJlLgoKQ2hlZXJzLAoKQ2h1bm1pbmcgWmhvdSAoMSk6CiAgaWd0OiBhZGQgdGlt
ZWxpbmUgdGVzdCBjYXNlcwoKTGlvbmVsIExhbmR3ZXJsaW4gKDQpOgogIGxpYi9zeW5jb2JqOiBm
aXggY29tbWVudCB0eXBvCiAgaW5jbHVkZTogYnVtcCBkcm0gaGVhZGVycwogIGxpYi9zeW5jb2Jq
OiBkcm9wIGxvY2FsIGRlY2xhcmF0aW9ucwogIHRlc3RzL3N5bmNvYmpfdGltZWxpbmU6IGFkZCBt
b3JlIHRpbWVsaW5lIHRlc3RzCgogaW5jbHVkZS9kcm0tdWFwaS9hbWRncHVfZHJtLmggIHwgICA1
MiArLQogaW5jbHVkZS9kcm0tdWFwaS9kcm0uaCAgICAgICAgIHwgICAzNyArCiBpbmNsdWRlL2Ry
bS11YXBpL2RybV9tb2RlLmggICAgfCAgICA0ICstCiBpbmNsdWRlL2RybS11YXBpL21zbV9kcm0u
aCAgICAgfCAgIDE0ICsKIGluY2x1ZGUvZHJtLXVhcGkvbm91dmVhdV9kcm0uaCB8ICAgNTEgKysK
IGxpYi9pZ3Rfc3luY29iai5jICAgICAgICAgICAgICB8ICAyMjQgKysrKystCiBsaWIvaWd0X3N5
bmNvYmouaCAgICAgICAgICAgICAgfCAgIDQ1ICstCiB0ZXN0cy9tZXNvbi5idWlsZCAgICAgICAg
ICAgICAgfCAgICAxICsKIHRlc3RzL3N5bmNvYmpfYmFzaWMuYyAgICAgICAgICB8ICAgIDIgKy0K
IHRlc3RzL3N5bmNvYmpfdGltZWxpbmUuYyAgICAgICB8IDEzMzUgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIHRlc3RzL3N5bmNvYmpfd2FpdC5jICAgICAgICAgICB8ICAgNTggKy0K
IDExIGZpbGVzIGNoYW5nZWQsIDE3NTYgaW5zZXJ0aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvc3luY29ial90aW1lbGluZS5jCgotLQoyLjIxLjAuMzky
LmdmOGY2Nzg3MTU5ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
