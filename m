Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 14 May 2018 09:02:47 +0100
Message-Id: <20180514080251.11224-2-chris@chris-wilson.co.uk>
In-Reply-To: <20180514080251.11224-1-chris@chris-wilson.co.uk>
References: <20180514080251.11224-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t 2/6] lib/audio: Replace sqrt(a*a + b*b) with
 hypot(a, b)
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0t
LQogbGliL2lndF9hdWRpby5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9hdWRpby5jIGIvbGliL2ln
dF9hdWRpby5jCmluZGV4IDIzMjFkMWM2ZS4uMjI5Y2U2YzY5IDEwMDY0NAotLS0gYS9saWIvaWd0
X2F1ZGlvLmMKKysrIGIvbGliL2lndF9hdWRpby5jCkBAIC0yNjYsOSArMjY2LDcgQEAgYm9vbCBh
dWRpb19zaWduYWxfZGV0ZWN0KHN0cnVjdCBhdWRpb19zaWduYWwgKnNpZ25hbCwgaW50IGNoYW5u
ZWxzLAogCQltYXggPSAwOwogCiAJCWZvciAoaSA9IDA7IGkgPCBmcmFtZXMgLyAyOyBpKyspIHsK
LQkJCWFtcGxpdHVkZVtpXSA9IHNxcnQoZGF0YVtpXSAqIGRhdGFbaV0gKwotCQkJCQkgICAgZGF0
YVtmcmFtZXMgLSBpXSAqCi0JCQkJCSAgICBkYXRhW2ZyYW1lcyAtIGldKTsKKwkJCWFtcGxpdHVk
ZVtpXSA9IGh5cG90KGRhdGFbaV0sIGRhdGFbZnJhbWVzIC0gaV0pOwogCQkJaWYgKGFtcGxpdHVk
ZVtpXSA+IG1heCkKIAkJCQltYXggPSBhbXBsaXR1ZGVbaV07CiAJCX0KLS0gCjIuMTcuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
