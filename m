Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF9A889DA6
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Dec 2018 10:25:35 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue,  4 Dec 2018 11:25:01 +0100
Message-Id: <20181204102509.18401-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH RESEND i-g-t 0/8] igt: chamelium: Test YUV buffers
 using the Chamelium
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
X2ZiLmMgICAgICAgICAgfCAxNDAgKysrKysrKysrKysrKysrKystLS0tLS0tLQogdGVzdHMva21z
X2NoYW1lbGl1bS5jIHwgMjM0ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMTAgaW5zZXJ0aW9ucygrKSwgMTY0IGRlbGV0aW9ucygt
KQoKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
