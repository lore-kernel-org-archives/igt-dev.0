Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59DA6EBA3
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Mar 2018 16:17:01 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Fri, 16 Mar 2018 17:16:57 +0100
Message-Id: <20180316161657.21398-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] kms_frontbuffer_tracking: Fix PSR reporting
 after PSR active flag is removed.
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

RWl0aGVyIHRoZSBtYWluIGxpbmsgaW4gc3RhbmRieSBtb2RlIG9yIGh3IGVuYWJsZWQgaXMgZW5v
dWdoIHRvCnNheSB0aGF0IFBTUiBpcyBhY3RpdmF0ZWQsIHNvIGp1c3QgdXNlIGJvdGguCgpCdWd6
aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1NTE5
ClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51
eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyBiL3Rlc3RzL2ttc19mcm9udGJ1
ZmZlcl90cmFja2luZy5jCmluZGV4IDQ1NDEwM2QzNjdjNy4uZTRkYTcwNmIwNjMxIDEwMDY0NAot
LS0gYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYworKysgYi90ZXN0cy9rbXNfZnJv
bnRidWZmZXJfdHJhY2tpbmcuYwpAQCAtNzgxLDcgKzc4MSw3IEBAIHN0YXRpYyBib29sIHBzcl9p
c19lbmFibGVkKHZvaWQpCiAJY2hhciBidWZbMjU2XTsKIAogCWRlYnVnZnNfcmVhZCgiaTkxNV9l
ZHBfcHNyX3N0YXR1cyIsIGJ1Zik7Ci0JcmV0dXJuIHN0cnN0cihidWYsICJcbkFjdGl2ZTogeWVz
XG4iKSAmJgorCXJldHVybiBzdHJzdHIoYnVmLCAiXG5NYWluIGxpbmsgaW4gc3RhbmRieSBtb2Rl
OiB5ZXNcbiIpIHx8CiAJICAgICAgIHN0cnN0cihidWYsICJcbkhXIEVuYWJsZWQgJiBBY3RpdmUg
Yml0OiB5ZXNcbiIpOwogfQogCi0tIAoyLjE2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
