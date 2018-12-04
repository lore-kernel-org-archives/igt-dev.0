Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0AB6789AEB
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Dec 2018 10:08:38 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue,  4 Dec 2018 11:08:13 +0100
Message-Id: <cover.c2054fa47f16b6319869fa4a8a2357a3a13e6d6c.1543917797.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/8] igt: chamelium: Test YUV buffers using
 the Chamelium
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

SGksCgpIZXJlIGlzIGEgZmlyc3QgYXR0ZW1wdCBhdCBleHBhbmRpbmcgdGhlIGN1cnJlbnQgQ2hh
bWVsaXVtIGZvcm1hdHMKdGVzdCB0byB0aGUgTlYxMiBmb3JtYXQuCgpJdCBidWlsZHMgb24gdG9w
IG9mIHRoZSBjdXJyZW50IGluZnJhc3RydWN0dXJlIGZvciB0aGUgTlYxMgpjb252ZXJ0aW9uLCBh
bmQgdGhlIGZvcm1hdCBzdXBwcG9ydCBvZiB0aGUgQ2hhbWVsaXVtLgoKTGV0IG1lIGtub3cgd2hh
dCB5b3UgdGhpbmssCk1heGltZQoKTWF4aW1lIFJpcGFyZCAoNik6CiAgaWd0OiB0ZXN0czogY2hh
bWVsaXVtOiBTdGFydCB0byB1bmlmeSB0ZXN0cwogIGlndDogdGVzdHM6IGNoYW1lbGl1bTogQ29u
dmVydCBWR0EgdGVzdHMgdG8gZG9fdGVzdF9kaXNwbGF5CiAgaWd0OiBmYjogTW92ZSBpOTE1IGJ1
ZmZlciBhbGxvY2F0aW9uIHRvIGEgZnVuY3Rpb24gb2YgaXRzIG93bgogIGlndDogZmI6IFNlcGFy
YXRlIFlVViBhbGxvY2F0aW9uIGZyb20gdGhlIHJlc3QKICBpZ3Q6IGZiOiBGYWxsYmFjayBvbiBL
TVMgZHVtYiBidWZmZXIgYWxsb2NhdGlvbiBmb3IgWVVWIGJ1ZmZlcnMKICBpZ3Q6IHRlc3RzOiBj
aGFtZWxpdW06IEFkZCBOVjEyIGZvcm1hdAoKUGF1bCBLb2NpYWxrb3dza2kgKDIpOgogIGNoYW1l
bGl1bTogRml4IGludmVydGVkIHhyMjQgcGF0dGVybiBwYWludCBkaW1lbnNpb25zCiAgY2hhbWVs
aXVtOiBQYXNzIGFuZCB1c2Ugc3RyaWRlIGZvciB4cjI0IHBhdHRlcm4gcGFpbnQKCiBsaWIvaWd0
X2ZiLmMgICAgICAgICAgfCAxNDAgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KIHRlc3RzL2tt
c19jaGFtZWxpdW0uYyB8IDIzNCArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIxMCBpbnNlcnRpb25zKCspLCAxNjQgZGVsZXRpb25z
KC0pCgpiYXNlLWNvbW1pdDogZjcyNzFmZTRlMTJiNTY0YzI1YTQ0Y2E3NmVlODJiYjVlNzg2MDFi
NgotLSAKZ2l0LXNlcmllcyAwLjkuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
