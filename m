Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x233.google.com (mail-wr0-x233.google.com
 [IPv6:2a00:1450:400c:c0c::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B016E196
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Apr 2018 09:53:07 +0000 (UTC)
Received: by mail-wr0-x233.google.com with SMTP id z73-v6so39456514wrb.0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Apr 2018 02:53:07 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Mon, 23 Apr 2018 10:52:34 +0100
Message-Id: <20180423095238.29238-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t v3 0/4] trace.pl fixes
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClJlbWFpbmlu
ZyB1bnJldmlld2VkIChhbmQgb25lIGFsbW9zdCByZXZpZXdlZCkgcGF0Y2hlcyB0byBmaXgga25v
d24gb3V0c3RhbmRpbmcKaXNzdWVzIGluIHRyYWNlLnBsIGFuZCBpbXByb3ZlIGl0cyByZXF1ZXN0
IHNwbGl0IG1vZGUuCgpUaGlzIHdpbGwgYmUgdXNlZnVsIGZvciBWaXJ0dWFsIEVuZ2luZSBkZXZl
bG9wbWVudCB3aGljaCBpcyBjdXJyZW50bHkgb25nb2luZy4KClR2cnRrbyBVcnN1bGluICg0KToK
ICB0cmFjZS5wbDogQWRkIHN1cHBvcnQgZm9yIGNvbG91cmluZyBjb250ZXh0IGV4ZWN1dGlvbgog
IHRyYWNlLnBsOiBGaXggZW5naW5lIGJ1c3kgYWNjb3VudGluZyBpbiBzcGxpdCBtb2RlCiAgdHJh
Y2UucGw6IEZpeCBpbmNvbXBsZXRlIHJlcXVlc3QgaGFuZGxpbmcKICB0cmFjZS5wbDogRml4IHJl
cXVlc3Qgc3BsaXQgbW9kZQoKIHNjcmlwdHMvdHJhY2UucGwgfCAyNjQgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIxMCBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkKCi0tIAoyLjE0LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
