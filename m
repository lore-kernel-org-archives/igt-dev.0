Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808D56E1C7
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Apr 2018 02:37:59 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 10 Apr 2018 19:37:21 -0700
Message-Id: <20180411023732.32362-9-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 09/20] tests/psr: Check for PSR entry more
 often and only for a second.
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

MSBzZWNvbmQgaW50ZXJ2YWwgaXMgdG9vIGxvbmcsIGNoZWNrIGV2ZXJ5IDEwMG1zLgoKUFNSIGdl
dHMgZW5hYmxlZCB3aGVuIHBpcGVzIGFyZSBlbmFibGVkIG9uIEJEVysuIEl0IHNob3VsZG4ndCB0
YWtlCjUgc2Vjb25kcyBldmVuIG9uIFZMVi9DSFYsIHdoZXJlIHdlIGRlbGF5IGEgYml0LiBMaW1p
dCB0aGUgY2hlY2tzIHRvIGEKMSBzZWNvbmQgdG90YWwgd2FpdCwgc28gdGhhdCB3ZSBrbm93IGlm
IHRoZSBkZWxheSBpcyBsb25nZXIuCgpTaWduZWQtb2ZmLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFu
IDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcHNyX3Npbmtf
Y3JjLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMgYi90ZXN0cy9r
bXNfcHNyX3NpbmtfY3JjLmMKaW5kZXggZTA0ZTBmNmEuLmQ5NDBlYzg5IDEwMDY0NAotLS0gYS90
ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKKysrIGIvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jCkBA
IC0yMTQsMTEgKzIxNCwxMyBAQCBzdGF0aWMgYm9vbCBwc3JfZW5hYmxlZChkYXRhX3QgKmRhdGEp
CiAKIHN0YXRpYyBib29sIHdhaXRfcHNyX2VudHJ5KGRhdGFfdCAqZGF0YSkKIHsKLQlpbnQgdGlt
ZW91dCA9IDU7CisJaW50IHRpbWVvdXQgPSAxMDsKKwogCXdoaWxlICh0aW1lb3V0LS0pIHsKIAkJ
aWYgKHBzcl9lbmFibGVkKGRhdGEpKQogCQkJcmV0dXJuIHRydWU7Ci0JCXNsZWVwKDEpOworCQl1
c2xlZXAoMTAwMDAwKTsKKwkJaWd0X2RlYnVnKCJXYWl0aW5nIGZvciBQU1IgZW50cnkgJWQgbXNc
biIsICgxMC10aW1lb3V0KSoxMDApOwogCX0KIAlyZXR1cm4gZmFsc2U7CiB9Ci0tIAoyLjE0LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
