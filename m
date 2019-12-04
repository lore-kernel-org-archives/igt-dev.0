Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA976E0C1
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2019 17:48:32 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  4 Dec 2019 17:48:17 +0000
Message-Id: <20191204174817.3877367-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Delegate exhaustive
 fault-injection to the idle runs
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

aTkxNV9tb2R1bGVfcmVsb2FkL2ZhdWx0LWluamVjdGlvbiBpcyB2YWx1YWJsZSBmb3IgaXRzIGV4
aGF1c3RpdmUgdHJhd2wKdGhyb3VnaCAoaG9wZWZ1bGx5KSBldmVyeSBwYXRoIHRoYXQgaGl0cyBp
OTE1X3Byb2JlX2Vycm9yLCB1bmZvcnR1bmF0ZWx5CnN1Y2ggdGhvcm91Z2huZXNzIGNvbWVzIGF0
IGEgY29zdC4gT24ga2JsLWd1YywgaXQgdGFrZXMgYWxtb3N0IDNtaW51dGVzLAp3aGljaCBpcyB1
bmFjY2VwdGFibGUgZm9yIEJBVCwgc28gbGVhdmUgaXQgdG8gdGhlIHNoYXJkcyBhbmQgaWRsZSBy
dW5zCnRvIGNhdGNoIHVudXN1YWwgZXJyb3JzIG9uIG1vZHVsZSBsb2FkLgoKU2lnbmVkLW9mZi1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBNYXJ0aW4gUGVy
ZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRlbC5jb20+CkNjOiBKb29uYXMgTGFodGluZW4gPGpv
b25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMvaW50ZWwtY2kvZmFzdC1m
ZWVkYmFjay50ZXN0bGlzdCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QgYi90ZXN0
cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0CmluZGV4IGQ1ZjEzYmVjMi4uMTQ1MDdj
MzQ3IDEwMDY0NAotLS0gYS90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0Cisr
KyBiL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKQEAgLTIwMCw2ICsyMDAs
NCBAQCBpZ3RAdmdlbV9iYXNpY0BzeXNmcwogCiBpZ3RAdmdlbV9iYXNpY0B1bmxvYWQKIGlndEBp
OTE1X21vZHVsZV9sb2FkQHJlbG9hZAotaWd0QGk5MTVfbW9kdWxlX2xvYWRAcmVsb2FkLW5vLWRp
c3BsYXkKLWlndEBpOTE1X21vZHVsZV9sb2FkQHJlbG9hZC13aXRoLWZhdWx0LWluamVjdGlvbgog
aWd0QGk5MTVfcG1fcnBtQG1vZHVsZS1yZWxvYWQKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
