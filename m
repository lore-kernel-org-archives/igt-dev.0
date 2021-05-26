Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708EE6E15E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 May 2021 15:43:27 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Wed, 26 May 2021 17:43:10 +0200
Message-Id: <20210526154311.3591-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/1] Fix the multiprocess mode of intel
 allocator
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

SW4gdGhlIG11bHRpcHJvY2VzcyBtb2RlIGFsbCByZXF1ZXN0cyB0byB0aGUgYWxsb2NhdG9yIGFy
ZQpwcm9jZXNzZWQgaW4gdGhlIHBhcmVudC4gSG93ZXZlciwgaW4gY2VydGFpbiBzY2VuYXJpb3MK
KGZvciBleGFtcGxlIGdlbV9leGVjX2NhcHR1cmVAcGkpLCBhIGNoaWxkIHByb2Nlc3MgbWF5IHdh
bnQKdG8gY3JlYXRlIGFuIGFsbG9jYXRvciBpbnN0YW5jZSB1c2luZyBpdHMgb3duIHByaXZhdGUg
ZmlsZQpkZXNyaXB0b3IuICBUaHVzIGFsbCBpb2N0bHMgdXNlZCB0byBkZXRlcm1pbmUgYXZhaWxh
YmxlIGd0dCBzaXplCm11c3QgYmUgY2FsbGVkIGluIHRoZSBjaGlsZCBwcm9jZXNzIGFuZCBub3Qg
aW4gdGhlIHBhcmVudC4KClRoaXMgcGF0Y2ggaW1wbGVtZW50cyB0aGUgYWJvdmUgY2hhbmdlLgoK
djI6IFRlc3QgYWxsb2NhdG9ycyBmb3IgcHJpdmF0ZSBhbmQgc2hhcmVkIGNvbnRleHRzIGluCiAg
ICBtdWx0aXByb2Nlc3MgbW9kZS4KCgpDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmll
dy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CgoKQW5kcnplaiBUdXJrbyAoMSk6CiAgbGliL2ludGVs
X2FsbG9jYXRvcjogTW92ZSB0aGUgaW9jdGwgY2FsbHMgdG8gY2xpZW50IHByb2Nlc3NlcwoKIGxp
Yi9pbnRlbF9hbGxvY2F0b3IuYyAgICAgICAgICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0KIGxpYi9pbnRlbF9hbGxvY2F0b3JfcmFuZG9tLmMgICAgIHwgMjcgKysrKysr
Ky0tLS0tLS0tLS0KIGxpYi9pbnRlbF9hbGxvY2F0b3JfcmVsb2MuYyAgICAgIHwgMjAgKysrKy0t
LS0tLS0tLQogbGliL2ludGVsX2FsbG9jYXRvcl9zaW1wbGUuYyAgICAgfCA0NCArKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIHRlc3RzL2k5MTUvYXBpX2ludGVsX2FsbG9jYXRvci5jIHwgNDcg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMTA0IGluc2Vy
dGlvbnMoKyksIDg1IGRlbGV0aW9ucygtKQoKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
