Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891796E1AA
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2018 11:37:52 +0000 (UTC)
Received: by mail-wm0-x243.google.com with SMTP id b21so25241821wme.4
 for <igt-dev@lists.freedesktop.org>; Mon, 05 Feb 2018 03:37:52 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Mon,  5 Feb 2018 11:37:41 +0000
Message-Id: <20180205113741.14959-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <151760502786.15322.10017126443410528565@mail.alporthouse.com>
References: <151760502786.15322.10017126443410528565@mail.alporthouse.com>
Subject: [igt-dev] [PATCH i-g-t v2 8/9] tests/perf_pmu: Explicitly test for
 engine availability in init tests
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClRlc3Qgd2ls
bCBzdWNjZWVkIGlmIHByZXNlbnQgZW5naW5lIGNhbiBiZSBvcGVuZWQsIG9yIGlmIHRoZSBtaXNz
aW5nCmVuZ2luZSByZXBvcnRzIHRoZSBjb3JyZWN0IGVycm9yIGNvZGUuCgp2MjoKICogVXNlIHRo
ZSByaWdodCBlcnJuby4KICogQ2xvc2UgZmQgb25seSBvbiBzdWNjZXNzLiAoQ2hyaXMgV2lsc29u
KQoKU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNv
bT4KUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiAj
IHYxCi0tLQogdGVzdHMvcGVyZl9wbXUuYyB8IDE1ICsrKysrKysrKysrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVz
dHMvcGVyZl9wbXUuYyBiL3Rlc3RzL3BlcmZfcG11LmMKaW5kZXggZDAwODM4YzQxMzMzLi4yNjBi
MDRiMDljODYgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3BlcmZfcG11LmMKKysrIGIvdGVzdHMvcGVyZl9w
bXUuYwpAQCAtNzIsMTEgKzcyLDIwIEBAIHN0YXRpYyBpbnQgb3Blbl9ncm91cCh1aW50NjRfdCBj
b25maWcsIGludCBncm91cCkKIHN0YXRpYyB2b2lkCiBpbml0KGludCBnZW1fZmQsIGNvbnN0IHN0
cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZSwgdWludDhfdCBzYW1wbGUpCiB7Ci0JaW50
IGZkOworCWludCBmZCwgZXJyID0gMDsKIAotCWZkID0gb3Blbl9wbXUoX19JOTE1X1BNVV9FTkdJ
TkUoZS0+Y2xhc3MsIGUtPmluc3RhbmNlLCBzYW1wbGUpKTsKKwllcnJubyA9IDA7CisJZmQgPSBw
ZXJmX2k5MTVfb3BlbihfX0k5MTVfUE1VX0VOR0lORShlLT5jbGFzcywgZS0+aW5zdGFuY2UsIHNh
bXBsZSkpOworCWVyciA9IGVycm5vOwogCi0JY2xvc2UoZmQpOworCWlmIChnZW1faGFzX2VuZ2lu
ZShnZW1fZmQsIGUtPmNsYXNzLCBlLT5pbnN0YW5jZSkpIHsKKwkJaWd0X2Fzc2VydF9lcShlcnIs
IDApOworCQlpZ3RfYXNzZXJ0X2ZkKGZkKTsKKwkJY2xvc2UoZmQpOworCX0gZWxzZSB7CisJCWln
dF9hc3NlcnRfbHQoZmQsIDApOworCQlpZ3RfYXNzZXJ0X2VxKGVyciwgRU5PREVWKTsKKwl9CiB9
CiAKIHN0YXRpYyB1aW50NjRfdCBwbXVfcmVhZF9zaW5nbGUoaW50IGZkKQotLSAKMi4xNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
