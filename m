Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com
 [IPv6:2a00:1450:400c:c09::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7644689ADC
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Feb 2018 19:02:09 +0000 (UTC)
Received: by mail-wm0-x241.google.com with SMTP id b21so11869999wme.4
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Feb 2018 11:02:09 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Mon, 12 Feb 2018 19:01:56 +0000
Message-Id: <20180212190158.4710-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/2] intel-gpu-overlay:
 Queued/runnable/running engine stats
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

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClNob3cgZW5n
aW5lIGxvYWQgYW5kIGxvYWQgYXZlcmFnZSBpbiBpbnRlbC1ncHUtb3ZlcmxheS4gTWF0Y2hpbmcg
SUdUIHNlcmllcyB0bwpnbyB3aXRoOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzM2OTI2Ly4KClR2cnRrbyBVcnN1bGluICgyKToKICBpbnRlbC1ncHUtb3ZlcmxheTog
QWRkIGVuZ2luZSBxdWV1ZSBzdGF0cwogIGludGVsLWdwdS1vdmVybGF5OiBTaG93IDFzLCAzMHMg
YW5kIDE1bSBHUFUgbG9hZAoKIGxpYi9pZ3RfcGVyZi5oICAgIHwgMTggKysrKysrKysrKysrLQog
b3ZlcmxheS9ncHUtdG9wLmMgfCA3OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystCiBvdmVybGF5L2dwdS10b3AuaCB8IDIxICsrKysrKysrKysr
KysrLQogb3ZlcmxheS9vdmVybGF5LmMgfCAzNiArKysrKysrKysrKysrKysrKysrLS0tLS0tCiA0
IGZpbGVzIGNoYW5nZWQsIDE0MyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCi0tIAoy
LjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
