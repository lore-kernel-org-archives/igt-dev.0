Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C7289958
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Nov 2018 10:58:24 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 27 Nov 2018 12:58:16 +0200
Message-Id: <20181127105816.15842-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Use %lx for printing unsigned longs
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Li4vcnVubmVyL2V4ZWN1dG9yLmM6NTU1OjU0OiB3YXJuaW5nOiBmb3JtYXQg4oCYJXjigJkgZXhw
ZWN0cyBhcmd1bWVudCBvZiB0eXBlIOKAmHVuc2lnbmVkIGludOKAmSwgYnV0IGFyZ3VtZW50IDMg
aGFzIHR5cGUg4oCYbG9uZyB1bnNpZ25lZCBpbnTigJkgWy1XZm9ybWF0PV0KZnByaW50ZihzdGRl
cnIsICJDaGlsZCByZWZ1c2VzIHRvIGRpZSwgdGFpbnRlZCAleC4gQWJvcnRpbmcuXG4iLAogICAg
ICAgICAgICAgICAgfl4KCkZpeGVzOiBhNmI1MTRkMjQyYmQgKCJydW5uZXI6IEJlIHBhdGllbnQg
Zm9yIHByb2Nlc3NlcyB0byBkaWUiKQpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRy
aS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgotLS0KIHJ1bm5lci9leGVjdXRvci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9y
LmMgYi9ydW5uZXIvZXhlY3V0b3IuYwppbmRleCA2MjkwMWQ4Ni4uNGEwYTEyMTkgMTAwNjQ0Ci0t
LSBhL3J1bm5lci9leGVjdXRvci5jCisrKyBiL3J1bm5lci9leGVjdXRvci5jCkBAIC01NTIsNyAr
NTUyLDcgQEAgc3RhdGljIGludCBtb25pdG9yX291dHB1dChwaWRfdCBjaGlsZCwKIAogCQkJCS8q
IE5vdGhpbmcgdGhhdCBjYW4gYmUgZG9uZSwgcmVhbGx5LiBMZXQncyB0ZWxsIHRoZSBjYWxsZXIg
d2Ugd2FudCB0byBhYm9ydC4gKi8KIAkJCQlpZiAoc2V0dGluZ3MtPmxvZ19sZXZlbCA+PSBMT0df
TEVWRUxfTk9STUFMKSB7Ci0JCQkJCWZwcmludGYoc3RkZXJyLCAiQ2hpbGQgcmVmdXNlcyB0byBk
aWUsIHRhaW50ZWQgJXguIEFib3J0aW5nLlxuIiwKKwkJCQkJZnByaW50ZihzdGRlcnIsICJDaGls
ZCByZWZ1c2VzIHRvIGRpZSwgdGFpbnRlZCAlbHguIEFib3J0aW5nLlxuIiwKIAkJCQkJCXRhaW50
cyk7CiAJCQkJfQogCQkJCWNsb3NlX3dhdGNoZG9ncyhzZXR0aW5ncyk7Ci0tIAoyLjE5LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
