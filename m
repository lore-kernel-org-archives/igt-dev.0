Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECA06EEBF
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2019 10:35:29 +0000 (UTC)
Date: Wed, 18 Sep 2019 13:35:26 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190918103526.GV4019@platvala-desk.ger.corp.intel.com>
References: <20190918095919.12423-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190918095919.12423-1-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_prime: Fix compiler warning
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMTI6NTk6MTlQTSArMDMwMCwgTWlrYSBLYWhvbGEgd3Jv
dGU6Cj4gRml4IGNvbXBpbGVyIHdhcm5pbmcgYWJvdXQKPiAKPiAuLi90ZXN0cy9rbXNfcHJpbWUu
YzogSW4gZnVuY3Rpb24g4oCYc2V0dXBfZGlzcGxheeKAmToKPiAuLi90ZXN0cy9rbXNfcHJpbWUu
Yzo3NDoyOiB3YXJuaW5nOiBJU08gQzkwIGZvcmJpZHMgbWl4ZWQgZGVjbGFyYXRpb25zIGFuZCBj
b2RlIFstV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudF0KPiAgIGlndF9vdXRwdXRfdCAqb3V0
cHV0ID0gaWd0X2dldF9zaW5nbGVfb3V0cHV0X2Zvcl9waXBlKGRpc3BsYXksIHBpcGUpOwo+IAo+
IFNpZ25lZC1vZmYtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+CgpSZXZp
ZXdlZC1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CgoKPiAtLS0K
PiAgdGVzdHMva21zX3ByaW1lLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHJpbWUu
YyBiL3Rlc3RzL2ttc19wcmltZS5jCj4gaW5kZXggMTc1OTk1NzMuLjMyNDFjNTE0IDEwMDY0NAo+
IC0tLSBhL3Rlc3RzL2ttc19wcmltZS5jCj4gKysrIGIvdGVzdHMva21zX3ByaW1lLmMKPiBAQCAt
NjksOSArNjksMTEgQEAgc3RhdGljIGJvb2wgaGFzX3ByaW1lX2V4cG9ydChpbnQgZmQpCj4gIHN0
YXRpYyBpZ3Rfb3V0cHV0X3QgKnNldHVwX2Rpc3BsYXkoaW50IGltcG9ydGVyX2ZkLCBpZ3RfZGlz
cGxheV90ICpkaXNwbGF5LAo+ICAJCQkJICAgZW51bSBwaXBlIHBpcGUpCj4gIHsKPiArCWlndF9v
dXRwdXRfdCAqb3V0cHV0Owo+ICsKPiAgCWlndF9kaXNwbGF5X3JlcXVpcmUoZGlzcGxheSwgaW1w
b3J0ZXJfZmQpOwo+ICAJaWd0X3NraXBfb24ocGlwZSA+PSBkaXNwbGF5LT5uX3BpcGVzKTsKPiAt
CWlndF9vdXRwdXRfdCAqb3V0cHV0ID0gaWd0X2dldF9zaW5nbGVfb3V0cHV0X2Zvcl9waXBlKGRp
c3BsYXksIHBpcGUpOwo+ICsJb3V0cHV0ID0gaWd0X2dldF9zaW5nbGVfb3V0cHV0X2Zvcl9waXBl
KGRpc3BsYXksIHBpcGUpOwo+ICAKPiAgCWlndF9yZXF1aXJlX2Yob3V0cHV0LCAiTm8gY29ubmVj
dG9yIGZvdW5kIGZvciBwaXBlICVzXG4iLAo+ICAJCSAgICAgIGttc3Rlc3RfcGlwZV9uYW1lKHBp
cGUpKTsKPiAtLSAKPiAyLjE3LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
