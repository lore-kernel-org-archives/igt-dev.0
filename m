Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8B889BD5
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2019 16:19:48 +0000 (UTC)
From: Neel Desai <neel.desai@intel.com>
Date: Tue, 16 Apr 2019 09:13:44 -0700
Message-Id: <cover.1555430824.git.neel.desai@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/1] igt_chamelium: Increase timeout for
 CaptureVideo
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

Rm9yIHNvbWUgY2hhbWVsaXVtIGJvYXJkcywgd2Ugb2JzZXJ2ZWQgdGhhdCB0aGUgY2hhbWVsaXVt
X3JwYygpCmNhbGwgd2l0aCBtZXRob2RfbmFtZSBhcyBDYXB0dXJlVmlkZW8gdGltZWQgb3V0IGJl
Y2F1c2UgdGhlIGRpc3BsYXkKcmVzb2x1dGlvbiByZWFkIGJ5IHRoZSBGUEdBIHVzaW5nIHRoZSBW
aWRlb0R1bXBlciBkaWQgbm90IG1hdGNoIHRoZQpyZXNvbHV0aW9uIGluIHRoZSBSWCBjaGlwLiBU
aGUgcmVzb2x1dGlvbiByZWFkIGJ5IHRoZSBGUEdBIGZyb20gdGhlCm1lbW9yeSB3YXMgaW5jb3Jy
ZWN0IGFmdGVyIDEwIHNlY29uZHMgYW5kIG5lZWRlZCBtb3JlIHRpbWUgdG8gc3RhYmlsaXplCnRv
IHRoZSBjb3JyZWN0IHZhbHVlLgoKU28sIGluc3RlYWQgb2YgY2hlY2tpbmcgdGhlIGNoYW1lbGl1
bS0+ZW52LmZhdWx0X29jY3VyZWQgaW4gdGhlCmNoYW1lbGl1bV9ycGMoKSBmdW50aW9uLCB3ZSBk
ZWZlciB0aGUgY2hlY2sgaW4gdGhlIHBhcmVudCBmdW5jdGlvbgpjaGFtZWxpdW1fY2FwdHVyZSgp
LiBXZSBpdGVyYXRlIHVwdG8gMTAgdGltZXMgaWYgY2hhbWVsaXVtX3JwYygpIHdpdGgKbWV0aG9k
IG5hbWUgYXMgQ2FwdHVyZVZpZGVvIGZhaWxzIHRodXMgZWZmZWN0aXZlbHkgaW5jcmVhc2luZyB0
aGUKdGltZW91dCB0byAxMDAgc2Vjb25kcyBpbnN0ZWFkIGlmIDEwIHNlY29uZHMuIElmIGFmdGVy
IDEwIGl0ZXJhdGlvbnMsCmNoYW1lbGl1bS0+ZW52LmZhdWx0X29jY3VyZWQgaXMgc3RpbGwgc2V0
LCB3ZSByZXR1cm4gYW4gZXJyb3IuCgpUaGlzIGxvb2tzIGxpa2UgYW4gaXNzdWUgZnJvbSBHb29n
bGUncyBlbmQgaW4gdGhlIEZQR0EgY29kZS4gVGhpcyBwYXRjaAppbnRyb2R1Y2VzIGEgd29ya2Fy
b3VuZCB0aWxsIHdlIGdldCB0aGUgaXNzdWUgcmVzb2x2ZWQgZnJvbSBHb29nbGUncwplbmQuCgpO
ZWVsIERlc2FpICgxKToKICBsaWIvaWd0X2NoYW1lbGl1bTogSW5jcmVhc2UgdGltZW91dCBmb3Ig
Q2FwdHVyZVZpZGVvCgogbGliL2lndF9jaGFtZWxpdW0uYyB8IDMzICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgotLQoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
