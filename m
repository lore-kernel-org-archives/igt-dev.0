Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079B289A0E
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jul 2018 14:56:41 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 30 Jul 2018 15:56:34 +0100
Message-Id: <20180730145634.26537-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] intel-ci: Drop gem_cs_tlb from fast-feedback
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

Z2VtX2NzX3RsYiB0cmllcyB0byBkZXRlY3QgYSBIVyBpc3N1ZSBhbmQgaXMgbm90IGV4ZXJjaXNp
bmcgYQpmdW5kYW1lbnRhbCBwcm9wZXJ0eSBvZiBlaXRoZXIgdGhlIEhXIG9yIHVBQkksIGl0IGRv
ZXNuJ3QgaW5kaWNhdGUKZ2VuZXJhbCBoZWFsdGggb2YgYSBkcml2ZXIgd2l0aCByZXNwZWN0IHRv
IHRlc3RpbmcgYSBwYXRjaHNldCBhbmQgc28KbmVlZCBvbmx5IGJlIGRvbmUgbGF0ZXIgKGFmdGVy
IGZhc3QtZmVlZGJhY2spLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlz
dCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0
cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IGIvdGVzdHMvaW50ZWwtY2kvZmFzdC1m
ZWVkYmFjay50ZXN0bGlzdAppbmRleCA5Nzg4ODg2OWMuLjdjNzgwOTAxZiAxMDA2NDQKLS0tIGEv
dGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdAorKysgYi90ZXN0cy9pbnRlbC1j
aS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0CkBAIC0xMyw3ICsxMyw2IEBAIGlndEBnZW1fYnVzeUBi
YXNpYy1idXN5LWRlZmF1bHQKIGlndEBnZW1fY2xvc2VfcmFjZUBiYXNpYy1wcm9jZXNzCiBpZ3RA
Z2VtX2Nsb3NlX3JhY2VAYmFzaWMtdGhyZWFkcwogaWd0QGdlbV9jcHVfcmVsb2NAYmFzaWMKLWln
dEBnZW1fY3NfdGxiQGJhc2ljLWRlZmF1bHQKIGlndEBnZW1fY3R4X2NyZWF0ZUBiYXNpYwogaWd0
QGdlbV9jdHhfY3JlYXRlQGJhc2ljLWZpbGVzCiBpZ3RAZ2VtX2N0eF9leGVjQGJhc2ljCi0tIAoy
LjE4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
