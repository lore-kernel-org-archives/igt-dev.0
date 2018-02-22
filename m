Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310916E6A8
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2018 01:42:00 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu, 22 Feb 2018 01:41:52 +0000
Message-Id: <20180222014152.17941-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t] test/perf: fixup inverted condition
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
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIHByZXZpb3VzIHBhdGNoIHNhaWQgOgoKInZlcmlmeSB0aGF0IHRoZSB0aW1lIGlzIGFsd2F5
cyBsb25nZXIgb3IgZXF1YWwgdG8gdGhlIHBlcmlvZCB3ZSd2ZQogYXNrZWQgZm9yIgoKVGhpcyBp
cyBhbiBvYnZpb3VzIGVycm9yLCBpdCBvbmx5IHdvcmtlZCBvbiBteSBtYWNoaW5lIGFuZCB0aGUg
Q0kKYmVjYXVzZSBvbmx5IG9uZSBsb25nZXIgcGVyaW9kIHdhcyBvYnNlcnZlZC4gQnV0IGFub3Ro
ZXIgQ0kgcnVuIGNhdWdodAp0aGUgaXNzdWUgOgoKICBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9kcm0tdGlwL0lHVF80MjgwL3NoYXJkLWdsa2I2L2lndEBwZXJmQG9hLWV4cG9uZW50
cy5odG1sCgpGaXhlczogYzNkMTFjYTEwNGZhICgidGVzdHMvcGVyZjogbWFrZSBvYS1leHBvbmVu
dHMgc3VidGVzdCBtb3JlIHJlbGlhYmxlIikKU2lnbmVkLW9mZi1ieTogTGlvbmVsIExhbmR3ZXJs
aW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgotLS0KIHRlc3RzL3BlcmYuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3Rlc3RzL3BlcmYuYyBiL3Rlc3RzL3BlcmYuYwppbmRleCAwNTEwOGY1YS4uYzMwMmEz
NTUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL3BlcmYuYworKysgYi90ZXN0cy9wZXJmLmMKQEAgLTE3OTUs
NyArMTc5NSw3IEBAIHRlc3Rfb2FfZXhwb25lbnRzKHZvaWQpCiAJCQkJICBvYV9yZXBvcnRfZ2V0
X2N0eF9pZCh0aW1lcl9yZXBvcnRzW2ldLnJlcG9ydCksCiAJCQkJICBkZWx0YSwgZGVsdGEgPT0g
ZXhwZWN0ZWRfdGltZXN0YW1wX2RlbHRhID8gIiIgOiAiKioqKioqIik7CiAKLQkJCW1hdGNoZXMg
Kz0gZXhwZWN0ZWRfdGltZXN0YW1wX2RlbHRhID49IGRlbHRhOworCQkJbWF0Y2hlcyArPSBleHBl
Y3RlZF90aW1lc3RhbXBfZGVsdGEgPD0gZGVsdGE7CiAJCX0KIAogCQlpZ3RfZGVidWcoIm1hdGNo
ZXM9JXUvJXVcbiIsIG1hdGNoZXMsIG5fdGltZXJfcmVwb3J0cyAtIDEpOwotLSAKMi4xNi4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
