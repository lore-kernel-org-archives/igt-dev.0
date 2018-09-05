Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x22f.google.com (mail-wm0-x22f.google.com
 [IPv6:2a00:1450:400c:c09::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630096E4C5
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 14:25:51 +0000 (UTC)
Received: by mail-wm0-x22f.google.com with SMTP id n11-v6so7939266wmc.2
 for <igt-dev@lists.freedesktop.org>; Wed, 05 Sep 2018 07:25:51 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Wed,  5 Sep 2018 15:25:42 +0100
Message-Id: <20180905142544.3381-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATH i-g-t 0/2] Per context dynamic (sub)slice
 power-gating
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClNvbWUgdGVz
dHMgZm9yIHRoZSBjb3JyZXNwb25kaW5nIGk5MTUgc2VyaWVzLgoKSSBkcm9wcGVkIHRoZSBiZW5j
aG1hcmsgZm9yIG5vdyBidXQgcGxhbiB0byBicmluZyBpdCBiYWNrIGxhdGVyLgoKTGlvbmVsIExh
bmR3ZXJsaW4gKDIpOgogIGhlYWRlcnM6IGJ1bXAKICB0ZXN0czogYWRkIHNsaWNlIHBvd2VyIHBy
b2dyYW1taW5nIHRlc3QKCiBpbmNsdWRlL2RybS11YXBpL2FtZGdwdV9kcm0uaCAgfCAgIDIzICsK
IGluY2x1ZGUvZHJtLXVhcGkvZHJtLmggICAgICAgICB8ICAgIDcgKwogaW5jbHVkZS9kcm0tdWFw
aS9kcm1fbW9kZS5oICAgIHwgICAyMiArLQogaW5jbHVkZS9kcm0tdWFwaS9ldG5hdml2X2RybS5o
IHwgICAgNiArCiBpbmNsdWRlL2RybS11YXBpL2V4eW5vc19kcm0uaCAgfCAgMjQwICsrKysrKysr
CiBpbmNsdWRlL2RybS11YXBpL2k5MTVfZHJtLmggICAgfCAgIDQzICsrCiBpbmNsdWRlL2RybS11
YXBpL21zbV9kcm0uaCAgICAgfCAgICAyICsKIGluY2x1ZGUvZHJtLXVhcGkvdGVncmFfZHJtLmgg
ICB8ICA0OTIgKysrKysrKysrKysrKystCiBpbmNsdWRlL2RybS11YXBpL3ZjNF9kcm0uaCAgICAg
fCAgIDEzICstCiBpbmNsdWRlL2RybS11YXBpL3ZpcnRncHVfZHJtLmggfCAgICAxICsKIHRlc3Rz
L01ha2VmaWxlLmFtICAgICAgICAgICAgICB8ICAgIDEgKwogdGVzdHMvTWFrZWZpbGUuc291cmNl
cyAgICAgICAgIHwgICAgMSArCiB0ZXN0cy9nZW1fY3R4X3BhcmFtLmMgICAgICAgICAgfCAgICA0
ICstCiB0ZXN0cy9nZW1fY3R4X3NzZXUuYyAgICAgICAgICAgfCAxMDQwICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiB0ZXN0cy9tZXNvbi5idWlsZCAgICAgICAgICAgICAgfCAgICA3
ICsKIDE1IGZpbGVzIGNoYW5nZWQsIDE4ODUgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvZ2VtX2N0eF9zc2V1LmMKCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
