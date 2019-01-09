Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5DE6E60D
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jan 2019 12:54:26 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed,  9 Jan 2019 14:55:11 +0200
Message-Id: <20190109125513.17460-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/kms_cursor_crc: Change crc
 collection
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

T24gSUNMIHBsYXRmb3JtIHdlIGRvIGdldCBhIGxvdCBvZiBjcmMgbWlzbWF0Y2ggZXJyb3JzLiBU
aGlzIHBhdGNoCnNlcmllcyBjaGFuZ2VzIHRoZSB3YXkgd2UgY29sbGVjdCB0aGVzZSBjcmMncyBh
bmQgd2UgZ2V0IHJpZCBvZgp2Ymxhbmsgd2FpdHMgdGhhdCBhcmUgdW5uZWNlc3Nhcnkgd2l0aCB0
aGUgcHJvcG9zZWQgd2F5IHRvIGNvbGxlY3QgY3Jjcy4KCkJ1Z3ppbGxhOiBodHRwczovL2J1Z3Mu
ZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDMyMzIKCk1pa2EgS2Fob2xhICgyKToK
ICB0ZXN0cy9rbXNfY3Vyc29yX2NyYzogQ2hhbmdlIHRoZSB3YXkgd2UgY29sbGVjdCBjcmMncwog
IHRlc3RzL2ttc19jdXJzb3JfY3JjOiBSZW1vdmUgdW5uZWNlc3Nhcnkgd2FpdHMgZm9yIHZibGFu
awoKIHRlc3RzL2ttc19jdXJzb3JfY3JjLmMgfCA5ICsrKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
