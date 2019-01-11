Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A3BE6F59C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 09:06:29 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Fri, 11 Jan 2019 10:05:16 +0100
Message-Id: <20190111090532.19235-6-paul.kocialkowski@bootlin.com>
In-Reply-To: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 05/21] lib/igt_fb: Allow interpreting the
 tile height as a stride equivalent
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
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIFZDNCBTQU5EIHRpbGluZyBtb2RlcyBhcmUgZGlzcG9zZWQgaW4gY29sdW1ucyB0aGF0IGZv
bGxvdyBlYWNoCm90aGVyIGluIG1lbW9yeS4gVGhlIGNvbHVtbiBoZWlnaHQgZGVmaW5lcyB0aGUg
bnVtYmVyIG9mIGZpeGVkLXdpZHRoCmxpbmVzIGZyb20gdGhlIGJlZ2lubmluZyBvZiBvbmUgY29s
dW1uIHRvIHRoZSBvdGhlciwgd2hpY2ggbWF5IGJlCmdyZWF0ZXIgdGhhbiB0aGUgZGlzcGxheSBo
ZWlnaHQuIEluIHRoaXMgY2FzZSwgdGhlIGV4dHJhIGxpbmVzIGFyZQp1c2VkIGFzIHBhZGRpbmcg
YW5kIHRoZSBjb2x1bW4gaGVpZ2h0IGJlY29tZXMgYSBoZWlnaHQtYmFzZWQgc3RyaWRlCmVxdWl2
YWxlbnQuCgpTdXBwb3J0IHRoaXMgd2hlbiBjYWxjdWxhdGluZyB0aGUgcGxhbmUgc2l6ZSBieSB1
c2luZyB0aGUgdGlsZSBoZWlnaHQKZGlyZWN0bHkgaWYgaXQgaXMgZ3JlYXRlciB0aGFuIHRoZSBw
bGFuZSBoZWlnaHQuIFRoaXMgd29ya3MgYmV0dGVyIHRoYW4KYWxpZ25tZW50IGZvciBub24tcG93
ZXItb2YtdHdvIGNhc2VzIChubyBzcGFjZSBpcyB3YXN0ZWQpIGFuZCBpdCBpcwplcXVpdmFsZW50
IHRvIGFsaWdubWVudCBmb3IgcG93ZXItb2YtdHdvIHRpbGUgaGVpZ2h0cy4KClNpZ25lZC1vZmYt
Ynk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KLS0t
CiBsaWIvaWd0X2ZiLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMKaW5kZXggN2ZiOGU3
ZDQ0YmQyLi4wM2E2YjhiZTk2MTggMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZmIuYworKysgYi9saWIv
aWd0X2ZiLmMKQEAgLTQ1MCw2ICs0NTAsMTMgQEAgc3RhdGljIHVpbnQ2NF90IGNhbGNfcGxhbmVf
c2l6ZShzdHJ1Y3QgaWd0X2ZiICpmYiwgaW50IHBsYW5lKQogCQlpZ3RfZ2V0X2ZiX3RpbGVfc2l6
ZShmYi0+ZmQsIGZiLT50aWxpbmcsIGZiLT5wbGFuZV9icHBbcGxhbmVdLAogCQkJCSAgICAgJnRp
bGVfd2lkdGgsICZ0aWxlX2hlaWdodCk7CiAKKwkJLyogU3BlY2lhbCBjYXNlIHdoZXJlIHRoZSAi
dGlsZSBoZWlnaHQiIHJlcHJlc2VudHMgYQorCQkgKiBoZWlnaHQtYmFzZWQgc3RyaWRlLCBzdWNo
IGFzIHdpdGggVkM0IFNBTkQgdGlsaW5nIG1vZGVzLgorCQkgKi8KKworCQlpZiAodGlsZV9oZWln
aHQgPiBmYi0+cGxhbmVfaGVpZ2h0W3BsYW5lXSkKKwkJCXJldHVybiBmYi0+c3RyaWRlc1twbGFu
ZV0gKiB0aWxlX2hlaWdodDsKKwogCQlyZXR1cm4gKHVpbnQ2NF90KSBmYi0+c3RyaWRlc1twbGFu
ZV0gKgogCQkJQUxJR04oZmItPnBsYW5lX2hlaWdodFtwbGFuZV0sIHRpbGVfaGVpZ2h0KTsKIAl9
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
