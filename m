Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445A06E8E0
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2019 13:50:49 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id x61so14958809edc.9
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Apr 2019 06:50:49 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed,  3 Apr 2019 15:50:42 +0200
Message-Id: <20190403135042.24195-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_color: Use igt_require more
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U3VjY2VzcyBpcyBub3QgdGhlIHJpZ2h0IHN0YXR1cyBpZiB0aGUgdGVzdCBkb2VzIG5vdGhpbmcu
IEZpeCB0aGF0LgoKQ2M6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGlu
dGVsLmNvbT4KQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4K
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
CkNjOiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfY29s
b3IuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2NvbG9yLmMgYi90ZXN0cy9rbXNfY29sb3IuYwpp
bmRleCBkZWNmM2MyYTY4MGUuLmQyMzUyY2Y4YTliYSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2Nv
bG9yLmMKKysrIGIvdGVzdHMva21zX2NvbG9yLmMKQEAgLTExMzUsOCArMTEzNSw3IEBAIGludmFs
aWRfY3RtX21hdHJpeF9zaXplcyhkYXRhX3QgKmRhdGEpCiAJaWd0X3BpcGVfdCAqcGlwZSA9ICZk
aXNwbGF5LT5waXBlc1swXTsKIAl2b2lkICpwdHI7CiAKLQlpZiAoIWlndF9waXBlX29ial9oYXNf
cHJvcChwaXBlLCBJR1RfQ1JUQ19DVE0pKQotCQlyZXR1cm47CisJaWd0X3JlcXVpcmUoaWd0X3Bp
cGVfb2JqX2hhc19wcm9wKHBpcGUsIElHVF9DUlRDX0NUTSkpOwogCiAJcHRyID0gbWFsbG9jKHNp
emVvZihzdHJ1Y3QgX2RybV9jb2xvcl9jdG0pICogNCk7CiAKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
