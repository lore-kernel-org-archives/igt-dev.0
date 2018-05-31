Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Thu, 31 May 2018 12:20:26 +0100
Message-Id: <20180531112026.17497-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] [PATCH i-g-t] perf_pmu: Stop skipping hotplug test on
 Broxton
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClRoZXJlIGlz
IGEgY2hhbmNlIG5ldyBrZXJuZWwgb3IgbmV3IGZpcm13YXJlIGZpeGVkIHRoZSBDUFUwIGhvdHBs
dWcgaGFuZwppc3N1ZS4gUmVtb3ZlIHRoZSBza2lwIHRvIGNoZWNrIGlmIHRoYXQncyB0cnVlLgoK
U2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4K
LS0tCiB0ZXN0cy9wZXJmX3BtdS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3BlcmZfcG11LmMgYi90ZXN0cy9wZXJmX3BtdS5jCmluZGV4
IDlhZjE5MmRkODIzMi4uNDU3MGY5MjZkN2ZlIDEwMDY0NAotLS0gYS90ZXN0cy9wZXJmX3BtdS5j
CisrKyBiL3Rlc3RzL3BlcmZfcG11LmMKQEAgLTEwMzcsNyArMTAzNyw2IEBAIHN0YXRpYyB2b2lk
IGNwdV9ob3RwbHVnKGludCBnZW1fZmQpCiAJaW50IGN1ciA9IDA7CiAJY2hhciBidWY7CiAKLQlp
Z3Rfc2tpcF9vbihJU19CUk9YVE9OKGludGVsX2dldF9kcm1fZGV2aWQoZ2VtX2ZkKSkpOwogCWln
dF9yZXF1aXJlKGNwdTBfaG90cGx1Z19zdXBwb3J0KCkpOwogCiAJZmQgPSBvcGVuX3BtdShJOTE1
X1BNVV9FTkdJTkVfQlVTWShJOTE1X0VOR0lORV9DTEFTU19SRU5ERVIsIDApKTsKLS0gCjIuMTcu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwt
Z2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
