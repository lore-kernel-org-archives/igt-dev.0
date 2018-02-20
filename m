Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 20 Feb 2018 16:53:19 +0000
Message-Id: <20180220165320.796-2-chris@chris-wilson.co.uk>
In-Reply-To: <20180220165320.796-1-chris@chris-wilson.co.uk>
References: <20180220165320.796-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [igt CI 2/3] igt/gem_exec_schedule: Dump the engine info
 prior to sync on preempt_other
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

SXQgaXMgdXNlZnVsIHRvIGR1bXAgdGhlIHJlcXVlc3QgbGF5b3V0IGJldHdlZW4gZW5naW5lcyAg
aGVscCBkZWJ1ZwpvcmRlcmluZyBpc3N1ZXMgYW5kIHN0dWNrIHByZWVtcHRpb24sIHNvIGFkZCBp
dCB0byBwcmVlbXB0X290aGVyKCkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlz
QGNocmlzLXdpbHNvbi5jby51az4KUmV2aWV3ZWQtYnk6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFz
LmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0cy9nZW1fZXhlY19zY2hlZHVsZS5j
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0
cy9nZW1fZXhlY19zY2hlZHVsZS5jIGIvdGVzdHMvZ2VtX2V4ZWNfc2NoZWR1bGUuYwppbmRleCAx
ZmM3YzY5Ny4uYzljNDQ1MmUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2dlbV9leGVjX3NjaGVkdWxlLmMK
KysrIGIvdGVzdHMvZ2VtX2V4ZWNfc2NoZWR1bGUuYwpAQCAtNDUwLDYgKzQ1MCw3IEBAIHN0YXRp
YyB2b2lkIHByZWVtcHRfb3RoZXIoaW50IGZkLCB1bnNpZ25lZCByaW5nKQogCQkgICAgcmVzdWx0
LCAobiArIDEpKnNpemVvZih1aW50MzJfdCksIG4gKyAxLAogCQkgICAgMCwgSTkxNV9HRU1fRE9N
QUlOX1JFTkRFUik7CiAKKwlpZ3RfZGVidWdmc19kdW1wKGZkLCAiaTkxNV9lbmdpbmVfaW5mbyIp
OwogCWdlbV9zZXRfZG9tYWluKGZkLCByZXN1bHQsIEk5MTVfR0VNX0RPTUFJTl9HVFQsIDApOwog
CiAJZm9yIChpID0gMDsgaSA8IG47IGkrKykgewotLSAKMi4xNi4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
