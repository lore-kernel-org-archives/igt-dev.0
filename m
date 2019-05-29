Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6267D6E32B
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2019 13:53:35 +0000 (UTC)
From: Tomasz Lis <tomasz.lis@intel.com>
Date: Wed, 29 May 2019 15:53:32 +0200
Message-Id: <20190529135332.3099-1-tomasz.lis@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/prime_busy: Increase timeout to mind
 pre-silicon.
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

RnJvbTogIkxpcywgVG9tYXN6IiA8dG9tYXN6Lmxpc0BpbnRlbC5jb20+CgpPbiBzaWxpY29uLCBz
aW1wbGUgc3VibWlzc2lvbiBpcyBmaW5pc2hlZCBtdWNoIGZhc3RlciB0aGFuIGluIGEgc2Vjb25k
LgpCdXQgZm9yIHByZS1zaWxpY29uLCBpdCBpcyBub3QgYWx3YXlzIHRoZSBjYXNlLiBTaXggc2Vj
b25kcyBzaG91bGQgYmUKZW5vdWdoIHRob3VnaC4KClNpZ25lZC1vZmYtYnk6IFRvbWFzeiBMaXMg
PHRvbWFzei5saXNAaW50ZWwuY29tPgpDYzogTXJ6eWdsb2QgRGFuaWVsIFQgPGRhbmllbC50Lm1y
enlnbG9kQGludGVsLmNvbT4KQ2M6IE1pY2hhbCBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJza2lA
aW50ZWwuY29tPgpDYzogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+CkNj
OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29t
PgotLS0KIHRlc3RzL3ByaW1lX2J1c3kuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3ByaW1lX2J1c3kuYyBi
L3Rlc3RzL3ByaW1lX2J1c3kuYwppbmRleCBhODJhY2JkYi4uOGUwZjNjYTYgMTAwNjQ0Ci0tLSBh
L3Rlc3RzL3ByaW1lX2J1c3kuYworKysgYi90ZXN0cy9wcmltZV9idXN5LmMKQEAgLTE0Nyw3ICsx
NDcsNyBAQCBzdGF0aWMgdm9pZCBidXN5KGludCBmZCwgdW5zaWduZWQgcmluZywgdW5zaWduZWQg
ZmxhZ3MpCiAJaWYgKChmbGFncyAmIEhBTkcpID09IDApIHsKIAkJKmJiZSA9IE1JX0JBVENIX0JV
RkZFUl9FTkQ7CiAJCV9fc3luY19zeW5jaHJvbml6ZSgpOwotCQl0aW1lb3V0ID0gMTsKKwkJdGlt
ZW91dCA9IDY7CiAJfQogCiAJLyogQ2FsbGluZyBidXN5IGluIGEgbG9vcCBzaG91bGQgYmUgZW5v
dWdoIHRvIGZsdXNoIHRoZSByZW5kZXJpbmcgKi8KLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
