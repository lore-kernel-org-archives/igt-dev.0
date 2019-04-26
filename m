Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E26989216
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2019 11:05:55 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 26 Apr 2019 14:05:41 +0300
Message-Id: <20190426110541.15840-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Disable building if tests are not
 built
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
Cc: Eero Tamminen <eero.t.tamminen@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkJ1
Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTAy
NDgKQ2M6IEVlcm8gVGFtbWluZW4gPGVlcm8udC50YW1taW5lbkBpbnRlbC5jb20+Ci0tLQogcnVu
bmVyL21lc29uLmJ1aWxkIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ydW5uZXIvbWVzb24uYnVpbGQgYi9ydW5u
ZXIvbWVzb24uYnVpbGQKaW5kZXggZGU2ZTZmMWMuLjUwMTM1MmY3IDEwMDY0NAotLS0gYS9ydW5u
ZXIvbWVzb24uYnVpbGQKKysrIGIvcnVubmVyL21lc29uLmJ1aWxkCkBAIC0xMiw3ICsxMiwxMSBA
QCByZXN1bHRzX3NvdXJjZXMgPSBbICdyZXN1bHRzLmMnIF0KIHJ1bm5lcl90ZXN0X3NvdXJjZXMg
PSBbICdydW5uZXJfdGVzdHMuYycgXQogcnVubmVyX2pzb25fdGVzdF9zb3VyY2VzID0gWyAncnVu
bmVyX2pzb25fdGVzdHMuYycgXQogCi1pZiBfYnVpbGRfcnVubmVyIGFuZCBqc29uYy5mb3VuZCgp
CitpZiBub3QgX2J1aWxkX3Rlc3RzIGFuZCBfcnVubmVyX3JlcXVpcmVkCisJZXJyb3IoJ0J1aWxk
aW5nIHRlc3QgcnVubmVyIHJlcXVpcmVzIGJ1aWxkaW5nIHRlc3RzJykKK2VuZGlmCisKK2lmIF9i
dWlsZF9ydW5uZXIgYW5kIF9idWlsZF90ZXN0cyBhbmQganNvbmMuZm91bmQoKQogCXN1YmRpcign
dGVzdGRhdGEnKQogCiAJcnVubmVybGliID0gc3RhdGljX2xpYnJhcnkoJ2lndF9ydW5uZXInLCBy
dW5uZXJsaWJfc291cmNlcywKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
