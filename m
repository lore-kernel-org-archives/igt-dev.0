Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com
 [IPv6:2a00:1450:400c:c09::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC606F000
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jun 2018 12:49:16 +0000 (UTC)
Received: by mail-wm0-x234.google.com with SMTP id r15-v6so11269605wmc.1
 for <igt-dev@lists.freedesktop.org>; Wed, 06 Jun 2018 05:49:16 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Wed,  6 Jun 2018 13:49:01 +0100
Message-Id: <20180606124907.13139-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/6] Queued/runnable/running engine stats
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
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClRlc3RzIGZv
ciBuZXcgUE1VIGNvdW50ZXJzLCBuZXcgcXVlcnkgYW5kIGFkZGluZyBzdXBwb3J0IHRvIGludGVs
X2dwdV90b3AgYW5kCmludGVsX2dwdV9vdmVybGF5IHRvIHNob3cgcXVldWUgZGVwdGhzIGFuZCBH
UFUgbG9hZCBhdmVyYWdlIG1ldHJpYy4KClR2cnRrbyBVcnN1bGluICg2KToKICBpbmNsdWRlOiBp
OTE1IHVBUEkgaGVhZGVycwogIGludGVsLWdwdS1vdmVybGF5OiBBZGQgZW5naW5lIHF1ZXVlIHN0
YXRzCiAgaW50ZWwtZ3B1LW92ZXJsYXk6IFNob3cgMXMsIDMwcyBhbmQgMTVtIEdQVSBsb2FkCiAg
dGVzdHMvcGVyZl9wbXU6IEFkZCB0ZXN0cyBmb3IgZW5naW5lIHF1ZXVlZC9ydW5uYWJsZS9ydW5u
aW5nIHN0YXRzCiAgaW50ZWwtZ3B1LXRvcDogQWRkIHF1ZXVlIGRlcHRocyBhbmQgbG9hZCBhdmVy
YWdlCiAgdGVzdHMvaTkxNV9xdWVyeTogRW5naW5lIHF1ZXVlcyB0ZXN0cwoKIGluY2x1ZGUvZHJt
LXVhcGkvaTkxNV9kcm0uaCB8ICAxOSArLQogb3ZlcmxheS9ncHUtdG9wLmMgICAgICAgICAgIHwg
IDgxICsrKysrKy0KIG92ZXJsYXkvZ3B1LXRvcC5oICAgICAgICAgICB8ICAyMiArLQogb3Zlcmxh
eS9vdmVybGF5LmMgICAgICAgICAgIHwgIDM1ICsrLQogdGVzdHMvaTkxNV9xdWVyeS5jICAgICAg
ICAgIHwgNDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdGVzdHMvcGVy
Zl9wbXUuYyAgICAgICAgICAgIHwgMjU4ICsrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvTWFr
ZWZpbGUuYW0gICAgICAgICAgIHwgICAyICstCiB0b29scy9pbnRlbF9ncHVfdG9wLmMgICAgICAg
fCAxMjIgKysrKysrKystLQogdG9vbHMvbWVzb24uYnVpbGQgICAgICAgICAgIHwgICAyICstCiA5
IGZpbGVzIGNoYW5nZWQsIDk1OCBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
