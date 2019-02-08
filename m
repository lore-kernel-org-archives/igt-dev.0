Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C086EDDD
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 13:35:51 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 745B93A7F7B
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 14:19:37 +0100 (CET)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Fri,  8 Feb 2019 14:18:53 +0100
Message-Id: <20190208131901.1400-3-maxime.ripard@bootlin.com>
In-Reply-To: <20190208131901.1400-1-maxime.ripard@bootlin.com>
References: <20190208131901.1400-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 02/10] igt: fb: Add size checks and
 recalculation before dumb allocation
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

U2luY2Ugd2Ugd2FudCB0byB1c2UgdGhlIGR1bWIgYnVmZmVycyB0byBzdG9yZSBmcmFtZXMgaW4g
Zm9ybWF0cyB3aXRoCm11bHRpcGxlIHBsYW5lcywgd2UgbmVlZCB0byBhZGQgY2hlY2tzIGZvciB1
bnN1cHBvcnRlZCBjb3JuZXIgY2FzZXMsIGFuZCB3ZQpuZWVkIHRvIGNhbGN1bGF0ZSB0aGUgb2Zm
c2V0cyBhbmQgc2l6ZXMgb2YgZWFjaCBwbGFuZXMuIExldCdzIHVzZQpjYWxjX2ZiX3NpemUgZm9y
IHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3Rs
aW4uY29tPgotLS0KIGxpYi9pZ3RfZmIuYyB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9m
Yi5jCmluZGV4IGM2MWU2ODA1ZmY3YS4uY2E0ODY1NTE5YzEzIDEwMDY0NAotLS0gYS9saWIvaWd0
X2ZiLmMKKysrIGIvbGliL2lndF9mYi5jCkBAIC01NjEsNiArNTYxLDE2IEBAIHN0YXRpYyBpbnQg
Y3JlYXRlX2JvX2Zvcl9mYihzdHJ1Y3QgaWd0X2ZiICpmYikKIAkJfQogCX0KIAorCS8qCisJICog
VGhlIGN1cnJlbnQgZHVtYiBidWZmZXIgYWxsb2NhdGlvbiBBUEkgZG9lc24ndCByZWFsbHkgYWxs
b3cgdG8KKwkgKiBzcGVjaWZ5IGEgY3VzdG9tIHNpemUgb3Igc3RyaWRlLiBZZXQgdGhlIGNhbGxl
ciBpcyBmcmVlIHRvIHNwZWNpZnkKKwkgKiB0aGVtLCBzbyB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0
byBlcnJvciBvdXQgaW4gdGhpcyBjYXNlLgorCSAqLworCWlndF9hc3NlcnQoZmItPnNpemUgPT0g
MCk7CisJaWd0X2Fzc2VydChmYi0+c3RyaWRlc1swXSA9PSAwKTsKKworCWZiLT5zaXplID0gY2Fs
Y19mYl9zaXplKGZiKTsKKwogCWZiLT5pc19kdW1iID0gdHJ1ZTsKIAlmYi0+Z2VtX2hhbmRsZSA9
IGttc3Rlc3RfZHVtYl9jcmVhdGUoZmQsIGZiLT53aWR0aCwgZmItPmhlaWdodCwKIAkJCQkJICAg
ICBmYi0+cGxhbmVfYnBwWzBdLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
