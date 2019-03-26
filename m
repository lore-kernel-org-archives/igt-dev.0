Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38EC6E04C
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2019 13:32:36 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Tue, 26 Mar 2019 15:32:30 +0200
Message-Id: <20190326133230.31950-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: fix typo in
 check_analog_bridge
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

VGhpcyBmdW5jdGlvbiBjaGVja3Mgd2hldGhlciBhIHBvcnQgaXMgYW4gYW5hbG9nIGJyaWRnZS4g
QW5hbG9nCmJyaWRnZXMgcHJvdmlkZSB0aGVpciBvd24gRURJRCB0aHVzIHRoZSB2ZW5kb3Igc2hv
dWxkIGJlIGRpZmZlcmVudApmcm9tICJJR1QiLgoKVGhlcmUgd2FzIGEgdHlwbyB0aGF0IG1hZGUg
dGhlIGZ1bmN0aW9uIGFsd2F5cyByZXR1cm4gdHJ1ZSBmb3IgVkdBCnBvcnRzLiBUaGUgY29uZGl0
aW9uIHdhcyBlc3NlbnRpYWxseToKCiAgICB0aGluZyAhPSAnSScgfHwgdGhpbmcgIT0gJ1QnCgp3
aGljaCBpcyBhbHdheXMgdHJ1ZS4KCkFwcGFyZW50bHkgdGhpcyBkaWRuJ3QgY2F1c2UgYW55IGhh
cm0sIGJ1dCBpdCdzIHByb2JhYmx5IGJldHRlciB0byBmaXgKaXQgYW55d2F5IGluIGNhc2Ugc29t
ZSB0ZXN0cyB3ZXJlIHNraXBwZWQgYW5kIHNob3VsZG4ndC4KClNpZ25lZC1vZmYtYnk6IFNpbW9u
IFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfY2hhbWVsaXVtLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS90ZXN0cy9rbXNfY2hhbWVsaXVtLmMgYi90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKaW5k
ZXggYzIwOTAwMzcuLjJkYzEwNDlkIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfY2hhbWVsaXVtLmMK
KysrIGIvdGVzdHMva21zX2NoYW1lbGl1bS5jCkBAIC0xOTksNyArMTk5LDcgQEAgY2hlY2tfYW5h
bG9nX2JyaWRnZShkYXRhX3QgKmRhdGEsIHN0cnVjdCBjaGFtZWxpdW1fcG9ydCAqcG9ydCkKIAog
CS8qIEFuYWxvZyBicmlkZ2VzIHByb3ZpZGUgdGhlaXIgb3duIEVESUQgKi8KIAlpZiAoZWRpZF92
ZW5kb3JbMF0gIT0gJ0knIHx8IGVkaWRfdmVuZG9yWzFdICE9ICdHJyB8fAotCSAgICBlZGlkX3Zl
bmRvclswXSAhPSAnVCcpCisJICAgIGVkaWRfdmVuZG9yWzJdICE9ICdUJykKIAkJcmV0dXJuIHRy
dWU7CiAKIAlyZXR1cm4gZmFsc2U7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
