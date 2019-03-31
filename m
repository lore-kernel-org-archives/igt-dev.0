Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 31 Mar 2019 22:09:30 +0100
Message-Id: <20190331210930.24358-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Idle before measuring idle
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
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QmVmb3JlIHRyeWluZyB0byBtZWFzdXJlIHRoZSBidXN5bmVzcyByZXBvcnRpbmcgZm9yIHRoZSBp
ZGxlIHN0YXRlLCBtYWtlCnN1cmUgdGhlIGdwdSBpcyBhY3R1YWxseSBpZGxlIGFuZCBub3Qgc3Rp
bGwgcnVubmluZyBhbnkgYmFja2dvdW5kIHN5c3RlbQp0YXNrLgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBUdnJ0a28gVXJzdWxpbiA8
dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIHRlc3RzL3BlcmZfcG11LmMgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3BlcmZfcG11
LmMgYi90ZXN0cy9wZXJmX3BtdS5jCmluZGV4IDFhMDhmNTY0Yi4uZWY2MWM0ZDQwIDEwMDY0NAot
LS0gYS90ZXN0cy9wZXJmX3BtdS5jCisrKyBiL3Rlc3RzL3BlcmZfcG11LmMKQEAgLTI2NCw2ICsy
NjQsNyBAQCBzaW5nbGUoaW50IGdlbV9mZCwgY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9l
bmdpbmUyICplLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiAJdWludDY0X3QgdmFsOwogCWludCBmZDsK
IAorCWdlbV9xdWllc2NlbnRfZ3B1KGdlbV9mZCk7CiAJZmQgPSBvcGVuX3BtdShJOTE1X1BNVV9F
TkdJTkVfQlVTWShlLT5jbGFzcywgZS0+aW5zdGFuY2UpKTsKIAogCWlmIChmbGFncyAmIFRFU1Rf
QlVTWSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
