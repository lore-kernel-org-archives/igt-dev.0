Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611826E51D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Apr 2018 02:38:00 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 10 Apr 2018 19:37:32 -0700
Message-Id: <20180411023732.32362-20-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 20/20] tests/psr: Add more PSR subtests to
 fast feedback list
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Tm9uZSBvZiB0aGVzZSB0ZXN0cyB0YWtlIG1vcmUgdGhhbiBhIGNvdXBsZSBvZiBzZWNvbmRzIGFu
ZCB0aGUgY3VycmVudApiYXNpYyBzdWJ0ZXN0IGlzIHRvbyBiYXNpYyB0byBiZSB1c2VmdWwuCgpT
aWduZWQtb2ZmLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGlu
dGVsLmNvbT4KLS0tCiB0ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IHwgNCAr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMv
aW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCBiL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVl
ZGJhY2sudGVzdGxpc3QKaW5kZXggYjA4ZWY3NzAuLmVhYWM5YjQ1IDEwMDY0NAotLS0gYS90ZXN0
cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0CisrKyBiL3Rlc3RzL2ludGVsLWNpL2Zh
c3QtZmVlZGJhY2sudGVzdGxpc3QKQEAgLTI0NCw2ICsyNDQsMTAgQEAgaWd0QGttc19waXBlX2Ny
Y19iYXNpY0BzdXNwZW5kLXJlYWQtY3JjLXBpcGUtYQogaWd0QGttc19waXBlX2NyY19iYXNpY0Bz
dXNwZW5kLXJlYWQtY3JjLXBpcGUtYgogaWd0QGttc19waXBlX2NyY19iYXNpY0BzdXNwZW5kLXJl
YWQtY3JjLXBpcGUtYwogaWd0QGttc19wc3Jfc2lua19jcmNAYmFzaWMKK2lndEBrbXNfcHNyX3Np
bmtfY3JjQHByaW1hcnlfcGFnZV9mbGlwCitpZ3RAa21zX3Bzcl9zaW5rX2NyY0BzcHJpdGVfcGxh
bmVfb25vZmYKK2lndEBrbXNfcHNyX3NpbmtfY3JjQGN1cnNvcl9wbGFuZV9tb3ZlCitpZ3RAa21z
X3Bzcl9zaW5rX2NyY0BkcG1zCiBpZ3RAa21zX3NldG1vZGVAYmFzaWMtY2xvbmUtc2luZ2xlLWNy
dGMKIGlndEBrbXNfc2lua19jcmNfYmFzaWMKIGlndEBwbV9iYWNrbGlnaHRAYmFzaWMtYnJpZ2h0
bmVzcwotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
