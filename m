Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 14 Mar 2019 14:19:25 +0000
Message-Id: <20190314141939.26246-11-chris@chris-wilson.co.uk>
In-Reply-To: <20190314141939.26246-1-chris@chris-wilson.co.uk>
References: <20190314141939.26246-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 11/25] kms_fence_pin_leak: Ask for the GPU
 before use
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
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
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50
ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
