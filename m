Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855266F2FD
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jan 2019 12:50:36 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu, 10 Jan 2019 14:51:23 +0200
Message-Id: <20190110125125.26374-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 0/2] tests/kms_cursor_crc: Change crc
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
Cc: stanislav.lisovskiy@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T24gSUNMIHBsYXRmb3JtIHdlIGRvIGdldCBhIGxvdCBvZiBjcmMgbWlzbWF0Y2ggZXJyb3JzLiBU
aGlzIHBhdGNoCnNlcmllcyBjaGFuZ2VzIHRoZSB3YXkgd2UgY29sbGVjdCB0aGVzZSBjcmMncyBh
bmQgd2UgZ2V0IHJpZCBvZgp2Ymxhbmsgd2FpdHMgdGhhdCBhcmUgdW5uZWNlc3Nhcnkgd2l0aCB0
aGUgcHJvcG9zZWQgd2F5IHRvIGNvbGxlY3QgY3Jjcy4KCnYyOiBTdG9wIGNvbGxlY3RpbmcgY3Jj
J3MgYWZ0ZXIgdGVzdCBjb21wbGV0aW9uCgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNr
dG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTAzMjMyCgpNaWthIEthaG9sYSAoMik6CiAgdGVzdHMv
a21zX2N1cnNvcl9jcmM6IENoYW5nZSB0aGUgd2F5IHdlIGNvbGxlY3QgY3JjJ3MKICB0ZXN0cy9r
bXNfY3Vyc29yX2NyYzogUmVtb3ZlIHVubmVjZXNzYXJ5IHdhaXRzIGZvciB2YmxhbmsKCiB0ZXN0
cy9rbXNfY3Vyc29yX2NyYy5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
