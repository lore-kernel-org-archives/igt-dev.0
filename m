Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856436E430
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2020 12:50:05 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  6 Mar 2020 14:49:59 +0200
Message-Id: <20200306125002.21316-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] tools/intel_reg: Simplify negative ports
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkxl
dCdzIGF2b2lkIGhhdmluZyB0byB0eXBlIGluIHRoZSBleHBsaWNpdCBuZWdhdGl2ZSB2YWx1ZSBm
b3IKYWxsIHRoZSBwb3J0IGVudW1zLgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiB0b29scy9pbnRlbF9yZWdfc3BlYy5o
IHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2ludGVsX3JlZ19zcGVjLmggYi90b29scy9pbnRlbF9y
ZWdfc3BlYy5oCmluZGV4IGM5NGM2MWJhYjNmOC4uYTZlMDUxNDM4N2RmIDEwMDY0NAotLS0gYS90
b29scy9pbnRlbF9yZWdfc3BlYy5oCisrKyBiL3Rvb2xzL2ludGVsX3JlZ19zcGVjLmgKQEAgLTI1
LDEwICsyNSwxMSBAQAogI2RlZmluZSBfX0lOVEVMX1JFR19TUEVDX0hfXwogCiBlbnVtIHBvcnRf
YWRkciB7CisJUE9SVF9NTUlPID0gLTEyNywKKwlQT1JUX1BPUlRJT19WR0EsCS8qIHNlZSB2Z2Eg
cmVnIHJlYWQvd3JpdGUgKi8KKwlQT1JUX01NSU9fVkdBLAkJLyogc2VlIHZnYSByZWcgcmVhZC93
cml0ZSAqLworCiAJUE9SVF9OT05FID0gMCwKLQlQT1JUX01NSU8gPSAtMSwKLQlQT1JUX1BPUlRJ
T19WR0EgPSAtMiwJLyogc2VlIHZnYSByZWcgcmVhZC93cml0ZSAqLwotCVBPUlRfTU1JT19WR0Eg
PSAtMywJLyogc2VlIHZnYSByZWcgcmVhZC93cml0ZSAqLwogCiAJLyogdmx2ICovCiAJUE9SVF9C
VU5JVCA9IDB4MDMsCi0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
