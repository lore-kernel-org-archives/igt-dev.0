Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62254894DE
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2019 08:08:27 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Fri, 14 Jun 2019 11:08:15 +0300
Message-Id: <20190614080816.12464-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20190614080816.12464-1-arkadiusz.hiler@intel.com>
References: <20190614080816.12464-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] runner: Handle SIGHUP too
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

RGVmYXVsdCBoYW5kbGVyIGZvciBTSUdIVVAgaXMgYWxzbyB0ZXJtaW5hdGluZyB0aGUgcHJvY2Vz
cywgc28gbGV0J3MKbWFzayBpdCBhbmQgaGFuZGxlIGl0IG1hbnVhbGx5LCBsaWtlIHRoZSByZXN0
IG9mIHRoZSBidW5jaC4KClNpZ25lZC1vZmYtYnk6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6
LmhpbGVyQGludGVsLmNvbT4KLS0tCiBydW5uZXIvZXhlY3V0b3IuYyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9yLmMgYi9y
dW5uZXIvZXhlY3V0b3IuYwppbmRleCBmOWM2OWZlZi4uNmIxNzFjMTIgMTAwNjQ0Ci0tLSBhL3J1
bm5lci9leGVjdXRvci5jCisrKyBiL3J1bm5lci9leGVjdXRvci5jCkBAIC05NTAsNiArOTUwLDcg
QEAgc3RhdGljIGludCBleGVjdXRlX25leHRfZW50cnkoc3RydWN0IGV4ZWN1dGVfc3RhdGUgKnN0
YXRlLAogCXNpZ2FkZHNldCgmbWFzaywgU0lHSU5UKTsKIAlzaWdhZGRzZXQoJm1hc2ssIFNJR1RF
Uk0pOwogCXNpZ2FkZHNldCgmbWFzaywgU0lHUVVJVCk7CisJc2lnYWRkc2V0KCZtYXNrLCBTSUdI
VVApOwogCXNpZ3Byb2NtYXNrKFNJR19CTE9DSywgJm1hc2ssIE5VTEwpOwogCXNpZ2ZkID0gc2ln
bmFsZmQoLTEsICZtYXNrLCBPX0NMT0VYRUMpOwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
