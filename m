Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 28 Feb 2019 14:18:27 +0000
Message-Id: <20190228141828.2567-4-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
References: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/5] autoconf: Silence void pointer
 arithmetic warnings
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCk1lc29uIGJ1
aWxkIGRvZXMgaXQgc28gbWFrZSB0aGUgdHdvIHN5bW1ldHJpY2FsIGluIHRoaXMgcmVzcGVjdC4K
ClNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+
Ci0tLQogY29uZmlndXJlLmFjIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwppbmRleCA0ZjU1ZWE1
ZDBmODkuLjIxMGUyYzU3ZGY1NSAxMDA2NDQKLS0tIGEvY29uZmlndXJlLmFjCisrKyBiL2NvbmZp
Z3VyZS5hYwpAQCAtMjU2LDYgKzI1Niw4IEBAIEFDX0FSR19FTkFCTEUod2Vycm9yLAogCQkJICAg
ICBbRmFpbCBvbiB3YXJuaW5nc10pLAogCSAgICAgIFtdLCBbZW5hYmxlX3dlcnJvcj1ub10pCiAK
K0NXQVJORkxBR1M9IiRDV0FSTkZMQUdTIC1Xbm8tcG9pbnRlci1hcml0aCIKKwogaWYgdGVzdCAi
eCRlbmFibGVfZGVidWciID0geHllczsgdGhlbgogCUFTX0NPTVBJTEVSX0ZMQUcoWy1nM10sIFtE
RUJVR19DRkxBR1M9Ii1nMyJdLCBbREVCVUdfQ0ZMQUdTPSItZyJdKQogCUFTX0NPTVBJTEVSX0ZM
QUcoWy1PZ10sIFtERUJVR19DRkxBR1MrPSIgLU9nIC1Xbm8tbWF5YmUtdW5pbml0aWFsaXplZCJd
LCAjIGRpc2FibGUgbWF5YmUtdW5pbml0aWFsaXplZCBkdWUgdG8gZmFsc2UgcG9zaXRpdmVzCi0t
IAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
