Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 21 Feb 2018 14:50:27 +0000
Message-Id: <20180221145027.8741-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt] igt/kms_fbcon_fbt: Handle ENODEV when
 checking i915_fbc_info for chipset support
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

SWYgdGhlIG1hY2hpbmUgZG9lc24ndCBzdXBwb3J0IEZCQywgaXQgd2lsbCByZXR1cm4gLUVOT0RF
ViBmcm9tCmk5MTVfZmJjX2luZm8sIHdoaWNoIHdlIHdhbnQgdG8gaW50ZXJwcmV0IGFzIHVuc3Vw
cG9ydGVkLgoKUmVwb3J0ZWQtYnk6IE1hcnRhIExvZnN0ZWR0PG1hcnRhLmxvZnN0ZWR0QGludGVs
LmNvbT4KU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+ClJldmlld2VkLWJ5OiBNYXJ0YSBMb2ZzdGVkdDxtYXJ0YS5sb2ZzdGVkdEBpbnRlbC5jb20+
Ci0tLQogdGVzdHMva21zX2ZiY29uX2ZidC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZmJjb25fZmJ0LmMgYi90ZXN0cy9r
bXNfZmJjb25fZmJ0LmMKaW5kZXggNTFmMTE3MjguLjFiMjM2ZjhiIDEwMDY0NAotLS0gYS90ZXN0
cy9rbXNfZmJjb25fZmJ0LmMKKysrIGIvdGVzdHMva21zX2ZiY29uX2ZidC5jCkBAIC04Nyw2ICs4
Nyw5IEBAIHN0YXRpYyBib29sIGZiY19zdXBwb3J0ZWRfb25fY2hpcHNldChpbnQgZmQpCiAJY2hh
ciBidWZbMTI4XTsKIAogCWlndF9kZWJ1Z2ZzX3JlYWQoZmQsICJpOTE1X2ZiY19zdGF0dXMiLCBi
dWYpOworCWlmICgqYnVmID09ICdcMCcpIC8qICFIQVNfRkJDIC0+IC1FTk9ERVYqLworCQlyZXR1
cm4gZmFsc2U7CisKIAlyZXR1cm4gIXN0cnN0cihidWYsICJGQkMgdW5zdXBwb3J0ZWQgb24gdGhp
cyBjaGlwc2V0XG4iKTsKIH0KIAotLSAKMi4xNi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
