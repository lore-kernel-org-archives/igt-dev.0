Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B032F6E425
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Dec 2020 16:27:09 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 17 Dec 2020 18:26:49 +0200
Message-Id: <20201217162703.20779-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 00/14] tools/intel_display_poller: async
 flip and vrr
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
ZCBzb21lIGFzeW5jIGZsaXAgYW5kIHZyciB0ZXN0IG1vZGVzIHRvIGludGVsX2Rpc3BsYXlfcG9s
bGVyLgpJJ3ZlIGJlZW4gdXNpbmcgdGhlc2UgdG8gcmV2ZXJzZSBlbmdpbmVlciB0aGUgaGFyZHdh
cmUgYmVoYXZpb3VyLgoKVmlsbGUgU3lyasOkbMOkICgxNCk6CiAgdG9vbHMvaW50ZWxfZGlzcGxh
eV9wb2xsZXI6IEZpeCBUSUxFT0ZGIHZzLiBMSU5PRkYgZm9yIHNrbCsKICB0b29scy9pbnRlbF9k
aXNwbGF5X3BvbGxlcjogVW5pZnkgaWxrKyBhbmQgYmR3KyBjb2RlcGF0aHMKICB0b29scy9pbnRl
bF9kaXNwbGF5X3BvbGxlcjogVXNlIGludGVsX2dlbigpCiAgdG9vbHMvaW50ZWxfZGlzcGxheV9w
b2xsZXI6IEFkZCBwaXBlIEQgc3VwcG9ydAogIHRvb2xzL2ludGVsX2Rpc3BsYXlfcG9sbGVyOiBB
ZGQgZmxpcGRvbmUgdGVzdHMKICB0b29scy9pbnRlbF9kaXNwbGF5X3BvbGxlcjogQWRkIGFzeW5j
IGZsaXAgdGVzdCBtb2RlCiAgbGliOiBBZGQgdHJhbnNjb2RlciBWUlIgcmVnaXN0ZXJzCiAgbGli
OiBBZGQgdGltZXN0bWFwIHJlZ2lzdGVycwogIHRvb2xzL2ludGVsX2Rpc3BsYXlfcG9sbGVyOiBF
eHRyYWN0IHdhaXRfc2NhbmxpbmUoKQogIHRvb2xzL2ludGVsX2Rpc3BsYXlfcG9sbGVyOiBBZGQg
ZnJhbWUgdGltZXN0YW1wIHRlc3RzCiAgdG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXI6IFJld29y
ayBzb21lIGxvb3BzCiAgdG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXI6IEFkZCBWUlIgcHVzaCBz
dXBwb3J0CiAgdG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXI6IEFkZCB2cnItd3JhcCB0ZXN0CiAg
dG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXI6IEFkZCB2cnItcHVzaCB0ZXN0CgogbGliL2ludGVs
X3JlZy5oICAgICAgICAgICAgICB8ICA0MyArKysKIHRvb2xzL2ludGVsX2Rpc3BsYXlfcG9sbGVy
LmMgfCA3MTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgNjM1IGluc2VydGlvbnMoKyksIDEyNyBkZWxldGlvbnMoLSkKCi0tIAoyLjI2LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
