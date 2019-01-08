Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id C42C16EF8A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jan 2019 15:20:04 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue,  8 Jan 2019 16:19:53 +0100
Message-Id: <20190108152001.5367-7-maxime.ripard@bootlin.com>
In-Reply-To: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
References: <cover.58d25323616120b55c27ab28cdac25877a37bd78.1546960696.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 07/13] igt: fb: Account for all planes bpp
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
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2hlbiBhbGxvY2F0aW5nIGEgZHVtYiBidWZmZXIgZm9yIGEgZm9ybWF0IHdpdGggbXVsdGlwbGUg
cGxhbmUsIHdlIG5lZWQgdG8KYWNjb3VudCBmb3IgYWxsIHBsYW5lJ3MgYnBwIGluIG9yZGVyIHRv
IGFsbG9jYXRlIHRoZSBwcm9wZXIgc2l6ZS4KCkxldCdzIGFkZCBhbGwgdGhlIHBsYW5lcyBicHAg
YW5kIHVzZSB0aGUgcmVzdWx0IHRvIGFsbG9jYXRlIG91ciBidWZmZXIuCgpTaWduZWQtb2ZmLWJ5
OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgotLS0KIGxpYi9pZ3Rf
ZmIuYyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMKaW5kZXgg
MmMzM2E4OTliYzA0Li45NmQ1NmQwZTYzYmUgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZmIuYworKysg
Yi9saWIvaWd0X2ZiLmMKQEAgLTUyOSw2ICs1MjksNyBAQCBzdGF0aWMgdm9pZCBjbGVhcl95dXZf
YnVmZmVyKHN0cnVjdCBpZ3RfZmIgKmZiKQogc3RhdGljIGludCBjcmVhdGVfYm9fZm9yX2ZiKHN0
cnVjdCBpZ3RfZmIgKmZiKQogewogCXVpbnQ2NF90IHNpemUgPSBjYWxjX2ZiX3NpemUoZmIpOwor
CXVuc2lnbmVkIGludCBwbGFuZSwgYnBwOwogCWludCBmZCA9IGZiLT5mZDsKIAogCS8qIHJlc3Bl
Y3QgdGhlIHNpemUgcmVxdWVzdGVkIGJ5IHRoZSBjYWxsZXIgKi8KQEAgLTU1NywxMCArNTU4LDEy
IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2JvX2Zvcl9mYihzdHJ1Y3QgaWd0X2ZiICpmYikKIAkJfQog
CX0KIAorCWZvciAocGxhbmUgPSAwOyBwbGFuZSA8IGZiLT5udW1fcGxhbmVzOyBwbGFuZSsrKQor
CQlicHAgKz0gZmItPnBsYW5lX2JwcFtwbGFuZV07CisKIAlmYi0+aXNfZHVtYiA9IHRydWU7CiAJ
ZmItPmdlbV9oYW5kbGUgPSBrbXN0ZXN0X2R1bWJfY3JlYXRlKGZkLCBmYi0+d2lkdGgsIGZiLT5o
ZWlnaHQsCi0JCQkJCSAgICAgZmItPnBsYW5lX2JwcFswXSwKLQkJCQkJICAgICAmZmItPnN0cmlk
ZXNbMF0sICZmYi0+c2l6ZSk7CisJCQkJCSAgICAgYnBwLCAmZmItPnN0cmlkZXNbMF0sICZmYi0+
c2l6ZSk7CiAKIAlyZXR1cm4gZmItPmdlbV9oYW5kbGU7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
