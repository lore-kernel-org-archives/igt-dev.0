Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 17 Feb 2019 14:35:55 +0000
Message-Id: <20190217143556.9482-7-chris@chris-wilson.co.uk>
In-Reply-To: <20190217143556.9482-1-chris@chris-wilson.co.uk>
References: <20190217143556.9482-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/8] kms_fence_pin_leak: Ask for the GPU
 before use
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Q2hlY2sgdGhhdCB0aGUgR1BVIGV2ZW4gZXhpc3RzIGJlZm9yZSBzdWJtaXR0aW5nIGEgYmF0Y2gu
CgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
MTA5NTg5ClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPgotLS0KIHRlc3RzL2ttc19mZW5jZV9waW5fbGVhay5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZmVuY2VfcGluX2xlYWsu
YyBiL3Rlc3RzL2ttc19mZW5jZV9waW5fbGVhay5jCmluZGV4IDYyYzUyYjYyNy4uZTZjOGIzM2Mz
IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfZmVuY2VfcGluX2xlYWsuYworKysgYi90ZXN0cy9rbXNf
ZmVuY2VfcGluX2xlYWsuYwpAQCAtMjAxLDYgKzIwMSw3IEBAIGlndF9zaW1wbGVfbWFpbgogCWln
dF9za2lwX29uX3NpbXVsYXRpb24oKTsKIAogCWRhdGEuZHJtX2ZkID0gZHJtX29wZW5fZHJpdmVy
X21hc3RlcihEUklWRVJfSU5URUwpOworCWlndF9yZXF1aXJlX2dlbShkYXRhLmRybV9mZCk7CiAK
IAlkYXRhLmRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChkYXRhLmRybV9mZCk7CiAKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
