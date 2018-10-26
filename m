Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B468924B
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Oct 2018 14:14:54 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id z21-v6so1412574edb.11
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Oct 2018 07:14:54 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 26 Oct 2018 16:14:43 +0200
Message-Id: <20181026141443.17173-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_content_protection: restore for
 real before failing
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

Tm90aGluZyBoYXBwZW5zIGlmIHlvdSBkb24ndCBjb21taXQgLi4uCgpCdWd6aWxsYTogaHR0cHM6
Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA4NTUwCkJ1Z3ppbGxhOiBo
dHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDg1NDkKQ2M6IFJh
bWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2NvbnRlbnRf
cHJvdGVjdGlvbi5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9u
LmMgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMKaW5kZXggODdjN2E5YWJkMzhhLi4w
NjBhMDBmOTVkMDQgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19jb250ZW50X3Byb3RlY3Rpb24uYwor
KysgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMKQEAgLTE3NCwxMiArMTc0LDExIEBA
IHRlc3RfY3BfZW5hYmxlX2Rpc2FibGUoY29uc3QgZW51bSBwaXBlIHBpcGUsIGlndF9vdXRwdXRf
dCAqb3V0cHV0LAogCS8qIEZJWE1FOiBLZXJuZWwgdG90YWxseSBmYWxscyBvdmVyIGlmIHdlIGxl
YXZlIEhEQ1AgZW5hYmxlZC4gV29yawogCSAqIGFyb3VuZCB0aGlzIGZvciBub3cgYnkgcmVzdG9y
aW5nIGl0IGJlZm9yZSBjaGVjayB3aGV0aGVyIGl0IHdvcmtlZC4gKi8KIAlpZ3Rfb3V0cHV0X3Nl
dF9wcm9wX3ZhbHVlKG91dHB1dCwgSUdUX0NPTk5FQ1RPUl9DT05URU5UX1BST1RFQ1RJT04sIDAp
OwotCi0JaWd0X2Fzc2VydF9mKHJldCwgIkNvbnRlbnQgUHJvdGVjdGlvbiBub3QgZW5hYmxlZFxu
Iik7Ci0KIAlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1hcnksICZyZWQpOwogCWlndF9kaXNwbGF5X2Nv
bW1pdDIoZGlzcGxheSwgcyk7CiAKKwlpZ3RfYXNzZXJ0X2YocmV0LCAiQ29udGVudCBQcm90ZWN0
aW9uIG5vdCBlbmFibGVkXG4iKTsKKwogCS8qIFdhaXQgZm9yIEhEQ1AgdG8gYmUgZGlzYWJsZWQs
IGJlZm9yZSBjcnRjIG9mZiAqLwogCXdhaXRfZm9yX3Byb3BfdmFsdWUob3V0cHV0LCAwLCAxMDAw
KTsKIAotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
