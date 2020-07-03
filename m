Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB946E311
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2020 11:24:59 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date: Fri,  3 Jul 2020 14:23:33 +0300
Message-Id: <20200703112333.4237-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Fix interface descriptor fills
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Rm9yIGdlbjgrIHdlIG5lZWQgdG8gaW5jcmVtZW50IHRoZSBwb2ludGVyIGZvciBpbnRlcmZhY2UK
ZGVzY3JpcHRvciBzaXplIGFtb3VudC4gT3RoZXJ3aXNlIHRoZSBuZXh0IGluZGlyZWN0IGl0ZW0K
aW50cm9kdWNlZCB3aWxsIG92ZXJ3cml0ZSBvdXIgZGVzY3JpcHRvci4KCkFwcGFyZW50bHkgdGhp
cyBoYXMgbm90IGNhdXNlZCBtdWNoIGhhdm9jIGFzIGludGVyZmFjZQpkZXNjcyBoYXMgYmVlbiB0
aGUgbGFzdCBpdGVtLgoKQ2M6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6
eW5za2lAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+ClNpZ25lZC1vZmYtYnk6IE1pa2EgS3VvcHBhbGEgPG1pa2Eua3VvcHBhbGFAbGludXguaW50
ZWwuY29tPgotLS0KIGxpYi9ncHVfY21kcy5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2dwdV9jbWRzLmMgYi9saWIvZ3B1X2NtZHMu
YwppbmRleCA0MTcyNTNhNy4uODExNTZkMjUgMTAwNjQ0Ci0tLSBhL2xpYi9ncHVfY21kcy5jCisr
KyBiL2xpYi9ncHVfY21kcy5jCkBAIC0zNjMsNiArMzYzLDggQEAgZ2VuOF9maWxsX2ludGVyZmFj
ZV9kZXNjcmlwdG9yKHN0cnVjdCBpbnRlbF9iYiAqaWJiLAogCiAJaWRkLT5kZXNjNi5udW1fdGhy
ZWFkc19pbl90ZyA9IDE7CiAKKwlpbnRlbF9iYl9wdHJfYWRkKGliYiwgc2l6ZW9mKCppZGQpKTsK
KwogCXJldHVybiBvZmZzZXQ7CiB9CiAKQEAgLTM5OSw2ICs0MDEsOCBAQCBnZW4xMV9maWxsX2lu
dGVyZmFjZV9kZXNjcmlwdG9yKHN0cnVjdCBpbnRlbF9iYiAqaWJiLAogCiAJaWRkLT5kZXNjNi5u
dW1fdGhyZWFkc19pbl90ZyA9IDE7CiAKKwlpbnRlbF9iYl9wdHJfYWRkKGliYiwgc2l6ZW9mKCpp
ZGQpKTsKKwogCXJldHVybiBvZmZzZXQ7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
