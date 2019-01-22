Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2396E384
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 13:42:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z5so27345126wrt.11
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 05:42:28 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 22 Jan 2019 14:42:12 +0100
Message-Id: <20190122134215.28396-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20190122134215.28396-1-daniel.vetter@ffwll.ch>
References: <20190122134215.28396-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/7] automake: Point builders at meson
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QXBwYXJlbnRseSBhbGwgdGhlIGRvYyBjaGFuZ2VzIGFyZW4ndCBnb29kIGVub3VnaCB5ZXQgLi4u
CgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
LS0tCiBjb25maWd1cmUuYWMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCmluZGV4IDVmNTNlYTYz
NzBkNi4uMDU5NTJlZGJhOGZlIDEwMDY0NAotLS0gYS9jb25maWd1cmUuYWMKKysrIGIvY29uZmln
dXJlLmFjCkBAIC0zNTQsNSArMzU0LDcgQEAgZWNobyAiICAgICAgIFRlc3QgcnVubmVyICAgICAg
ICA6ICR7QlVJTERfUlVOTkVSfSIKIGVjaG8gIiIKIGVjaG8gIiDigKIgRmFpbCBvbiB3YXJuaW5n
cyAgICAgICA6ICR7ZW5hYmxlX3dlcnJvcn0iCiBlY2hvICIiCitlY2hvICIgV0FSTklORzogYXV0
b21ha2UgaXMgZGVwcmVjYXRlZCwgcGxlYXNlIHVzZSBtZXNvbiIKK2VjaG8gIiIKIAogIyB2aW06
IHNldCBmdD1jb25maWcgdHM9OCBzdz04IHR3PTAgbm9ldCA6Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
