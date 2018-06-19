Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 19 Jun 2018 11:49:15 +0100
Message-Id: <20180619104920.17528-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t 1/6] lib: Conservatively include residue
 buffers in the available ram estimate
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

QWRkIGFueSBidWZmZXJzIHJlcG9ydGVkIGJ5IHN5c2luZm8gdG8gdGhlIGVzdGltYXRlIG9mIGF2
YWlsYWJsZSBtZW1vcnkuCldlIGRvIGFzayB0aGUga2VybmVsIHRvIHB1cmdlIGl0J3MgY2FjaGVz
IGJlZm9yZSByZXBvcnRpbmcgc3lzaW5mbywgYnV0CmEgZmV3IHJlbWFpbiB0aGF0IG1heSBiZSBm
b3JjZWQgb3V0IGJ5IG91ciB0ZXN0IHVzYWdlLCBzbyBpbmNsdWRlIHRoZW0uCkhvd2V2ZXIsIGJl
IGNvbnNlcnZhdGl2ZSBhbmQgb25seSBhbGxvdyB0aGVtIHRvIGJlIHN3YXBwZWQgb3V0LgoKUmVm
ZXJlbmNlczogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1
OTY3ClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
PgotLS0KIGxpYi9pbnRlbF9vcy5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9saWIvaW50ZWxfb3MuYyBiL2xpYi9pbnRlbF9vcy5jCmluZGV4IDg4
YTYxZjM3OC4uODg1ZmZkY2VjIDEwMDY0NAotLS0gYS9saWIvaW50ZWxfb3MuYworKysgYi9saWIv
aW50ZWxfb3MuYwpAQCAtMTA1LDYgKzEwNSw3IEBAIGludGVsX2dldF9hdmFpbF9yYW1fbWIodm9p
ZCkKIAogCWlndF9hc3NlcnQoc3lzaW5mbygmc3lzaW5mKSA9PSAwKTsKIAlyZXR2YWwgPSBzeXNp
bmYuZnJlZXJhbTsKKwlyZXR2YWwgKz0gbWluKHN5c2luZi5mcmVlc3dhcCwgc3lzaW5mLmJ1ZmZl
cnJhbSk7CiAJcmV0dmFsICo9IHN5c2luZi5tZW1fdW5pdDsKICNlbGlmIGRlZmluZWQoX1NDX1BB
R0VTSVpFKSAmJiBkZWZpbmVkKF9TQ19BVlBIWVNfUEFHRVMpIC8qIFNvbGFyaXMgKi8KIAlsb25n
IHBhZ2VzaXplLCBucGFnZXM7Ci0tIAoyLjE4LjAucmMyCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
