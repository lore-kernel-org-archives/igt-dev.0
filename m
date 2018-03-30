Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8E36E055
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Mar 2018 15:49:32 +0000 (UTC)
From: Daniel Stone <daniels@collabora.com>
Date: Fri, 30 Mar 2018 16:49:27 +0100
Message-Id: <20180330154928.20555-2-daniels@collabora.com>
In-Reply-To: <20180330154928.20555-1-daniels@collabora.com>
References: <20180330154928.20555-1-daniels@collabora.com>
Subject: [igt-dev] [PATCH i-g-t 2/3] NOMERGE: include: Add getfb2 ioctl
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

Tm90IHlldCBhY3R1YWxseSBtZXJnZWQgdG8gYW4gYWN0dWFsIGtlcm5lbCB0cmVlLgotLS0KIGlu
Y2x1ZGUvZHJtLXVhcGkvZHJtLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtLXVhcGkvZHJtLmggYi9pbmNsdWRlL2RybS11YXBp
L2RybS5oCmluZGV4IGYwYmQ5MWRlLi5jMGEzNTg3OCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0t
dWFwaS9kcm0uaAorKysgYi9pbmNsdWRlL2RybS11YXBpL2RybS5oCkBAIC04ODYsNiArODg2LDcg
QEAgZXh0ZXJuICJDIiB7CiAjZGVmaW5lIERSTV9JT0NUTF9NT0RFX0xJU1RfTEVTU0VFUwlEUk1f
SU9XUigweEM3LCBzdHJ1Y3QgZHJtX21vZGVfbGlzdF9sZXNzZWVzKQogI2RlZmluZSBEUk1fSU9D
VExfTU9ERV9HRVRfTEVBU0UJRFJNX0lPV1IoMHhDOCwgc3RydWN0IGRybV9tb2RlX2dldF9sZWFz
ZSkKICNkZWZpbmUgRFJNX0lPQ1RMX01PREVfUkVWT0tFX0xFQVNFCURSTV9JT1dSKDB4QzksIHN0
cnVjdCBkcm1fbW9kZV9yZXZva2VfbGVhc2UpCisjZGVmaW5lIERSTV9JT0NUTF9NT0RFX0dFVEZC
MgkJRFJNX0lPV1IoMHhDQSwgc3RydWN0IGRybV9tb2RlX2ZiX2NtZDIpCiAKIC8qKgogICogRGV2
aWNlIHNwZWNpZmljIGlvY3RscyBzaG91bGQgb25seSBiZSBpbiB0aGVpciByZXNwZWN0aXZlIGhl
YWRlcnMKLS0gCjIuMTcuMC5yYzEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
