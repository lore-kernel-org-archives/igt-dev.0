Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41516E9E9
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Feb 2021 15:13:04 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id l12so26305844edt.3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Feb 2021 07:13:04 -0800 (PST)
References: <20210223134924.10045-1-ville.syrjala@linux.intel.com>
 <20210223134924.10045-2-ville.syrjala@linux.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <34f9c659-429e-08ce-7808-5aba7d06ddf8@gmail.com>
Date: Tue, 23 Feb 2021 17:12:57 +0200
MIME-Version: 1.0
In-Reply-To: <20210223134924.10045-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_plane: Restore RGB pixel
 format tests for non-atomic drivers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFp
bC5jb20+CgpPbiAyMy4yLjIwMjEgMTUuNDksIFZpbGxlIFN5cmphbGEgd3JvdGU6Cj4gRnJvbTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBSZXN0
b3JlIHRoZSBjYXBhYmlsaXR5IHRvIHJ1biBSR0IgcGl4ZWwgZm9ybWF0IHRlc3RzIHdoZW4gdGhl
IGRyaXZlcgo+IGRvZXNuJ3QgYWR2ZXJ0aXplIHRoZSBhdG9taWMgY2FwYWJpbGl0eS4KPiAKPiBD
YzogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KPiBG
aXhlczogZTk2YzBkOGU2OTUyICgidGVzdHMva21zX3BsYW5lOiBvcHRpbWl6ZSBwaXhlbCBmb3Jt
YXQgdGVzdHMiKQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gICB0ZXN0cy9rbXNfcGxhbmUuYyB8IDQgKystLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvdGVzdHMva21zX3BsYW5lLmMgYi90ZXN0cy9rbXNfcGxhbmUuYwo+IGluZGV4
IGVjYmExOTdjODBmNS4uMjk4YTkzNzViOWY0IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ttc19wbGFu
ZS5jCj4gKysrIGIvdGVzdHMva21zX3BsYW5lLmMKPiBAQCAtNTY3LDggKzU2Nyw4IEBAIHN0YXRp
YyB2b2lkIGNhcHR1cmVfZm9ybWF0X2NyY3NfcGFja2VkKGRhdGFfdCAqZGF0YSwgZW51bSBwaXBl
IHBpcGUsCj4gICAJcHJlcGFyZV9mb3JtYXRfY29sb3IoZGF0YSwgcGlwZSwgcGxhbmUsIGZvcm1h
dCwgbW9kaWZpZXIsCj4gICAJCQkgICAgIHdpZHRoLCBoZWlnaHQsIGVuY29kaW5nLCByYW5nZSwg
JmJsYWNrLCBmYiwgdHJ1ZSk7Cj4gICAKPiAtCWlndF9kaXNwbGF5X2NvbW1pdF9hdG9taWMoJmRh
dGEtPmRpc3BsYXksIERSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VULAo+IC0JCQkJICBOVUxM
KTsKPiArCWlndF9kaXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIGRhdGEtPmRpc3BsYXku
aXNfYXRvbWljID8KPiArCQkJICAgIENPTU1JVF9BVE9NSUMgOiBDT01NSVRfVU5JVkVSU0FMKTsK
PiAgIAo+ICAgCWlndF9yZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmb2xkX2ZiKTsKPiAgIAo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
