Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F15A6E072
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Mar 2021 20:32:20 +0000 (UTC)
From: Manasi Navare <manasi.d.navare@intel.com>
Date: Mon,  1 Mar 2021 12:37:33 -0800
Message-Id: <20210301203747.7177-1-manasi.d.navare@intel.com>
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

QWRkIFZSUiBhbmQgYXN5bmMgZmxpcHMgc3VwcG9ydCB0byBkaXNwbGF5IHBvbGxlcgoKVmlsbGUg
U3lyasOkbMOkICgxNCk6CiAgdG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXI6IEZpeCBUSUxFT0ZG
IHZzLiBMSU5PRkYgZm9yIHNrbCsKICB0b29scy9pbnRlbF9kaXNwbGF5X3BvbGxlcjogVW5pZnkg
aWxrKyBhbmQgYmR3KyBjb2RlcGF0aHMKICB0b29scy9pbnRlbF9kaXNwbGF5X3BvbGxlcjogVXNl
IGludGVsX2dlbigpCiAgdG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXI6IEFkZCBwaXBlIEQgc3Vw
cG9ydAogIHRvb2xzL2ludGVsX2Rpc3BsYXlfcG9sbGVyOiBBZGQgZmxpcGRvbmUgdGVzdHMKICB0
b29scy9pbnRlbF9kaXNwbGF5X3BvbGxlcjogQWRkIGFzeW5jIGZsaXAgdGVzdCBtb2RlCiAgbGli
OiBBZGQgdHJhbnNjb2RlciBWUlIgcmVnaXN0ZXJzCiAgbGliOiBBZGQgdGltZXN0bWFwIHJlZ2lz
dGVycwogIHRvb2xzL2ludGVsX2Rpc3BsYXlfcG9sbGVyOiBFeHRyYWN0IHdhaXRfc2NhbmxpbmUo
KQogIHRvb2xzL2ludGVsX2Rpc3BsYXlfcG9sbGVyOiBBZGQgZnJhbWUgdGltZXN0YW1wIHRlc3Rz
CiAgdG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXI6IFJld29yayBzb21lIGxvb3BzCiAgdG9vbHMv
aW50ZWxfZGlzcGxheV9wb2xsZXI6IEFkZCBWUlIgcHVzaCBzdXBwb3J0CiAgdG9vbHMvaW50ZWxf
ZGlzcGxheV9wb2xsZXI6IEFkZCB2cnItd3JhcCB0ZXN0CiAgdG9vbHMvaW50ZWxfZGlzcGxheV9w
b2xsZXI6IEFkZCB2cnItcHVzaCB0ZXN0CgogbGliL2ludGVsX3JlZy5oICAgICAgICAgICAgICB8
ICA0MyArKysKIHRvb2xzL2ludGVsX2Rpc3BsYXlfcG9sbGVyLmMgfCA3MTkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNjM1IGluc2VydGlvbnMo
KyksIDEyNyBkZWxldGlvbnMoLSkKCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
