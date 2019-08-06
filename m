Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D55089FE8
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2019 21:02:50 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  6 Aug 2019 22:02:27 +0100
Message-Id: <20190806210227.28141-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] kms_ccs: Add the missing '\n' for
 igt_require_f
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Q3VycmVudGx5IHRoZSBydW5uZXIgc2VlcwoKU3RhcnRpbmcgc3VidGVzdDogcGlwZS1DLWJhZC1h
dXgtc3RyaWRlClRlc3QgcmVxdWlyZW1lbnQgbm90IG1ldCBpbiBmdW5jdGlvbiB0ZXN0X291dHB1
dCwgZmlsZSAuLi90ZXN0cy9rbXNfY2NzLmM6MzI0OgpUZXN0IHJlcXVpcmVtZW50OiB2YWxpZF90
ZXN0cyA+IDAKQ0NTIG5vdCBzdXBwb3J0ZWQsIHNraXBwaW5nU3VidGVzdCBwaXBlLUMtYmFkLWF1
eC1zdHJpZGU6IFNLSVAgKDAuMzMwcykKCmFuZCBtYW5hZ2VzIHRvIGV4cGxvZGUuCgpTaWduZWQt
b2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0ZXN0
cy9rbXNfY2NzLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jY3MuYyBiL3Rlc3RzL2ttc19j
Y3MuYwppbmRleCA2Y2QzMGFhZDguLjFjZTY2Y2RlYyAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2Nj
cy5jCisrKyBiL3Rlc3RzL2ttc19jY3MuYwpAQCAtMzIxLDcgKzMyMSw3IEBAIHN0YXRpYyBpbnQg
X190ZXN0X291dHB1dChkYXRhX3QgKmRhdGEpCiBzdGF0aWMgdm9pZCB0ZXN0X291dHB1dChkYXRh
X3QgKmRhdGEpCiB7CiAJaW50IHZhbGlkX3Rlc3RzID0gX190ZXN0X291dHB1dChkYXRhKTsKLQlp
Z3RfcmVxdWlyZV9mKHZhbGlkX3Rlc3RzID4gMCwgIkNDUyBub3Qgc3VwcG9ydGVkLCBza2lwcGlu
ZyIpOworCWlndF9yZXF1aXJlX2YodmFsaWRfdGVzdHMgPiAwLCAiQ0NTIG5vdCBzdXBwb3J0ZWQs
IHNraXBwaW5nXG4iKTsKIH0KIAogc3RhdGljIGRhdGFfdCBkYXRhOwpAQCAtMzczLDcgKzM3Myw4
IEBAIGlndF9tYWluCiAJCQkJdmFsaWRfdGVzdHMgKz0gX190ZXN0X291dHB1dCgmZGF0YSk7CiAJ
CQl9CiAKLQkJCWlndF9yZXF1aXJlX2YodmFsaWRfdGVzdHMgPiAwLCAiQ0NTIG5vdCBzdXBwb3J0
ZWQsIHNraXBwaW5nIik7CisJCQlpZ3RfcmVxdWlyZV9mKHZhbGlkX3Rlc3RzID4gMCwKKwkJCQkg
ICAgICAiQ0NTIG5vdCBzdXBwb3J0ZWQsIHNraXBwaW5nXG4iKTsKIAkJfQogCiAJCWRhdGEucGxh
bmUgPSBOVUxMOwotLSAKMi4yMy4wLnJjMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
