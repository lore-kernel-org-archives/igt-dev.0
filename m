Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD72B6E3FB
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 18:17:36 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 22 Jan 2019 18:17:28 +0000
Message-Id: <20190122181728.2500-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Include the size in the error message
 for mlock
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
List-ID: <igt-dev@lists.freedesktop.org>

S25vd2luZyBob3cgbXVjaCB3ZSB0cmllZCB0byBhbGxvY2F0ZSB3b3VsZCBiZSB1c2VmdWwgaWYg
b25lIHNob3VsZCBuZWVkCnRvIGRlYnVnIHdoeSBpdCBmYWlsZWQuCgpSZWZlcmVuY2VzOiBodHRw
czovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDk0MzkKU2lnbmVkLW9m
Zi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogbGliL2ln
dF9hdXguYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2F1eC5jIGIvbGliL2lndF9hdXguYwppbmRl
eCAxMjUwZDVjNWYuLjJlMmQ1NTJiNSAxMDA2NDQKLS0tIGEvbGliL2lndF9hdXguYworKysgYi9s
aWIvaWd0X2F1eC5jCkBAIC0xMDgwLDE0ICsxMDgwLDE0IEBAIHZvaWQgaWd0X2xvY2tfbWVtKHNp
emVfdCBzaXplKQogCiAJbG9ja2VkX21lbSA9IG1hbGxvYyhsb2NrZWRfc2l6ZSk7CiAJaWd0X3Jl
cXVpcmVfZihsb2NrZWRfbWVtLAotCQkgICAgICAiQ291bGQgbm90IGFsbG9jYXRlIGVub3VnaCBt
ZW1vcnkgdG8gbG9jay5cbiIpOworCQkgICAgICAiQ291bGQgbm90IG1hbGxvYyAlemRNaUIgZm9y
IGxvY2tpbmcuXG4iLCBzaXplKTsKIAogCS8qIHdyaXRlIGludG8gZWFjaCBwYWdlIHRvIGVuc3Vy
ZSBpdCBpcyBhbGxvY2F0ZWQgKi8KIAlmb3IgKGkgPSAwOyBpIDwgbG9ja2VkX3NpemU7IGkgKz0g
cGFnZXNpemUpCiAJCWxvY2tlZF9tZW1baV0gPSBpOwogCiAJcmV0ID0gbWxvY2sobG9ja2VkX21l
bSwgbG9ja2VkX3NpemUpOwotCWlndF9hc3NlcnRfZihyZXQgPT0gMCwgIkNvdWxkIG5vdCBsb2Nr
IG1lbW9yeSBpbnRvIFJBTS5cbiIpOworCWlndF9hc3NlcnRfZihyZXQgPT0gMCwgIkNvdWxkIG5v
dCBtbG9jayAlemRNaUIuXG4iLCBzaXplKTsKIH0KIAogLyoqCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
